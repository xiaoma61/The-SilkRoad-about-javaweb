package cn.theslikroad.tribune.DAO;

public interface Collection {
	//验证是否有表
	boolean istable(String name);
	boolean insert_total_table(String name);
	boolean inserttable(String name);
	boolean createtable(String name);
	boolean deletetable(int titleid,String name);
	

}
