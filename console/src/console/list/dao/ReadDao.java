package console.list.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.list.BoardBean;

public class ReadDao {
public String nextpage="";

	
	

	
	
	
	
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



	

}
