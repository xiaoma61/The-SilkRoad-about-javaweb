package cn.theslikroad.literature.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.theslikroad.dbc.DatabaseConnection;
import cn.theslikroad.literature.checkUser;
import cn.theslikroad.literature.dao.ALLLiteraturedao;
import cn.theslikroad.literature.data.LiteractureData;

public class literatureimpl implements ALLLiteraturedao{

	public List<LiteractureData> dofind(String name) {
		// TODO Auto-generated method stub
		List<LiteractureData>datalist=new ArrayList<LiteractureData>();
		String sql="select *from "+ name;
		DatabaseConnection conn = null;
		try {
			conn = new  DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 PreparedStatement pstm = null;
		 ResultSet rs = null;
		 try {
			pstm=conn.getConnection().prepareStatement(sql);
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
				 LiteractureData data=new LiteractureData();
				 data.setTitle(rs.getString(1));
				 data.setWriter(rs.getString(2));
				 data.setWriterword(rs.getString(3));
				 data.setArticle(rs.getString(4));
				 data.setFileroad(rs.getString(5));
				 data.setId(rs.getInt("id"));
				 datalist.add(data);
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
		return datalist;
	}

	@Override
	public boolean dodelete(int id) {
		// TODO Auto-generated method stub
		//用户删除操作
		DatabaseConnection conn = null;
		checkUser user=new checkUser();
		String Name=user.Getname();
		String sql="delete from  "+Name +" where id=?";
		try {
			conn = new  DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 PreparedStatement pstm = null;
		 
		 ResultSet rs = null;
		 try {
			pstm=conn.getConnection().prepareStatement(sql);
			pstm.setInt(1, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			rs=pstm.executeQuery();
			if(rs.next())
			{
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}

	@Override
	public boolean doALLdelete(int id) {
		id--;
		// TODO Auto-generated method stub
		DatabaseConnection conn = null;
		
		String sql="delete from   LITERATUREDATA  where id=?";
		try {
			conn = new  DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 PreparedStatement pstm = null;
		 
		 ResultSet rs = null;
		 try {
			pstm=conn.getConnection().prepareStatement(sql);
			pstm.setInt(1, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			rs=pstm.executeQuery();
			if(rs.next())
			{
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		//大表单删除操作
		 return true;
		
	}

}
