package com.cz.common;

import com.cz.bean.Message;
import com.cz.bean.User;
import com.cz.dao.MessageDAO;
import com.cz.dao.UserDAO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class MessageTest extends  BaseTest{
    @Autowired
    private MessageDAO messageDAO;

    @Test
    public void svae(){
        Message message=new Message();
        message.setuId(1);
        message.setImg("111.jsp");
        message.setContent("人在故我在");
       messageDAO.save(message);
    }
    @Test
    public void listAll(){
        Pager pager=new Pager(1,5);
        List<Object> objectList=messageDAO.listPagerCriteria(pager,null);
        for (Object obj:objectList){
            Message message=(Message) obj;
            System.out.println(message.getContent());
        }
    }
}
