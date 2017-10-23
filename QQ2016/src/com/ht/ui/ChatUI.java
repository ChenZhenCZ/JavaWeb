package com.ht.ui;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.FileDialog;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.Insets;
import java.awt.Rectangle;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JColorChooser;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollBar;
import javax.swing.JScrollPane;
import javax.swing.JTextPane;
import javax.swing.text.BadLocationException;
import javax.swing.text.Element;
import javax.swing.text.SimpleAttributeSet;
import javax.swing.text.StyleConstants;
import javax.swing.text.StyledDocument;

import com.ht.base.Cmd;
import com.ht.base.SendCmd;
import com.ht.base.SendMsg;
import com.ht.vo.AccountVo;

public class ChatUI extends JFrame implements ActionListener,ItemListener{

	JLabel title;
	JTextPane txtReceive,txtSend;
	JButton btnSend,btnClose;
	JButton btnShake,btnFile,btnColor,btnFace;
	JComboBox cbFont,cbSize;
	AccountVo myInfo,friendInfo;
	String sFont[] = {"宋体","黑体","楷体","隶书"};
	String sSize[]={"8","10","12","14","16","18","24","28","32","36","72"};
	Font font;
	public ChatUI(AccountVo myInfo,AccountVo friendInfo) {
		String str =myInfo.getNickName()+"("+myInfo.getQqCode() +")和";
		str += friendInfo.getNickName()+"("+friendInfo.getQqCode()+")正在聊天...";
		setTitle(str);
		this.myInfo = myInfo;
		this.friendInfo = friendInfo;
		setIconImage(new ImageIcon(friendInfo.getHeadImg()).getImage());
		title = new JLabel(str,new ImageIcon(friendInfo.getHeadImg()),JLabel.LEFT);
		title.setForeground(Color.WHITE);
		title.setOpaque(false);
		JLabel titlebg = new JLabel(new ImageIcon("images/2.jpg"));
		titlebg.setLayout(new FlowLayout(FlowLayout.LEFT));
		titlebg.add(title);
		add(titlebg,BorderLayout.NORTH);
		JPanel centerPanel = new JPanel(new GridLayout(2,1,1,1));
		txtReceive = new JTextPane();
		centerPanel.add(new JScrollPane(txtReceive));
		/*下面3部分
		 * 1.抖动，颜色，表情等控件
		 * 2.发送控件
		 * 3.发送按钮，关闭按钮
		 * 
		 */
		JPanel sendPanel = new JPanel(new BorderLayout());
		JLabel btnPanel = new JLabel(new ImageIcon("images/11.jpg"));
		btnPanel.setLayout(new FlowLayout(FlowLayout.LEFT));
		cbFont = new JComboBox(sFont);
		cbSize = new JComboBox(sSize);
		cbFont.addItemListener(this);
		cbSize.addItemListener(this);
		btnShake = new JButton(new ImageIcon("images/zd.png"));
		//设置按钮的大小与图片一致
		btnShake.setMargin(new Insets(0,0,0,0));
		btnFile = new JButton("文件");
		btnColor = new JButton("颜色");
		btnFace = new JButton(new ImageIcon("images/sendFace.png"));
		btnFace.setMargin(new Insets(0,0,0,0));
		btnShake.addActionListener(this);
		btnFile.addActionListener(this);
		btnColor.addActionListener(this);
		btnFace.addActionListener(this);
		
		btnPanel.add(cbFont);
		btnPanel.add(cbSize);
		btnPanel.add(btnColor);
		btnPanel.add(btnShake);
		btnPanel.add(btnFace);
		btnPanel.add(btnFile);
		sendPanel.add(btnPanel,BorderLayout.NORTH);
		txtSend = new JTextPane();
		sendPanel.add(txtSend,BorderLayout.CENTER);
		btnSend = new JButton("发送(S)");
		btnSend.setMnemonic('S');
		btnClose = new JButton("关闭(X)");
		btnClose.setMnemonic('X');
		btnSend.addActionListener(this);
		btnClose.addActionListener(this);
		JLabel bottombg = new JLabel(new ImageIcon("images/11.jpg"));
		bottombg.setLayout(new FlowLayout(FlowLayout.RIGHT));
		bottombg.add(btnSend);
		bottombg.add(btnClose);
		sendPanel.add(bottombg,BorderLayout.SOUTH);
		centerPanel.add(new JScrollPane(sendPanel));
		add(centerPanel);
		JLabel lblboy = new JLabel(new ImageIcon("images/6.jpg"));
		add(lblboy,BorderLayout.EAST);
		setSize(700, 500);
		setVisible(true);
		setLocationRelativeTo(null);
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
	}
	//把发送框的内容提交到接收框，同时清除发送框的内容
	public  void appendView(String name, StyledDocument xx)throws BadLocationException {
		//获取接收框的文档（内容）
		StyledDocument vdoc = txtReceive.getStyledDocument();//获取接收框的内容
		
		// 格式化时间
		Date date = new Date();//获取系统当前时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); //设置显示时分秒的格式
		String time = sdf.format(date);//获取时分秒
		//创建一个属性集合
		SimpleAttributeSet as = new SimpleAttributeSet();
		// 显示谁说
		//vdoc.getLength()获取接收框中的原来内容的长度
		String s =name + "    " + time + "\n";
//		saveRecord(name,s);//保存聊天记录
		vdoc.insertString(vdoc.getLength(), s, as);
		int end = 0;
		//处理显示的内容
		while (end < xx.getLength()) {
			// 获得一个元素
			Element e0 = xx.getCharacterElement(end);
			//获取对应的风格，
			SimpleAttributeSet as1 = new SimpleAttributeSet();
			StyleConstants.setForeground(as1, StyleConstants.getForeground(e0.getAttributes()));
			StyleConstants.setFontSize(as1, StyleConstants.getFontSize(e0.getAttributes()));
			StyleConstants.setFontFamily(as1, StyleConstants.getFontFamily(e0.getAttributes()));
			//获取该元素的内容
			s = e0.getDocument().getText(end, e0.getEndOffset() - end);
			// 将元素加到浏览窗中
			if("icon".equals(e0.getName())){
				vdoc.insertString(vdoc.getLength(), s, e0.getAttributes());
			}
			else{
				vdoc.insertString(vdoc.getLength(), s, as1);
//				saveRecord(name,s+"\n");//保存聊天记录
			}
			//getEndOffset（）函数就是获取当前元素的长度
			end = e0.getEndOffset(); 
		}
		// 输入一个换行
		vdoc.insertString(vdoc.getLength(), "\n", as);
		
		// 设置显示视图加字符的位置与文档结尾，以便视图滚动
		txtReceive.setCaretPosition(vdoc.getLength());
	}
	public static void main(String[] args) {
		new ChatUI(null,null);
	}
	public void shake(){
		//抖动窗口
		int x = this.getLocation().x;
		int y = this.getLocation().y;
		for(int i=0;i<20;i++){
			if(i%2==0){
				this.setLocation(x+2, y+2);
			}else{
				this.setLocation(x-2, y-2);
			}
			try {
				Thread.sleep(50);
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
		}
	}
	public void actionPerformed(ActionEvent e) {
		if(e.getSource()==btnShake){
			//发送消息
			SendMsg msg = new SendMsg();
			msg.cmd = Cmd.CMD_SHAKE;
			msg.myInfo = myInfo;
			msg.friendInfo = friendInfo;
			SendCmd.send(msg);
			shake();
		}else if(e.getSource()==btnColor){
			JColorChooser colordlg = new JColorChooser();
			//打开颜色对话框，并且获取选中的颜色
			Color color=colordlg.showDialog(this, "请选择字体颜色", Color.BLACK);
			//设置发送文本框的字体颜色
			txtSend.setForeground(color);
			
		}else if(e.getSource()==btnFace){
			//打开表情窗口，选择表情图标
			int x,y;
			x=this.getLocation().x+220;
			y=this.getLocation().y-28;
			new BqUI(this,x,y);
		}else if(e.getSource()==btnFile){
			FileDialog dlg = new FileDialog(this,"请选择要发送的文件(64K以下)",FileDialog.LOAD);
			dlg.show();
			String filename = dlg.getDirectory() + dlg.getFile();
			try {
				FileInputStream fis = new FileInputStream(filename);
				int size = fis.available();
				byte b[] = new byte[size];
				fis.read(b);
				SendMsg msg = new SendMsg();
				msg.cmd = Cmd.CMD_FILE;
				msg.myInfo=myInfo;
				msg.friendInfo = friendInfo;
				msg.b = b;
				msg.fileName = dlg.getFile();
				SendCmd.send(msg);
				
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			System.out.println(filename);
		}else if(e.getSource()==btnSend){
			if(txtSend.getText().equals("")){
				JOptionPane.showMessageDialog(this, "请输入你要发送的内容。");
				return;
			}
			try {
				appendView(myInfo.getNickName(), txtSend.getStyledDocument());
				SendMsg msg= new SendMsg();
				msg.cmd = Cmd.CMD_SEND;
				msg.myInfo = myInfo;
				msg.friendInfo = friendInfo;
				msg.doc = txtSend.getStyledDocument();
				SendCmd.send(msg);
				txtSend.setText("");
			} catch (BadLocationException e1) {
				e1.printStackTrace();
			}
		}else if(e.getSource()==btnClose){
			dispose();
		}
	}
	public void setFont(){
		String sf=sFont[cbFont.getSelectedIndex()];
		String size = sSize[cbSize.getSelectedIndex()];
		font = new Font(sf,Font.PLAIN,Integer.parseInt(size));
		//设置发送文本框的字体
		txtSend.setFont(font);
	}
	public void itemStateChanged(ItemEvent e) {
		if(e.getSource()==cbFont){
			setFont();
		}else if(e.getSource()==cbSize){
			setFont();
		}
	}
}
