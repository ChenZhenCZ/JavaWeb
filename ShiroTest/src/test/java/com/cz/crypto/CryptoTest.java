package com.cz.crypto;

import org.apache.shiro.codec.Hex;
import org.apache.shiro.crypto.AesCipherService;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.crypto.hash.Sha1Hash;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.apache.shiro.crypto.hash.Sha384Hash;
import org.junit.Test;

import java.io.UnsupportedEncodingException;
import java.security.Key;

public class CryptoTest {

    /*
    *加密
    *
     */
    @Test
    public void testMD5(){
        Md5Hash md5Hash =new Md5Hash("123456","123");
        System.out.println(md5Hash.toBase64());
        System.out.println(md5Hash.toString());
        System.out.println(md5Hash.toHex());
    }

    @Test
    public void testSha(){
        System.out.println(new Sha1Hash("123456","123456"));
        System.out.println(new Sha256Hash("123456","123456"));
        System.out.println(new Sha384Hash("123456","123456"));

    }

    /**
     * 对称密钥加密
     */
    @Test
    public void testAES() throws UnsupportedEncodingException {
        AesCipherService aesCipherService = new AesCipherService();
        aesCipherService.setKeySize(128); //设置key长度
        Key key = aesCipherService.generateNewKey();
        String text = "hello,中国";
        //密钥
        String encrptText = aesCipherService.encrypt(text.getBytes(), key.getEncoded()).toHex();
        //解密
        String text2 = new String(aesCipherService.decrypt(Hex.decode(encrptText), key.getEncoded()).getBytes());
        System.out.println(encrptText);
        System.out.println(text2);
    }
}
