package com.pgs.common;

import java.security.MessageDigest;

/**
 * Created by Administrator on 2017/6/21.
 * md5加密
 */
public class Md5 {

    public static String md5Digest(String src) {
        byte[] b = null;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            b = md.digest(src.toLowerCase().getBytes("utf-8"));
        } catch (Exception e) {

        }
        return byte2HexStr(b);
    }

    private static String byte2HexStr(byte[] b) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < b.length; i++) {
            String s = Integer.toHexString(b[i] & 0xFF);
            if (s.length() == 1) {
                sb.append("0");
            }
            sb.append(s.toUpperCase());
        }
        return sb.toString();
    }
}
