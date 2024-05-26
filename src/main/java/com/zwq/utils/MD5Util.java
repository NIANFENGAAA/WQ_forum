package com.zwq.utils;

import org.apache.commons.codec.digest.DigestUtils;

public class MD5Util {
    public static String encryptMD5(String input) {
        return DigestUtils.md5Hex(input);
    }
}