package console.list;

import java.sql.*;
import java.text.*;
import java.util.*;
import java.util.Date;
import console.common.cmd.BaseCommand;
public class BoardMgr {
	DBConn pool=new DBConn();
	 

//    public BoardMgr() {
//	   try{
//			pool = DBConnectionMgr.getInstance();
//	   }catch(Exception e){
//			System.out.println("Error : 커넥션 가져오기 실패!!");
//		}
//    }

	public Vector getBoardList(String keyField, String keyWord) {
          Connection con = null;
		  Statement stmt = null;
		  ResultSet rs = null;
		  String strQuery = null;
		  Vector boardList = new Vector();
   		  
		  try {	 
			 con = pool.getConnection();
			System.out.println("conn ok..");
			 stmt = con.createStatement();
			 if(keyWord.equals("null") || keyWord.equals("")){
			   strQuery = "select * from board order by pos asc";
			 }else{
			   strQuery = "select * from  pro.board where "
			   +keyField+" like '%" + keyWord +"%' order by pos asc";
			 }
			 System.out.println("strQuery->"+strQuery);
			 rs = stmt.executeQuery(strQuery);
			
			while (rs.next()) {
			BoardBean tempBean = new BoardBean();

			tempBean.setNum(rs.getInt("num"));
			tempBean.setName(rs.getString("name"));
			tempBean.setEmail(rs.getString("email"));
			tempBean.setHomepage(rs.getString("homepage"));
			tempBean.setSubject(rs.getString("subject")); 
			tempBean.setContent(rs.getString("content"));
			tempBean.setPos(rs.getInt("pos"));
			tempBean.setDepth(rs.getInt("depth"));
			tempBean.setRegdate(rs.getString("regdate"));
			tempBean.setPass(rs.getString("pass"));
			tempBean.setCount(rs.getInt("count"));
			boardList.addElement(tempBean);
			
			}
		  }catch(Exception ex){
			 System.out.println("Exception" + ex);
		  }finally{
	        try{
			 rs.close();
			 stmt.close();
	        	con.close();	  
	        }catch(Exception e){}
	        }
		return boardList;
	}

	
	public int  getNum(){
		   Connection con = null;
			  Statement stmt = null;
			  ResultSet rs = null;
			  String strQuery = null;
			  int getnum=0;
			  try {	 
					con = pool.getConnection();
					stmt = con.createStatement();
					
					 
					
					strQuery = "select max(num) as num from board";
					rs = stmt.executeQuery(strQuery);
					if (rs.next()) {
					getnum=rs.getInt("num")+1;
					System.out.println(getnum);
					}
				  }catch(Exception ex){
					  System.out.println(getnum);
					  System.out.println("Exception" + ex);
				  }finally{
			        try{
					 rs.close();
					 stmt.close();
			        	con.close();	  
			        }catch(Exception e){}
			        }
				return getnum;
	}
	
	
	public void insertBoard(BoardBean boardBean) throws Exception{
		  Connection con = null;
		  PreparedStatement pstmt = null;
		  upPos();
		  
		  try {
			
			  con = pool.getConnection();
			con.setAutoCommit(true);
			  String strQuery = "insert into board" 
					+ "(num,name,email,homepage,subject,content,pos,depth,regdate,pass,count,ip)" 
					+ " values(?,?,?,?,?,?,?,?,sysdate,?,?,?)"; 
																			 
			
			       pstmt = con.prepareStatement(strQuery);
					pstmt.setInt(1, getNum());
				    pstmt.setString(2,boardBean.getName());
					pstmt.setString(3,boardBean.getEmail());
					pstmt.setString(4,boardBean.getHomepage());
					pstmt.setString(5,boardBean.getSubject());
					pstmt.setString(6,boardBean.getContent());
					System.out.println("boardBean.getPos() :"+boardBean.getPos());
					pstmt.setInt(7,boardBean.getPos());
					pstmt.setInt(8,boardBean.getDepth());
					pstmt.setString(9,boardBean.getPass());
					pstmt.setInt(10,boardBean.getCount());
					pstmt.setString(11,boardBean.getIp());
					pstmt.executeUpdate();
					
		  }catch(Exception ex) {
				System.out.println("Exception" + ex);
		  }finally{
	          pstmt.close();
			  con.close();	  
		  
		  }
	}

	public void upPos() throws Exception{ 
		  Connection con = null;
		  Statement stmt = null;
		  
		  try{
			con = pool.getConnection();
			stmt=con.createStatement();
			String strQuery="update board set pos=pos+1";
			stmt.executeUpdate(strQuery);
		  }catch(Exception ex) {
				System.out.println("Exception" + ex);
	      }finally{
	        stmt.close();	  
		    con.close();
	      }
	}

