package cn.theslikeroad.finduser;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import cn.theslikeroad.User.PasswordandUser;
import cn.theslikroad.LLM.Register;
import cn.theslikroad.dbc.DatabaseConnection;
public class userandpassword implements PasswordandUser{
	private DatabaseConnection conn=null;
	private PreparedStatement pstm=null;
	private ResultSet rs=null;
	public boolean findLogin(Register register)throws Exception{
		boolean flag=false;
		try{
			conn=new DatabaseConnection();
			String sql="select * from UsrMsg where username=? and password=?";
			pstm=conn.getConnection().prepareStatement(sql);
			pstm.setString(1, register.getUsername());
			pstm.setString(2, register.getPassword());
			rs=pstm.executeQuery();
			if(rs.next())
			{
				register.setUsername(rs.getString(1));			
				flag=true;
				
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally{
			pstm.close();
		}
		
		return  flag;
	}

}
