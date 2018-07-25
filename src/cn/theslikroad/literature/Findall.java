package cn.theslikroad.literature;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.theslikroad.dbc.DatabaseConnection;
import cn.theslikroad.literature.data.LiteractureData;

public class Findall {
   public LiteractureData findll(int newid)
   {
	   LiteractureData data=new LiteractureData();
	   DatabaseConnection conn = null;
		try {
			conn = new  DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 PreparedStatement pstm = null;
		 ResultSet rs;
		 String sql="select  *from LITERATUREDATA where id="+newid;
		 try {
			pstm=conn.getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			rs=pstm.executeQuery();
			if(rs.next())
			{
				data.setTitle(rs.getString(1));
				data.setWriter(rs.getString(2));
				data.setWriterword(rs.getString(3));
				data.setArticle(rs.getString(4));
		
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm.close();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 try {
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   return data;
   }


}
