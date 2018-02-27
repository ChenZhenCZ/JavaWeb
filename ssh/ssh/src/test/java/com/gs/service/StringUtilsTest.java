package com.gs.service;

import org.apache.commons.lang3.StringUtils;
import org.junit.Test;;

/**
 * Created by Administrator on 2017/11/29.
 */
public class StringUtilsTest {

    @Test
    public void testStringUtils() {
        System.out.println(StringUtils.isEmpty(" "));
        System.out.println(StringUtils.isBlank(" "));
        System.out.println(StringUtils.capitalize("abcd"));
    }
}
