package cn.theslikroad.GetFile;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


import cn.theslikroad.LLM.UserName;
import cn.theslikroad.dbc.DatabaseConnection;

public class GetFile extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private DatabaseConnection conn=null;
	private PreparedStatement pstm=null;
	private PreparedStatement pstm1=null;
	private PreparedStatement pstm2=null;
	public void doGet(HttpServletRequest req,HttpServletResponse resp) throws UnsupportedEncodingException
	{
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		DiskFileItemFactory factory=new DiskFileItemFactory();
		ServletFileUpload sfu=new ServletFileUpload(factory);
		sfu.setFileSizeMax(1024*400);
		try {
			List<FileItem>items=sfu.parseRequest(req);
			for(int i=0;i<items.size();i++)
			{
			
				FileItem item=items.get(i);
				if(!item.isFormField())
				{
				
				
					String path="G:/myeclipse/.metadata/.me_tcat85/webapps/TheSlikRoad/UserImage";
					System.out.println(path);
					int index=item.getName().lastIndexOf("\\");
					if(index!=-1)
					{
						String filename=item.getName().substring(index+1);
						String name=CreateName(filename);
						File file=new File(path,name);
						String id=UserName.username;
					
						if(!file.exists())
						{
							item.write(file);
							StringBuffer buf=new StringBuffer();
							buf.append("file:///G:/myeclipse/.metadata/.me_tcat85/webapps/TheSlikRoad/UserImage");
							buf.append(name);
							String mpath=buf.toString();
							System.out.println(buf.toString());
						
							InsertData("text",mpath);
							req.getRequestDispatcher("html/personal homepage.jsp").forward(req, resp);
							
						}
					}
					
					
					
				}
			}
			
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void InsertData(String id,String url) throws Exception
	{
		conn=new DatabaseConnection();
		String sql2="select* from headimge where id=?";
		pstm=conn.getConnection().prepareStatement(sql2);
		pstm.setString(1, id);
		ResultSet rs=pstm.executeQuery();
		if(rs.next())
		{
			String sql1="delete from headimge where id=?";		
			pstm2=conn.getConnection().prepareStatement(sql1);
			pstm2.setString(1, id);
		}
		
		String sql="insert into headimge(id ,url)values(?,?)";
		pstm1=conn.getConnection().prepareStatement(sql);
		pstm1.setString(1, id);
		pstm1.setString(2, url);
		
		ResultSet rs1=pstm1.executeQuery();
		if(rs1.next())
		{
			System.out.print("success");
		}
		pstm.close();
		conn.close();
		
		
	}
	public String CreateName(String filename)//时间+系统日期
	{
		StringBuffer buf=new StringBuffer();
		String date=Getdate();
		buf.append(date);
		Random r=new Random();
		for(int i=0;i<4;i++)
		{
			buf.append(r.nextInt(10));
			
		}
		buf.append(filename);
		return buf.toString();
		
	}
	public String Getdate()
	{
		SimpleDateFormat data=new SimpleDateFormat("yyyyMMddHHmmssSS");
		return data.format(new Date());
		
	}
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws UnsupportedEncodingException
	{
		doGet(req,resp);
	}

}
