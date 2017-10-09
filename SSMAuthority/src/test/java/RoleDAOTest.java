import com.cz.bean.Permission;
import com.cz.service.PermissionService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class RoleDAOTest extends BaenTest {
    @Autowired
    private PermissionService permissionService;

    @Test
    public void getByPermissionRole(){
        List<Integer> roleIds = new ArrayList<Integer>();
        roleIds.add(1);
        Permission permission = permissionService.getByPermissionRole(roleIds, "com.cz.controller.UserController.menu1");
        System.out.println(permission);
    }
}
