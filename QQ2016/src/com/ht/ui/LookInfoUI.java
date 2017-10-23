package com.ht.ui;

import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.swing.ButtonGroup;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPasswordField;
import javax.swing.JRadioButton;
import javax.swing.JTextArea;
import javax.swing.JTextField;

import com.ht.db.BaseDAO;
import com.ht.vo.AccountVo;

public class LookInfoUI extends JFrame implements MouseListener{
	private JLabel lblQQcode,lblnickName,lblAge,lblBg;
	private JLabel lblSex,lblNation,lblStar,lblBlood;
	private JLabel lblRemark,lblHobit,lblHeadImg;
	public LookInfoUI(){}
	public LookInfoUI(AccountVo myInfo){
		super("修改个人用户资料");
		setIconImage(new ImageIcon("images/tubiao.jpg").getImage());
		lblBg = new JLabel(new ImageIcon("images/bgreg5.jpg"));
		add(lblBg);
		lblBg.setLayout(null);
		JLabel title = new JLabel("好友资料",JLabel.CENTER);
		title.setFont(new Font("楷体",Font.BOLD,36));
		title.setForeground(Color.RED);
		title.setBounds(0,30,260,40);
		lblBg.add(title);
		lblQQcode = new JLabel("QQ号码:"+myInfo.getQqCode(),JLabel.RIGHT);
		lblnickName = new JLabel("昵称:"+myInfo.getNickName(),JLabel.RIGHT);
		lblHeadImg = new JLabel(new ImageIcon(myInfo.getHeadImg()));
		lblAge = new JLabel("年龄:"+myInfo.getAge(),JLabel.RIGHT);
		lblSex = new JLabel("性别:"+myInfo.getSex(),JLabel.RIGHT);
		lblNation = new JLabel("民族:"+myInfo.getNation(),JLabel.RIGHT);
		lblStar = new JLabel("星座:"+myInfo.getStar(),JLabel.RIGHT);
		lblBlood = new JLabel("血型:"+myInfo.getBlood()+"型",JLabel.RIGHT);
		lblHobit = new JLabel("爱好:"+myInfo.getHobit(),JLabel.CENTER);
		lblRemark = new JLabel("备注:"+myInfo.getRemark(),JLabel.CENTER);
		
		
		
		lblQQcode.setBounds(0, 100, 100, 20);
		lblnickName.setBounds(0, 140, 100, 20);
		
		lblHeadImg.setBounds(280, 100, 80, 60);
		
		lblAge.setBounds(0, 180, 100, 20);
		lblSex.setBounds(280, 180, 80, 20);
		
		lblNation.setBounds(0, 220, 100, 20);
		lblStar.setBounds(280, 220, 80, 20);
		
		lblBlood.setBounds(0, 260, 100, 20);
		lblHobit.setBounds(0, 300, 300, 20);

		lblRemark.setBounds(0, 340, 300, 20);
		
		lblBg.add(lblQQcode);
		lblBg.add(lblnickName);
		lblBg.add(lblHeadImg);
		lblBg.add(lblAge);
		lblBg.add(lblSex);
		lblBg.add(lblNation);
		lblBg.add(lblStar);
		lblBg.add(lblBlood);
		lblBg.add(lblHobit);
		lblBg.add(lblRemark);
		addMouseListener(this);
		//隐藏标题栏
		setUndecorated(true);
		setResizable(false);
		setSize(420, 380);
		setVisible(true);
		setLocationRelativeTo(null);
		//关闭窗口，不退出应用程序
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
	}

	public static void main(String[] args) {
		new LookInfoUI();
	}
	public void mouseClicked(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void mouseExited(MouseEvent e) {
		dispose();
	}
	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
}
