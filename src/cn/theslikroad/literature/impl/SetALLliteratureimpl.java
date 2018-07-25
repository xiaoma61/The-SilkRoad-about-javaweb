package cn.theslikroad.literature.impl;

import java.util.ArrayList;
import java.util.List;

import cn.theslikroad.literature.checkUser;
import cn.theslikroad.literature.data.LiteractureData;

public class SetALLliteratureimpl {
	public List<LiteractureData>GetUsrLiterature()
	{
		List<LiteractureData> LiteractureDatas=new ArrayList<LiteractureData>();
		checkUser user=new checkUser();
		String Name=user.Getname();
		literatureimpl impl=new literatureimpl();
		LiteractureDatas=impl.dofind(Name);
		return LiteractureDatas;
		
	}

}
