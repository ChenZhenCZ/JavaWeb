package com.wd.dao.imp;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.Cookie;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.wd.bean.UsersVO;
import com.wd.common.PageByEasyUi;
import com.wd.common.util.MyMD5Util;
import com.wd.dao.UserDao;

public class UserDaoImp implements UserDao{
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	//通过id查询
	@Override
	public UsersVO queryById(String id) {
		Session session=sessionFactory.getCurrentSession();
		return session.get(UsersVO.class, id);
	}
	//注册
	@Override
	public void saveOrUpdate(UsersVO t) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(t);
	}
	//删除
	@Override
	public void del(UsersVO t) {
		// TODO Auto-generated method stub
		
	}
	//分页查询
	@Override
	public PageByEasyUi<UsersVO> queryByPage(PageByEasyUi<UsersVO> page) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from UsersVO");
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<UsersVO> list = query.list();
		page.setRows(list);
		page.setTotal(count());
		return page;
	}
	//统计记录条数
	@Override
	public int count() {
		Session session=sessionFactory.getCurrentSession();
		Query query =session.createSQLQuery("select count(id) from t_user");
		BigInteger cnt = (BigInteger) query.uniqueResult();	
		return cnt.intValue();
	}
	//用户登录
	@Override
	public UsersVO login(UsersVO user) {
		Session session = sessionFactory.getCurrentSession();
		String hql="from UsersVO u where u.phone=?";
		Query query=session.createQuery(hql);
		query.setString(0,user.getPhone());
		List<UsersVO> list = query.list();
		boolean valitePwd=false;
		if(list.size()>0){
				UsersVO user2=list.get(0);
			try {
				valitePwd=MyMD5Util.validPassword(user.getPwd(),user2.getPwd());
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			if(valitePwd){
				return user2;
			}else{
				return null;
			}
		}else{
			return null;
	}
}
	//判断手机号是否被注册过
	@Override
	public int queryByPhone(String phone) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from UsersVO where phone=? ");
		query.setString(0,phone);
		List<UsersVO> list = query.list();
		if(list.size()>0){
			return 1;	//返回1 表示该账号已被注册过
		}else{
			return 0;//返回0 表示该账号没被注册过
		}
	}
	//修改用户密码
	@Override
	public void changePwd(String id, String pwd) {
		Session session = sessionFactory.getCurrentSession();
		String sql="update t_user set pwd='"+pwd+"' where id='"+id+"'";
		System.out.println(sql);
		session.createNativeQuery(sql).executeUpdate();
	}
	//修改用户信息
	@Override
	public void update(UsersVO user) {
		Session session = sessionFactory.getCurrentSession();
		String sql="update  t_user  set email='"+user.getEmail()+"',phone='"+user.getPhone()+"',qq='"+user.getQq()+"',wechat='"+user.getWechat()+"',gender='"+user.getGender()+"',birthday='"+new Date(user.getBirthday().getTime())+"',nickname='"+user.getNickname()+"',t_name='"+user.getName()+"',address='"+user.getAddress()+"',introduction='"+user.getIntroduction()+"'  where id='"+user.getId()+"'";
		System.out.println(sql);
		session.createNativeQuery(sql).executeUpdate();//用sql语句查询
	}
	//忘记密码
	@Override
	public void forgetPwd(String phone, String pwd) {
		Session session = sessionFactory.getCurrentSession();
		String sql="update t_user set pwd='"+pwd+"'  where phone='"+phone+"'";
		session.createNativeQuery(sql).executeUpdate();
	}
	//修改用户头像
	@Override
	public void modifyHeadicon(String id, String logoUrl) {
		Session session = sessionFactory.getCurrentSession();
		String sql ="update t_user set headicon='"+logoUrl+"'  where id='"+id+"'";
		session.createNativeQuery(sql).executeUpdate();
	}
}
