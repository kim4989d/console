package console.usermode.dao;

import java.sql.Connection;

import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.common.dao.BaseDao;

public class ConnectionReqDao extends BaseDao{
public String nextpage="";


/*
 * 작업관리 리스트용 DB 처리
 * 작성자: 최승주
 * 
 */
	public ResultSetTray WorkedList(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();
		
		query.append("SELECT 									\n");	
		query.append("A.SERVICE_NAME,                           \n");
		query.append("A.SERVICE_ID,                             \n");
		query.append("B.SYSTEM_NAME,                            \n");
		query.append("B.SYSTEM_ID,                              \n");
		query.append("B.HOST_ID,                                \n");
		query.append("C.NAME                                    \n");
		query.append("FROM TBL_SERVICE A,                       \n");
		query.append("TBL_SYSTEM B,                             \n");
		query.append("TBL_USER C                                \n");
		query.append("WHERE A.SERVICE_ID = B.SERVICE_ID         \n");
		query.append("AND B.CHARGER_ID = C.USER_ID              \n");		
		
		queryRunner = new QueryRunner("WorkedDao WorkedList(Connection conn,Tray reqTray)",query.toString(), reqTray); 
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
	return rsTray;
	}
}	//Class }