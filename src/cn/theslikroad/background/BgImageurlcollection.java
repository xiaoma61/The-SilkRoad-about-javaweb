package cn.theslikroad.background;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.theslikroad.LLM.UserName;
import cn.theslikroad.background.impl.bgcollectionimpl;


public class BgImageurlcollection extends HttpServlet{


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
	{
		doPost(request,response);
		
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
	{
		PrintWriter out=response.getWriter();
		if(UserName.username==""||UserName.username==null)
		{
			out.print("false");
			/*request.getRequestDispatcher("html/load.jsp").forward(request, response);*/
		}
		else
		{
			
			String id=request.getParameter("id");
			String flag=request.getParameter("flag");
			System.out.println(id);
			System.out.println(flag);
			bgcollectionimpl bgc=new bgcollectionimpl();
	
			try {
				
				if(flag.equals("true"))
				{
					if(bgc.doCreate(id))
					{
						out.print("url docreatesuccess");
					}
				}
				if(flag.equals("false"))
				{
					if(bgc.doDelete(id))
					{
						out.print("urldaoDeletesuccess");
					}
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			out.close();
		}
		

		
		
		
	
	}

}
