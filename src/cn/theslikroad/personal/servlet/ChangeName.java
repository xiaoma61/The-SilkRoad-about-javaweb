package cn.theslikroad.personal.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.theslikroad.LLM.UserName;

public class ChangeName extends HttpServlet{
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	doPost(request, response);
}
public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
	UserName.username="";
	//������ҳ
	response.sendRedirect("index.jsp");
	}

}
