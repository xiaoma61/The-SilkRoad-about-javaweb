package cn.theslikeroad.dataPrepare;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import cn.theslikroad.LLM.TheLandRoadData;
import cn.theslikroad.dbc.DatabaseConnection;

public class Thelandroad {
	static PreparedStatement pstm;
	static ResultSet rs;
	static DatabaseConnection conn;
	static public List<TheLandRoadData>TheLandRoadDataList;
	
	public List<TheLandRoadData>GetData() throws Exception
	{
		TheLandRoadDataList=new ArrayList<TheLandRoadData>();
		conn = new DatabaseConnection();
		String sql="select *from LANDSILKROAD";
		pstm=conn.getConnection().prepareStatement(sql);
		rs=pstm.executeQuery();
		
		while(rs.next())
		{
			 TheLandRoadData data=new TheLandRoadData();
			 String imageurl =rs.getString("imageurl");
			 String introduction=rs.getString("introduction");
		     String id=rs.getString("id");
		     String name=rs.getString("name");
		     data.setId(id);
		     data.setImageurl(imageurl);
		     data.setIntroduction(introduction);
		     data.setName(name);
		     TheLandRoadDataList.add(data);
		     		 	
			
		}
		pstm.close();
		conn.close();
		return TheLandRoadDataList;
	}
	

}
