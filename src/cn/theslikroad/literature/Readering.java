package cn.theslikroad.literature;

import java.io.File;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.theslikroad.BaiduwenkuReader.DocConverter;
import cn.theslikroad.dbc.DatabaseConnection;
import cn.theslikroad.literature.data.LiteractureData;

public class Readering extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException{
		
		String id=req.getParameter("titleid");
		System.out.println("id     "+id); 
		int newid=Integer.parseInt(id);
		
		String file = null;
		//找到文件位置
	/*	 String name=null;
		 checkUser user=new checkUser();
		 name=user.Getname();*/
		 DatabaseConnection conn = null;
		try {
			conn = new  DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 PreparedStatement pstm = null;
		 ResultSet rs;
		 String sql="select fileroad from LITERATUREDATA where id="+newid;
		 try {
			pstm=conn.getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			rs=pstm.executeQuery();
			if(rs.next())
			{
				file=rs.getString(1);
				System.out.println("file     "+file); 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm.close();
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
		 //获取需要转换的文件名,将路径名中的'\'替换为'/'  
		  String path=req.getSession().getServletContext().getRealPath(File.separator); 
//		  String readpath=file.replaceAll("\\\\", "/"); 
		  DocConverter d = new DocConverter(file);  
		  d.conver();
		  System.out.println("sadasasda"+d.getswfPath()); 
		  String mpath=getSubStr(d.getswfPath(), 2);
		  //生成文件相对路径
		  //在这里添加信息传过去
		  Findall all=new Findall();
		  LiteractureData data=all.findll(newid);
		  
		  System.out.println("sad "+mpath); 
		  HttpSession session=req.getSession();
		  session.setAttribute("swfpath", mpath); 
		  session.setAttribute("data", data); 
		  //开始跳转
		 resp.sendRedirect("html/Three level page/FlexPaper_1.5.1_flash/literature_user.jsp");
	}
	private static String getSubStr(String str, int num) {
		  String result = "";
		  int i = 0;
		  while(i < num) {
		   int lastFirst = str.lastIndexOf('/');
		   result = str.substring(lastFirst) + result;
		   str = str.substring(0, lastFirst);
		   i++;
		  }
		  return result.substring(1);
		 } 

	public void doGet(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException
	{
		doPost(req,resp);
	}

}
