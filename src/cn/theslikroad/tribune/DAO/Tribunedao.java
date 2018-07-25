package cn.theslikroad.tribune.DAO;

import java.util.List;

import cn.theslikroad.tribune.UserMsg;
import cn.theslikroad.tribune.commentDBC;
import cn.theslikroad.tribune.replyDBC;

public interface Tribunedao {
	public UserMsg findTitle(int title) ;
	public List<commentDBC> findall(int title);
	List<replyDBC> findReply( String id,String time);
	public int Findtitlenum(int title);
	public boolean updatetitilenum(int title,int num);//实现评论人数的更新

}
