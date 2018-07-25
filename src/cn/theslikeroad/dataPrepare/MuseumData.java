package cn.theslikeroad.dataPrepare;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import cn.theslikroad.LLM.MuseumMsg;

import cn.theslikroad.dbc.DatabaseConnection;
public class MuseumData{
	

	
	public List<MuseumMsg>GetMsg() throws Exception
	{
		
		List< MuseumMsg> museumMsg;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		DatabaseConnection conn = null;
			museumMsg=new ArrayList<MuseumMsg>();
	
			try {
				conn = new DatabaseConnection();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			String sql="select  name, introduce,imgeurl from MUSEUM";
			String sql1="select  imageurl from MUSEUMIMAGE where name=?";
			String sql2="select  comments from MUSEUMIMAGE where name=?";
			String sql3="select  address from MUSEUMIMAGE where name=?";
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
					 MuseumMsg museum=new  MuseumMsg();
					 museum.setName(rs.getString(1));
					 museum.setIntroduce(rs.getString(2));
					 museum.setMainImage(rs.getString(3));
					 String name=rs.getString(1);
					 List<String>imageurl=getlistMsg(sql1,name);	
					 List<String>comments=getlistMsg(sql2,name);	
					 List<String>address=getlistMsg(sql3,name);
					 museum.setUrl(imageurl);
					 museum.setComments(comments);
					 museum.setAddress(address);
				     museumMsg.add(museum);
					
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
			return museumMsg;
			
		
		
	}
	private List<String>getlistMsg(String sql,String name) throws Exception
	{
		List<String>Msg=new ArrayList<String>();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		DatabaseConnection conn = null;
		conn = new DatabaseConnection();
		pstm=conn.getConnection().prepareStatement(sql);
		pstm.setString(1, name);
		rs=pstm.executeQuery();
		
		while(rs.next())
		{
			Msg.add(rs.getString(1));				
				
		}
		return Msg;
		
	}
}
