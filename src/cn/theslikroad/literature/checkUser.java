package cn.theslikroad.literature;

import cn.theslikroad.LLM.UserName;

public class checkUser {
	public String Getname()
	{
		//µÃµ½Ãû×Ö
		String name=null;
		if(UserName.username==""||UserName.username==null)
		{
			name="vistor";
		}
		else
		{
			name=UserName.username;
		} 
		 StringBuffer buf=new StringBuffer();
		 buf.append(name);
		 buf.append("filetable");
		 String filename=buf.toString();
		 return filename;
		
	}
}
