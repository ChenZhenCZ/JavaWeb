import com.cz.bean.User;
import com.cz.dao.UserDAO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class UserDAOTest extends BaenTest {
    @Autowired
    private UserDAO userDAO;

    @Test
    public void  getByPhonePwd(){
        User user =userDAO.getByPhonePwd("15270640035","123456");
        System.out.println(user);
    }
}
