package cn.theslikroad.dao;
import  cn.theslikroad.LLM.Register;
import  java.util.List;
public interface IUsrMsg {

	public boolean doCreate(Register reg)throws Exception;
	public List<Register>findAll(String keyword)throws Exception;
	public Register findById(String username)throws Exception;

	
	
}
