package cn.theslikroad.background.dao;

public interface BgCollection {
	boolean doCreate(String url);
	String find(String id);
	boolean doDelete(String url);

}
