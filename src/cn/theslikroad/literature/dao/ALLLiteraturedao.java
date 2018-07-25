package cn.theslikroad.literature.dao;

import java.util.List;

import cn.theslikroad.literature.data.LiteractureData;

public interface ALLLiteraturedao {
	List<LiteractureData>dofind(String name);
	boolean dodelete(int id);
	boolean doALLdelete(int id);
}
