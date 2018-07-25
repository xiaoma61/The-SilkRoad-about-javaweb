package cn.theslikroad.personal.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.theslikroad.personal.impl.Dodelete;

public class deleteColletion extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
		int id= Integer.parseInt(request.getParameter("id"));
		Dodelete d=new Dodelete();
		
		PrintWriter out=response.getWriter();
		if(d.doDelete_Collect(id))
		{
			out.print("true");
		}
		else
		{
			out.print("false");
		}
	}

}
