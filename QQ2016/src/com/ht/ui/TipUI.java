package com.ht.ui;

import java.awt.Color;
import java.awt.Toolkit;

import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;

import com.ht.base.Cmd;
import com.ht.vo.AccountVo;
import com.sun.awt.AWTUtilities;

public class TipUI extends JFrame{

	JLabel myLabel;
	public TipUI(AccountVo myInfo) {
		setUndecorated(true);
		getContentPane().setBackground(Color.PINK);
		String str  = myInfo.getNickName()+"("+myInfo.getQqCode()+")";
		if(myInfo.getOnlinestatus().equals(Cmd.STATUS[0])){
			str +="上线了";
		}else{
			str +="下线了";
		}
		String headimg = changeState(myInfo);
		System.out.println("aaaaaaaaaaaaaa="+headimg);
		myLabel = new JLabel(str,new ImageIcon(headimg),JLabel.RIGHT);
		
		add(myLabel);
		setAlwaysOnTop(true);
		setSize(200, 100);
		Toolkit toolkit = Toolkit.getDefaultToolkit();
		int width = toolkit.getScreenSize().width-200;
		int height = toolkit.getScreenSize().height;
		setVisible(true);
		for(int i=0;i<100;i++){
			setLocation(width,height-i);
			try {
				Thread.sleep(50);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		for(int i=100;i>0;i--){
			AWTUtilities.setWindowOpacity(this, 0.01f*i);
			try {
				Thread.sleep(50);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		dispose();
	}
	public String changeState(AccountVo myInfo){
		String status = myInfo.getOnlinestatus();
		String filename=myInfo.getHeadImg();
		String headImg= myInfo.getHeadImg();
		if(status.equals(Cmd.STATUS[0])){
			filename = headImg;
		}else if(status.equals(Cmd.STATUS[1])){
			int pos = headImg.indexOf('.');
			String pre = headImg.substring(0,pos);
			String fix = headImg.substring(pos,headImg.length());
			filename = pre + "_h"+fix;
		}
		return filename;
	}
	public static void main(String[] args) {
		new TipUI(null);
	}
}
