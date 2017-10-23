package com.ht.vo;

import java.io.Serializable;

public class FriendVo implements Serializable{
	private int friendId;
	private int myQQcode;
	private int friendQQcode;
	private String groupName;
	public int getFriendId() {
		return friendId;
	}
	public void setFriendId(int friendId) {
		this.friendId = friendId;
	}
	public int getMyQQcode() {
		return myQQcode;
	}
	public void setMyQQcode(int myQQcode) {
		this.myQQcode = myQQcode;
	}
	public int getFriendQQcode() {
		return friendQQcode;
	}
	public void setFriendQQcode(int friendQQcode) {
		this.friendQQcode = friendQQcode;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	
}
