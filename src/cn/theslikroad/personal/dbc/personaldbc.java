package cn.theslikroad.personal.dbc;

import java.util.List;

import cn.theslikroad.LLM.BGImgecollet;
import cn.theslikroad.tribune.Colletiondata;
import cn.theslikroad.tribune.Talkingdata;
import cn.theslikroad.tribune.browerdata;

public class personaldbc {
	String Bg;
	String img;
	List<Colletiondata>colltridata;
	List<browerdata>browtalk;
	List<Talkingdata>talking;
	List<BGImgecollet> BgImge;
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getBg() {
		return Bg;
	}
	public void setBg(String bg) {
		Bg = bg;
	}
	public List<Colletiondata> getColltridata() {
		return colltridata;
	}
	public void setColltridata(List<Colletiondata> colltridata) {
		this.colltridata = colltridata;
	}
	public List<browerdata> getBrowtalk() {
		return browtalk;
	}
	public void setBrowtalk(List<browerdata> browtalk) {
		this.browtalk = browtalk;
	}
	public List<Talkingdata> getTalking() {
		return talking;
	}
	public void setTalking(List<Talkingdata> talking) {
		this.talking = talking;
	}
	public List<BGImgecollet> getBgImge() {
		return BgImge;
	}
	public void setBgImge(List<BGImgecollet> bgImge) {
		BgImge = bgImge;
	}

	
}
