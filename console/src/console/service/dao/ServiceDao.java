package console.service.dao;

import java.sql.Connection;

import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.common.dao.BaseDao;

public class ServiceDao extends BaseDao{
public String nextpage="";







/*
 * 서비스관리 select
 * 작성자    : 최승주
 * e-mail : halfodys@gmail.com   
 * date   : 2009-02-07 
 */
	public ResultSetTray WorkedList(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();

		
		reqTray.get("service_id");
		
		query.append("select distinct 		              		 		\n");
		query.append("a.service_id,   #서비스ID     			         	\n");
		query.append("a.service_name, #서비스이름     			         	\n");		
		query.append("a.session_policy_id,        			 			\n");
		query.append("ifnull(b.name,'담당자없음') as adminer #관리자이름        \n");
		query.append("from TBL_SERVICE a                                \n");
		query.append("left join TBL_USER b  		                 	\n");
		query.append("on a.charger_id = b.user_id		 	 			\n");
		query.append("left join TBL_SVC_USER c     			 			\n");
		query.append("on a.service_id = c.service_id			 		\n");
		query.append("where b.user_id is not null                       \n");
		
		queryRunner = new QueryRunner("WorkedDao WorkedList(Connection conn,Tray reqTray)",query.toString(), reqTray); 
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
	return rsTray;
	}
}	//Class }