	public BoardBean getBoard(int num) throws Exception{ 
		  Connection con = null;
		  PreparedStatement pstmt = null;
		  ResultSet rs = null;
		  upCount(num);
		  BoardBean tempBean = new BoardBean();
		
		  try {
			con = pool.getConnection();
			String strQuery = "select * from board where num = ?";
			pstmt = con.prepareStatement(strQuery);
			pstmt.setInt(1,num);
			rs = pstmt.executeQuery();
		    while (rs.next()) {
			
				tempBean.setNum(rs.getInt("num"));
				tempBean.setName(rs.getString("name"));
				tempBean.setEmail(rs.getString("email"));
				tempBean.setHomepage(rs.getString("homepage"));
				tempBean.setSubject(rs.getString("subject")); 
				tempBean.setContent(rs.getString("content"));
				tempBean.setPos(rs.getInt("pos"));
				tempBean.setDepth(rs.getInt("depth"));
				tempBean.setRegdate(rs.getString("regdate"));
				tempBean.setPass(rs.getString("pass")); 
				tempBean.setCount(rs.getInt("count"));
				tempBean.setIp(rs.getString("ip"));
			}
		  }catch(Exception ex) {
			  System.out.println("Exception" + ex);
		  }finally{
	         rs.close();
	         pstmt.close();
		     con.close();  
		  }
		return tempBean;
	}

	public void upCount(int num) throws Exception{ 
		  Connection con = null;
		  PreparedStatement pstmt = null;
		
		  try{
			con = pool.getConnection();
			String strQuery="update board set count=count+1 where num= ?";
			pstmt = con.prepareStatement(strQuery);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();
		  }catch(Exception ex) {
			System.out.println("Exception" + ex);
	      }finally{
	      pstmt.close();
	      con.close();
		  }
	}

	public void deleteBoard(int num) throws Exception{  
		  Connection con = null;
		  PreparedStatement pstmt = null;
		
		  try{
			con = pool.getConnection();
			String strQuery = "delete from board where num = ?";
			pstmt = con.prepareStatement(strQuery);
			pstmt.setInt(1,num);
			
			
			pstmt.executeUpdate();
		  }catch(Exception ex) {
		      System.out.println("Exception" + ex);
		  }finally{
	     pstmt.close();
	     con.close();
		  }
	}

	public void updateBoard(BoardBean boardBean) throws Exception{
		  Connection con = null;
		  PreparedStatement pstmt = null;
		
	      try{
			con = pool.getConnection();
			String strQuery = "update board set "
							+ "name=?,email=?,homepage=?,subject=?,content=?" 
							+ "where num=?";
					
			pstmt = con.prepareStatement(strQuery);
			pstmt.setString(1,boardBean.getName());
			pstmt.setString(2,boardBean.getEmail());
			pstmt.setString(3,boardBean.getHomepage());
			pstmt.setString(4,boardBean.getSubject());
			pstmt.setString(5,boardBean.getContent());
			pstmt.setInt(6,boardBean.getNum());
			pstmt.executeUpdate();
			}catch(Exception ex) {
			System.out.println("Exception" + ex);
			}finally{
	        pstmt.close();
	        con.close();
		  }
	}

	public void replyupMyBoard(BoardBean reBoardBean)  throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try{
			con = pool.getConnection();
			int pos = reBoardBean.getPos();
			String strQuery = "update board set pos = pos + 1 where pos > ?";
			pstmt = con.prepareStatement(strQuery);
			pstmt.setInt(1,pos);
			pstmt.executeUpdate();
		}catch(Exception ex) {
			System.out.println("Exception" + ex);
		}finally{
			  pstmt.close();
		        con.close();
		}
	}

	public void replyMyBoard(BoardBean reBoardBean)  throws Exception{
		  Connection con = null;
		  PreparedStatement pstmt = null;
		
		  try{
			con = pool.getConnection();
			int depth = reBoardBean.getDepth() + 1;
			int pos = reBoardBean.getPos()+1;
			String strQuery = "insert into board" 
				   + "(num,name,email,homepage,subject,content,pos,depth,regdate,pass,count,ip)" 
				   + " values (?,?,?,?,?,?,?,?,sysdate,?,?,?)";
																  
					pstmt = con.prepareStatement(strQuery);
					pstmt.setInt(1,getNum());
					pstmt.setString(2,reBoardBean.getName());
					pstmt.setString(3,reBoardBean.getEmail());
					pstmt.setString(4,reBoardBean.getHomepage());
					pstmt.setString(5,reBoardBean.getSubject());
					pstmt.setString(6,reBoardBean.getContent());
					System.out.println("pos :"+pos);
					pstmt.setInt(7,pos);
					pstmt.setInt(8,depth);
					pstmt.setString(9,reBoardBean.getPass());
					pstmt.setInt(10,reBoardBean.getCount());
					pstmt.setString(11,reBoardBean.getIp());
					pstmt.executeUpdate();
							
		
		  
					StringBuffer buff=new StringBuffer();
					String[] str=new String[10];
					
		  
		  }catch(Exception ex) {
			 System.out.println("Exception" + ex);
		  }finally{
			  pstmt.close();
		        con.close();	  		  
		  }
	  }
}
