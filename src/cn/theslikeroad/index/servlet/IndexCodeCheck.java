package cn.theslikeroad.index.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IndexCodeCheck extends HttpServlet {//验证码检测
	
private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String usercode = request.getParameter("code");
		String systemcode = (String) request.getSession().getAttribute("picCode");
		
		if(usercode.equals(systemcode))	{
			out.println("<HTML><BODY>验证结果正确！</BODY></HTML>");
		}
		else {
			out.println("<HTML><BODY>验证结果失败！</BODY></HTML>");
		}
		out.flush();
		out.close();
	}
}
