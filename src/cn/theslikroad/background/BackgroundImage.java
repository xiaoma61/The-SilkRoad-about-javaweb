package cn.theslikroad.background;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.theslikroad.LLM.BgImage;
import cn.theslikroad.dbc.DatabaseConnection;
import net.sf.json.JSONArray;
public class BackgroundImage extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		doPost(request,response);
		
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		List<BgImage>bgImagelist = new ArrayList<BgImage>();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String page=request.getParameter("page");

		
		int num=Integer.parseInt(page);
		
		
		
		try {
			
			bgImagelist=GetImage();
			if(num>=bgImagelist.size())
			{
				out.print("false");
			}
			else
			{
				String url=bgImagelist.get(num).getUrl();
			
				List<BgImage>bgImage = new ArrayList<BgImage>();
				
				if(num==0)
				{
					for(int i=num;i<bgImagelist.size()&&i<(num+9);i++)
					{
						bgImage.add(bgImagelist.get(i));
					}
				}else
				{
					for(int i=num;i<bgImagelist.size()&&i<(num+10);i++)
					{
						bgImage.add(bgImagelist.get(i));
					}
				}
				JSONArray ja = JSONArray.fromObject(bgImage);
				out.print(ja);
				out.flush();
				out.close();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/*int id=bgImagelist.get(num).getId();*/
		
		
	}
	
	public List<BgImage>GetImage() throws Exception
	{
		 DatabaseConnection conn=null;
		 PreparedStatement pstm=null;
		 ResultSet rs=null;
		 List<BgImage>bgImagelist=new ArrayList<BgImage>();
		 conn=new DatabaseConnection();
		 String sql="select *from BGIMAGE";
		 pstm=conn.getConnection().prepareStatement(sql);
		 rs=pstm.executeQuery();
		 while(rs.next())
		 {
			 String url=rs.getString(1);
			 int id=rs.getInt(2);
			 BgImage bgimage=new BgImage();
			 bgimage.setUrl(url);
			 bgimage.setId(id);
			 bgImagelist.add(bgimage);
		 }
		/* pstm.close();
		 conn.close();*/
		 
		return bgImagelist;
		
	}
	

}
