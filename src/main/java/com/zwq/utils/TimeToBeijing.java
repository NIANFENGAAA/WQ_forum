package com.zwq.utils;
import java.time.Instant;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
public class TimeToBeijing {
    public static String convertToBeijingTime(long timestamp) {
        // 将时间戳转换为Instant对象
        Instant instant = Instant.ofEpochMilli(timestamp);

        // 设定北京时区
        ZoneId zoneId = ZoneId.of("Asia/Shanghai");

        // 将Instant转换为ZonedDateTime对象，并应用北京时区
        ZonedDateTime zonedDateTime = instant.atZone(zoneId);

        // 格式化日期时间
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = zonedDateTime.format(formatter);

        return formattedDateTime;
    }
}
