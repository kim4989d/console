package console.usermode.dao;

import java.sql.Connection;

import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.common.dao.BaseDao;

public class UserUniSystemListDao extends BaseDao{
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
		
		query.append("select 					                \n");
		query.append("a.service_id,                             \n");
		query.append("a.system_id,                              \n");
		query.append("b.system_name,                            \n");
		query.append("date_format(a.exp_date,'%Y/%m/%d %H:%i') as timeg , \n");
		query.append("a.admit_date,                             \n");
		query.append("c.service_name,                           \n");
		query.append("b.OSTYPE,                                 \n");
		query.append("a.CONN_TYPE,                              \n");
		query.append("b.host_id                                 \n");
		query.append("from TBL_USER_SYSTEM a,                 \n");
		query.append("TBL_SYSTEM b,                              \n");
		query.append("TBL_SERVICE c                             \n");
		query.append("where a.service_id=c.service_id           \n");		
		query.append("and a.system_id=b.system_id and b.ostype='U' \n");
		query.append("order by a.service_id						\n");
		
		queryRunner = new QueryRunner("WorkedDao WorkedList(Connection conn,Tray reqTray)",query.toString(), reqTray); 
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
	return rsTray;
	}
}	//Class }