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
	public String findBg() {//��ֽ
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
	public List<Colletiondata> findcollect_tribune() {//��̳�ղػ���
		// TODO Auto-generated method stub
		
		 List<Colletiondata>datalist=new ArrayList<Colletiondata>();
		 checkUser user=new checkUser();
		 String name=user.Getname();
		 String tablename=name+"colletion";//�������Ϊ�û���+tribune
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
							//���ұ���
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
	public List<browerdata> talk() {//����ĶԻ�
		// TODO Auto-generated method stub
		List<browerdata> datalist=new ArrayList<browerdata>();
		checkUser user=new checkUser();
		String name=user.Getname();
		String tablename=name+"tribune";//�������Ϊ�û���+tribune
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
					//���ұ���
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
	public List<Talkingdata> talking() {//�Ի�����
		// TODO Auto-generated method stub
		//���ұ�������������������id�ţ��ٿ�����һ����û����id�ţ����û�м�¼����в���¼
		//������һ����¼��������������֣���¼
		//�û����Ի��ˣ�ʱ�䣬����id��
		//���ʵ�������ɾ���ü�¼
		//���ҵ�ʱ���ұ�Ǻ� REPLYID ,TO_UID
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
	public  List<BGImgecollet> FindBgImge() {//�û��ռ� ����ͼƬ
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
