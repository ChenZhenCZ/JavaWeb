package basexxp;

import java.util.ArrayList;
import java.util.List;

import base.BaseDAOimp;
import base.IBaseDAO;
import bean.CourseVo;
import bean.MycourseVo;
import bean.PayRecordVo;

public class MOBpay implements Mpay{
	IBasexxp basexxp=new Basexxp();
	IBaseDAO baseDao=new BaseDAOimp();
	//Âò¿Î¼ÇÂ¼±í
	public List<MycourseVo> paylist(String id) {
		 List<MycourseVo> mylist = new ArrayList<MycourseVo>();
		   List<PayRecordVo> payList=basexxp.findpayRecord(id);
					for(int i=0;i<payList.size();i++){
						MycourseVo mcv=new MycourseVo();
						int courseId=payList.get(i).getCourseid();
						CourseVo course=baseDao.courseven(String.valueOf(courseId));
						mcv.setPay(payList.get(i));
						mcv.setCou(course);
						mylist.add(mcv);
					}
		return mylist;
	}

}
