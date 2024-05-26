package com.zwq.utils;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class HtmlToText {

    public String toText(String htmlText){
        // 使用Jsoup解析HTML
        Document doc = Jsoup.parse(htmlText);

        // 提取纯文本
        return doc.text();
    }
}




