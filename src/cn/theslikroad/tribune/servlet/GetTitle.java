package cn.theslikroad.tribune.servlet;

import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.theslikroad.LLM.UserName;
import cn.theslikroad.tribune.UserMsg;
import cn.theslikroad.tribune.browerdata;
import cn.theslikroad.tribune.commentDBC;
import cn.theslikroad.tribune.impl.IsFollow;
import cn.theslikroad.tribune.impl.Msg;

public class GetTitle extends HttpServlet{
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
	
		int titleid= Integer.parseInt(request.getParameter("titleid"));
	
		
		
		
		Msg getMsg=new Msg();
		List<commentDBC> vistorlist=new ArrayList<commentDBC>();
		UserMsg user=new UserMsg();
		HttpSession session=request.getSession();
		browerdata data=new browerdata();
		IsFollow isf=new IsFollow();
		user=getMsg.findTitle(titleid);
		//插入浏览记录
		
		String time=GetTime();
		data.setTime(time);
		data.setTitleid(titleid);
		
		getMsg.addBrower(data);
		vistorlist=getMsg.findall(titleid);
		session.setAttribute("user", user);
		
		String isinfo = null;
		if(UserName.username!=null&&UserName.username!="")
		{
			try {
				isinfo=isf.isFollow(titleid);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else
		{
			isinfo="false";
		}
		
		
		System.out.print("size"+vistorlist.size());
		//查找话题是不是被关注如果是
		
		
		//空指针判断是否发送值过去
	/*	if(vistorlist!=null&& vistorlist.size()>1)
		{*/ session.setAttribute("isinfo", isinfo);
			session.setAttribute("vistorMsg", vistorlist);
			response.sendRedirect("html/Three level page/post.jsp");
	/*	}
		else
		{
			response.sendRedirect("html/Three level page/post_user.jsp");
		}*/
		
		
		
		
	}
	private String GetTime()
	{
		SimpleDateFormat date=new SimpleDateFormat("yyyy-MM dd-HH:mm");
		return date.format(new Date());
		
	}

}
