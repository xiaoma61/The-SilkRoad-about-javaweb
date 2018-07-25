package cn.theslikroad.tribune.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import cn.theslikroad.dbc.DatabaseConnection;
import cn.theslikroad.literature.checkUser;
import cn.theslikroad.personal.impl.FindUserIMG;
import cn.theslikroad.tribune.UserMsg;
import cn.theslikroad.tribune.browerdata;
import cn.theslikroad.tribune.commentDBC;
import cn.theslikroad.tribune.replyDBC;
import cn.theslikroad.tribune.DAO.Tribunedao;

public class Msg implements Tribunedao{

	 
	@Override
	public UserMsg findTitle(int titleid) {
		 FindUserIMG img=new FindUserIMG ();  
		 PreparedStatement pstm= null;
		 ResultSet rs= null;
		 DatabaseConnection conn = null;
		 try {
			conn=new  DatabaseConnection();
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		// TODO Auto-generated method stub
		UserMsg user=new UserMsg();
		try {
			conn=new DatabaseConnection();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String sql="select  id ,title, suggest,vistor,talknums,time , url from TRIBUNECREATEMSG where titleid=?";
		try {
			pstm=conn.getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			pstm.setInt(1, titleid);
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			rs=pstm.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(rs.next()){
				user.setId(rs.getString(1));
				user.setTitle(rs.getString(2));
				user.setSuggest(rs.getString(3));
				user.setVisitor(rs.getInt(4));
				user.setTalknums(rs.getInt(5));
				user.setTime(rs.getString(6));
				String url;
				url=img.GetImge(rs.getString(1));
				
				user.setUrl(url);
				user.setTitleid(titleid);
				int num=rs.getInt(4);
				num++;
				addVistors( titleid, num);
	
			}		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			pstm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	private boolean insertdata(String name ,browerdata data)
	{
		 boolean flag=false;
		 PreparedStatement pstm= null;
		 DatabaseConnection conn = null;
		 //插入数据
		 String sql="insert into   "+name+"  (titleid,time, id)values(?,?,TRIBUNEID.nextval)";
		 try {
			conn=new  DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm=conn.getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm.setInt(1,data.getTitleid());
			pstm.setString(2, data.getTime());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			 if(pstm.executeUpdate()>0)
			 {
				 flag=true;//存在该表
			 }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flag;
	}
	public void addBrower()//浏览记录表
	{
		//查找是否有大表里面是否有小表
		checkUser user=new checkUser();
		String name=user.Getname();
		String tablename=name+"tribune";//表的名字为用户名+tribune
		if(istable(tablename))//存在表的情况下
		{
		
		}
		else
		{
			//不存在的情况下创建该表
			if(!createtable(tablename))
			{
				//插入数据
				
					
			}
			
		}
		
		
		
	}
	public void addBrower(browerdata data)
	{
		//查找是否有大表里面是否有小表
		checkUser user=new checkUser();
		String name=user.Getname();
		String tablename=name+"tribune";//表的名字为用户名+tribune
		if(istable(tablename))//存在表的情况下
		{
			
				//插入数据
				System.out.print("charubiao1");
				insertdata(tablename , data);
				
	
		}
		else
		{
			//不存在的情况下创建该表
			if(!createtable(tablename))
			{
				//插入数据
				System.out.print("charubiao2");
				insertdata(tablename , data);
				
					
			}
			
		}
		
		
		
	}
	private boolean insert_total_table(String name)
	{
		//插入数据
		 boolean flag=false;
		 PreparedStatement pstm= null;
		 DatabaseConnection conn = null;
		 String sql="insert into   BROWSINGHISTORY (TRIBUNEUSER,id)values(?,HISTORYID.nextval)";
		 try {
			conn=new  DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm=conn.getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm.setString(1,name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			 if(pstm.executeUpdate()>0)
			 {
				 flag=true;//存在该表
			 }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		 try {
			pstm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
		
	}
	private boolean inserttable(String name)
	{
		//插入数据
		 boolean flag=false;
		 PreparedStatement pstm= null;
		 DatabaseConnection conn = null;
		 
		 String sql="create  table "+name+" (titleid int, time varchar(100), id int)";
		 try {
			conn=new  DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm=conn.getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			 if(pstm.executeUpdate()>0)
			 {
				 flag=true;//存在该表
			 }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		 try {
			pstm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
		
	}
	private boolean createtable(String name)
	{
		//插入数据
		boolean flag=false;
		if(insert_total_table(name))//先插入大表数据
		{
			if(inserttable(name))//创建表
			{
				//开始将大数据加入表中
				flag=true;
			}
		}
		return flag;
		
	}
	private boolean istable(String name)
	{
		 boolean flag=false;
		 PreparedStatement pstm= null;
		 DatabaseConnection conn = null;
		 ResultSet rs;
	
		 String sql="select count(*) from BROWSINGHISTORY  where TRIBUNEUSER=?";
		 try {
			conn=new  DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm=conn.getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm.setString(1,name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			 rs=pstm.executeQuery();
			 rs.next();
			 int count=rs.getInt(1);
			 if(count>0)
			 {
				 flag=true;//存在该表名
			 }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
		return flag;
	}
	private void addVistors(int title,int num)
	{
		 PreparedStatement pstm= null;
		 DatabaseConnection conn = null;
		 String sql="update TRIBUNECREATEMSG set vistor=? where titleid="+title;
		 try {
			conn=new  DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm=conn.getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm.setInt(1, num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		 try {
			pstm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public List<commentDBC> findall(int titleid) {
		// TODO Auto-generated method stub
		 
		 List<commentDBC> vistorList=new ArrayList<commentDBC>();
		 PreparedStatement pstm= null;
		 ResultSet rs= null;
		 DatabaseConnection conn = null;
		 String sql="select ID,CONTENT,FROM_UID,TIME ,imgeurl from TRIBUNECOMMENT where TOPIC_ID=?";
		 FindUserIMG Img=new FindUserIMG();
		 try {
			conn=new  DatabaseConnection();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 try {
			pstm=conn.getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm.setInt(1, titleid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			rs=pstm.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			while(rs.next())
			 {
				commentDBC vistors=new commentDBC();
				vistors.setId(rs.getInt(1));
				vistors.setContent(rs.getString(2));
				vistors.setFrom_uid(rs.getString(3));
				vistors.setTime(rs.getString(4));
				//查找头像
				String url;
				url=Img.GetImge(rs.getString(3));
				vistors.setImgurl(url);
				vistors.setTopic_id(titleid);
				int replysize=GetReplySize(titleid, vistors.getFrom_uid(),vistors.getContent(),vistors.getTime());
				vistors.setReplysize(replysize);
				/*List<replyDBC>r=new ArrayList<replyDBC>();
				;
				vistors.setReply(r);*/				
				vistorList.add(vistors);
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vistorList;
	}
	private int GetReplySize(int title, String id,String to_content,String time)
	{
		int size = 0;
		 PreparedStatement pstm= null;
		 ResultSet rs= null;
		 DatabaseConnection conn = null;
		 String sql="select count(*) totalCount from REPLY where  REPLYID=?  And TO_TIME=?";
		
		 try {
			conn=new  DatabaseConnection();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 try {
			pstm=conn.getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
				/*pstm.setInt(1, title);*/
				pstm.setString(1, id);
				/*pstm.setString(3, to_content);*/
				pstm.setString(2, time);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			rs=pstm.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			if(rs.next())
			 {
				
				size=rs.getInt("totalCount");
			
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return size;
	}
	@Override
	public List<replyDBC> findReply( String id,String time) {
		 FindUserIMG Img=new FindUserIMG();
			System.out.print("reply");
		// TODO Auto-generated method stub
		 PreparedStatement pstm= null;
		 ResultSet rs= null;
		 DatabaseConnection conn = null;
		 try {
			conn=new  DatabaseConnection();
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		// TODO Auto-generated method stub
		 List<replyDBC> replylist=new ArrayList<replyDBC>();
		try {
			conn=new DatabaseConnection();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.print(id);
		int size= GetReplySize(1, id,"to_content", time);
		String sql="select ID,CONTENT,FROM_UID,TO_UID ,TIME,topicid from REPLY where   REPLYID=? And TO_TIME=?";
		try {
			pstm=conn.getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
		
			pstm.setString(1, id);
			
			pstm.setString(2, time);
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			rs=pstm.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			while(rs.next())
			{
				replyDBC r=new replyDBC();
				r.setId(rs.getInt(1));
				r.setContent(rs.getString(2));
				r.setFrom_uid(rs.getString(3));
				r.setTo_uid(rs.getString(4));
				r.setTime(rs.getString(5));
				r.setReplyid(id);
				r.setTotime(time);
				r.setTopicid(rs.getInt(6));
				String url;
				url=Img.GetImge(rs.getString(3));
				System.out.println(rs.getString(3));
				System.out.println(url);
				r.setImgeurl(url);
				r.setSize(size);
				
			 /*   r.setTo_content(to_content);
			    r.setTopicid(title);*/
			    r.setReplyid(id);
				replylist.add(r);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return replylist;
	}
	@Override
	public boolean updatetitilenum(int title,int num) {
		

		 PreparedStatement pstm= null;
		 DatabaseConnection conn = null;
		 num++;
		 String sql="update TRIBUNECREATEMSG set TALKNUMS=? where titleid="+title;
		 try {
			conn=new  DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm=conn.getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm.setInt(1, title);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			if(pstm.executeUpdate()>0)return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		// TODO Auto-generated method stub gvt6b
		
		
		
		
	}
	@Override
	public int Findtitlenum(int title) {
		// TODO Auto-generated method stub
		 PreparedStatement pstm= null;
		 DatabaseConnection conn = null;
		 ResultSet rs;
		 int talknums = 0;
		 String sql="select TALKNUMS from TRIBUNECREATEMSG  where titleid="+title;
		 try {
			conn=new  DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm=conn.getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			 rs=pstm.executeQuery();
			if( rs.next())talknums=rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return talknums;
		// TODO Auto-generated method stub gvt6b
	}



	

}
