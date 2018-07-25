package cn.theslikroad.literature;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

import cn.theslikroad.dbc.DatabaseConnection;
import cn.theslikroad.literature.data.LiteractureData;
/*import cn.theslikroad.literature.impl.literatureimpl;*/
public class ListeracturePage {
	//ʹ��JavaBean��ȡ����
	//ҳ����ת����ʶ��id�Ű�������ڻ��������
	//������ʵ��˼·ʹ��ajax�����ݿ⴫�����ַ��������ڿ���ʵ�ֲ��ҵĹ���
	public List<LiteractureData> Getpage() throws Exception
	{
		//���û����еõ��������ݲ���
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
			
			//����ÿһ�����������Ϣ
		}
		
		/* String name=null;
		 checkUser user=new checkUser();
		 name=user.Getname();*/
		//��ʼѰ��
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
