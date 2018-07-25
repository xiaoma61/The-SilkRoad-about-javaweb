package cn.theslikeroad.refresh.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.theslikroad.tribune.commentDBC;
import cn.theslikroad.tribune.impl.Msg;
public class Refreshservlet extends HttpServlet{
	

	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException
	{
		//实现session更新
		int titleid= Integer.parseInt(req.getParameter("titleid"));
		//更新数据
		Msg getMsg=new Msg();
		List<commentDBC> vistorlist=new ArrayList<commentDBC>();
		vistorlist=getMsg.findall(titleid);
		req.getSession().setAttribute("vistorMsg", vistorlist);
		PrintWriter out=resp.getWriter();
		out.print("true");
		
		
	}
	public void doGet(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException
	{
		doPost(req,resp);
	}
}
