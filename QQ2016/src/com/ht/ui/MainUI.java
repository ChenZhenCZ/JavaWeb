package com.ht.ui;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Component;
import java.awt.FileDialog;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;
import java.util.Hashtable;
import java.util.Vector;

import javax.swing.AbstractListModel;
import javax.swing.DefaultListCellRenderer;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPopupMenu;
import javax.swing.JTabbedPane;
import javax.swing.ListSelectionModel;
import javax.swing.UIManager;
import javax.swing.text.BadLocationException;
import javax.swing.text.StyleConstants;
import javax.swing.text.StyledDocument;

import com.ht.base.Cmd;
import com.ht.base.SendCmd;
import com.ht.base.SendMsg;
import com.ht.base.Sound;
import com.ht.db.BaseDAO;
import com.ht.vo.AccountVo;

public class MainUI extends JFrame implements ActionListener,MouseListener,ItemListener,WindowListener{
	JLabel bgImg,lblMyInfo;
	JTabbedPane tabPanel;
	JList lstFriend,lstmate,lstFamliy,lstHmd;
	JButton btnFind,btnChangebj;
	//弹出菜单
	JPopupMenu popMenu;
	JMenuItem miChat,miFamily,miFriend,miMate,miHmd,miLookInfo,miDel;
	//更改状态
	JComboBox cbState;
	//保存登录成功后的个人信息
	AccountVo myInfo,friendInfo;
	//保存所有的好友信息（好友，家人，同学，黑名单）
	Vector<AccountVo> vAllInfo,vFriend,vFamily,vMate,vHmd;
	BaseDAO baseDAO = new BaseDAO();
	Hashtable<Integer, ChatUI> chatWin = new Hashtable<Integer, ChatUI>();
	public MainUI() {
		
	}
	public MainUI(AccountVo myInfo) {
		this.myInfo = myInfo;
		//监听窗口事件
		addWindowListener(this);
		//设置窗口图标
		setIconImage(new ImageIcon(myInfo.getHeadImg()).getImage());
//		setUndecorated(true);
		setResizable(false);
		bgImg = new JLabel(new ImageIcon("images/bgmain3.jpg"));
		bgImg.setLayout(new BorderLayout());
		//设置背景透明
		bgImg.setOpaque(false);
		add(bgImg);
		vAllInfo = new Vector<AccountVo>();
		vFriend = new Vector<AccountVo>();
		vFamily = new Vector<AccountVo>();
		vMate = new Vector<AccountVo>();
		vHmd = new Vector<AccountVo>();
		lstFriend = new JList();
		lstmate = new JList();
		lstFamliy = new JList();
		lstHmd = new JList();
		lstFriend.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		//设置透明
		lstFriend.setOpaque(false);
		lstmate.setOpaque(false);
		lstFamliy.setOpaque(false);
		lstHmd.setOpaque(false);
		lstFriend.addMouseListener(this);
		lstmate.addMouseListener(this);
		lstFamliy.addMouseListener(this);
		lstHmd.addMouseListener(this);
		//设置TabbedPane为透明背景
		UIManager.put("TabbedPane.contentOpaque", false);
		tabPanel = new JTabbedPane();
		tabPanel.setOpaque(false);
		//添加标签页
		tabPanel.addTab("好友", lstFriend);
		tabPanel.addTab("同学", lstmate);
		tabPanel.addTab("家人", lstFamliy);
		tabPanel.addTab("黑名单", lstHmd);
		bgImg.add(tabPanel);
		refresh();

		//设置个人头像
		ImageIcon icon = new ImageIcon(myInfo.getHeadImg());
		String nickname = myInfo.getNickName()+"("+myInfo.getQqCode()+")【"+myInfo.getRemark()+"】";
		lblMyInfo = new JLabel(nickname,icon,JLabel.LEFT);
		lblMyInfo.setOpaque(false);
		bgImg.add(lblMyInfo,BorderLayout.NORTH);
		lblMyInfo.addMouseListener(this);
		//在下面放按钮
		JPanel bottomPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT));
		bottomPanel.setOpaque(false);
		btnFind = new JButton("查找");
		btnChangebj = new JButton("换肤");
		btnFind.addActionListener(this);
		btnChangebj.addActionListener(this);
		//状态
		cbState = new JComboBox(Cmd.STATUS);
		cbState.addItemListener(this);
		//删除离线状态
		cbState.removeItemAt(1);
		bottomPanel.add(btnFind);
		bottomPanel.add(btnChangebj);
		bottomPanel.add(cbState);
		
		bgImg.add(bottomPanel,BorderLayout.SOUTH);
		createMenu();
		//启动线程
		new ReceiveThread().start();
		//发送登录广播
		SendCmd.sendAll(vAllInfo, myInfo, Cmd.CMD_ONLINE);
		setSize(300, 700);
		setVisible(true);
		setLocation(1050, 50);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	//创建菜单
	public void createMenu(){
		miChat = new JMenuItem("聊天");
		miFamily = new JMenuItem("移到家人组");
		miFriend = new JMenuItem("移到好友组");
		miMate = new JMenuItem("移到同学组");
		miHmd = new JMenuItem("移到黑名单");
		miLookInfo = new JMenuItem("查看好友信息");
		miDel = new JMenuItem("删除好友资料");
		//添加事件
		miChat.addActionListener(this);
		miFamily.addActionListener(this);
		miFriend.addActionListener(this);
		miMate.addActionListener(this);
		miHmd.addActionListener(this);
		miLookInfo.addActionListener(this);
		miDel.addActionListener(this);
		popMenu = new JPopupMenu();
		popMenu.add(miChat);
		popMenu.add(miFamily);
		popMenu.add(miFriend);
		popMenu.add(miMate);
		popMenu.add(miHmd);
		popMenu.add(miLookInfo);
		popMenu.add(miDel);
	}
	//把好友信息分别放到对应的Vector中
	public void refresh(){
		//获取所有的好友信息（好友，家人，同学，黑名单）
		vAllInfo = baseDAO.getMyFriend(myInfo.getQqCode());
//		"同学","好友","家人","黑名单"
		//清空Vector的值
		vMate.clear();
		vFriend.clear();
		vFamily.clear();
		vHmd.clear();
		for (AccountVo acc : vAllInfo) {
			String groupName = acc.getGroupName();
			if(groupName.equals(Cmd.GROUPNAME[0])){
				vMate.add(acc);
			}else if(groupName.equals(Cmd.GROUPNAME[1])){
				vFriend.add(acc);
			}else if(groupName.equals(Cmd.GROUPNAME[2])){
				vFamily.add(acc);
			}else if(groupName.equals(Cmd.GROUPNAME[3])){
				vHmd.add(acc);
			}
		}
		//初始化List界面的显示
		lstFriend.setModel(new DataModel(vFriend));
		lstmate.setModel(new DataModel(vMate));
		lstFamliy.setModel(new DataModel(vFamily));
		lstHmd.setModel(new DataModel(vHmd));
		lstFriend.setCellRenderer(new MyHeadImg(vFriend));
		lstmate.setCellRenderer(new MyHeadImg(vMate));
		lstFamliy.setCellRenderer(new MyHeadImg(vFamily));
		lstHmd.setCellRenderer(new MyHeadImg(vHmd));
	}
	public static void main(String[] args) {
		new MainUI();
	}
	public void actionPerformed(ActionEvent e) {
		//更换背景图片
		if(e.getSource()==btnChangebj){
			JFileChooser dlg = new JFileChooser();
			//打开文件对话框
			dlg.setDialogType(JFileChooser.OPEN_DIALOG);
			dlg.setFileSelectionMode(JFileChooser.FILES_ONLY);
            //设置对话框标题
			dlg.setDialogTitle("更换皮肤");
            if (dlg.showOpenDialog(this) == dlg.APPROVE_OPTION) {
            	File file = dlg.getSelectedFile();
            	String path = file.getPath();
            	bgImg.setIcon(new ImageIcon(path));
            }
		}else if(e.getSource()==miLookInfo){
//			friendInfo = vFriend.get(lstFriend.getSelectedIndex());
			new LookInfoUI(friendInfo);
		}else if(e.getSource()== miFriend){
			baseDAO.moveGroup(myInfo.getQqCode(), friendInfo.getQqCode(), Cmd.GROUPNAME[1]);
			refresh();
		}else if(e.getSource()== miFamily){
			baseDAO.moveGroup(myInfo.getQqCode(), friendInfo.getQqCode(), Cmd.GROUPNAME[2]);
			refresh();
			
		}else if(e.getSource()== miMate){
			baseDAO.moveGroup(myInfo.getQqCode(), friendInfo.getQqCode(), Cmd.GROUPNAME[0]);
			refresh();
		}else if(e.getSource()== miHmd){
			baseDAO.moveGroup(myInfo.getQqCode(), friendInfo.getQqCode(), Cmd.GROUPNAME[3]);
			refresh();
		}else if(e.getSource()==btnFind){
			new FindUI(myInfo);
		}else if(e.getSource()==miChat){
			openChat();
		}
	}
	//显示文本信息
	class DataModel extends AbstractListModel {
		Vector<AccountVo> data;
		public DataModel() {}
		public DataModel(Vector<AccountVo> data) {
			this.data = data;
		}
	    //系统自动运行，下标从0开始计算
	    public Object getElementAt(int index) {
	    	AccountVo info = data.get(index);
	    	return info.getNickName()+"("+info.getQqCode()+")【"+info.getRemark()+"]";
	    }

	    public int getSize() {
	        return data.size();
	    }
	    
	}
	// 获取好友头像
	class MyHeadImg extends DefaultListCellRenderer {
		Vector<AccountVo> datas;
		public MyHeadImg(Vector<AccountVo> datas) {
			this.datas = datas;
		}
		@Override
		public Component getListCellRendererComponent(JList list, Object value,
				int index, boolean isSelected, boolean cellHasFocus) {
			Component c = super.getListCellRendererComponent(list, value,
					index, isSelected, cellHasFocus);
			if (index >= 0 && index < datas.size()) {
				AccountVo user =  datas.get(index);
				String status = user.getOnlinestatus();
				String headImg = user.getHeadImg();
//				STATUS={"在线","离线","忙碌","隐身"};
				String filename = "";
				if(status.equals(Cmd.STATUS[0])){
					filename = headImg;
				}else if(status.equals(Cmd.STATUS[1])){
					int pos = headImg.indexOf('.');
					String pre = headImg.substring(0,pos);
					String fix = headImg.substring(pos,headImg.length());
					filename = pre + "_h"+fix;
				}else if(status.equals(Cmd.STATUS[2])){
					int pos = headImg.indexOf('.');
					String pre = headImg.substring(0,pos);
					String fix = headImg.substring(pos,headImg.length());
					filename = pre + "_l"+fix;
				}else if(status.equals(Cmd.STATUS[3])){
					int pos = headImg.indexOf('.');
					String pre = headImg.substring(0,pos);
					String fix = headImg.substring(pos,headImg.length());
					filename = pre + "_w"+fix;
				}
				// 给列表中好友状态设置头像
				System.out.println(filename);
				setIcon(new ImageIcon(filename));
				//设置文本内容
				setText(user.getNickName()+"("+user.getQqCode()+")【"+user.getRemark()+"]");
				System.out.println(user.getHeadImg());
			}
			// 设置字体颜色
			if (isSelected) {
				setBackground(list.getSelectionBackground());
				setForeground(list.getSelectionForeground());
			} else {
				setBackground(list.getBackground());
				setForeground(list.getForeground());
			}
			//设置有效
			setEnabled(list.isEnabled());
			//设置默认字体
			setFont(list.getFont());
//			设置透明
			setOpaque(false);
			return this;
		}
	}
	//打开聊天窗口
	public ChatUI openChat(){
		//从Hashtable中获取根该朋友聊天的窗口信息
		ChatUI chat = chatWin.get(friendInfo.getQqCode());
		if(chat==null){
			chat = new ChatUI(myInfo,friendInfo);
			chatWin.put(friendInfo.getQqCode(), chat);
		}
		//显示
		chat.show();
		return chat;
	}
	public void mouseClicked(MouseEvent e) {
		if(e.getSource()==lblMyInfo){
			if(e.getClickCount()==2){
				new UpdateMyInfoUI(myInfo,this);
			}
		}else if(e.getSource()==lstFriend){
			if(lstFriend.getSelectedIndex()>=0){
				friendInfo = vFriend.get(lstFriend.getSelectedIndex());
			}
			//右键
			if(e.getButton()==3){
				if(lstFriend.getSelectedIndex()>=0){
					popMenu.show(lstFriend, e.getX(), e.getY());
				}
			}else if(e.getClickCount()==2){//双击
				if(lstFriend.getSelectedIndex()>=0){
					openChat();
				}
			}
		}else if(e.getSource()==lstFamliy){
			if(lstFamliy.getSelectedIndex()>=0){
				friendInfo = vFamily.get(lstFamliy.getSelectedIndex());
			}
			if(e.getButton()==3){
				if(lstFamliy.getSelectedIndex()>=0){
					popMenu.show(lstFamliy, e.getX(), e.getY());
				}
			}else if(e.getClickCount()==2){//双击
				if(lstFamliy.getSelectedIndex()>=0){
					openChat();
				}
			}
		}else if(e.getSource()==lstmate){
			if(lstmate.getSelectedIndex()>=0){
				friendInfo = vMate.get(lstmate.getSelectedIndex());
			}
			if(e.getButton()==3){
				if(lstmate.getSelectedIndex()>=0){
					popMenu.show(lstmate, e.getX(), e.getY());
				}
			}else if(e.getClickCount()==2){//双击
				if(lstmate.getSelectedIndex()>=0){
					friendInfo = vMate.get(lstmate.getSelectedIndex());
					openChat();
				}
			}
		}else if(e.getSource()==lstHmd){
			if(e.getButton()==3){
				if(lstHmd.getSelectedIndex()>=0){
					friendInfo = vHmd.get(lstHmd.getSelectedIndex());
					popMenu.show(lstHmd, e.getX(), e.getY());
				}
			}
		}
	}
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
	//定义内部线程类
	class ReceiveThread extends Thread{
		public ReceiveThread() {
			
		}
		@Override
		public void run() {
			try {
				DatagramSocket socket = new DatagramSocket(myInfo.getPort());
				while(true){
					byte b[] = new byte[1024*512];
					DatagramPacket pack = new DatagramPacket(b,0,b.length);
					//接收信息
					socket.receive(pack);
					ByteArrayInputStream bais = new ByteArrayInputStream(pack.getData());
					ObjectInputStream ois = new ObjectInputStream(bais);
					SendMsg msg = (SendMsg)ois.readObject();
					myInfo = msg.friendInfo;
					friendInfo = msg.myInfo;
					switch(msg.cmd){
					case Cmd.CMD_ONLINE: //登录（上线)
						refresh();
						new Sound(msg.cmd);
						new TipUI(friendInfo);
						break;
					case Cmd.CMD_LEVEL:
					case Cmd.CMD_BUYS:
						refresh();
						break;
					case Cmd.CMD_OFFLINE:
						refresh();
						new TipUI(friendInfo);
						break;
					case Cmd.CMD_CHANGESTATE:
						refresh();
						break;
					case Cmd.CMD_SEND: //接收聊天消息
						System.out.println("接收聊天消息....");
						ChatUI chat = openChat();
						try {
								chat.appendView(msg.myInfo.getNickName(), msg.doc);
						} catch (BadLocationException e) {
							e.printStackTrace();
						}
						break;
					case Cmd.CMD_SHAKE:
						chat = openChat();
						chat.shake();
						break;
					case Cmd.CMD_ADDFRI: //添加好友
						new Sound(msg.cmd);
						String str = "【"+friendInfo.getNickName()+"】请求添加你为好友，是否同意？";
						SendMsg msg2 = new SendMsg();
						if(JOptionPane.showConfirmDialog(null, str,"添加好友",JOptionPane.OK_CANCEL_OPTION)==JOptionPane.OK_OPTION){
							msg2.cmd = Cmd.CMD_ARGEE;
							baseDAO.addFriend(myInfo.getQqCode(), friendInfo.getQqCode());
							refresh();
						}else{
							msg2.cmd = Cmd.CMD_REFUSE;
						}
						msg2.myInfo = myInfo;
						msg2.friendInfo = friendInfo;
						SendCmd.send(msg2);
						break;
					case Cmd.CMD_ARGEE:
						refresh();
						break;
					case Cmd.CMD_REFUSE:
						str = "【"+friendInfo.getNickName()+"】拒绝了你的好友请求。";
						JOptionPane.showMessageDialog(null, str);
						break;
					case Cmd.CMD_FILE:
						str = friendInfo.getNickName()+"发送了一个【"+msg.fileName+"文件】，是否接收？";
						if(JOptionPane.showConfirmDialog(null, "是否接收文件","接收文件",JOptionPane.OK_CANCEL_OPTION)==JOptionPane.OK_OPTION){
							JFileChooser chooser = new JFileChooser(" ");
				            chooser.setDialogType(JFileChooser.SAVE_DIALOG);
				            chooser.setDialogTitle("保存文件");
				            if (chooser.showOpenDialog(null) == chooser.APPROVE_OPTION) {
				            	String ext = msg.fileName.substring(msg.fileName.indexOf('.'),msg.fileName.length());
				            	String filename = chooser.getSelectedFile().getAbsolutePath()+ext;
				            	FileOutputStream fos = new FileOutputStream(filename);
				            	fos.write(msg.b);
				            	fos.flush();
				            	fos.close();
				            }
						}
					}
				}
				
				
			} catch (SocketException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
		}
	}
	public void itemStateChanged(ItemEvent e) {
		/*
		 * 1.更改界面的头像；
		 * 2.更改自己的状态到数据库；
		 * 3.通知所有好友，状态改变
		 * */
		if(e.getSource()==cbState){
			 String status = cbState.getSelectedItem().toString();
			 changeState();
			 baseDAO.changeStatus(myInfo.getQqCode(), status);
			 SendCmd.sendAll(vAllInfo, myInfo, Cmd.CMD_CHANGESTATE);
		}
	}
	//更改状态
	public void changeState(){
		String status = cbState.getSelectedItem().toString();
		String filename=myInfo.getHeadImg();
		String headImg= myInfo.getHeadImg();
		if(status.equals(Cmd.STATUS[0])){
			filename = headImg;
		}else if(status.equals(Cmd.STATUS[2])){
			int pos = headImg.indexOf('.');
			String pre = headImg.substring(0,pos);
			String fix = headImg.substring(pos,headImg.length());
			filename = pre + "_l"+fix;
		}else if(status.equals(Cmd.STATUS[3])){
			int pos = headImg.indexOf('.');
			String pre = headImg.substring(0,pos);
			String fix = headImg.substring(pos,headImg.length());
			filename = pre + "_w"+fix;
		}
		lblMyInfo.setIcon(new ImageIcon(filename));
	}
	public void windowActivated(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void windowClosed(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}
	//窗口马上要关闭时会触发该事件
	public void windowClosing(WindowEvent e) {
//		JOptionPane.showMessageDialog(this, "窗口马上要关闭");
		//更改为离线状态
		baseDAO.changeStatus(myInfo.getQqCode(), Cmd.STATUS[1]);
		myInfo.setOnlinestatus(Cmd.STATUS[1]);
		SendCmd.sendAll(vAllInfo, myInfo, Cmd.CMD_OFFLINE);
	}
	public void windowDeactivated(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void windowDeiconified(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void windowIconified(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}
	public void windowOpened(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}
}
