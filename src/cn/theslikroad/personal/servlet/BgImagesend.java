package cn.theslikroad.personal.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.theslikroad.personal.impl.BGIMage;


public class BgImagesend extends HttpServlet{
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	doPost(request, response);
}
public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{

	 
	 response.addHeader("Access-Control-Allow-Origin", "*");
     response.setCharacterEncoding("UTF-8");
     request.setCharacterEncoding("UTF-8");
     PrintWriter out=response.getWriter();
     
	//��ȡ���������ļ������λ��
	String path=getServletContext().getRealPath("");
	String imgdata=request.getParameter("data");
	if(imgdata!=null)
	{
		imgdata=imgdata.trim();
	}
	System.out.println("js send succuessed+data   "+imgdata);
	String returnPath="UserBGImage/" + System.currentTimeMillis() + "." + "png";//���ô洢λ��
	System.out.println("js send succuessed+   "+path + returnPath);
	BGIMage impl=new BGIMage();
	if(impl.change(imgdata, path + returnPath)){
		System.out.print("succuss");
		out.write(returnPath);
         //�ϴ��ɹ���ʵ��ҳ��ˢ����ת
     } else {
         System.out.print("false");
    	 out.write("�ϴ�ʧ��");
    }

}

}
