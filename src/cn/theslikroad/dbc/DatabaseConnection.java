package cn.theslikroad.dbc;
import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
	private static final  String DBDRIVER ="oracle.jdbc.driver.OracleDriver";
	private static final  String DBURL="jdbc:oracle:thin:@localhost:1521:orcl";
	private static final  String DBUSER="scott";
	private static final  String DBPASS="1314";
	private Connection conn=null;
	
	public DatabaseConnection()throws Exception{
		try{
			
			Class.forName(DBDRIVER);
			conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
			
		}catch(Exception e)
		{
			throw e;
		}
		
		
	}
	public Connection getConnection()
	{
		return this.conn;
	}
	public void close()throws Exception
	{
		if(this.conn!=null)
		{
			try{
				conn.close();
			}catch(Exception e)
			{
				throw e;
			}
		}
		
	
	}
	

}
