package console.qadb.dao;


import java.sql.Connection;

import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;



public class QaDetailDao {


	public ResultSetTray getHistoryLine(Connection conn,Tray reqTray){
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int totalnum=0;
		query=new StringBuffer();
		String qahistory_num=reqTray.get("qahistory_num");	
		query.append("select * from qa_qna_list where qna_num=:qahistory_num \n");
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		System.out.println("QaDetailDao query->"+query.toString());
		return rsTray; 
	}
}
