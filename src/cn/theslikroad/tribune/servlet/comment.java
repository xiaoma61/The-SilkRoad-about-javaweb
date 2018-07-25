package cn.theslikroad.tribune.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.theslikroad.LLM.UserName;
import cn.theslikroad.dbc.DatabaseConnection;
import cn.theslikroad.tribune.commentDBC;
import cn.theslikroad.tribune.impl.Commentimpl;
import cn.theslikroad.tribune.impl.Msg;
import net.sf.json.JSONArray;


public class comment extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		if(UserName.username.equals(null)||UserName.username.equals("")){
			
			//注册页面
			 out.print("false");
			
		}
		else
		{
			String content=request.getParameter("content");
			int topic_id=Integer.parseInt(request.getParameter("topic_id"));
			String from_uid=UserName.username;
			String time=getTime();
			String url=null;
			System.out.println(content);
			try {
				url= imageUrl(from_uid);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//执行插入操作
			commentDBC com=new commentDBC();
			com.setContent(content);
			com.setFrom_uid(from_uid);
			com.setTopic_id(topic_id);
			com.setTime(time);
			com.setImgurl(url);
			
			Commentimpl c=new Commentimpl();
			
			if(c.Insert(com))
			{
				//实现跳转传递ID号
				  //实现评论人数增加
				  Msg msg=new  Msg();
				  int num=msg.Findtitlenum(topic_id);
				  msg.updatetitilenum(topic_id, num);
				  com.setImgurl(getSubStr(url, 2));
				  Msg getMsg=new Msg();
				  List<commentDBC> vistorlist=new ArrayList<commentDBC>();
				  vistorlist=getMsg.findall(topic_id);
				  request.getSession().setAttribute("vistorMsg", vistorlist);
				  String jsonString ="{\"content\":"+'"'+com.getContent()+'"'+",\"from_uid\":"+'"'+com.getFrom_uid()+'"'+",\"time\":"+'"'+com.getTime()+'"'+"}";
				  System.out.println(jsonString);
				
				  out.print(jsonString);
				  out.flush();
				
				 	
			
			}
			else
			{
				//更新失败
				out.println("false");
			}
			
			out.close();
			
		}
		
		
	}
	private String getTime()
	{
		SimpleDateFormat date=new SimpleDateFormat("yyyy-MM-dd-HH-mm");
		return date.format(new Date());
		
		
	}
	private String imageUrl(String from_uid) throws Exception
	{
		 String url = null;
		 String id=from_uid;
		 PreparedStatement pstm= null;
		 ResultSet rs= null;
		 DatabaseConnection conn = null;
		 conn=new DatabaseConnection();
		 String sql="select  imgurl from  USRMSG where USERNAME=?";
		 
		 pstm=conn.getConnection().prepareStatement(sql);
		 pstm.setString(1, id);
		 rs=pstm.executeQuery();
		 if(rs.next())
		 {
			 url=rs.getString(1);
		 }
		 
		 
		return url;
		
	}
	private static String getSubStr(String str, int num) {
		  String result = "";
		  int i = 0;
		  while(i < num) {
		   int lastFirst = str.lastIndexOf('\\');
		   result = str.substring(lastFirst) + result;
		   str = str.substring(0, lastFirst);
		   i++;
		  }
		  return result.substring(1);
		 } 

}
