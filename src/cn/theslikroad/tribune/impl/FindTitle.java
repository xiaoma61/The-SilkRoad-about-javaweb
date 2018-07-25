package cn.theslikroad.tribune.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.theslikroad.dbc.DatabaseConnection;

public class FindTitle {
	public String findtitle(int titleid )
	{
		String title = null;
		String sql="select TITLE from TRIBUNECREATEMSG where titleid="+titleid;
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
				if(rs.next())
				{
					title=rs.getString(1);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return title;
	}

}
