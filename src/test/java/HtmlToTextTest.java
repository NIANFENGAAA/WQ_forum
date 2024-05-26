import com.zwq.utils.HtmlToText;

public class HtmlToTextTest {
    public static void main(String[] args) {
        HtmlToText htmlToText = new HtmlToText();
        String s = "<h3 id=\"h3--\"><a name=\"#### ### ### 一、前言\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>#### ### ### 一、前言</h3><p>hi，大家好，这里是白泽。今天给大家分享一个GitHub \uD83C\uDF1F 3.5k 的 Go项目：go-backend-clean-arch<br>github.com/amitshekhar…<br>这个项目是一位老外写的，通过一个 HTTP demo 介绍了一个优雅的项目结构。<br>我也在b站出了一期30多分钟的视频，讲解了这个仓库，欢迎你的关注 \uD83D\uDCFA B站：白泽talk，qq交流群：622383022。</p>\n" +
                "<p>\uD83C\uDF1F 当然，如果您是一位 Go 学习的新手，您可以在我开源的学习仓库：github.com/BaiZe1998/g… 中，找到我往期翻译的英文书籍，或者Go学习路线。</p>\n" +
                "<h3 id=\"h3--\"><a name=\"二、项目架构\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>二、项目架构</h3><p>三、目录详解<br>csharp复制代码.<br>├── Dockerfile # 镜像文件<br>├── api<br>│   ├── controller # 接口<br>│   ├── middleware # 中间件（JWT鉴权）<br>│   └── route # 路由绑定<br>├── bootstrap<br>│   ├── app.go # 核心类<br>│   ├── database.go # 数据库<br>│   └── env.go # 配置类<br>├── cmd<br>│   └── main.go # 启动命令<br>├── docker-compose.yaml<br>├── domain # 实例层<br>├── go.mod<br>├── go.sum<br>├── internal # 内部工具<br>│   └── tokenutil<br>├── mongo # mongodb<br>│   └── mongo.go<br>├── repository # 仓储层<br>└── usecase # 业务层</p>\n" +
                "<p>3.1 参数配置 &amp; 项目启动<br>./cmd/main.go<br>go复制代码<code>html\n" +
                "type Application struct {\n" +
                "    Env   *Env\n" +
                "    Mongo mongo.Client\n" +
                "}\n" +
                "\u200B\n" +
                "type Env struct {\n" +
                "    AppEnv                 string `mapstructure:&quot;APP_ENV&quot;`\n" +
                "    ServerAddress          string `mapstructure:&quot;SERVER_ADDRESS&quot;`\n" +
                "    ContextTimeout         int    `mapstructure:&quot;CONTEXT_TIMEOUT&quot;`\n" +
                "    DBHost                 string `mapstructure:&quot;DB_HOST&quot;`\n" +
                "    DBPort                 string `mapstructure:&quot;DB_PORT&quot;`\n" +
                "    ...\n" +
                "}\n" +
                "\u200B\n" +
                "func main() {\n" +
                "    // app 是整个应用的实例，管理生命周期中的重要资源\n" +
                "    app := bootstrap.App()\n" +
                "    // 配置变量\n" +
                "    env := app.Env\n" +
                "    // 数据库实例\n" +
                "    db := app.Mongo.Database(env.DBName)\n" +
                "    defer app.CloseDBConnection()\n" +
                "\u200B\n" +
                "    timeout := time.Duration(env.ContextTimeout) * time.Second\n" +
                "    // gin 实例创建\n" +
                "    gin := gin.Default()\n" +
                "    // 路由绑定\n" +
                "    route.Setup(env, timeout, db, gin)\n" +
                "    // 运行服务\n" +
                "    gin.Run(env.ServerAddress)\n" +
                "}</code></p>\n" +
                "<p>\uD83C\uDF1F 接下来的讲解将以登陆逻辑为例，讲解三层架构。<br>3.2 接口层<br>./api/controller/login_controller.go<br>LoginController 持有配置类，以及 LoginUsecase 接口（定义了业务层的行为）<br>go复制代码// 业务层接口<br>type SignupUsecase interface {<br>    Create(c context.Context, user <em>User) error<br>    GetUserByEmail(c context.Context, email string) (User, error)<br>    CreateAccessToken(user </em>User, secret string, expiry int) (accessToken string, err error)<br>    CreateRefreshToken(user <em>User, secret string, expiry int) (refreshToken string, err error)<br>}<br>\u200B<br>type LoginController struct {<br>   LoginUsecase domain.LoginUsecase<br>   Env          </em>bootstrap.Env<br>}<br>\u200B<br>func (lc <em>LoginController) Login(c </em>gin.Context) {<br>   var request domain.LoginRequest<br>\u200B<br>   err := c.ShouldBind(&amp;request)<br>   if err != nil {<br>      c.JSON(http.StatusBadRequest, domain.ErrorResponse{Message: err.Error()})<br>      return<br>   }<br>\u200B<br>   user, err := lc.LoginUsecase.GetUserByEmail(c, request.Email)<br>   if err != nil {<br>      c.JSON(http.StatusNotFound, domain.ErrorResponse{Message: “User not found with the given email”})<br>      return<br>   }<br>\u200B<br>   if bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(request.Password)) != nil {<br>      c.JSON(http.StatusUnauthorized, domain.ErrorResponse{Message: “Invalid credentials”})<br>      return<br>   }<br>\u200B<br>   accessToken, err := lc.LoginUsecase.CreateAccessToken(&amp;user, lc.Env.AccessTokenSecret, lc.Env.AccessTokenExpiryHour)<br>   if err != nil {<br>      c.JSON(http.StatusInternalServerError, domain.ErrorResponse{Message: err.Error()})<br>      return<br>   }<br>\u200B<br>   refreshToken, err := lc.LoginUsecase.CreateRefreshToken(&amp;user, lc.Env.RefreshTokenSecret, lc.Env.RefreshTokenExpiryHour)<br>   if err != nil {<br>      c.JSON(http.StatusInternalServerError, domain.ErrorResponse{Message: err.Error()})<br>      return<br>   }<br>\u200B<br>   loginResponse := domain.LoginResponse{<br>      AccessToken:  accessToken,<br>      RefreshToken: refreshToken,<br>   }<br>\u200B<br>   c.JSON(http.StatusOK, loginResponse)<br>}</p>\n" +
                "<p>3.3 业务层<br>./usecase/login_usecase.go<br>loginUsecase 结构实现 LoginUsecase 接口，同时在 loginUsecase 结构中，持有了 UserRepository 接口（定义了仓储层的行为）。<br>go复制代码// 数据防腐层接口<br>type UserRepository interface {<br>    Create(c context.Context, user <em>User) error<br>    Fetch(c context.Context) ([]User, error)<br>    GetByEmail(c context.Context, email string) (User, error)<br>    GetByID(c context.Context, id string) (User, error)<br>}<br>\u200B<br>type loginUsecase struct {<br>   userRepository domain.UserRepository<br>   contextTimeout time.Duration<br>}<br>\u200B<br>func NewLoginUsecase(userRepository domain.UserRepository, timeout time.Duration) domain.LoginUsecase {<br>   return &amp;loginUsecase{<br>      userRepository: userRepository,<br>      contextTimeout: timeout,<br>   }<br>}<br>\u200B<br>func (lu </em>loginUsecase) GetUserByEmail(c context.Context, email string) (domain.User, error) {<br>   ctx, cancel := context.WithTimeout(c, lu.contextTimeout)<br>   defer cancel()<br>   return lu.userRepository.GetByEmail(ctx, email)<br>}<br>\u200B<br>func (lu <em>loginUsecase) CreateAccessToken(user </em>domain.User, secret string, expiry int) (accessToken string, err error) {<br>   return tokenutil.CreateAccessToken(user, secret, expiry)<br>}<br>\u200B<br>func (lu <em>loginUsecase) CreateRefreshToken(user </em>domain.User, secret string, expiry int) (refreshToken string, err error) {<br>   return tokenutil.CreateRefreshToken(user, secret, expiry)<br>}</p>\n" +
                "<p>3.4 防腐层<br>./repository/user<em>repository.go<br>userRepository 结构实现了 UserRepository 接口，内部持有 mongo.Database 接口（定义数据层行为），以及 collection 实例的名称。<br>go复制代码// 数据操作层接口<br>type Database interface {<br>    Collection(string) Collection<br>    Client() Client<br>}<br>\u200B<br>type userRepository struct {<br>   database   mongo.Database<br>   collection string<br>}<br>\u200B<br>func NewUserRepository(db mongo.Database, collection string) domain.UserRepository {<br>   return &amp;userRepository{<br>      database:   db,<br>      collection: collection,<br>   }<br>}<br>\u200B<br>func (ur <em>userRepository) Create(c context.Context, user </em>domain.User) error {<br>   collection := ur.database.Collection(ur.collection)<br>\u200B\n" +
                "   </em>, err := collection.InsertOne(c, user)<br>\u200B<br>   return err<br>}<br>\u200B<br>func (ur <em>userRepository) Fetch(c context.Context) ([]domain.User, error) {<br>   collection := ur.database.Collection(ur.collection)<br>\u200B<br>   opts := options.Find().SetProjection(bson.D{{Key: “password”, Value: 0}})<br>   cursor, err := collection.Find(c, bson.D{}, opts)<br>\u200B<br>   if err != nil {<br>      return nil, err<br>   }<br>\u200B<br>   var users []domain.User<br>\u200B<br>   err = cursor.All(c, &amp;users)<br>   if users == nil {<br>      return []domain.User{}, err<br>   }<br>\u200B<br>   return users, err<br>}<br>\u200B<br>func (ur </em>userRepository) GetByEmail(c context.Context, email string) (domain.User, error) {<br>   collection := ur.database.Collection(ur.collection)<br>   var user domain.User<br>   err := collection.FindOne(c, bson.M{“email”: email}).Decode(&amp;user)<br>   return user, err<br>}<br>\u200B<br>func (ur *userRepository) GetByID(c context.Context, id string) (domain.User, error) {<br>   collection := ur.database.Collection(ur.collection)<br>\u200B<br>   var user domain.User<br>\u200B<br>   idHex, err := primitive.ObjectIDFromHex(id)<br>   if err != nil {<br>      return user, err<br>   }<br>\u200B<br>   err = collection.FindOne(c, bson.M{“_id”: idHex}).Decode(&amp;user)<br>   return user, err<br>}</p>\n" +
                "<p>3.5 数据层<br>./mongo/mongo.go<br>实现了 mongo.Database 接口，通过 mongoDatabase 结构体的两个方法可以获取对应的 Client 实例和 Collection 实例，从而操作数据库。<br>go复制代码type mongoDatabase struct {<br>   db <em>mongo.Database<br>}<br>\u200B<br>func (md </em>mongoDatabase) Collection(colName string) Collection {<br>    collection := md.db.Collection(colName)<br>    return &amp;mongoCollection{coll: collection}<br>}<br>\u200B<br>func (md *mongoDatabase) Client() Client {<br>    client := md.db.Client()<br>    return &amp;mongoClient{cl: client}<br>}</p>\n" +
                "<p>作者：白泽talk<br>链接：<a href=\"https://juejin.cn/post/7352789840352755721\">https://juejin.cn/post/7352789840352755721</a><br>来源：稀土掘金<br>著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。</p>\n";
        System.out.println(htmlToText.toText(s));
        String text = htmlToText.toText(s);
        String substring = text.substring(0, 70);
        System.out.println(substring);
    }
}
