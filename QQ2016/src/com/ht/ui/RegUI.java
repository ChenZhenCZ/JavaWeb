package com.ht.ui;

import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
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

public class RegUI extends JFrame implements ActionListener{
	private JLabel lblQQcode,lblnickName,lblPassword,lblcfgPwd,lblAge;
	private JLabel lblSex,lblNation,lblStar,lblBlood,lblIpAddr,lblPort;
	private JLabel lblRemark,lblHobit,lblHeadImg;
	private JTextField txtQQcode,txtNickName,txtAge,txtIpAddr,txtPort,txtHobit;
	private JPasswordField txtPassword,txtCfgPwd;
	private JRadioButton rbMale,rbRemale;
	private JComboBox cbNation,cbStar,cbBlood,cbHeadImg;
	private JTextArea taRemark;
	private ButtonGroup bg;
	private JLabel lblBg;
	private JButton btnSave,btnClose;
	private String sNation[]={
			"汉族","苗族","壮族","高山族","回族","侗族",
			"傣族","藏族","朝鲜族","其他"
	};
	private String sStar[]={
			"双鱼座","金牛座","摩羯座","天蝎座","处女座","狮子座","白羊座",
			"水瓶座","射手座","天秤座","巨蟹座","双子座",
	};
	private String sBlood[]={"A","B","O","AB"};
	private String sHeadImg[] = {
			"head/0.png","head/1.png","head/2.png",
			"head/3.png","head/4.png","head/5.png",
			"head/6.png","head/7.png","head/8.png",
			"head/9.png","head/10.png"
	};
	private ImageIcon[] headIcon = {
			new ImageIcon(sHeadImg[0]),
			new ImageIcon(sHeadImg[1]),
			new ImageIcon(sHeadImg[2]),
			new ImageIcon(sHeadImg[3]),
			new ImageIcon(sHeadImg[4]),
			new ImageIcon(sHeadImg[5]),
			new ImageIcon(sHeadImg[6]),
			new ImageIcon(sHeadImg[7]),
			new ImageIcon(sHeadImg[8]),
			new ImageIcon(sHeadImg[9]),
			new ImageIcon(sHeadImg[10])
	};
	public RegUI(){
		super("QQ用户注册");
		setIconImage(new ImageIcon("images/tubiao.jpg").getImage());
		lblBg = new JLabel(new ImageIcon("images/bgreg.jpg"));
		add(lblBg);
		lblBg.setLayout(null);
		JLabel title = new JLabel("用户注册",JLabel.CENTER);
		title.setFont(new Font("楷体",Font.BOLD,36));
		title.setForeground(Color.RED);
		title.setBounds(0,30,160,40);
		lblBg.add(title);
		lblQQcode = new JLabel("QQ号码:",JLabel.RIGHT);
		lblnickName = new JLabel("昵称:",JLabel.RIGHT);
		lblHeadImg = new JLabel("头像:",JLabel.RIGHT);
		lblPassword = new JLabel("登录密码:",JLabel.RIGHT);
		lblcfgPwd = new JLabel("确认密码:",JLabel.RIGHT);
		lblAge = new JLabel("年龄:",JLabel.RIGHT);
		lblSex = new JLabel("性别:",JLabel.RIGHT);
		lblNation = new JLabel("民族:",JLabel.RIGHT);
		lblStar = new JLabel("星座:",JLabel.RIGHT);
		lblBlood = new JLabel("血型:",JLabel.RIGHT);
		lblHobit = new JLabel("爱好:",JLabel.RIGHT);
		lblIpAddr = new JLabel("IP地址:",JLabel.RIGHT);
		lblPort = new JLabel("端口:",JLabel.RIGHT);
		lblRemark = new JLabel("备注:",JLabel.RIGHT);
		
		txtQQcode = new JTextField(10);
		txtQQcode.setText("系统自动生成");
		txtQQcode.setEditable(false);
		txtNickName = new JTextField(10);
		cbHeadImg = new JComboBox(headIcon);
		txtPassword = new JPasswordField(10);
		txtPassword.setEchoChar('@');
		txtCfgPwd = new JPasswordField(10);
		txtCfgPwd.setEchoChar('@');
		txtAge = new JTextField(5);
		rbMale = new JRadioButton("男",true);
		rbRemale = new JRadioButton("女");
		bg = new ButtonGroup();
		bg.add(rbMale);
		bg.add(rbRemale);
		cbNation = new JComboBox(sNation);
		cbStar = new JComboBox(sStar);
		cbBlood = new JComboBox(sBlood);
		txtHobit = new JTextField(20);
		InetAddress addr=null;
		try {
			addr = InetAddress.getLocalHost();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		txtIpAddr = new JTextField(addr.getHostAddress());
		txtPort = new JTextField(5);
		txtPort.setEditable(false);
		txtPort.setText("系统自动生成");
		taRemark  = new JTextArea(3,80);
		
		lblQQcode.setBounds(0, 100, 100, 20);
		txtQQcode.setBounds(100, 100, 150, 20);
		lblnickName.setBounds(0, 140, 100, 20);
		txtNickName.setBounds(100, 140, 150, 20);
		//设置透明
//		txtNickName.setOpaque(false);
		
		lblHeadImg.setBounds(280, 100, 80, 60);
		cbHeadImg.setBounds(360, 100, 80, 60);
		
		lblPassword.setBounds(0, 180, 100, 20);
		txtPassword.setBounds(100, 180, 150, 20);
		lblcfgPwd.setBounds(280, 180, 80, 20);
		txtCfgPwd.setBounds(360, 180, 150, 20);

		lblAge.setBounds(0, 220, 100, 20);
		txtAge.setBounds(100, 220, 150, 20);
		lblSex.setBounds(280, 220, 80, 20);
		rbMale.setBounds(360, 220, 40, 20);
		rbMale.setOpaque(false);
		rbRemale.setBounds(400, 220, 40, 20);
		rbRemale.setOpaque(false);
		
		lblNation.setBounds(0, 260, 100, 20);
		cbNation.setBounds(100, 260, 150, 20);
		lblStar.setBounds(280, 260, 80, 20);
		cbStar.setBounds(360, 260, 150, 20);
		
		lblBlood.setBounds(0, 300, 100, 20);
		cbBlood.setBounds(100, 300, 150, 20);
		lblHobit.setBounds(0, 340, 100, 20);
		txtHobit.setBounds(100, 340, 410, 20);

		lblIpAddr.setBounds(0, 380, 100, 20);
		txtIpAddr.setBounds(100, 380, 150, 20);
		lblPort.setBounds(280, 380, 80, 20);
		txtPort.setBounds(360, 380, 150, 20);
		
		lblRemark.setBounds(0, 420, 100, 20);
		taRemark.setBounds(100, 420, 410, 80);
		
		lblBg.add(lblQQcode);
		lblBg.add(txtQQcode);
		lblBg.add(lblnickName);
		lblBg.add(txtNickName);
		lblBg.add(lblHeadImg);
		lblBg.add(cbHeadImg);
		lblBg.add(lblPassword);
		lblBg.add(txtPassword);
		lblBg.add(lblcfgPwd);
		lblBg.add(txtCfgPwd);
		lblBg.add(lblAge);
		lblBg.add(txtAge);
		lblBg.add(lblSex);
		lblBg.add(rbMale);
		lblBg.add(rbRemale);
		lblBg.add(lblNation);
		lblBg.add(cbNation);
		lblBg.add(lblStar);
		lblBg.add(cbStar);
		lblBg.add(lblBlood);
		lblBg.add(cbBlood);
		lblBg.add(lblHobit);
		lblBg.add(txtHobit);
		lblBg.add(lblIpAddr);
		lblBg.add(txtIpAddr);
		lblBg.add(lblPort);
		lblBg.add(txtPort);
		lblBg.add(lblRemark);
		lblBg.add(taRemark);
		btnSave = new JButton("保存(S)");
		btnSave.setMnemonic('S');
		btnClose = new JButton("关闭(X)");
		btnClose.setMnemonic('X');
		
		btnSave.setBounds(180, 520, 100, 40);
		btnClose.setBounds(350, 520, 100, 40);
		lblBg.add(btnSave);
		lblBg.add(btnClose);
		btnSave.addActionListener(this);
		btnClose.addActionListener(this);
		//隐藏标题栏
		setUndecorated(true);
		setResizable(false);
		setSize(550, 580);
		setVisible(true);
		setLocationRelativeTo(null);
		//关闭窗口，不退出应用程序
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
	}

	public static void main(String[] args) {
		new RegUI();
	}

	public void actionPerformed(ActionEvent e) {
		if(e.getSource()== btnSave){
			String nickname = txtNickName.getText().trim();
			if(nickname.equals("")){
				JOptionPane.showMessageDialog(this, "请输入昵称");
				return;
			}
			String pass= txtPassword.getText().trim();
			String cfgpass= txtCfgPwd.getText().trim();
			if(pass.equals("")){
				JOptionPane.showMessageDialog(this, "请输入登录密码");
				return;
			}
			if(!pass.equals(cfgpass)){
				JOptionPane.showMessageDialog(this, "登录密码与确认密码不一致");
				return;
			}
			int age = 0;
			String sage = txtAge.getText().trim();
			if(sage.equals("")){
				JOptionPane.showMessageDialog(this, "请输入年龄");
				txtAge.setText("0");
				return;
			}
			try{
				age = Integer.parseInt(sage);
			}catch(Exception ex){
				JOptionPane.showMessageDialog(this, "请输入0~150之间的年龄");
				return;
			}
			if(age<0 || age>150){
				JOptionPane.showMessageDialog(this, "请输入0~150之间的年龄");
				return;
			}
			AccountVo account = new AccountVo();
			account.setNickName(nickname);
			account.setHeadImg(sHeadImg[cbHeadImg.getSelectedIndex()]);
			account.setPassword(pass);
			account.setAge(age);
			if(rbMale.isSelected()){
				account.setSex("男");
			}else{
				account.setSex("女");
			}
			account.setNation(sNation[cbNation.getSelectedIndex()]);
			account.setStar(sStar[cbStar.getSelectedIndex()]);
			account.setBlood(sBlood[cbBlood.getSelectedIndex()]);
			account.setHobit(txtHobit.getText().trim());
			account.setIpAddr(txtIpAddr.getText().trim());
			account.setRemark(taRemark.getText().trim());
			BaseDAO baseDAO = new BaseDAO();
			//保存信息到数据库中的account表
			account=baseDAO.saveAccount(account);
			//给txtQQcode文本框赋值
			txtQQcode.setText(account.getQqCode() +"");
			txtPort.setText("0");
			JOptionPane.showMessageDialog(this, "恭喜你注册成功，您的QQ号码是："+account.getQqCode());
		}else if(e.getSource()==btnClose){
			dispose();
		}
	}
	
}
