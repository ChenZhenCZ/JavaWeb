package bean;

import java.io.Serializable;
import java.util.Date;
//16ϵͳ��־��
public class SysLogVo implements Serializable{
	private int sysLogId;	 //ϵͳ��־id
	private int managerId;	 //����Աid
	private int Type;		 //��־���ͣ��������޸ģ�ɾ������¼���޸����룩
	private String Content;	 //��־����
	private Date createDate; //����ʱ��
	private String ipAddress; //ip��ַ
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
