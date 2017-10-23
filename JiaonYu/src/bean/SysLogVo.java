package bean;

import java.io.Serializable;
import java.util.Date;
//16系统日志表
public class SysLogVo implements Serializable{
	private int sysLogId;	 //系统日志id
	private int managerId;	 //管理员id
	private int Type;		 //日志类型（新增，修改，删除，登录，修改密码）
	private String Content;	 //日志内容
	private Date createDate; //发生时间
	private String ipAddress; //ip地址
	public int getSysLogId() {
		return sysLogId;
	}
	public void setSysLogId(int sysLogId) {
		this.sysLogId = sysLogId;
	}
	public int getManagerId() {
		return managerId;
	}
	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}
	public int getType() {
		return Type;
	}
	public void setType(int type) {
		Type = type;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
}
