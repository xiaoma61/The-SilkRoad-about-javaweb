package cn.theslikeroad.dataPrepare;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.theslikroad.LLM.TheMaritimeSlikroad;
import cn.theslikroad.dbc.DatabaseConnection;

public class MaritimeData {
	static PreparedStatement pstm;
	static ResultSet rs;
	static DatabaseConnection conn;
	static public List<TheMaritimeSlikroad>TheMaritimeSlikroadList;
	public List<TheMaritimeSlikroad>GetMaritimeData() throws Exception
	{
		TheMaritimeSlikroadList=new ArrayList<TheMaritimeSlikroad>();
		conn = new DatabaseConnection();
		String sql="select *from MARITIMESILKROAD";
		pstm=conn.getConnection().prepareStatement(sql);
		rs=pstm.executeQuery();
		
		while(rs.next())
		{
			 TheMaritimeSlikroad data=new TheMaritimeSlikroad();
			 String imageurl =rs.getString("imageurl");
			 String introduction=rs.getString("introduction");
		     String id=rs.getString("id");
		     String name=rs.getString("name");
		     data.setId(id);
		     data.setImageurl(imageurl);
		     data.setIntroduction(introduction);
		     data.setName(name);
		     TheMaritimeSlikroadList.add(data);
		     		 	
			
		}
		pstm.close();
		conn.close();
		
		return TheMaritimeSlikroadList;
	}
	
}
