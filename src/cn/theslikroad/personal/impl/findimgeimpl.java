package cn.theslikroad.personal.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.theslikroad.LLM.UserName;
import cn.theslikroad.dbc.DatabaseConnection;
import cn.theslikroad.personal.dao.FindImge;

public class findimgeimpl implements FindImge{

	public String finduserIMg() {
		// TODO Auto-generated method stub
		 String url = null;
		 PreparedStatement pstm= null;
		 ResultSet rs= null;
		 DatabaseConnection conn = null;
		 String name=UserName.username;
		 String sql="select IMGURL from USRMSG where USERNAME=?";
		 try {
			conn=new  DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm=conn.getConnection().prepareStatement(sql);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
			try {
				pstm.setString(1, name);
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
				try {
					url=rs.getString(1);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return url;
	}

}
