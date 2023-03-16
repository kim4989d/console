package console.category.dao;

import java.sql.Connection;

import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;

public class categorydao {
public String nextpage="";

	
	public ResultSetTray categoryList(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int count=0;
		int temp=2;
		query=new StringBuffer();
		query.append("select level_one,level_two,level_three,one,two,three		\n");
		query.append("from cust_category");
		
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		System.out.println("categoryList");
		
	return rsTray;
	}

}
