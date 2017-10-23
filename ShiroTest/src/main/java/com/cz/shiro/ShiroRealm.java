package com.cz.shiro;


import com.cz.baen.Uers;
import com.cz.common.CollectionUtils;
import com.cz.service.PermissionsService;
import com.cz.service.RoleService;
import com.cz.service.UersService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ShiroRealm extends AuthorizingRealm {
    @Autowired
    private UersService uersService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private PermissionsService permissionsService;

    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        String uersname =principalCollection.getPrimaryPrincipal().toString();
        SimpleAuthorizationInfo authenticationInfo =new SimpleAuthorizationInfo();
        authenticationInfo.setRoles(CollectionUtils.listToSet(roleService.listRoles(uersname)));
        authenticationInfo.setStringPermissions(CollectionUtils.listToSet(permissionsService.listPermissions(uersname)));
        return authenticationInfo;
    }

    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        String uersname =authenticationToken.getPrincipal().toString();
        String password =authenticationToken.getCredentials().toString();
        Uers uers=uersService.getByNamePwd(uersname,password);
        if (uers!=null) {
            return new SimpleAuthenticationInfo(authenticationToken.getPrincipal(),authenticationToken.getCredentials(),"myRealm");
        }
        return null;
    }
}
