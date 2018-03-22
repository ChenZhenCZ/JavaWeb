package com.cz.common;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Http {

    public static  String methodGet(String url,String param) throws  Exception {
        DefaultHttpClient httpclient = new DefaultHttpClient();
        //代理的设置
//           HttpHost proxy = new HttpHost("10.60.8.20", 8080);
//           httpclient.getParams().setParameter(ConnRoutePNames.DEFAULT_PROXY, proxy);

        //目标地址
        HttpPost httpGet = new HttpPost(url);

        //构造最简单的字符串数据
//           StringEntity reqEntity = new StringEntity("name=test&password=test");
        StringEntity reqEntity = new StringEntity(param);
        // 设置类型
        reqEntity.setContentType("application/x-www-form-urlencoded");
        // 设置请求的数据
        httpGet.setEntity(reqEntity);
        // 执行
        HttpResponse response = httpclient.execute(httpGet);
        HttpEntity entity = response.getEntity();
        System.out.println(response.getStatusLine());

        if (entity != null) {
            System.out.println("Response content length: " + entity.getContentLength());  //得到返回数据的长度
        }      // 显示结果
        BufferedReader reader = new BufferedReader(new InputStreamReader(entity.getContent(), "UTF-8"));
        String line = reader.readLine();
        System.out.println(line);
        if (entity != null) {
            entity.consumeContent();
        }
        return line;
    }
}
