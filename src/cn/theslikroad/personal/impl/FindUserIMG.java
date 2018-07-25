package cn.theslikroad.personal.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.theslikroad.LLM.UserName;
import cn.theslikroad.dbc.DatabaseConnection;

public class FindUserIMG {
	public String GetImge(String name)
	{
		 System.out.println(name);
		 String url = null;
		 url=findImg(name);
		 System.out.println(url);
	     url=getSubStr(url, 1);
	     System.out.println(url);  
		 return url;
	}
	private static String getSubStr(String str, int num) {
		  String result = "";
		  int i = 0;
		  while(i < num) {
		   int lastFirst = str.lastIndexOf('\\');
		   result = str.substring(lastFirst) + result;
		   str = str.substring(0, lastFirst);
		   i++;
		  }
		  return result.substring(1);
		 } 
	private String findImg(String usname)
	{
		 String url = null;

		 DatabaseConnection conn = null;
		 PreparedStatement pstm = null;
		 ResultSet rs;
		 try {
			conn=new  DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	 
	
		String sql="select   IMGURL  from USRMSG where USERNAME=?";//更新表格
		try {
			pstm=conn.getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {

			pstm.setString(1, usname);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			 rs=pstm.executeQuery();
			 if(rs.next())
			 {
				 url=rs.getString(1);
				 return url;
			 }
			 
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			pstm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		
		
		return url;
		
	}

}
