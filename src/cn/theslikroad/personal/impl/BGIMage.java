package cn.theslikroad.personal.impl;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import cn.theslikroad.LLM.UserName;
import cn.theslikroad.dbc.DatabaseConnection;

public class BGIMage extends ImgChangeimpl{
	public boolean updateUser(String filepath) {
		// TODO Auto-generated method stub
		
		 boolean flag=true;
		 DatabaseConnection conn = null;
		 PreparedStatement pstm = null;
		 try {
			conn=new  DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	 

		String name=UserName.username;
		String sql="update   USRMSG   SET  BGIMAGE=?  where USERNAME=?";//更新表格
		try {
			pstm=conn.getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			pstm.setString(1, filepath);
			pstm.setString(2, name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			 pstm.execute();
			 conn.getConnection().commit();
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
		
		
		return flag;
	}

}
