package cn.theslikeroad.seekword.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.theslikeroad.seekword.impl.keywordimpl;


public class keywordServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
	
		String keyword = URLDecoder.decode(request.getParameter("keyword"), "UTF-8");
		String type= request.getParameter("type");
		/*String keyword=request.getParameter("keyword");*/
		 response.setContentType("text/xml;charset=UTF-8");  
	    response.setHeader("Cache-Control", "no-store");
	    response.setHeader("Pragma","no-cache");
	    response.setDateHeader("Expires",0);
		keywordimpl impl=new keywordimpl();
		List<String>name = null;
		if(type.equals("2"))
		{
			name=impl.findkeyword(keyword,2);
		}else
		{
			name=impl.findkeyword(keyword,1);
		}
	
		System.out.print(keyword);
		PrintWriter out=response.getWriter();
	    out.write("<response>");
	    for(int i=0;i<6&&i<name.size();i++)
	    {
	    	out.write("<res>");
	    	System.out.print(name.get(i));
	    	out.write(name.get(i));
	    	out.write("</res>");
	    }
	    out.write("</response>");      
        out.flush();
        out.close();
		
	}

}
