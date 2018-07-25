package cn.theslikroad.GetFile;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class ChangeName {
	public String CreateName()//时间+系统日期
	{
		StringBuffer buf=new StringBuffer();
		String date=Getdate();
		buf.append(date);
		Random r=new Random();
		for(int i=0;i<4;i++)
		{
			buf.append(r.nextInt(10));
			
		}
		return buf.toString();
		
	}
	public String Getdate()
	{
		SimpleDateFormat data=new SimpleDateFormat("yyyyMMddHHmmssSS");
		return data.format(new Date());
		
	}

}
