package cn.theslikroad.personal.dao;

import java.util.List;

import cn.theslikroad.LLM.BGImgecollet;
import cn.theslikroad.tribune.Colletiondata;
import cn.theslikroad.tribune.Talkingdata;
import cn.theslikroad.tribune.browerdata;

public interface FindMsgdao {
	String findBg();//�û���ֽ
	List<Colletiondata> findcollect_tribune();//�����ղ�
	List<browerdata> talk();//�������
	List<Talkingdata>talking();//�Ի�
	List<BGImgecollet>FindBgImge();//�ղصı�ֽ
}
