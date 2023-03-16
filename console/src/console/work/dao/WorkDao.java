package console.work.dao;

import java.sql.Connection;

import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.common.dao.BaseDao;

public class WorkDao extends BaseDao{
public String nextpage="";


/*
 * 작업관리 리스트용 DB 처리
 * 작성자: 최승주
 * 
 */
	public ResultSetTray WorkList(Connection conn,Tray reqTray){
		 
		
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
				
		
		 	if(reqTray.get("div") !="" &&  reqTray.get("div") != "ALL" ){
				query.append("and a.service_id ="+Qutter(reqTray.get("div")));
		 	}
		
		 	if(!reqTray.get("txtsearch").equals("")){
				if(reqTray.get("selectoption").equals("USERID")){
					//$SQL = $SQL . " AND b." . $key . " =  '" . check_web2db($find) . "' ";
					query.append(" AND b.user_id="+Qutter(reqTray.get("txtsearch")));
				}
				if(reqTray.get("selectoption").equals("USERNAME")){	
					query.append(" AND b.name="+Qutter(reqTray.get("txtsearch")));
				}
				
		 	}
		 	
			 if(!reqTray.get("txtsearch2").equals("")){
					 	
					if(reqTray.get("selectoption2").equals("SYSTEMNAME")){
						//$SQL = $SQL . " AND b." . $key . " =  '" . check_web2db($find) . "' ";
						query.append(" AND e.system_name="+Qutter(reqTray.get("txtsearch2")));
					}
					if(reqTray.get("selectoption2").equals("SYSTEMID")){	
						query.append(" AND e.host_id="+Qutter(reqTray.get("txtsearch2")));
					}
			 	
		 	
		 	
		 	
		 	}
			
			
/*//날짜 조회를 위한 조건
 *  IF ($CAL1 != "" ){
		IF ($CAL2 =="" )  $CAL2 = date('Y-m-d ');
			$SQL = $SQL ." AND a.logintime between date_format('".$CAL1." 00:00:00', '%Y-%m-%d %H:%i:%s')  and  DATE_FORMAT('".$CAL2." 23:59:59"."','%Y-%m-%d %H:%i:%s')" ;
	}	
 */			
	
//			
//			IF ($CAL1 != "" ){
//				IF ($CAL2 =="" )  $CAL2 = date('Y-m-d ');
//					$SQL = $SQL . " AND a.logintime between date_format('".$CAL1." 00:00:00', '%Y-%m-%d %H:%i:%s')  " +
//							"and  DATE_FORMAT('".$CAL2." 23:59:59"."','%Y-%m-%d %H:%i:%s')" ;
//			}
			
		 	String cal1=reqTray.get("cal1").replaceAll("/","-");
		 	String cal2=reqTray.get("cal2").replaceAll("/","-");;
			
		 	
		 	if(!cal1.equals("") || !cal2.equals("")){
				query.append("AND a.logintime and date_format("+Qutter(cal1+" 00:00:00")+","+Qutter("%Y-%m-%d %H:%i:%s")+")" );
				query.append("and  DATE_FORMAT("+Qutter(cal2+" 23:59:59.")+","+Qutter("%Y-%m-%d %H:%i:%s")+")") ;
			
			}

		
		queryRunner = new QueryRunner("WorkDao WorkList(Connection conn,Tray reqTray)",query.toString(), reqTray); 
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
	return rsTray;
	}
	
	
	
	/*
	 * 작업신청현황 승인 처
	 * 작성자: 이충섭
	 * 일자: 2009-01-20
	 */
	
	public ResultSetTray UpdateList(Connection conn, Tray reqTray){
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int count = 0;
		
		//
		String updt_id = reqTray.getString("updt_id");
		String cert_id = reqTray.getString("cert_id");
		
		
		query = new StringBuffer();
		
		/*
		 * 임시추가 추후 변경 예정.
		 * 
		 * CERT_ID = 작업 인증값
		 * updt_id = 
		 * 
		 */
		
		query.append("		UPDATE TBL_CONN_CERT_KEY SET	\n");	
		query.append("		admit_date = now(),         	\n");		
		query.append("		admit_flag = '1' ,          	\n");
//		query.append("		updt_id='insung',           	\n");	
		query.append("		updt_id= :updt_id,           	\n");	//뭐지?
		query.append("		term =1, idle=20            	\n");
		query.append("		WHERE                       	\n");	
//		query.append("		CERT_ID = 0262666216        	\n");	
		query.append("		CERT_ID = :cert_id	        	\n");	
		query.append("		and admit_flag='0'          	\n");
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		count = queryRunner.update(conn);	//Update처리 Methode
		System.out.println("UpPos count:  "+count);

		return rsTray;
	}
}	//Class }