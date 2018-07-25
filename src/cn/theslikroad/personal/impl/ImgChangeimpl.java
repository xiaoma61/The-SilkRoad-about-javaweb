package cn.theslikroad.personal.impl;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import Decoder.BASE64Decoder;
import cn.theslikroad.LLM.UserName;
import cn.theslikroad.dbc.DatabaseConnection;
import cn.theslikroad.personal.dao.ImgChange;

public class ImgChangeimpl implements ImgChange{

	@Override
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
		String sql="update   USRMSG   SET  IMGURL=?  where USERNAME=?";//更新表格
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

	
	

	@Override
	public boolean GenerateImage(String imgStr, String imgFilePath) {
		// TODO Auto-generated method stub
		if (imgStr == null) // 图像数据为空  
            return false;  
        BASE64Decoder decoder = new BASE64Decoder();  
        try {  
            // Base64解码  
            byte[] bytes = decoder.decodeBuffer(imgStr);  
            for (int i = 0; i < bytes.length; ++i) {  
                if (bytes[i] < 0) {// 调整异常数据  
                    bytes[i] += 256;  
                }  
            }  
            // 生成jpeg图片  
            OutputStream out = new FileOutputStream(imgFilePath);  
            out.write(bytes);  
            out.flush();  
            out.close();  
            return true;  
        } catch (Exception e) {  
            return false;  
        }
	}




	@Override
	public boolean change(String imgStr, String imgFilePath) {
		// TODO Auto-generated method stub
		if(GenerateImage( imgStr,  imgFilePath))//先解析文件
		{
			if(updateUser( imgFilePath))
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}
		
	}




	
}
