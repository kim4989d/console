package console.require.dao;

import java.sql.Connection;

import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.common.dao.BaseDao;

public class RequireDao extends BaseDao{
	

	
/****	신청현황-> 계정신청 현황 Query	Start	******************************************************************************/

/**
 * 
 * 기능:		신청현황 -> Unix 작업신청현황 LIST 
 * 작성일:	2009.02.06
 * 작성자: 이충섭
 * 
 * 특이사항: 현재 ngs의 경우 서비스 그룹에 등록된 관리자 이외에 관리자도 작업신청된 내역을 확인 
 * 및 승인/반려 할수 있는 권한을 같고 처리하고 있다.
 * 위 사실과 같이 처리된 상태이며 추후 변경 예정.
 * 
 */
	public ResultSetTray unixList(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		String kind  	= reqTray.get("kind");      //운영 레벨 		
		String user_id 	= reqTray.get("user_id");	//접속자 아이디 
		
		String div	 	= reqTray.get("div");		//left 메뉴 flag 값 운영자일 경우 해당  service_id
		/*
		 * div 관련  flag value 
		 * ALL일 경우 전체 서비스 검색
		 * 나머지 해당 service name일 경우 해당 서비스 검색  
		 */ 

		query = new StringBuffer();

		
		
		query.append("		SELECT a.user_id,	                                  	\n");
		query.append("		       b.name,                                        	\n");
		query.append("		       ifnull(a.apply_date,' '),                      	\n");
		query.append("		       ifnull(f.service_id,' ') as service_group,     	\n");
		query.append("		       ifnull(a.system_id,' '),                       	\n");
		query.append("		       ifnull(a.intention,' ') as work_conttens,      	\n");
		query.append("		       ifnull(a.cert_id,' ') as cert_id,		       	\n");
		query.append("		       a.reg_dt                                       	\n");
		query.append("		FROM   TBL_CONN_CERT_KEY a,                           	\n");
		query.append("		       TBL_USER b ,                                   	\n");
		query.append("		       (SELECT distinct                               	\n");
		query.append("		       		c.cert_id ,                         	  	\n");
		query.append("		       		d.service_id                          		\n");
		query.append("		        FROM TBL_CONN_SYSTEM c,                       	\n");
		query.append("			        (SELECT                               		\n");
		query.append("			        		b.system_id,                 		\n");
		query.append("			                b.system_name,                		\n");
		query.append("			                a.service_id                  		\n");
		query.append("			         FROM                                 		\n");
		query.append("			         	TBL_SERVICE a,                			\n");
		query.append("			            TBL_SYSTEM b	                  		\n");
		query.append("			         WHERE a.service_id = b.service_id    		\n");
		
		if( !div.equals("") && !div.equals("ALL") ){ //left메뉴 플래그 값에 따른 분기  										
			query.append("  				 and a.service_id = "+Qutter(div)+"		\n");
		}
		
		if(kind.equals("O")){	//레벨이 운영자 일 경우 
			query.append("	        and EXISTS(select aa.service_id  				\n");
			query.append("	        from TBL_SVC_USER aa   							\n");
			query.append("	        where aa.charger_id="+Qutter(user_id)+")		\n");
		}
		query.append("				        ) d                           			\n");
		query.append("			 WHERE c.system_id = d.system_id              		\n");
		query.append("			        ) f                                   		\n");
		query.append("		WHERE a.cert_id = f.cert_id                           	\n");
		query.append("		  and a.user_id = b.user_id                           	\n");
		query.append("		  and a.admit_flag = '0'                              	\n");	
		query.append("		  order by a.reg_dt desc                              	\n");
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray); 
		
		
		
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		
		
