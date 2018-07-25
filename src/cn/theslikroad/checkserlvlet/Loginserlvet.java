package cn.theslikroad.checkserlvlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.theslikroad.LLM.Register;
import cn.theslikroad.LLM.UserName;
import cn.theslikroad.dao.factory.DAOfactory;
import cn.theslikroad.personal.impl.FindUserIMG;


public class Loginserlvet extends HttpServlet{
	

	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException
	{
		
	
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html");
		String username=req.getParameter("username");
		String password=req.getParameter("password");
		List<String>info=new ArrayList<String>();
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		HttpSession session=req.getSession();
		String usercode = req.getParameter("code");
		String systemcode = (String) req.getSession().getAttribute("picCode");

			if(info.isEmpty())
			{
				Register register=new Register();
				register.setUsername(username);
				register.setPassword(password);
				try {
					if(usercode.equals(systemcode))	{
						
						if(DAOfactory.getIUserPasswordInstance().findLogin(register))
						{
							UserName.setUsername(username);	
							FindUserIMG Img=new FindUserIMG();
							String url=Img.GetImge(username);
							//设置头像
							session.setAttribute("url", url);
							/*req.getSession().setAttribute("url", url);*/
							resp.sendRedirect("index.jsp");
						}
						else
						{
							
							info.add("密码或者账号不正确");
							req.setAttribute("info", info);
							req.getRequestDispatcher("html/load.jsp").forward(req, resp);
						
						}
					}
					else {
						info.add("验证码错误");
						req.setAttribute("info", info);
						req.getRequestDispatcher("html/load.jsp").forward(req, resp);

					}
					
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		/*}*/
		
		
			
		
		
	
		
	}
	public void doGet(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException
	{
		doPost(req,resp);
	}

}
