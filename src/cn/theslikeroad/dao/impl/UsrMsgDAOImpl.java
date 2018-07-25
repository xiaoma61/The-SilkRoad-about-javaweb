package cn.theslikeroad.dao.impl;

import java.util.List;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import cn.theslikroad.LLM.Register;
import cn.theslikroad.LLM.UserName;
import cn.theslikroad.dao.IUsrMsg;
import cn.theslikroad.dbc.DatabaseConnection;
import cn.theslikroad.tribune.impl.Colletionimpl;
import cn.theslikroad.tribune.impl.Msg;


public class UsrMsgDAOImpl implements IUsrMsg {
	private Connection conn=null;
	private PreparedStatement pstm=null;
	
	public UsrMsgDAOImpl(Connection conn)
	{
		this.conn=conn;
	}
	
	
	
	public boolean doCreate(Register reg)throws Exception
	{
		boolean flag=false;
		boolean flag1=false;
		boolean flag2=false;
		String sql="insert into UsrMsg(username,password,phone,e_mail,id,IMGURL)values(?,?,?,?,USERID.nextval,?)";
		
		pstm=conn.prepareStatement(sql);				
		this.pstm.setString(1, reg.getUsername());
		this.pstm.setString(2, reg.getPassword());
		this.pstm.setString(3, reg.getPhone());
		this.pstm.setString(4, reg.getE_mail());
		this.pstm.setString(5, "F:\\myeclipse\\.metadata\\.me_tcat85\\webapps\\TheSlikRoad\\userImage/1528643241907.png");
		
		if(this.pstm.executeUpdate()>0)flag=true;
		flag1=doCreate(reg.getUsername());
		flag2=doCreate_table( reg.getUsername());
		UserName.username=reg.getUsername();
		Colletionimpl impl=new Colletionimpl();
		impl.addBrower();//加入收藏记录表
		Msg msg=new Msg();//加入浏览记录表
		msg.addBrower();
		
		this.pstm.close();
		this.conn.close();	
		return true;
		
	}
	public boolean doCreate(String username) throws Exception
	{
		boolean flag=false;
		
		DatabaseConnection conn=new DatabaseConnection();
		String sql_table="insert into BGIMAGEUSR(username)values(?)";
		PreparedStatement pstm;
		pstm=conn.getConnection().prepareStatement(sql_table);
		pstm.setString(1,username);
		if(pstm.executeUpdate()>0)
			flag=true;
		pstm.close();
		conn.close();
		return flag;
		
	}
	public boolean doCreate_table(String username) throws Exception
	{
		boolean flag=false;
		DatabaseConnection conn=new DatabaseConnection();
		String sql_table= "create table "+username+" (id number, url varchar2(500))";;
		PreparedStatement pstm;
		pstm=conn.getConnection().prepareStatement(sql_table);
		if(pstm.executeUpdate()>0)
			flag=true;
		pstm.close();
		conn.close();
		return flag;
		
	}
	
	public List<Register>findAll(String keyword)throws Exception
	{
		return null;
			
	}

	public Register findById(String username)throws Exception
	{
		
		Register reg=null;
		String sql="select  username,password,phone,e_mail, from UsrMsg where username=?";
		pstm=conn.prepareStatement(sql);
		pstm.setString(1, username);
		ResultSet rs=pstm.executeQuery();
		if(rs.next())
		{
			reg=new Register();
			reg.setUsername(rs.getString(1));
			reg.setPassword(rs.getString(2));
			reg.setPhone(rs.getString(3));
			reg.setE_mail(rs.getString(4));

		}
		this.pstm.close();
		this.conn.close();
		return reg;
		
	}

}
