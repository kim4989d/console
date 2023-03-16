package console.service.dao;

import java.sql.Connection;

import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.common.dao.BaseDao;

public class ServiceUpdateDao extends BaseDao{
public String nextpage="";



public void ServiceUpdate(Connection conn,Tray reqTray){
	
	QueryRunner    queryRunner = null;
	ResultSetTray  rsTray      = null;
	StringBuffer   query       = null;
	
	query =new StringBuffer();
	
	
	query.append("update TBL_SERVICE set  						 \n");          
	query.append("service_name=:service_name ,        		\n");                               
	//query.append("SESSION_POLICY_ID=");                                   
	query.append("CHARGER_ID=:charger_id   ,          		 \n");                                   
	query.append("UPDT_DT=now()             ,        		 \n");                                   
	query.append("UPDT_ID=:user_id                         		\n");                                   
	query.append("where service_id=:service_id                         \n");                                   
	
	queryRunner = new QueryRunner("ServiceUpdateDao ServiceList(Connection conn,Tray reqTray)",query.toString(), reqTray); 
	queryRunner.update(conn);
	
	
}

public void ServiceUpdate2(Connection conn,Tray reqTray){
	
	QueryRunner    queryRunner = null;
	ResultSetTray  rsTray      = null;
	StringBuffer   query       = null;
	
	query =new StringBuffer();
	
	
	query.append("update TBL_SVC_USER set     			 \n");                                                                      
	query.append("charger_id=:charger_id      ,    		 \n");
	query.append("UPDT_DT=now()               ,    		 \n");
	query.append("UPDT_ID=:user_id                    	 \n");
	query.append("where service_id=:service_id           \n");
	query.append("and charger_id=:charger_id             \n");                           
	
	
	queryRunner = new QueryRunner("ServiceUpdateDao ServiceUpdate2(Connection conn,Tray reqTray)",query.toString(), reqTray); 
	queryRunner.update(conn);
	
	
}





/*
 * 서비스 정보 수정 입력박스 select
 * 작성자    : 최승주
 * e-mail : halfodys@gmail.com 
 * date   : 2009-02-07
 */
	public ResultSetTray ServiceList(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query =new StringBuffer();
		query.append("select 		              					\n");
		query.append("a.service_name,   #서비스이름     					\n");
		query.append("a.CHARGER_ID,     #서비스ID     				\n");		
		query.append("ifnull(b.name,'담당자없음') as CNAME #관리자이름   \n");
		query.append("from TBL_SERVICE a                            \n");
		query.append("left join TBL_USER b  		                \n");
		query.append("on a.charger_id = b.user_id  	 	 			\n");
		query.append("where a.service_id=:service_id  	 	 	    \n");		
		
		queryRunner = new QueryRunner("ServiceUpdateDao ServiceList(Connection conn,Tray reqTray)",query.toString(), reqTray); 
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
	return rsTray;
	}


	//combobox
	public ResultSetTray CMO(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();

		query.append("select  		                    				\n");			
		query.append("user_id, 											\n");	  
		query.append("NAME     			  								\n");	 
		query.append("from TBL_USER          	 						\n");		
		query.append("where KIND='O' and admit_flag='1' order by NAME   \n");	
		
		queryRunner = new QueryRunner("ServiceUpdateDao ServiceList(Connection conn,Tray reqTray)",query.toString(), reqTray); 
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
	return rsTray;
	}	
		
//i프레임 내부 쿼리
	public ResultSetTray CompanyHistory(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();

		query.append("SELECT											\n"); 
		query.append("a.SERVICE_ID, a.COMPANY_ID,b.company_name         \n");
		query.append("FROM TBL_SVC_COMPANY a,                           \n");
		query.append("TBL_COMPANY b                                     \n");
		query.append("WHERE a.SERVICE_ID=:SERVICE_ID                    \n");
		query.append("and b.company_id = a.company_id                   \n");
		query.append("order by b.company_name                           \n");
		
		queryRunner = new QueryRunner("ServiceUpdateDao ServiceList(Connection conn,Tray reqTray)",query.toString(), reqTray); 
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
	return rsTray;
	}	
	
//리스트 삭제 쿼리	
	public ResultSetTray ServiceDelect(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();

		query.append("	delete from TBL_SYSTEM where system_id =:system_id		\n");		
		
		queryRunner = new QueryRunner("ServiceUpdateDao ServiceList(Connection conn,Tray reqTray)",query.toString(), reqTray); 
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
	return rsTray;
	}
	
}	//Class }