package cn.theslikroad.tribune.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.theslikroad.tribune.replyDBC;
import cn.theslikroad.tribune.impl.Msg;
import net.sf.json.JSONArray;

public class Replyservlet  extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.print("dddd");
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		List<replyDBC>r=new ArrayList<replyDBC>();
		String time=request.getParameter("time");
		String id=request.getParameter("id");
		Msg m=new Msg();
		r=m.findReply(id, time);
		
		String page=request.getParameter("page");
		PrintWriter out=response.getWriter();
		System.out.print(time+"time" +id+"id"+ page+"page");
		try {
			System.out.print(time+"time" +id+"id"+ page+"page");
			r=m.findReply(id, time);
			int num=Integer.parseInt(page);
			if(num>=1)
			{
				num=(num-1)*5;
			}
			if(num>r.size())
			{
				out.print("false");
			}
			else
			{
				
			
				
					List<replyDBC>r1=new ArrayList<replyDBC>();
					for(int i=num;i<r.size()&&i<(num+5);i++)
					{
						r1.add(r.get(i));
					}
			 
				JSONArray ja = JSONArray.fromObject(r1);
				out.print(ja);
				out.flush();
				out.close();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		
		
	}

}
