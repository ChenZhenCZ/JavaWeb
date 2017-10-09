package com.cz.mail;

import org.junit.Test;

import java.util.Properties;

public class MainUtilsTest {
    @Test
    public void testBuild() {
        Properties properties = MainUtils.duid("src/main/resources/mail.properties");
        System.out.println(MainUtils.getString("username"));
        System.out.println(MainUtils.getInteger("mail.smtp.port"));
    }
}
