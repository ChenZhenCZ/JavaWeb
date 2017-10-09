package com.wd.service.imp;

import java.util.List;

import com.wd.bean.AgencyVO;
import com.wd.common.MailSenderInfo;
import com.wd.common.PageByEasyUi;
import com.wd.common.SendMail;
import com.wd.dao.AgencyDao;
import com.wd.service.AgencyService;

public class AgencyServiceImpl implements AgencyService{

	private AgencyDao agencyDao;
	public void setAgencyDao(AgencyDao agencyDao) {
		this.agencyDao = agencyDao;
	}
	@Override
	public AgencyVO queryById(String id) {
		return agencyDao.queryById(id);
	}
	@Override
	public void saveOrUpdate(AgencyVO t) {
		agencyDao.saveOrUpdate(t);
	}
	@Override
	public void del(AgencyVO t) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public PageByEasyUi<AgencyVO> queryByPage(PageByEasyUi<AgencyVO> page) {
		return agencyDao.queryByPage(page);
	}
	@Override
	public int count() {
		return agencyDao.count();
	}
	
	@Override
	public int queryByPhone(String phone) {
		int cnt = agencyDao.queryByPhone(phone);
		return cnt;
	}
	
	 
	@Override
	public AgencyVO loginValidate(String phone, String pwd) {
		return agencyDao.loginValidate(phone, pwd);
	}
	
	//经销商忘记密码(密码修改)
	@Override
	public void forgetPwd(String phone, String pwd) {
		agencyDao.forgetPwd(phone, pwd);
	}
	
	@Override
	public AgencyVO lookImg(String id) {
		return agencyDao.lookImg(id);
	}
	@Override
	public void modifyImg(String id, AgencyVO agency) {
		agencyDao.modifyImg(id, agency);
	}
	@Override
	public void modifyLogo(String id, String logoUrl) {
		agencyDao.modifyLogo(id, logoUrl);
	}
	@Override
	public AgencyVO login(AgencyVO t) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void updateStatus(AgencyVO a) {
	//	sendMessage(a);
		agencyDao.updateStatus(a);
	}
	@Override
	public void sendMessage(AgencyVO a){
		if(a.getStatus().equals("激活")){
			MailSenderInfo info=new MailSenderInfo();
			info.setToAddress(a.getEmail());
			info.setSubject("经销商入驻通知");
			String content="您好！您的账号为:"+a.getPhone()+"的万达平台经销商入驻审核已成功通过"+
			"请到官网登陆！http://localhost:8080/EstateSales/";
			info.setContent(content);
			new SendMail().sendMail(info);
		}else{
			MailSenderInfo info=new MailSenderInfo();
			info.setToAddress(a.getEmail());
			info.setSubject("经销商通知");
			String content="您好！您的账号为:"+a.getPhone()+"的万达平台经销商账号已被冻结"+
			",如有疑问，请咨询平台管理员！QQ：1471244691";
			info.setContent(content);
			new SendMail().sendMail(info);
		}
	}
	@Override
	public List agencyList() {
		return agencyDao.agencyList();
	}
	@Override
	public List<AgencyVO> agencyBySale() {
		return agencyDao.agencyBySale();
	}
}
