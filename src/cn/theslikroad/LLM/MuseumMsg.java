package cn.theslikroad.LLM;


import java.util.ArrayList;
import java.util.List;

public class MuseumMsg {
	String MainImage;
	String Name;
	String Introduce;
	List<String>url;
	List<String> Comments;
	List<String> address;
	public MuseumMsg()
	{
		url=new ArrayList<String>();
		Comments=new ArrayList<String>();
		address=new ArrayList<String>();
	}
	public String getMainImage() {
		return MainImage;
	}
	public void setMainImage(String mainImage) {
		MainImage = mainImage;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getIntroduce() {
		return Introduce;
	}
	public void setIntroduce(String introduce) {
		Introduce = introduce;
	}
	public List<String> getUrl() {
		return url;
	}
	public void setUrl(List<String> url) {
		this.url = url;
	}
	public List<String> getComments() {
		return Comments;
	}
	public void setComments(List<String> comments) {
		Comments = comments;
	}
	public List<String> getAddress() {
		return address;
	}
	public void setAddress(List<String> address) {
		this.address = address;
	}
	

}


