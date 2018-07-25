package cn.theslikroad.tribune;

public class Talkingdata {
	//查找表格中如果评论中有他的id号，再看看另一个有没有他id号，如果没有记录如果有不记录
			//查找另一个记录，如果有他的名字，记录
			//用户，对话人，时间，话题id，
	String from_uid;
	String to_uid;
	int topicid;
	String time;
	String content;
	String title;
	int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getTo_uid() {
		return to_uid;
	}
	public void setTo_uid(String to_uid) {
		this.to_uid = to_uid;
	}
	public int getTopicid() {
		return topicid;
	}
	public void setTopicid(int topicid) {
		this.topicid = topicid;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	

}
