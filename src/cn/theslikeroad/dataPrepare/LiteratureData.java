package cn.theslikeroad.dataPrepare;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.theslikroad.dbc.DatabaseConnection;
import cn.theslikroad.LLM.literatureData;

public class LiteratureData{
	static PreparedStatement pstm;
	static ResultSet rs;
	static DatabaseConnection conn;
	static List<literatureData> lists;

	
	
	public List<literatureData>GetMsg() throws Exception
	{
		lists=new ArrayList<literatureData>();
		conn=new DatabaseConnection();
		String sql="select* from bookmsg";
		pstm=conn.getConnection().prepareStatement(sql);
		rs=pstm.executeQuery();
		while(rs.next())
		{
			literatureData data=new literatureData();
			String title=rs.getString("imageurl");
			String msg=rs.getString("bookname");
			String bookname=rs.getString("bookwriter");
			
			data.setBookname(bookname);
			data.setMsg(msg);
			data.setTitle(title);
			lists.add(data);
			
		}
		//rs.last();
		
		conn.close();
		pstm.close();
		rs.close();
		
		
		
		return lists;
		
	}
	

}
