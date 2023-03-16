package console.list.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.list.BoardBean;

public class BoardDao {
public String nextpage="";

	
	public ResultSetTray BoardList(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int count=0;
		int temp=2;
		query=new StringBuffer();
		query.append("select	 NUM      							\n");
		query.append("			,NAME      							\n");
		query.append("			,EMAIL     							\n");
		query.append("			,HOMEPAGE  							\n");
		query.append("			,SUBJECT   							\n");
		query.append("			,CONTENT  							\n");
		query.append("			,POS       							\n");
		query.append("			,DEPTH     							\n");
		query.append("			,REGDATE   							\n");
		query.append("			,PASS      							\n");
		query.append("			,COUNT     							\n");	
		query.append("			,IP       							\n");
		query.append("from board									\n");
		
		
		
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		System.out.println("BoardList");
		
	return rsTray;
	}

	
	
	public ResultSetTray GetNUm(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int count=0;
		int temp=2;
		query=new StringBuffer();
		query.append("select	 nvl(max(NUM),0) as NUM,nvl(max(POS),0) as POS    \n");
		query.append("from board									\n");
		
		
		
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
	
		System.out.println("rsTray "+rsTray.getInt("num"));
	return rsTray;
	}
	
	
	public ResultSetTray ReadDetail(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int count=0;
		int temp=2;
		query=new StringBuffer();
		query.append("select	 NUM      							\n");
		query.append("			,NAME      							\n");
		query.append("			,EMAIL     							\n");
		query.append("			,HOMEPAGE  							\n");
		query.append("			,SUBJECT   							\n");
		query.append("			,CONTENT  							\n");
		query.append("			,POS       							\n");
		query.append("			,DEPTH     							\n");
		query.append("			,REGDATE   							\n");
		query.append("			,PASS      							\n");
		query.append("			,COUNT     							\n");	
		query.append("			,IP       							\n");
		query.append("from board	where num=:num					\n");
		
		
		
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		System.out.println("BoardList");
		
	return rsTray;
	}



	public void insertBoard(Connection conn,Tray reqTray) throws Exception{
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int count=0;
		int temp=2;
		
		
		UpPos(conn,reqTray);
		rsTray=GetNUm(conn,reqTray);
		System.out.println("count  "+(rsTray.getInt("num")+1)+","+(rsTray.getInt("pos")+1));
		query=new StringBuffer();
		
		query.append("insert into board  \n");
		query.append("(num,name,email,homepage,subject,content,pos,depth,regdate,pass,count,ip) \n");
		query.append("values("+(rsTray.getInt("num")+1)+",:name,:email,:homepage,:subject,:content,"+(rsTray.getInt("pos")+1)+",0,sysdate,:pass,0,:ip)\n");
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		System.out.println("queryRunner");
		queryRunner.update(conn);
	  
		//return count;
			 
	}
	
	
	

	public void UpPos(Connection conn,Tray reqTray) throws Exception{
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int count=0;
		int temp=2;
		
		
		query=new StringBuffer();
		query.append("update  board set pos=nvl(pos,1) \n");
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		count=queryRunner.update(conn);
		System.out.println("UpPos count:  "+count);
		//return count;
			 
	}

}
