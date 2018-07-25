package cn.theslikroad.background.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.theslikroad.LLM.UserName;
import cn.theslikroad.background.dao.BgCollection;
import cn.theslikroad.dbc.DatabaseConnection;

public class bgcollectionimpl implements BgCollection{

	@Override
	public boolean doCreate(String url) {
		boolean flag=false;
		ResultSet rs = null;
		DatabaseConnection conn = null;
		try {
			conn = new DatabaseConnection();
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}	
		String sql="insert into "+UserName.username+" (url,id)values(?,TEST_ID.nextval)";
		PreparedStatement pstm = null;
		try {
			pstm = conn.getConnection().prepareStatement(sql);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			pstm.setString(1, url);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	
			try {
				rs=pstm.executeQuery();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	
		try {
			if(rs.next())
			{
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public String find(String id) {
		String url=null;
		int mid=Integer.parseInt(id);
		DatabaseConnection conn = null;
		try {
			conn = new DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ResultSet rs = null;
		String sql="select IMAGEURL from BGIMAGE where id=?";
		PreparedStatement pstm = null;
		try {
			pstm = conn.getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			pstm.setInt(1,mid);
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
				url=rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return url;
	}

	@Override
	public boolean doDelete(String url) {
		// TODO Auto-generated method stub
		boolean flag=false;
		
		DatabaseConnection conn = null;
		try {
			conn = new DatabaseConnection();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		ResultSet rs = null;	
		String sql="delete from "+UserName.username+" where url=?";
		PreparedStatement pstm = null;
		try {
			pstm = conn.getConnection().prepareStatement(sql);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			pstm.setString(1, url);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
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
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

}
