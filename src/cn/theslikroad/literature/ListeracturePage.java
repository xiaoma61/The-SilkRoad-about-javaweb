package cn.theslikroad.literature;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

import cn.theslikroad.dbc.DatabaseConnection;
import cn.theslikroad.literature.data.LiteractureData;
/*import cn.theslikroad.literature.impl.literatureimpl;*/
public class ListeracturePage {
	//使用JavaBean获取内容
	//页面跳转采用识别id号吧添加日期或者随机数
	//下拉框实现思路使用ajax向数据库传递数字返回数字在框内实现查找的功能
	public List<LiteractureData> Getpage() throws Exception
	{
		//从用户表单中得到表单表将数据插入
		 DatabaseConnection conn=new  DatabaseConnection();
		 PreparedStatement pstm;
		 String sql="select *from LITERATUREDATA";
		 ResultSet rs;
		 pstm=conn.getConnection().prepareStatement(sql);
		 rs=pstm.executeQuery();
		
		 
		List<String >list=new ArrayList<String>();
		List<LiteractureData>datalist=new ArrayList<LiteractureData>();
		while(rs.next())
		{
			
			
			 LiteractureData data=new LiteractureData();
			 data.setTitle(rs.getString(1));
			 data.setWriter(rs.getString(2));
			 data.setWriterword(rs.getString(3));
			 data.setArticle(rs.getString(4));
			 data.setFileroad(rs.getString(5));
			 data.setId(rs.getInt("id"));
			 datalist.add(data);
			/*String name=rs.getString(1);
			list.add(name);*/
			
			//查找每一个表下面的信息
		}
		
		/* String name=null;
		 checkUser user=new checkUser();
		 name=user.Getname();*/
		//开始寻找
		/*literatureimpl impl=new literatureimpl();
		for(int i=0;i<list.size();i++)
		{
			String name=list.get(i);
			List<LiteractureData>data=new ArrayList<LiteractureData>();
			data=impl.dofind(name);
			datalist.addAll(data);
			
			
		}*/
		 	
		return datalist;
		
	}
	
	

}
