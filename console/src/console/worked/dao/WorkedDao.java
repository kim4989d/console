package console.worked.dao;

import java.sql.Connection;

import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.common.dao.BaseDao;

public class WorkedDao extends BaseDao{
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

		query.append("SELECT ifnull(a.user_id, ' ') as user_id,                                                           \n");
		query.append("ifnull(b.name, '사용자없음 ') as    name,                                                           \n");
		query.append("ifnull(a.system_id, ' ') as system_id,                                                                \n");
		query.append("ifnull(a.service_id, ' ') as service_id,                                                               \n");
		query.append("ifnull(DATE_FORMAT(a.logintime,'%Y-%m-%d %H:%i:%s'),' ') as logintime,                                \n");
		//query.append("ifnull(c.term, 0),                                                                       \n");
		//query.append("ifnull(c.idle, 0),                                                                       \n");
		//query.append("ifnull(c.limitation_command, ' '),                                                       \n");
		query.append("ifnull(d.Name, '담당자없음')as admin,                                                            \n");
		query.append("ifnull(a.log_filename, ' '),                                                             \n");
		query.append("ifnull(a.pid, 0 ),                                                                       \n");
		//query.append("c.policy_id,                                                                            \n");
		query.append("e.ostype,                                                                                \n");
		query.append("ifnull(e.host_id, '서비스삭제')                                                          \n");
		
		//query.append("FROM TBL_SESSION_HISTORY a left join TBL_SYSTEM e on a.system_id  = e.system_id ,        \n");
		query.append("FROM TBL_SESSION_HISTORY a inner join TBL_SYSTEM e on a.system_id  = e.system_id ,        \n");
		query.append("TBL_USER b 									\n");
		
		//query.append("TBL_USER b left join TBL_POLICY c on  b.session_policy_id = c.policy_id                  \n");
		query.append("           left join TBL_USER d on b.charger_id = d.user_id                              \n");
		query.append("WHERE a.user_id = b.user_id 								\n");
		//query.append(" and b.user_id='web21' 								\n");
		query.append(" 	and a.type =1 and a.logouttime is  null 		\n");
		
		if(!reqTray.get("txtsearch").equals("") || !reqTray.get("txtsearch2").equals("")){
			if(reqTray.get("selectoption").equals("사용자ID")){
				//$SQL = $SQL . " AND b." . $key . " =  '" . check_web2db($find) . "' ";
				query.append(" AND b.user_id="+Qutter(reqTray.get("txtsearch")));
			}
			if(reqTray.get("selectoption").equals("사용자이름")){	
				query.append(" AND b.name="+Qutter(reqTray.get("txtsearch")));
						
			}
		
			if(reqTray.get("selectoption2").equals("시스템이름")){
				//$SQL = $SQL . " AND b." . $key . " =  '" . check_web2db($find) . "' ";
				query.append(" AND e.system_name="+Qutter(reqTray.get("txtsearch2")));
			}
			if(reqTray.get("selectoption2").equals("시스템ID")){	
				query.append(" AND e.host_id="+Qutter(reqTray.get("txtsearch2")));
			}
		
			if(reqTray.get("dayselect").equals("시스템이름")){
				query.append("AND a.logintime between date_format('"+Qutter(reqTray.get("txtsearch2")));
			}
			if(reqTray.get("selectoption2").equals("시스템ID")){	
				query.append(" AND e.host_id="+Qutter(reqTray.get("txtsearch2")));
			}	
		}
		
		queryRunner = new QueryRunner("WorkedDao WorkedList(Connection conn,Tray reqTray)",query.toString(), reqTray); 
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
	return rsTray;
	}
}	//Class }