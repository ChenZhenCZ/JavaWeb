package com.cz.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.realm.AuthenticatingRealm;

public class MyRealm extends AuthenticatingRealm {
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
       String uresname =(String) authenticationToken.getPrincipal();
       String password =String.valueOf((char[]) authenticationToken.getCredentials());
       if("amdin".equals(uresname) && "123456".equals(password)){
           return new SimpleAuthenticationInfo(authenticationToken.getPrincipal(),authenticationToken.getCredentials(),"myRealm");
       }
        return null;
    }
}
