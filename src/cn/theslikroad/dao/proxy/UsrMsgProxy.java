package cn.theslikroad.dao.proxy;
import java.util.List;

import cn.theslikeroad.dao.impl.UsrMsgDAOImpl;
import cn.theslikroad.LLM.Register;
import cn.theslikroad.dao.IUsrMsg;
import cn.theslikroad.dbc.DatabaseConnection;
public class UsrMsgProxy implements IUsrMsg {

	private DatabaseConnection dbc=null;
	private UsrMsgDAOImpl dao=null;
	public UsrMsgProxy()throws Exception
	{
		dbc=new DatabaseConnection();
		this.dao=new UsrMsgDAOImpl(this.dbc.getConnection());
	}
	
	public boolean doCreate(Register reg)throws Exception
	{
		boolean flag=true;
		try
		{
			
			flag=dao.doCreate(reg);
			
		}catch(Exception e)
		{
			throw e;
		}
		finally
		{
			this.dbc.close();
		}
		
		
		
		return flag;
		
	
	}
	
	public List<Register>findAll(String keyword)throws Exception
	{
		return null;
			
	}
	public Register findById(String username)throws Exception
	{
		Register reg=null;
		try {
			reg=this.dao.findById(username);
			
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
		finally
		{
			this.dbc.close();
		}
		
		
		return reg;
		
	}
}
