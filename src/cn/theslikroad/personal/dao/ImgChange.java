package cn.theslikroad.personal.dao;

public interface ImgChange {
	boolean updateUser(String filepath);//改变用户的数据
	boolean change(String imgStr,String imgFilePath);//实现imge解析数据并且插入数据库
	boolean GenerateImage(String imgStr,String imgFilePath);


}
