package cn.theslikroad.tribune.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.theslikroad.dbc.DatabaseConnection;
import cn.theslikroad.tribune.replyDBC;
import cn.theslikroad.tribune.DAO.Replydao;

public class Replyimpl implements Replydao{

	@Override
	public boolean Insert(replyDBC reply) {
		// TODO Auto-generated method stub
		 boolean flag=false;
		 PreparedStatement pstm= null;
		 ResultSet rs= null;
		 DatabaseConnection conn = null;
		 System.out.println("reply.getReplyid()+ "+reply.getReplyid());
		 System.out.println("reply.getContent()+ "+reply.getContent());
		 System.out.println("reply.getFrom_uid()+ "+reply.getFrom_uid());
		 System.out.println("reply.getTopicid()+ "+reply.getTopicid());
		 System.out.println("reply.getTime()+ "+reply.getTime());
		 try {
			conn=new DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 String sql="insert into REPLY (ID,REPLYID,CONTENT,FROM_UID,TOPICID,TIME,IMGEURL,TO_CONTENT,TO_TIME,to_uid)values(REPLYID.nextval,?,?,?,?,?,?,?,?,?)";
		 try {
			pstm=conn.getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm.setString(1, reply.getReplyid());
			pstm.setString(2, reply.getContent());
			pstm.setString(3, reply.getFrom_uid());
			pstm.setInt(4, reply.getTopicid());
			pstm.setString(5, reply.getTime());
			pstm.setString(6, reply.getImgeurl());
			pstm.setString(7, reply.getTo_content());
			pstm.setString(8, reply.getTotime());
			pstm.setString(9, reply.getTo_uid());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 try {
			rs=pstm.executeQuery();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 try {
			if(rs.next())flag=true;
			 try {
				pstm.close();
				conn.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 InsertREPLYRECORDS( reply);
		return flag;
	}
	private boolean InsertREPLYRECORDS(replyDBC reply) {
		// TODO Auto-generated method stub
		 boolean flag=false;
		 PreparedStatement pstm= null;
		 ResultSet rs= null;
		 DatabaseConnection conn = null;
		 try {
			conn=new DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 String sql="insert into REPLYRECORDS (ID,REPLYID,CONTENT,FROM_UID,TOPICID,TIME,IMGEURL,TO_CONTENT,TO_TIME,to_uid)values(REPLYID.nextval,?,?,?,?,?,?,?,?,?)";
		 try {
			pstm=conn.getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm.setString(1, reply.getReplyid());
			pstm.setString(2, reply.getContent());
			pstm.setString(3, reply.getFrom_uid());
			pstm.setInt(4, reply.getTopicid());
			pstm.setString(5, reply.getTime());
			pstm.setString(6, reply.getImgeurl());
			pstm.setString(7, reply.getTo_content());
			pstm.setString(8, reply.getTotime());
			pstm.setString(9, reply.getTo_uid());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 try {
			rs=pstm.executeQuery();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 try {
			if(rs.next())flag=true;
			 try {
				pstm.close();
				conn.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}


	@Override
	public boolean update(replyDBC reply,String to_uid) {
		// TODO Auto-generated method stub
		 boolean flag=false;
		 PreparedStatement pstm= null;
		 ResultSet rs= null;
		 DatabaseConnection conn = null;
		 try {
			conn=new DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 String sql="update  REPLY set REPLYID=?, CONTENT=?,FROM_UID=?, TOPICID=?, TIME=?   IMGEURL=?   TO_CONTENT=? TO_TIME=? where TO_UID=?";
		 try {
			pstm=conn.getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm.setString(1, reply.getReplyid());
			pstm.setString(2, reply.getContent());
			pstm.setString(3, reply.getFrom_uid());
			pstm.setInt(4, reply.getTopicid());
			pstm.setString(5, reply.getTime());
			pstm.setString(6, to_uid);
			pstm.setString(7, reply.getTo_content());
			pstm.setString(8, reply.getTotime());
			pstm.setString(9, reply.getImgeurl());
			conn.getConnection().commit();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			rs=pstm.executeQuery();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 try {
			if(rs.next())
				{
					flag=true;
					
				}
			 try {
				conn.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		updateREPLYRECORDS(reply,to_uid);
		return flag;
	}
	private boolean updateREPLYRECORDS(replyDBC reply,String to_uid) {
		// TODO Auto-generated method stub
		 boolean flag=false;
		 PreparedStatement pstm= null;
		 ResultSet rs= null;
		 DatabaseConnection conn = null;
		 try {
			conn=new DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 String sql="update  REPLYRECORDS set REPLYID=?, CONTENT=?,FROM_UID=?, TOPICID=?, TIME=?   IMGEURL=?   TO_CONTENT=? TO_TIME=? where TO_UID=?";
		 try {
			pstm=conn.getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm.setString(1, reply.getReplyid());
			pstm.setString(2, reply.getContent());
			pstm.setString(3, reply.getFrom_uid());
			pstm.setInt(4, reply.getTopicid());
			pstm.setString(5, reply.getTime());
			pstm.setString(6, to_uid);
			pstm.setString(7, reply.getTo_content());
			pstm.setString(8, reply.getTotime());
			pstm.setString(9, reply.getImgeurl());
			conn.getConnection().commit();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			rs=pstm.executeQuery();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 try {
			if(rs.next())
				{
					flag=true;
					
				}
			 try {
				conn.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	@Override
	public boolean Insertreply(replyDBC reply) {
		// TODO Auto-generated method stub
		 boolean flag=false;
		 PreparedStatement pstm= null;
		 ResultSet rs= null;
		 DatabaseConnection conn = null;
		 try {
			conn=new DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 String sql="insert into REPLY  (to_uid,id)values(?,REPLYID.nextval)";
		 try {
			pstm=conn.getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm.setString(1, reply.getTo_uid());
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			if(pstm.executeUpdate()>0)flag=true;
			 try {
				pstm.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 try {
			rs=pstm.executeQuery();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 try {
			if(rs.next())flag=true;
			 try {
				conn.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 InsertreplyREPLYRECORDS(reply);//±¸ÓÃ±í
		return flag;
	}
	public boolean InsertreplyREPLYRECORDS(replyDBC reply) {
		// TODO Auto-generated method stub
		 boolean flag=false;
		 PreparedStatement pstm= null;
		 ResultSet rs= null;
		 DatabaseConnection conn = null;
		 try {
			conn=new DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 String sql="insert into REPLYRECORDS  (to_uid,id)values(?,REPLYID.nextval)";
		 try {
			pstm=conn.getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			pstm.setString(1, reply.getTo_uid());
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			if(pstm.executeUpdate()>0)flag=true;
			 try {
				pstm.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 try {
			rs=pstm.executeQuery();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 try {
			if(rs.next())flag=true;
			 try {
				conn.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
		
}


