package bean;

import java.io.Serializable;
import java.util.Date;
//15���������԰�
public class ForumVo implements  Serializable{
	private int forumid;//	���
	private  int userid;//�����û�id
	private  int ReplayUserId;//�ظ��û�id
	private   int fourmtype;//1�����ʣ�2���ظ�
	private  String content;//��������
	private  Date forumdate;//	����ʱ��
	private String  forumname;//�ظ���
	private String  textde;//�ظ�����
	public int getForumid() {
		return forumid;
	}
	public void setForumid(int forumid) {
		this.forumid = forumid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getReplayUserId() {
		return ReplayUserId;
	}
	public void setReplayUserId(int replayUserId) {
		ReplayUserId = replayUserId;
	}
	public int getFourmtype() {
		return fourmtype;
	}
	public void setFourmtype(int fourmtype) {
		this.fourmtype = fourmtype;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getForumdate() {
		return forumdate;
	}
	public void setForumdate(Date forumdate) {
		this.forumdate = forumdate;
	}
	public String getForumname() {
		return forumname;
	}
	public void setForumname(String forumname) {
		this.forumname = forumname;
	}
	public String getTextde() {
		return textde;
	}
	public void setTextde(String textde) {
		this.textde = textde;
	}
}
