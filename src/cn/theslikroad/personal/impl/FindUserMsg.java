package cn.theslikroad.personal.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.theslikroad.LLM.BGImgecollet;
import cn.theslikroad.LLM.UserName;
import cn.theslikroad.dbc.DatabaseConnection;
import cn.theslikroad.literature.checkUser;
import cn.theslikroad.personal.dao.BGImg;
import cn.theslikroad.personal.dao.FindMsgdao;
import cn.theslikroad.tribune.Colletiondata;
import cn.theslikroad.tribune.Talkingdata;
import cn.theslikroad.tribune.browerdata;
import cn.theslikroad.tribune.impl.FindTitle;


public class FindUserMsg implements FindMsgdao, BGImg{

	@Override
	public String findBg() {//壁纸
		// TODO Auto-generated method stub
		String sql="select BGIMAGE from USRMSG where username=?";
		String name=UserName.username;
		String bgurl = null;
		 DatabaseConnection conn = null;
		 try {
			conn = new  DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 PreparedStatement pstm = null;
		 ResultSet rs = null;
		 try {
			pstm=conn.getConnection().prepareStatement(sql);
			pstm.setString(1, name);
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
				if(rs.next())
				{
					bgurl=rs.getString(1);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				pstm.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return bgurl;
	}

	@Override
	public List<Colletiondata> findcollect_tribune() {//论坛收藏话题
		// TODO Auto-generated method stub
		
		 List<Colletiondata>datalist=new ArrayList<Colletiondata>();
		 checkUser user=new checkUser();
		 String name=user.Getname();
		 String tablename=name+"colletion";//表的名字为用户名+tribune
		 String sql="select titleid,time from "+ tablename;
				DatabaseConnection conn = null;
				 try {
					conn = new  DatabaseConnection();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				 PreparedStatement pstm = null;
				 ResultSet rs = null;
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
							Colletiondata data=new  Colletiondata();
							data.setTitleid(rs.getInt(1));
							//查找标题
							FindTitle mtitle=new FindTitle();
							String title=mtitle.findtitle(data.getTitleid());
							data.setTitle(title);
							data.setTime(rs.getString(2));
							datalist.add(data);	
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					try {
						pstm.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					try {
						conn.close();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				return datalist;
	}

	@Override
	public List<browerdata> talk() {//浏览的对话
		// TODO Auto-generated method stub
		List<browerdata> datalist=new ArrayList<browerdata>();
		checkUser user=new checkUser();
		String name=user.Getname();
		String tablename=name+"tribune";//表的名字为用户名+tribune
		String sql="select titleid,time from "+tablename;
		DatabaseConnection conn = null;
		 try {
			conn = new  DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 PreparedStatement pstm = null;
		 ResultSet rs = null;
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
					browerdata data=new  browerdata();
					data.setTitleid(rs.getInt(1));
					//查找标题
					FindTitle mtitle=new FindTitle();
					String title=mtitle.findtitle(data.getTitleid());
					data.setTitle(title);
					data.setTime(rs.getString(2));
					datalist.add(data);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				pstm.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return datalist;
	}


	@Override
	public List<Talkingdata> talking() {//对话过程
		// TODO Auto-generated method stub
		//查找表格中如果评论中有他的id号，再看看另一个有没有他id号，如果没有记录如果有不记录
		//查找另一个记录，如果有他的名字，记录
		//用户，对话人，时间，话题id，
		//如何实现浏览后删除该记录
		//查找的时候找标记号 REPLYID ,TO_UID
		String name=UserName.username;
		List<Talkingdata>datalist=new ArrayList<Talkingdata>();
		String sql="select time,CONTENT, FROM_UID , TOPICID, ID from REPLYRECORDS  where to_uid=?";
		DatabaseConnection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = new  DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			
			pstm=conn.getConnection().prepareStatement(sql);
			pstm.setString(1, name);
			rs=pstm.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			while(rs.next())
			{
				Talkingdata data=new Talkingdata();
				data.setTime(rs.getString(1));
				data.setContent(rs.getString(2));
				data.setFrom_uid(rs.getString(3));
				data.setTopicid(rs.getInt(4));
				FindTitle mtitle=new FindTitle();
				String title=mtitle.findtitle(data.getTopicid());
				data.setTitle(title);
				data.setId(rs.getInt(5));
				datalist.add(data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			pstm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<Talkingdata>dataadd= talking1() ;
		datalist.addAll(dataadd);
		return datalist;
		
	}
	private List<Talkingdata> talking1() 
	{
		String name=UserName.username;
		List<Talkingdata>datalist=new ArrayList<Talkingdata>();
		String sql="select time,CONTENT, FROM_UID , TOPICID , ID from REPLYRECORDS  where REPLYID=?";
		DatabaseConnection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = new  DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			
			pstm=conn.getConnection().prepareStatement(sql);
			pstm.setString(1, name);
			rs=pstm.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			while(rs.next())
			{
				Talkingdata data=new Talkingdata();
				data.setTime(rs.getString(1));
				data.setContent(rs.getString(2));
				data.setFrom_uid(rs.getString(3));
				data.setTopicid(rs.getInt(4));
				FindTitle mtitle=new FindTitle();
				String title=mtitle.findtitle(data.getTopicid());
				data.setTitle(title);
				data.setId(rs.getInt(5));
				datalist.add(data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			pstm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return datalist;
	}
	@Override
	public  List<BGImgecollet> FindBgImge() {//用户收集 背景图片
		// TODO Auto-generated method stub
		List<BGImgecollet>BGImge=new ArrayList<BGImgecollet>();
		String name=UserName.username;
		String sql="select url,id  from "+name;
		DatabaseConnection conn = null;
		PreparedStatement pstm = null;
		 ResultSet rs = null;
		try {
			conn = new  DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			pstm=conn.getConnection().prepareStatement(sql);
			rs=pstm.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			while(rs.next())
			{
				BGImgecollet bg=new BGImgecollet();
				bg.setUrl(rs.getString(1));
				bg.setId(rs.getInt(2));
				BGImge.add(bg);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			pstm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return BGImge;
	}

	
}
