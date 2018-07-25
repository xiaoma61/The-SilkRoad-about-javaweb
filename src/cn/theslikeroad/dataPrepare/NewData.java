package cn.theslikeroad.dataPrepare;
import cn.theslikroad.LLM.New;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



import cn.theslikroad.dbc.DatabaseConnection;
public class NewData{
	

	static PreparedStatement pstm;
	static ResultSet rs;
	static DatabaseConnection conn;
	static public List<New>newdataList;

	public   List<New> Getdata() throws Exception
	{
		newdataList=new ArrayList<New>();

		try {
			conn = new DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql="select *from newMsg";
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
				 New newsdata=new New();
				 String newsTitle =rs.getString("newsTitle");
				 String newsUrl=rs.getString("newsUrl");
			     String newTime=rs.getString("newTime");
				 newsdata.setNewsTitle(newsTitle);
				 newsdata.setNewsUrl(newsUrl);
				 newsdata.setNewTime(newTime);
				 newdataList.add(newsdata);
				 	
				
			}
	
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			pstm.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return newdataList;
		
	}


}
