package cn.theslikroad.tribune.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.theslikroad.LLM.UserName;
import cn.theslikroad.tribune.FromUid;
import cn.theslikroad.tribune.replyDBC;
import cn.theslikroad.tribune.impl.Replyimpl;

public class SetFromid extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		String From_uid= request.getParameter("From_uid");
		PrintWriter out=response.getWriter();
		if(UserName.username.equals(null)||UserName.username.equals("")){
			
			//注册页面
			 response.sendRedirect("html/load.jsp");
			
		}
		
		else
		{
			//自己ID号
			String from_uid=UserName.username;
			FromUid.setFromuid(From_uid);
			
			//获取topicid	
			replyDBC reply=new replyDBC();
			reply.setFrom_uid(from_uid);
			
			//插入数据库
			Replyimpl replyimpl=new Replyimpl();
			if(replyimpl.Insertreply(reply))
			{
				//插入成功后跳转
				 out.write("insertsuccess");
			
			}
			else
			{
				//插入不成功
				 out.write("insertlose");
			}
		}
		
		
		}
	

}
