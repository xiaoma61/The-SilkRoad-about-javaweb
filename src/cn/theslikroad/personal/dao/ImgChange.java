package cn.theslikroad.personal.dao;

public interface ImgChange {
	boolean updateUser(String filepath);//�ı��û�������
	boolean change(String imgStr,String imgFilePath);//ʵ��imge�������ݲ��Ҳ������ݿ�
	boolean GenerateImage(String imgStr,String imgFilePath);


}
