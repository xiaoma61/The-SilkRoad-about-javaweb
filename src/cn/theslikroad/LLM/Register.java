package cn.theslikroad.LLM;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import cn.theslikroad.dao.factory.DAOfactory;;
public class Register {
	private String username;
	private String password;
	private String repassword;
	private String phone;
	private String e_mail;
	private String re_e_mail;
	private Map<String,String>error=null;
	
	
	public Register()
	{
		username="";
		password="";
		phone="";
		repassword="";
		e_mail="";
		re_e_mail="";		
		
	}
	
	public void setUsername(String username)
	{
		this.username=username;
	}
	
	public void setPassword(String password)
	{
		this.password=password;
	}
	public void setRepassword(String repassword)
	{
		this.repassword=repassword;
	}
	public void setPhone(String phone)
	{
		this.phone=phone;
	}
	public void setE_mail(String e_mail)
	{
		this.e_mail=e_mail;
	}
	public void setRe_e_mail(String re_e_mail)
	{
		this.re_e_mail=re_e_mail;
	}
	
	
	
	public String getUsername()
	{
		return this.username;
	}
	public String getPassword()
	{
		return this.password;
	}
	public String getRepassword()
	{
		return this.repassword;
	}

	public String getPhone()
	{
		return this.phone;
	}
	public String getE_mail()
	{
		return this.e_mail;
	}
	public String getRe_e_mail()
	{
		return this.re_e_mail;
	}

	
	
	public boolean isValidate() throws Exception
	{
		
		boolean flag=true;	
		error=new HashMap<String,String>();
		if(this.username.length()==0)
		{
			this.username="";
			flag=false;
			error.put("errname", "用户名不能为空");
			
		}
		if(!this.password.matches("\\w{6,15}")){
			this.password="";
			flag=false;
			error.put("errpass", "输入密码必须为6-15位的数字");
			
		}
		if(!this.repassword.equals(this.password))
		{
			this.repassword="";
			flag=false;
			error.put("errrepass", "密码错误");
		}
		String regExp="^[1][3,4,5,7,8][0-9]{9}$";
		Pattern p=Pattern.compile(regExp);
		Matcher m=p.matcher(phone);
		if(!m.matches())
		{
			this.phone="";
			flag=false;
			error.put("errphone", "电话号码必须为11位");
			
		}
		if(!this.e_mail.matches("\\w+@\\w+\\w.\\w+\\.?\\w*")){
			this.e_mail="";
			flag=false;
			error.put("erre_mail", "邮箱不合法");			
		}
		if(!e_mail.equals(re_e_mail)){
			this.re_e_mail="";
			flag=false;
			error.put("errre_e_mail", "邮箱不正确");
			
		}
	
		return flag;
		
	}
	
	public String getErrorMsg(String key)
	{
		String value=error.get(key);	
		return value==null?"":value;
		
	}
	
}
