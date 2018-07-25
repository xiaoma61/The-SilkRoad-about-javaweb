package cn.theslikroad.literature;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.codehaus.jackson.map.ObjectMapper;

import cn.theslikroad.GetFile.ChangeName;
import cn.theslikroad.LLM.UserName;
import cn.theslikroad.dbc.DatabaseConnection;

public class Literature extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String uploadPath;
	private String path=null;
	public Integer code;
	
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException{
		//当没有登陆的时候跳转
		uploadPath=req.getSession().getServletContext().getRealPath(File.separator);
		DiskFileItemFactory factory = new DiskFileItemFactory(); 
		factory.setSizeThreshold(1024*4);
		ServletFileUpload upload=new ServletFileUpload(factory);
		upload.setSizeMax(1024*1024*4);
		
		
		try {
			List<FileItem>fileitems=upload.parseRequest(req);
			Iterator<FileItem>i=fileitems.iterator();
			String name=Getname();
			PrintWriter writer=resp.getWriter();
			ChangeName changename=new ChangeName();
			String newname=changename.CreateName();
			if(isInsertallTable())
			{
				
				while(i.hasNext())
				{
					FileItem file=i.next();
					String filename=file.getName();
					StringBuffer buf=new StringBuffer();
					
					if(filename!=null)
					{
	
						checkfileroad(name);
						buf.append(path);
						buf.append("\\");					
						File fullfile=new File(new String(file.getName().getBytes(), "utf-8"));
						//改变文件的名称防止文件重复
						File savedFile=new File(path,newname+fullfile.getName());	
						File newFilename=new File(path,newname+fullfile.getName());
						/*savedFile.renameTo(newFilename);*/					
						buf.append(newFilename.getName());
						Inserdata(name,buf.toString());
						LiteratureInsert( name,buf.toString());
						file.write(savedFile);
						fileroadArray.setFile(buf.toString());
						System.out.print(fileroadArray.getFile().get(0));
						Upload upload1 = new Upload();
					    upload1.setCode(200);
					    String callback = new ObjectMapper().writeValueAsString(upload1);
					    writer.print(callback);
						writer.flush();
					    
						
					}
					
				}
				
			}
		
	        writer.close();
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	private void checkfileroad(String name)
	{
		//检测目标文件是否存在
		//不存在的时候创建
		StringBuffer buffer=new StringBuffer();
		buffer.append(uploadPath);
		buffer.append("\\");
		buffer.append(name);
		File file=null;
		file=new File(buffer.toString());
		if(!file.exists()) {
		
			System.out.print("mkdirs");
			file.mkdirs(); 
			
		}
		path=buffer.toString();
	}
	private boolean isInsertallTable() throws Exception
	{
		//检查是不是添加到了表名
		boolean flag=false;
		String name=Getname();
		if(!check(name))
		{
			
			if(InsertFile(name))//不存在表名的时候创建表格
				 if(CreateTable(name))flag=true;
				 else flag=false;
			
		}
		else
		{
			flag=true;
		}
		
		return flag;
	}
	private boolean Inserdata(String name,String file) throws Exception
	{
		 boolean flag=false;
		 DatabaseConnection conn=new  DatabaseConnection();
		 PreparedStatement pstm;
		 ResultSet rs;
		 String sql="insert into "+name+"(fileroad,id)values(?,TITILEIDS.nextval)";
		 pstm=conn.getConnection().prepareStatement(sql);
		 pstm.setString(1, file);
		 rs=pstm.executeQuery();
		 if(rs.next())
		 {
			 flag=true;
		 }
		 pstm.close();
		 conn.close();
		 return flag;
		
	}
	private boolean LiteratureInsert(String name,String file) throws Exception
	{
		 boolean flag=false;
		 DatabaseConnection conn=new  DatabaseConnection();
		 PreparedStatement pstm;
		 ResultSet rs;
		 String sql="insert into LITERATUREDATA (fileroad,id)values(?,TITILEIDS.nextval)";
		 pstm=conn.getConnection().prepareStatement(sql);
		 pstm.setString(1, file);
		 rs=pstm.executeQuery();
		 if(rs.next())
		 {
			 flag=true;
		 }
		 pstm.close();
		 conn.close();
		 return flag;
		 
	}
	private boolean check(String name) throws Exception
	{
		//检查是否存在该数据表格
		 boolean flag=false;
		 DatabaseConnection conn=new  DatabaseConnection();
		 PreparedStatement pstm;
		 ResultSet rs;
		 String sql=" Select count(*)  from  FILEUSER where USERNAME =?";
		 
		 pstm=conn.getConnection().prepareStatement(sql);
		 pstm.setString(1, name);
		 rs=pstm.executeQuery();
		 rs.next();
		 int count=rs.getInt(1);
		 if(count>0)
		 {
			 flag=true;//存在该表名
		 }
		
			 
		
		 pstm.close();
		 conn.close();
		
		return flag;
		
	}
	private String Getname()
	{
		//得到名字
		String name=null;
		if(UserName.username==""||UserName.username==null)
		{
			name="vistor";
		}
		else
		{
			name=UserName.username;
		} 
		 StringBuffer buf=new StringBuffer();
		 buf.append(name);
		 buf.append("filetable");
		 String filename=buf.toString();
		 return filename;
		
	}
	public boolean InsertFile(String name) throws Exception
	{
		 DatabaseConnection conn=new  DatabaseConnection();
		 PreparedStatement pstm;
		 ResultSet rs;
		 boolean flag=false;
		
		 
		 String sql="insert into FILEUSER (USERNAME)values(?)";
		 
		 pstm=conn.getConnection().prepareStatement(sql);
		 pstm.setString(1, name);
		 rs=pstm.executeQuery();
		 if(rs.next())
		 {
			 flag=true;
		 }
		 pstm.close();
		 conn.close();
		return flag;
		
	}
	public boolean CreateTable(String filename) throws Exception
	{
		//检查是否存在表格，无则创建表格。有则将将数据传入该表格（主要是传入文件位置）
		 
		 DatabaseConnection conn=new  DatabaseConnection();
	/*	 PreparedStatement pstm;
		 ResultSet rs;*/
		 boolean flag=false;
		 Statement sm = null;
		 sm=conn.getConnection().createStatement();
		

		 
		 String sql="create table "+filename+"(title varchar(20),writer varchar(10),writerword varchar(50),article varchar(100),fileroad varchar(500),id int)";//创建属于用户的文件表
		 sm.addBatch(sql);
	
		/* pstm=conn.getConnection().prepareStatement(sql);
		 if(!pstm.execute())
		 {
			 System.out.println("创建表成功");
			 flag=sm.executeBatch();
		 }*/
		 int[] results =sm.executeBatch();
		for(int i=0;i<results.length;i++)
		{
			if(results[i]>=0)flag=true;
			else flag=false;
				
		}
		 
		// pstm.close();
		// conn.close();
		 return flag;
		
		
    }
	public void doGet(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException
	{
		doPost(req,resp);
	}
}
