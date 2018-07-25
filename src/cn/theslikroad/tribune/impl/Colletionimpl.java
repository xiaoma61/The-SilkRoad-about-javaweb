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
		String tablename=name+"colletion";//�������Ϊ�û���+tribune
		int titleid=data.getTitleid();
		return deletetable( titleid,tablename);
		
	}
	public boolean addBrower()//������
	{
		boolean flag=false;
			checkUser user=new checkUser();
			String name=user.Getname();
			String tablename=name+"colletion";//�������Ϊ�û���+tribune
			if(istable(tablename))//���ڱ�������
			{
					//��������
				

			}
			else
			{
				//�����ڵ�����´����ñ�
				if(!createtable(tablename))
				{
					//��������
					System.out.print("charubiao2");
		
					
						
				}
				
			}
		return flag;
	}
	public boolean addBrower(Colletiondata data)
	{
	
		 boolean flag=false;
		//�����Ƿ��д�������Ƿ���С��
		checkUser user=new checkUser();
		String name=user.Getname();
		String tablename=name+"colletion";//�������Ϊ�û���+tribune
		if(istable(tablename))//���ڱ�������
		{
				//��������
				if(insertdata(tablename , data))flag=true;

		}
		else
		{
			//�����ڵ�����´����ñ�
			if(!createtable(tablename))
			{
				//��������
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
		 //��������
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
				 flag=true;//���ڸñ�
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
				 flag=true;//���ڸñ���
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
		//��������
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
				 flag=true;//���ڸñ�
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
				 flag=true;//���ڸñ�
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
		if(insert_total_table(name))//�Ȳ���������
		{
			if(inserttable(name))//������
			{
				//��ʼ�������ݼ������
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
