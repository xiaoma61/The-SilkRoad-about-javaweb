package cn.theslikeroad.seekword.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.theslikeroad.seekword.seekword;
import cn.theslikroad.dbc.DatabaseConnection;

public class keywordimpl implements seekword{

	@Override
	public List<String> findkeyword(String word,int type) {
		// TODO Auto-generated method stub
		List<String> Fword = new ArrayList<String>();
		// µœ÷≤È’“
	
		 PreparedStatement pstm= null;
		 ResultSet rs= null;
		 DatabaseConnection conn = null;
		 String sql;
		 if(type==1)
			{
				sql="select name from LANDSILKROAD where name like?";
			}else
			{
				sql="select name from MARITIMESILKROAD where name like?";
			}
		 try {
			conn=new  DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm=conn.getConnection().prepareStatement(sql);
			pstm.setString(1,"%"+ word+"%");
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
			while(rs.next())
				try {
					String n=rs.getString(1);
					Fword.add(n);
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	return Fword;
	}
	

}
