package cn.theslikroad.checkserlvlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.theslikroad.dbc.DatabaseConnection;

public class checkservlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	static DatabaseConnection conn;
	static PreparedStatement pstm;
	static ResultSet rs;
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws IOException
	{
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		String username=req.getParameter("username");
		
		try {
			conn=new DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql="select  count (username) from usrmsg where  username=? ";
		try {
			pstm=conn.getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			pstm.setString(1, username);
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			rs=pstm.executeQuery();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			if(rs.next())
			{
				if(rs.getInt(1)>0)
				{
					out.print("true");
				}
				else
				{
					out.print("false");
				}
				
			}
			out.close();
			conn.close();
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
	}
	public void doGet(HttpServletRequest req,HttpServletResponse resp) throws IOException
	{
		doPost(req,resp);
	}

}
