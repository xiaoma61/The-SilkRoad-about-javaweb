package cn.theslikroad.dao.factory;

import cn.theslikroad.dao.IUsrMsg;
import cn.theslikroad.dao.proxy.*;
import cn.theslikeroad.finduser.userandpassword;
import cn.theslikeroad.User.PasswordandUser;
public class DAOfactory {

	public static IUsrMsg getInstance()throws Exception
	{
		return new UsrMsgProxy();
		
	}
	public static PasswordandUser getIUserPasswordInstance()throws Exception
	{
		return new userandpassword();
		
	}
	
}
