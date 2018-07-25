package cn.theslikroad.literature;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import cn.theslikroad.literature.data.LiteractureData;
import cn.theslikroad.dbc.DatabaseConnection;

public class GetFileMsg extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String name=null;
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException{
		//����ļ��ϴ��ɹ���������Խ��з�����
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html");
		String title=req.getParameter("title");
		String writer=req.getParameter("writer");
		String writerword=req.getParameter("writerword");
		String article=req.getParameter("article");
		LiteractureData data=new LiteractureData();
		data.setArticle(article);
		data.setTitle(title);
		data.setWriterword(writerword);
		data.setWriter(writer);
		checkUser user=new checkUser();
		name=user.Getname();
		//¼��ɹ�ʵ�����µ�ҳ�����ת
		
		try {
			if(doGetlast(data))
			{
				//ʵ����ת
				doGetLiteracture(data);
				resp.sendRedirect("html/literature.jsp");
			
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//ʵ���������
		
	}
	
	private boolean doGetlast(LiteractureData data) throws Exception 
	{
		 boolean flag=true;
		 DatabaseConnection conn=new  DatabaseConnection();	 
		
		 //ѡ��
		 String[] sql = new String[50];
		 int t=0;
		 
		 for(String filename:fileroadArray.file)
		 {
			 
			 String sql1="update "+name+" SET TITLE=?,  WRITER=? , WRITERWORD=? , ARTICLE=?   where FILEROAD=?";
			 PreparedStatement ps;
			 ps=conn.getConnection().prepareStatement(sql1);
			 ps.setString(1, data.getTitle());
			 ps.setString(2, data.getWriter());
			 ps.setString(3, data.getWriterword());
			 ps.setString(4, data.getArticle());			
			 ps.setString(5, filename);
			 t++;
			 ps.execute();
			 conn.getConnection().commit();
			 ps.close();
		 }
		 conn.close();

		 return flag;
		
	}
	private boolean doGetLiteracture(LiteractureData data) throws Exception //������
	{
		 boolean flag=true;
		 DatabaseConnection conn=new  DatabaseConnection();	 
		 ResultSet rs;
		 //ѡ��
		 String[] sql = new String[50];
		 int t=0;
		 
		 for(String filename:fileroadArray.file)
		 {
			 
			 String sql1="update LITERATUREDATA SET TITLE=?,  WRITER=? , WRITERWORD=? , ARTICLE=?   where FILEROAD=?";
			 PreparedStatement ps;
			 ps=conn.getConnection().prepareStatement(sql1);
			 ps.setString(1, data.getTitle());
			 ps.setString(2, data.getWriter());
			 ps.setString(3, data.getWriterword());
			 ps.setString(4, data.getArticle());			
			 ps.setString(5, filename);
			 t++;
			 ps.execute();
			 conn.getConnection().commit();
			 ps.close();
		 }
		 conn.close();

		 return flag;
		
	}
	private boolean doInsert(LiteractureData data,String fileroad) throws Exception
	{
		//��������
		 boolean flag=false;
		 //���ұ�
		 DatabaseConnection conn=new  DatabaseConnection();
		 PreparedStatement pstm;
	

		 String sql=" update"+name+"title=?  writer=? writerword=? article=? where fileroad="+fileroad;
		 pstm=conn.getConnection().prepareStatement(sql);
		 pstm.setString(1, data.getTitle());
		 pstm.setString(2, data.getWriter());
		 pstm.setString(3, data.getWriterword());
		 pstm.setString(4, data.getArticle());
		 int  rs=pstm.executeUpdate();
		if(rs!=0)
		{
			flag=true;
		}
		
			 
		
		 pstm.close();
		 conn.close();
		return flag;
		
	}
	public void doGet(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException
	{
		doPost(req,resp);
	}

}
