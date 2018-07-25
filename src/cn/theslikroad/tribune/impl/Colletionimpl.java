package cn.theslikroad.tribune.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.theslikroad.dbc.DatabaseConnection;
import cn.theslikroad.literature.checkUser;
import cn.theslikroad.tribune.Colletiondata;
import cn.theslikroad.tribune.DAO.Collection;

public class Colletionimpl implements Collection{

	public boolean delete(Colletiondata data)
	{

		checkUser user=new checkUser();
		String name=user.Getname();
		String tablename=name+"colletion";//表的名字为用户名+tribune
		int titleid=data.getTitleid();
		return deletetable( titleid,tablename);
		
	}
	public boolean addBrower()//创建表
	{
		boolean flag=false;
			checkUser user=new checkUser();
			String name=user.Getname();
			String tablename=name+"colletion";//表的名字为用户名+tribune
			if(istable(tablename))//存在表的情况下
			{
					//插入数据
				

			}
			else
			{
				//不存在的情况下创建该表
				if(!createtable(tablename))
				{
					//插入数据
					System.out.print("charubiao2");
		
					
						
				}
				
			}
		return flag;
	}
	public boolean addBrower(Colletiondata data)
	{
	
		 boolean flag=false;
		//查找是否有大表里面是否有小表
		checkUser user=new checkUser();
		String name=user.Getname();
		String tablename=name+"colletion";//表的名字为用户名+tribune
		if(istable(tablename))//存在表的情况下
		{
				//插入数据
				if(insertdata(tablename , data))flag=true;

		}
		else
		{
			//不存在的情况下创建该表
			if(!createtable(tablename))
			{
				//插入数据
				System.out.print("charubiao2");
				if(insertdata(tablename , data))flag=true;
				
					
			}
			
		}
		
		return flag;
		
	}
	
	private boolean insertdata(String name ,Colletiondata data)
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
	@Override
	public boolean istable(String name) {
		// TODO Auto-generated method stub
		 boolean flag=false;
		 PreparedStatement pstm= null;
		 DatabaseConnection conn = null;
		 ResultSet rs;
	
		 String sql="select count(*) from COLLETION  where USERTRIBUNE=?";
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

	@Override
	public boolean insert_total_table(String name) {
		// TODO Auto-generated method stub
		//插入数据
		 boolean flag=false;
		 PreparedStatement pstm= null;
		 DatabaseConnection conn = null;
		 String sql="insert into   COLLETION (USERTRIBUNE,id)values(?,HISTORYID.nextval)";
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

	@Override
	public boolean inserttable(String name) {
		// TODO Auto-generated method stub
		boolean flag=false;
		 PreparedStatement pstm= null;
		 DatabaseConnection conn = null;
		 
		 String sql="create  table "+name+" (titleid int, time varchar(30), id int)";
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

	@Override
	public boolean createtable(String name) {
		// TODO Auto-generated method stub
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
	@Override
	public boolean deletetable(int titleid,String name) {
		// TODO Auto-generated method stub
		
		boolean flag=false;
		 PreparedStatement pstm= null;
		 DatabaseConnection conn = null;
		 ResultSet rs;
	
		 String sql="delete from "+name +" where titleid=?";
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
			pstm.setInt(1,titleid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			 rs=pstm.executeQuery();
			if( rs.next())flag=true;
			
			
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

}
