package cn.theslikroad.tribune.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.theslikroad.tribune.UserMsg;
import cn.theslikroad.tribune.commentDBC;
import cn.theslikroad.tribune.impl.Msg;

public class Post_GetTitle extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	@SuppressWarnings({ })
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		
		int titleid=  Integer.parseInt( request.getParameter("titleid"));
		System.out.println("title is  "+titleid);
		
		
		Msg getMsg=new Msg();
		List<commentDBC> vistorlist=new ArrayList<commentDBC>();
		UserMsg user=new UserMsg();
		HttpSession session=request.getSession();
		
		
		user=getMsg.findTitle(titleid);
		vistorlist=getMsg.findall(titleid);
		session.setAttribute("user", user);


		//更新评论数
		
		//空指针判断是否发送值过去
	/*	if(vistorlist!=null&& vistorlist.size()>1)
		{*/
			session.setAttribute("vistorMsg", vistorlist);
			response.sendRedirect("html/Three level page/post.jsp");
	/*	}*/
		
		
		
		
	}

}
