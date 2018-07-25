package cn.theslikroad.tribune;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.theslikroad.LLM.UserName;
import cn.theslikroad.dbc.DatabaseConnection;
import cn.theslikroad.personal.impl.findimgeimpl;
@WebServlet("/UserServlet")
public class SendMsg extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	int visitor;
	int talknums;
	String id;
	static DatabaseConnection conn;
	static PreparedStatement pstm;
	static PreparedStatement pstm1;
	static ResultSet rs;
	public void doGet(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException
	{
		doPost(req,resp);
	}
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException
	{
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html");
		String title =req.getParameter("title");
		String suggest=req.getParameter("suggest");
		String url;
		findimgeimpl impl=new findimgeimpl();
		if(UserName.username==""||UserName.username==null)
		{
			req.getRequestDispatcher("html/load.jsp").forward(req, resp);
		}
		else
		{
			visitor=0;
			talknums=0;
			id=UserName.username;
			String time=GetTime();
		//得到图像
			url=impl.finduserIMg();
			try {
				conn=new DatabaseConnection();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String sql="insert into TRIBUNECREATEMSG(ID,TITLE,SUGGEST,VISTOR,TALKNUMS,TIME,titleid,url)values(?,?,?,?,?,?,TITILEIDS.nextval,?)";
			try {
				pstm=conn.getConnection().prepareStatement(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				pstm.setString(1, id);
				pstm.setString(2, title);
				pstm.setString(3, suggest);
				pstm.setInt(4, visitor);
				pstm.setInt(5, talknums);
				pstm.setString(6, time);
				pstm.setString(7, url);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				
				rs=pstm.executeQuery();
				if(rs.next())
				{
					System.out.print("插入成功");
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
			resp.sendRedirect("html/tribune.jsp");
		
			/*req.getRequestDispatcher("html/tribune.jsp").forward(req, resp);*/
			
		}
	}
	
	private String GetTime()
	{
		SimpleDateFormat date=new SimpleDateFormat("yyyy-MM-dd-HH-mm");
		return date.format(new Date());
		
	}
	

}
