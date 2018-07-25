package cn.theslikroad.personal.dao;

import java.util.List;

import cn.theslikroad.LLM.BGImgecollet;
import cn.theslikroad.tribune.Colletiondata;
import cn.theslikroad.tribune.Talkingdata;
import cn.theslikroad.tribune.browerdata;

public interface FindMsgdao {
	String findBg();//用户壁纸
	List<Colletiondata> findcollect_tribune();//话题收藏
	List<browerdata> talk();//话题浏览
	List<Talkingdata>talking();//对话
	List<BGImgecollet>FindBgImge();//收藏的壁纸
}
