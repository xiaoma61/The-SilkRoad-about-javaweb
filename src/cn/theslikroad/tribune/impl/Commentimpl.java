package cn.theslikroad.tribune.impl;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import cn.theslikroad.dbc.DatabaseConnection;
import cn.theslikroad.tribune.commentDBC;
import cn.theslikroad.tribune.DAO.Commentdao;

public class Commentimpl implements Commentdao{

	
	@Override
	public boolean Insert(commentDBC com) {
		// TODO Auto-generated method stub
		 boolean flag=false;
		 PreparedStatement pstm= null;
		 DatabaseConnection conn = null;
		 try {
			conn=new DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 String sql="insert into TRIBUNECOMMENT (ID,TOPIC_ID,CONTENT,FROM_UID,TIME,Imgeurl)values(COMMENTID.nextval,?,?,?,?,?)";
		 try {
			pstm=conn.getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm.setInt(1, com.getTopic_id());
			pstm.setString(2, com.getContent());
			pstm.setString(3, com.getFrom_uid());
			pstm.setString(4, com.getTime());
			pstm.setString(5, com.getImgurl());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			if(pstm.executeUpdate()>0)flag=true;
			 try {
				pstm.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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
		return flag;
	}

}
