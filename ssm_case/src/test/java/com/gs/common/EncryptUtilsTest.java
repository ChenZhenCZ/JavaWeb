package com.gs.common;

import org.junit.Test;

/**
 * Created by Administrator on 2017/12/7.
 */
public class EncryptUtilsTest {
    @Test
    public void testEncrypt() {
        System.out.println(EncryptUtils.md5("123456"));
    }
}
