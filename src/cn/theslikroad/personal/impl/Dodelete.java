package cn.theslikroad.personal.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import cn.theslikroad.LLM.UserName;
import cn.theslikroad.dbc.DatabaseConnection;
import cn.theslikroad.literature.checkUser;
import cn.theslikroad.personal.dao.Delete;



public class Dodelete implements Delete{

	@Override
	public boolean doDelete_Bg(int id) {
		// TODO Auto-generated method stub
		String name=UserName.username;
		String sql="delete  from "+name+" where id=?";
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
			pstm.setInt(1, id);
			rs=pstm.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(rs.next())
			{
				return true;
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
		
		
		return false;
	}

	@Override
	public boolean doDelete_Collect(int titleid) {
		// TODO Auto-generated method stub

		 checkUser user=new checkUser();
		 String name=user.Getname();
		 String tablename=name+"colletion";//表的名字为用户名+tribune
		 String sql="delete  from "+tablename+" where titleid=?";
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
					pstm.setInt(1, titleid);
			
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
							return true;
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
		return false;
	}

	@Override
	public boolean doDelete_Brower(int titleid) {
		// TODO Auto-generated method stub

		checkUser user=new checkUser();
		String name=user.Getname();
		String tablename=name+"tribune";//表的名字为用户名+tribune
		String sql="delete from "+tablename +" where titleid=?";
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
			pstm.setInt(1, titleid);
	
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
					return true;
					
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
		return false;
	}

	@Override
	public boolean doDelete_Talking(int titleid) {
		// TODO Auto-generated method stub
		//不能直接删除浏览记录 ，复制另一个表格
		//不能删除话题
		String sql="delete  from REPLYRECORDS  where ID=?";
		DatabaseConnection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int delNum = 0;
		
		try {
			conn = new  DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			
			pstm=conn.getConnection().prepareStatement(sql);
			pstm.setInt(1, titleid);
			delNum = pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(delNum!=0)
			{
				pstm.close();
				conn.close();
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		try {
			pstm.close();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

}
