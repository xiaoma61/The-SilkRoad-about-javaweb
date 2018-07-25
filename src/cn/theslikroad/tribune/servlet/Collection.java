package cn.theslikroad.tribune.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.theslikroad.LLM.UserName;
import cn.theslikroad.tribune.Colletiondata;
import cn.theslikroad.tribune.impl.Colletionimpl;

public class Collection extends HttpServlet{
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
			//点击的时候创建表格
			PrintWriter out=response.getWriter();
			if(UserName.username==null||UserName.username.equals("")){
				
				//注册页面
				out.print("false");
				
			}
			else
			{
			int titleid=Integer.parseInt(request.getParameter("titleid"));
			String flag=request.getParameter("flag");
			Colletiondata data=new Colletiondata();
			Colletionimpl coll=new Colletionimpl();
			String time=GetTime();
			data.setTime(time);
			data.setTitleid(titleid);
		
			if(flag.equals("true"))
			{
				out.write("addsuccess");
				coll.addBrower(data);
			}else
			{
				out.write("deletesuccess");
				coll.delete(data);
			}
			out.close();
			}
			//删除操作
			
		}
		private String GetTime()
		{
			SimpleDateFormat date=new SimpleDateFormat("yyyy-MM-dd-HH-mm");
			return date.format(new Date());
			
		}
}
