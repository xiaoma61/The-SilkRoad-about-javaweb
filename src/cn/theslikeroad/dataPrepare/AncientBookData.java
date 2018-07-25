package cn.theslikeroad.dataPrepare;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import cn.theslikroad.LLM.AncientBook;
import cn.theslikroad.dbc.DatabaseConnection;
public class AncientBookData {
	static PreparedStatement pstm;
	static ResultSet rs;
	static DatabaseConnection conn;
	static public List<AncientBook>ancientBook;
	public List<AncientBook> GetAncientBook() throws Exception
	{
		ancientBook=new ArrayList<AncientBook>();

		try {
			conn = new DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql="select *from ANCIENTBOOK";
		try {
			pstm=conn.getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			rs=pstm.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			while(rs.next())
			{
				 AncientBook ancient=new AncientBook();
				 
				 String bookMsg =rs.getString("bookMsg");
				 String bookName=rs.getString("bookName");
			     String bookPath=rs.getString("bookPath");
			     String keyWord =rs.getString("keyWord");
			     ancient.setBookMsg(bookMsg); 
			     ancient.setBookName(bookName);
			     ancient.setBookPath(bookPath);
			     ancient.setKeyWord(keyWord);
			     
				 ancientBook.add(ancient);
				 
				
				
			}
	
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			pstm.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ancientBook;
		
	}

}
