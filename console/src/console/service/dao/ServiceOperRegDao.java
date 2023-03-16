package console.service.dao;

import java.sql.Connection;

import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.common.dao.BaseDao;

public class ServiceOperRegDao extends BaseDao{
public String nextpage="";


/*
 * 서비스 정보 수정 select
 * 작성자    : 최승주
 * e-mail : halfodys@gmail.com 
 * date   : 2009-02-07
 */
	public ResultSetTray WorkedList(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();

		query.append("select 		              			\n");        
		query.append("a.user_id,   #서비스이름     				\n");
		query.append("a.name,     #서비스ID     				\n");		     
		query.append("c.charger_id   						\n");                       
		query.append("from TBL_USER a,                      \n");                            
		query.append("TBL_SVC_USER b,	                	\n");                        
		query.append("TBL_SERVICE c  	 	 				\n");
		query.append("where a.user_id=b.charger_id			\n");				
		
		queryRunner = new QueryRunner("WorkedDao WorkedList(Connection conn,Tray reqTray)",query.toString(), reqTray); 
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
	return rsTray;
	}
}	//Class }