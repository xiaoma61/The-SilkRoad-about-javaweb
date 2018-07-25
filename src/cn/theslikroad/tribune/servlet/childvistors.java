package cn.theslikroad.tribune.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.theslikroad.LLM.UserName;
import cn.theslikroad.personal.impl.findimgeimpl;

import cn.theslikroad.tribune.replyDBC;
import cn.theslikroad.tribune.impl.Msg;
import cn.theslikroad.tribune.impl.Replyimpl;
import net.sf.json.JSONArray;

public class childvistors extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		System.out.print("text");
		if(UserName.username.equals(null)||UserName.username.equals("")){
			
			//注册页面
			 out.print("false");
			 
			
		}
		else
		{
			//自己ID号
			String from_uid=UserName.username;
			//发送父对象
			String replyid=request.getParameter("from_uid"); 
			//当是子对象的时候
			String to_uid=request.getParameter("to_uid");
			//发送文字
			String content=request.getParameter("content");
			//获取topicid号
			int topicid=Integer.parseInt(request.getParameter("topic_id")) ;
			String to_content=request.getParameter("to_content");
			String totime=request.getParameter("totime");
			String time=getTime();
					
		
			replyDBC reply=new replyDBC();
			reply.setContent(content);
			reply.setFrom_uid(from_uid);
			reply.setReplyid(replyid);
			reply.setTopicid(topicid);
			reply.setTo_uid(to_uid);
			reply.setTime(time);
			reply.setTo_content(to_content);
			reply.setTotime(totime);
			
			//查找图片并且插入
			findimgeimpl img=new findimgeimpl();
			String Imge=img.finduserIMg();	
			reply.setImgeurl(Imge);
			//插入数据库
			Replyimpl replyimpl=new Replyimpl();		
			if(replyimpl.Insert(reply))
			{
					//成功后更新数据评论数据
					Msg msg=new Msg();
					int num=msg.Findtitlenum(topicid);
					msg.updatetitilenum(topicid, num);				

					List<replyDBC>r=new ArrayList<replyDBC>();
					String time1=totime;
					String id=request.getParameter("topic_id");
					Msg m=new Msg();
					r=m.findReply(replyid, time1);
					
					
					try {
					
		
								List<replyDBC>r1=new ArrayList<replyDBC>();
								for(int i=0;i<r.size();i++)
								{
									r1.add(r.get(i));
								}
						 
							JSONArray ja = JSONArray.fromObject(r1);
							out.print(ja);
							out.flush();
							out.close();
						
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
			}
	
	
		}
			

	}
	private String getTime()
	{
		SimpleDateFormat date=new SimpleDateFormat("yyyy-MM-dd HH:mm");
		return date.format(new Date());
		
		
	}

}
