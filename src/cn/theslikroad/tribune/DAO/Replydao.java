package cn.theslikroad.tribune.DAO;
import cn.theslikroad.tribune.replyDBC;

public interface Replydao {
	public boolean Insert(replyDBC reply);
	public boolean update(replyDBC reply,String to_uid);
	public boolean Insertreply(replyDBC reply);
}
