package cn.theslikroad.findImage;
import cn.theslikroad.LLM.TheLandRoadData;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.theslikroad.dbc.DatabaseConnection;

public class FindSearoad extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private DatabaseConnection conn=null;
	private PreparedStatement pstm=null;
	private PreparedStatement pstm1=null;
	public void doGet(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException
	{
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html");
		String Id=req.getParameter("id");
		String name=req.getParameter("name");
		String type=req.getParameter("type");
		System.out.println(name);
		System.out.print(Id);
		System.out.print("type=1 "+type);
		HttpSession session=req.getSession();
		
		try {
			conn=new DatabaseConnection();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
			if(!Id.equals("文物分类"))
			{
			
				List<TheLandRoadData>IDdata =new ArrayList<TheLandRoadData>();		 
				try {
					if(type.equals("2"))
					{
						IDdata=GetID(Id,2);
					}else
					{
						IDdata=GetID(Id,1);
					}
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if(IDdata.size()>0)
				{
					session.setAttribute("ID", IDdata);
					if(type.equals("2"))
					{
						resp.sendRedirect("html/MaritimeSlikRoadSeacherID.jsp");
						
					}else
					{
						resp.sendRedirect("html/LandSlikRoadSeacherID.jsp");
					}
					
				}
				else
				{
					
					resp.sendRedirect("html/Land Slik Road.jsp");
				}
				
				
		
			}
			else if(!(name.equals(null)&&name.equals("")))
			{
				System.out.println(name);
				List<TheLandRoadData>Namedata =new ArrayList<TheLandRoadData>();
				try {
					if(type.equals("2"))
					{
						Namedata=GetName(name,2);
					}
					else
					{
						Namedata=GetName(name,1);
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if(Namedata.size()>0)
				{
					session.setAttribute("mName", Namedata);
					if(type.equals("2"))
					{
						resp.sendRedirect("html/MaritimeSlikRoadSeacherName.jsp");
						
					}else
					{
						resp.sendRedirect("html/LandSlikRoadSeacherName.jsp");
					}
				
					
				}
				else
				{
					resp.sendRedirect("html/Land Slik Road.jsp");
				
				}
				
			
		  }else
		  {
			  resp.sendRedirect("html/Land Slik Road.jsp");
		  }
		
		
		
	}
	public void doPost(HttpServletRequest req,HttpServletResponse resp)
	{
		try {
			doGet(req,resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public List<TheLandRoadData> GetID(String Id,int type) throws Exception
	{
		List<TheLandRoadData>TheLandRoadDataList=new ArrayList<TheLandRoadData>();
		String sql = null;
		if(type==1)
		{
			sql="select imageurl,introduction, id,name  from LANDSILKROAD where id like?";
		}else
		{
			sql="select imageurl,introduction, id,name  from MARITIMESILKROAD where id like?";
		}
		
		pstm=conn.getConnection().prepareStatement(sql);
		pstm.setString(1, "%"+Id+"%");
		ResultSet rs=pstm.executeQuery();
		while(rs.next())
		{
			TheLandRoadData data=new TheLandRoadData();
			String id=rs.getString("id");
			String imageurl=rs.getString("imageurl");
			String introduction =rs.getString("introduction");
			String name=rs.getString("name");
			data.setId(id);
			data.setImageurl(imageurl);
			data.setName(name);
			data.setIntroduction(introduction);
			TheLandRoadDataList.add(data);
		}
	
		return TheLandRoadDataList;
	}
	 List<TheLandRoadData> GetName(String name,int type) throws Exception
	{
		    List<TheLandRoadData>TheLandRoadDataList =new ArrayList<TheLandRoadData>();
		    String sql = null;
			if(type==1)
			{
				sql="select imageurl,introduction, id,name  from LANDSILKROAD where name like?";
			}else
			{
				sql="select imageurl,introduction, id,name  from MARITIMESILKROAD where name like?";
			}
			
			
			pstm1=conn.getConnection().prepareStatement(sql);
			pstm1.setString(1, "%"+name+"%");
			ResultSet rs=pstm1.executeQuery();
			while(rs.next())
			{
				TheLandRoadData data=new TheLandRoadData();
				String id=rs.getString("id");
				String imageurl=rs.getString("imageurl");
				String introduction =rs.getString("introduction");
				String Name=rs.getString("name");
				data.setId(id);
				data.setImageurl(imageurl);
				data.setName(Name);
				data.setIntroduction(introduction);
				TheLandRoadDataList.add(data);
			}
			
			return TheLandRoadDataList;
	}

}
