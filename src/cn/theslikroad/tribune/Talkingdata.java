package cn.theslikroad.tribune;

public class Talkingdata {
	//���ұ�������������������id�ţ��ٿ�����һ����û����id�ţ����û�м�¼����в���¼
			//������һ����¼��������������֣���¼
			//�û����Ի��ˣ�ʱ�䣬����id��
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
