package cn.theslikroad.tribune.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.theslikroad.LLM.UserName;
import cn.theslikroad.dbc.DatabaseConnection;
import cn.theslikroad.literature.checkUser;

public class IsFollow {

	public String isFollow(int titleid) throws Exception
	{
		
		 String isfollow ="false";
		 if(UserName.username==null||UserName.username.equals(""))
		 {
			 
			 return isfollow;
		 }
		 else
		 {
			 checkUser user=new checkUser();
			 String name=user.Getname();
			 String tablename=name+"colletion";//表的名字为用户名+tribune
			 String sql="select count(*) from "+ tablename +" where TITLEID=?";
			 DatabaseConnection conn = null;
			 conn=new DatabaseConnection();
			 PreparedStatement pstm = null;
			 ResultSet rs = null;
			 try {
				pstm=conn.getConnection().prepareStatement(sql);
				pstm.setInt(1, titleid);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 try {
				rs=pstm.executeQuery();
				if(rs.next())
				{
					if(rs.getInt(1)>0)
					{
						isfollow="true";
					}
					else
					{
						isfollow="false";
					}
					
				}
				else
				{
					isfollow="false";
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 }
		
		return isfollow;
		
	}

}
