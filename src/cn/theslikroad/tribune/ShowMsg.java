package cn.theslikroad.tribune;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.theslikroad.dbc.DatabaseConnection;
import cn.theslikroad.personal.impl.FindUserIMG;
import cn.theslikroad.tribune.UserMsg;
public class ShowMsg {
	List<UserMsg>userMsgList;
	static DatabaseConnection conn;
	static PreparedStatement pstm;
	static ResultSet rs;
	public List<UserMsg> GetData() throws Exception
	{
		conn=new DatabaseConnection();
		String sql="select *from TRIBUNECREATEMSG";
		pstm=conn.getConnection().prepareStatement(sql);
		rs=pstm.executeQuery();
		FindUserIMG img=new FindUserIMG();
		userMsgList=new ArrayList<UserMsg>();
		while(rs.next())
		{
			UserMsg useMsg=new UserMsg ();
			String id=rs.getString("id");
			String title =rs.getString("title");
			String suggest=rs.getString("suggest");
			int visitor=rs.getInt("VISTOR");
			int talknums=rs.getInt("TALKNUMS");
			String time=rs.getString("time");
			int titleid=rs.getInt("titleid");
			String url;
			url=img.GetImge(id);
			//由用户id查找用户头像
			useMsg.setId(id);
			useMsg.setSuggest(suggest);
			useMsg.setTalknums(talknums);
			useMsg.setTitle(title);
			useMsg.setVisitor(visitor);
			useMsg.setTime(time);
			useMsg.setTitleid(titleid);
			useMsg.setUrl(url);
			userMsgList.add(useMsg);
			
		}
	
		pstm.close();
		conn.close();
		return userMsgList;
		
		
	}

	

}
