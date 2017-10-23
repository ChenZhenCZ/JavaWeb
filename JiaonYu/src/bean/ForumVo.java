package bean;

import java.io.Serializable;
import java.util.Date;
//15、在线留言板
public class ForumVo implements  Serializable{
	private int forumid;//	编号
	private  int userid;//提问用户id
	private  int ReplayUserId;//回复用户id
	private   int fourmtype;//1：提问；2：回复
	private  String content;//提问内容
	private  Date forumdate;//	提问时间
	private String  forumname;//回复人
	private String  textde;//回复内容
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
