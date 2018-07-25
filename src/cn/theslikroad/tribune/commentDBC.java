package cn.theslikroad.tribune;

import java.util.ArrayList;
import java.util.List;

public class commentDBC {
	int id;
	int topic_id;
	String content;
	String from_uid;
	String time;
	String imgurl;
	int replysize;
	
/*	List<replyDBC> reply;*/
	/*public commentDBC()
	{
		reply=new ArrayList<replyDBC>();
	}*/
	
	

	/*public List<replyDBC> getReply() {
		return reply;
	}*/



	/*public void setReply(List<replyDBC> reply) {
		this.reply = reply;
	}
*/


	public int getReplysize() {
		return replysize;
	}
	public void setReplysize(int replysize) {
		this.replysize = replysize;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getTopic_id() {
		return topic_id;
	}
	public void setTopic_id(int topic_id) {
		this.topic_id = topic_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFrom_uid() {
		return from_uid;
	}
	public void setFrom_uid(String from_uid) {
		this.from_uid = from_uid;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	

}
