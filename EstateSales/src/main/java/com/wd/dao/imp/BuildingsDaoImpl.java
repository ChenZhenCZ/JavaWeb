package com.wd.dao.imp;

import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.wd.bean.ArticleTypeVO;
import com.wd.bean.BuildingsImgVO;
import com.wd.bean.BuildingsVO;
import com.wd.bean.CommentVO;
import com.wd.bean.FindObject;
import com.wd.common.PageByEasyUi;
import com.wd.dao.BuildingsDao;

public class BuildingsDaoImpl implements BuildingsDao{

	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public BuildingsVO queryById(String id) {
		Session session = sessionFactory.getCurrentSession();
		BuildingsVO b=(BuildingsVO)session.get(BuildingsVO.class,id);
		//b.setBuildingsImgSet(b.getBuildingsImgSet());
		//b.setEmpSet(b.getEmpSet());
		return b;
	}

	@Override
	public void saveOrUpdate(BuildingsVO t) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(t);
	}

	@Override
	public void del(BuildingsVO t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public PageByEasyUi<BuildingsVO> queryByPage(PageByEasyUi<BuildingsVO> page) {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from BuildingsVO order by created_time desc");
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<BuildingsVO> list = query.list();
		page.setRows(list);
		page.setTotal(count());
		return page;
	}

	@Override
	public int count() {
		Session session=sessionFactory.getCurrentSession();
		String sql="select count(*) from t_buildings";
		Query query=session.createNativeQuery(sql);
		List list=query.list();
		BigInteger cnt=(BigInteger)list.get(0);
		return cnt.intValue();
	}
	
	@Override 	//保存楼栋图片地址
	public String saveBuildUrl(String logoFileName, File logo) {
		String path = ServletActionContext.getRequest().getRealPath("/attached/agency");
		int pos = logoFileName.lastIndexOf('.');
		String ext = logoFileName.substring(pos); 
		String newFileName = System.nanoTime()+ext;
		try {
			FileUtils.copyFile(logo, new File(path,newFileName));//保存楼栋图片
		} catch (IOException e) {
			e.printStackTrace();
		}
		String logoUrl=ServletActionContext.getRequest().getContextPath()+"/attached/agency";
		return logoUrl+"/"+newFileName;
	}

	@Override
	public void inOractive(BuildingsVO buildingsVo) {
		Session session = sessionFactory.getCurrentSession();
		String sql ="update  t_buildings set b_status='"+buildingsVo.getStatus()+"' where id='"+buildingsVo.getId()+"'";
		session.createSQLQuery(sql).executeUpdate();
	}

	@Override
	public void batchUploadImg(BuildingsImgVO buildingsImgVO) {
		Session session = sessionFactory.getCurrentSession();
		session.save(buildingsImgVO);
	}

	@Override
	public BuildingsVO login(BuildingsVO t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> buildsMapList() {
		List<String>list=new ArrayList<>();
		Session session=sessionFactory.getCurrentSession();
		String sql="SELECT longitude,latitude,t_name,intro,logo from t_buildings";
		list=session.createNativeQuery(sql).list();
		return list;
	}

	@Override
	public PageByEasyUi<BuildingsVO> pageByAgency(PageByEasyUi<BuildingsVO>page,String id) {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from BuildingsVO where agency_id=:id");
		query.setParameter("id",id);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getPageSize());
		List<BuildingsVO> list = query.list();
		page.setRows(list);
		page.setTotal(countByAgency(id));
		return page;
	}

	@Override
	public int countByAgency(String id) {
		Session session=sessionFactory.getCurrentSession();
		String sql="select count(*) from t_buildings where agency_id='"+id+"'";
		Query query=session.createNativeQuery(sql);
		List list=query.list();
		BigInteger cnt=(BigInteger)list.get(0);
		return cnt.intValue();
	}

	@Override
	public BuildingsVO lookBuildsDetail(String buildingsId) {
		Session session = sessionFactory.getCurrentSession();
		String hql="from BuildingsVO where id=:buildingsId";
		Query<BuildingsVO> query = session.createQuery(hql);
		query.setParameter("buildingsId", buildingsId);
		List<BuildingsVO> list = query.list();
		return list.get(0);
	}

	@Override
	public List buildsListMap(String id) {
		Session session=sessionFactory.getCurrentSession();
		String sql="SELECT longitude,latitude,t_name,intro,logo from t_buildings where agency_id='"+id+"'";
		return session.createNativeQuery(sql).list();
	}

	@Override
	public void agencyModifyImg(BuildingsVO buildingsVo) {
		Session session=sessionFactory.getCurrentSession();
		String sql ="update  t_buildings set logo='"+buildingsVo.getLogo()+"' where id='"+buildingsVo.getId()+"'";
		session.createNativeQuery(sql).executeUpdate();
	}

	@Override
	public List buildsListByagency(String agencyId) {
		Session session=sessionFactory.getCurrentSession();
		String hql="from BuildingsVO where agency_id=:id";
		Query query=session.createQuery(hql);
		query.setParameter("id",agencyId);
		return query.list();
	}

	@Override
	public List buildsListByTime() {
		Session session=sessionFactory.getCurrentSession();
		Query query= session.createQuery("from BuildingsVO order by created_time desc");
		query.setFirstResult(0);
		query.setMaxResults(6);
		return query.list();
	}
	@Override
	public List<BuildingsVO> pageBysql(FindObject find, int startPos, int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "";
		String str="";
		if(!(find.getArea()==null||find.getArea().equals("不限"))){
			str+=" and area like '%"+find.getArea()+"%'";
		}
		if(!(find.getHouse()==null||find.getHouse().equals("不限"))){
			str+=" and house_type like '%"+find.getHouse()+"%'";
		}
		if(!(find.getPrice()==null||find.getPrice().equals("不限"))){
			str+=" and avg_price "+find.getPrice();
		}
		if(find.getSosuo()==null||find.getSosuo().equals("")){
			hql = "from BuildingsVO where 1=1"+str;
			System.out.println(hql);
			Query query = session.createQuery(hql);
			query.setFirstResult(startPos);
			query.setMaxResults(pageSize);
			List<BuildingsVO> list = query.list();
			return list;
		}else{
			try{
		        //若是数字，则可以转换，否则会出现异常
				int a=Integer.parseInt(find.getSosuo());
				hql = "from BuildingsVO where avg_price like '%"+a+"%'"+str;
				System.out.println(hql);
				Query query = session.createQuery(hql);
				query.setFirstResult(startPos);
				query.setMaxResults(pageSize);
				List<BuildingsVO> list = query.list();
				return list;
		   }catch (NumberFormatException e){
			   	String m="%"+find.getSosuo()+"%";
		    	hql = "from BuildingsVO where t_name like:name or address like:address or area like:area"+str;
		    	System.out.println(hql);
		    	Query query = session.createQuery(hql);
		    	query.setParameter("name",m);
			   	query.setParameter("address",m);
			   	query.setParameter("area",m);
				query.setFirstResult(startPos);
				query.setMaxResults(pageSize);
				List<BuildingsVO> list = query.list();
				return list;
	       }
		}
		
	}

	@Override
	public List<BuildingsVO> buildsListByactivity() {
		Session session=sessionFactory.getCurrentSession();
		String hql="select distinct  b from BuildingsVO as b,ActivityVO as a where b.id=buildings_id";
		Query query=session.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(6);
		return query.list();
	}

	@Override
	public List<BuildingsVO> buildsBySaleTime() {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from BuildingsVO where status=:status order by open_date desc");
		query.setParameter("status","激活");
		query.setFirstResult(0);
		query.setMaxResults(6);
		return query.list();
	}

	@Override
	public List<Object[]> buildsAvgPrice() {
		Session session=sessionFactory.getCurrentSession();
		String sql="select AVG(avg_price),YEAR(created_time),MONTH(created_time) from"
				+ " t_buildings where b_status='激活' GROUP BY"
				+ " YEAR(created_time),MONTH(created_time) ORDER BY created_time";
		Query query=session.createNativeQuery(sql);
		return query.list();
	}

	@Override
	public List<BuildingsVO> hotBuilds() {
		Session session=sessionFactory.getCurrentSession();
		String hql="select DISTINCT b from BuildingsVO as b,EmployeeVO as e, "
				+ "SalaryVO as s where b.id=building_id and e.id=emp_id and "
				+ "s.time=:t order by s.sum desc";
		Query query=session.createQuery(hql);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM");
		String t=sdf.format(new Date());
		query.setParameter("t",t);
		query.setFirstResult(0);
		query.setMaxResults(6);
		return query.list();
	}
}