	return rsTray;
	}
	
	
	
	
	
	
	
	
	/**
	 * 
	 * 기능:		신청현황-> Unix 작업신청에 대한 승인처리 (Update)
	 * 작성자: 	이충섭
	 * 작성일:	2009.02.06
	 * 
	 */
	
	public ResultSetTray unixUpdate(Connection conn, Tray reqTray){
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int count = 0;
		
		String updt_id 	= reqTray.get("user_id");
		String cert_id 	= reqTray.get("seqNo");
		
		updt_id = "ngsadmin";
		
		
		query = new StringBuffer();
		
		query.append("		UPDATE TBL_CONN_CERT_KEY SET	\n");	
		query.append("		admit_date = date_format(now(),'%Y-%m-'),        \n");		
		query.append("		admit_flag = 1,		          	\n");
		query.append("		updt_id= "+Qutter(updt_id)+", 	\n");	
		query.append("		term =1, idle=20            	\n");
		query.append("		WHERE                       	\n");	
		query.append("		CERT_ID = "+Qutter(cert_id)+"  	\n");	
		query.append("		and admit_flag=0          	\n");
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		
		count = queryRunner.update(conn);	
		
		System.out.println("UpPos count:  "+count);

		return rsTray;
	}

	
	
	
	
	
	
	/****	신청현황-> NT작업 신청 현황 Query	Start	**************************************************************************/
	
	
	public ResultSetTray ntList(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
//		String kind = reqTray.get("kind");

		query = new StringBuffer();
		
		
		query.append("		SELECT a.user_id,	                                  	\n");

		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray); 
		
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
	return rsTray;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 기능: 	신청 현황 -> 계정 신청 현황 리스트
	 * 작성일:	2009.02.06 
	 * 작성자: 	이충섭
	 * 
	 */
		public ResultSetTray UserList(Connection conn,Tray reqTray){
			 
			QueryRunner    queryRunner = null;
			ResultSetTray  rsTray      = null;
			StringBuffer   query       = null;
			
			String kind 	= reqTray.get("kind");
			

			query = new StringBuffer();
			
			query.append("	SELECT                                                        	\n");             
			query.append("		a.user_id, a.name, b.company_name,                    		\n");             
			query.append("		a.kind, a.apply_date, a.intention,                    		\n");             
			query.append("		a.REG_DT                                              		\n");             
			query.append("	FROM                                                          	\n");             
			query.append("		TBL_USER a right                                      		\n");             
			query.append("		join TBL_COMPANY b on a.company_id = b.company_id     		\n");             
			query.append("	WHERE                                                         	\n");             
			query.append("		a.admit_flag = '0'                                    		\n");             
			query.append("		and a.kind != 'A'                                   	  	\n");             
			query.append("		and  a.company_id is not null                   	      	\n");             
			if(kind.equals("O")){
				query.append("	                                                              	\n");             
				query.append("	and EXISTS                                                    	\n");             
				query.append("	(                                                             	\n");             
				query.append("			SELECT                                        			\n");             
				query.append("				user_id                               				\n");             
				query.append("			FROM                                          			\n");             
				query.append("				TBL_USER_SYSTEM c                     				\n");             
				query.append("			WHERE                                         			\n");             
				query.append("				admit_flag = '0'                      				\n");             
				query.append("		and a.user_id = c.user_id                             		\n");             
				query.append("		and EXISTS                                            		\n");             
				query.append("			(                                             			\n");             
				query.append("			SELECT                                        			\n");             
				query.append("				charger_id                            				\n");             
				query.append("			FROM                                          			\n");             
				query.append("				TBL_SVC_USER d                        				\n");            
				query.append("			WHERE                                         			\n");        
				query.append("				c.service_id = d.service_id             			\n");                                                  
				query.append("				and d.charger_id =:user_id               			\n");                                                  
				query.append("			)                                              			\n");                                   
				query.append("	)                                                               \n");                                   
			}
			
			queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray); 
			rsTray = (ResultSetTray)queryRunner.query(conn);
			
		return rsTray;
		}
		
	
	

	

	
		
		
	
	
	/****	신청현황-> 계정신청 현황 Query	Start	**************************************************************************/
	/**
	 *
	 * 기능:		신청현황-> 계정신청등록
	 * 			신규 계정 신청 신청자(uid)에 대한 전체 정보를 select 한다
	 * 작성일:	2009.02.06
	 * 작성자:	이충섭 
	 * 
	 */
	
	
	public ResultSetTray userList(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		query = new StringBuffer();
		

		query.append("	select                                      	   	\n");
		query.append("		user_id,password,NAME,                 			\n");
		query.append("		Kind, TYPE, INTENTION,                 			\n");
		query.append("		COMPANY_ID, CELL_NUM, COMPANY_TEL,     			\n");
		query.append("		COMPANY_FAX, RSNO, CHARGER_ID,         			\n");
		query.append("		CERT_KEY, IFNULL(ISPORTED,'0') ISPORTED			\n");
		query.append("	from                                           		\n");
		query.append("		TBL_USER                               			\n");
		query.append("	where                                          		\n");
//		query.append("		user_id=:uid	                    			\n");
		query.append("		user_id=:'admintemp'	                    	\n");	//임시 등록자 처리 추후 변경 

		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray); 
		
		rsTray = (ResultSetTray)queryRunner.query(conn);
	
		
	return rsTray;
	}
	
	
	
	
	
	/**
	 * 
	 * 기능: 	신청현황 -> 계정신청 현황 TBL_COMPNAY(회사) 전체 리스트 구한다.
	 * 작성일:	2009.02.06
	 * 작성자: 	이충섭 
	 * 
	 */
	
	public ResultSetTray companyList(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		query = new StringBuffer();

		query.append("		select COMPANY_ID,COMPANY_NAME from TBL_COMPANY    	\n");

		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray); 
		
		rsTray = (ResultSetTray)queryRunner.query(conn);
	
		
	return rsTray;
	}
	
	
	
	
	
	
	
	
	/************************* 유저 승인 처리 *******************************/
	
	public ResultSetTray userUpdate(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		query = new StringBuffer();
		
		String uid 	= reqTray.get("seqNo");

		query.append("	update                      	    \n");
		query.append("		TBL_USER                		\n");
		query.append("	set                           	    \n");
		query.append("		admit_flag = 1          		\n");
		query.append("  where		                 	    \n");
		query.append("        	user_id="+Qutter(uid)+"		\n");
		
		
				
		queryRunner = new QueryRunner("userUpdate(Connection conn,Tray reqTray)",query.toString(), reqTray); 
		
		queryRunner.update(conn);
	
		
	return rsTray;
	}
	
	/*************************************************************************************************************************/
	

}	

	
	