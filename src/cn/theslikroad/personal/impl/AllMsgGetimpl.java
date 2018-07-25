package cn.theslikroad.personal.impl;

import java.util.List;

import cn.theslikroad.LLM.BGImgecollet;
import cn.theslikroad.personal.dao.AllMsg;
import cn.theslikroad.personal.dbc.personaldbc;
import cn.theslikroad.tribune.Colletiondata;
import cn.theslikroad.tribune.Talkingdata;
import cn.theslikroad.tribune.browerdata;

public class AllMsgGetimpl implements AllMsg{

	@Override
	public personaldbc AllMsgGet() {
		// TODO Auto-generated method stub
		personaldbc dbc=new personaldbc();
		FindUserMsg msg=new FindUserMsg();
		
		String bg=msg.findBg();
		List<Colletiondata>colltridata=msg.findcollect_tribune();
		List<browerdata>browtalk=msg.talk();
		List<Talkingdata>talking=msg.talking();
		List<BGImgecollet> BgImge=msg.FindBgImge();
		//实现截取 操作
		if(bg==null||bg=="")
		{
			bg=getSubStr("F:\\myeclipse\\.metadata\\.me_tcat85\\webapps\\TheSlikRoad\\UserBGImage/1528643222243.png", 1);
		}
		else
		{
			bg=getSubStr(bg, 1);
		}
	
	
		
		dbc.setBg(bg);
		dbc.setBgImge(BgImge);
		dbc.setBrowtalk(browtalk);
		dbc.setColltridata(colltridata);
		dbc.setTalking(talking);
		findimgeimpl impl=new findimgeimpl();
		String img=impl.finduserIMg();
		img=getSubStr(img, 1);
		dbc.setImg(img);
		
		return dbc;
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
