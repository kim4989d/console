package console.require.dao;

import java.sql.Connection;

import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.common.dao.BaseDao;

public class RequireAccountDao extends BaseDao{
	

	
	
	
	

	/**
	 *	기능: 	작업신청현황 서비스 List
	 *	작성자:  이충섭
	 * 
	 * 
	 */
	public ResultSetTray serviceLsit(Connection conn,Tray reqTray){
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query = new StringBuffer();
		
		
		//request valuse 
		String flag		=	reqTray.get("flag");
		String cert_key	=	reqTray.get("cert_key");
		String job_no	=	reqTray.get("job_no");
		String sys_id	=	reqTray.get("sys_id");
		
		
		
		//임시 설정 
		sys_id = "53w5";
		
		
		
		if(flag.equals("unix")){  //unix 작업시
			if( ( !sys_id.equals("") && cert_key.equals("") ) 
					|| ( sys_id.equals("") && cert_key.equals("") ) ){
				query.append(" SELECT A.SERVICE_NAME,              \n");
	            query.append("       A.SERVICE_ID,                 \n");  
	            query.append("       B.SYSTEM_NAME,                \n");  
	            query.append("       B.SYSTEM_ID,                  \n");  
	            query.append("       B.HOST_ID,                    \n");  
	            query.append("       C.NAME                        \n");  
	            query.append("  FROM TBL_SERVICE A ,               \n");  
	            query.append("       TBL_SYSTEM B,                 \n");  
	            query.append("       TBL_USER C                    \n");  
	            query.append(" WHERE A.SERVICE_ID = B.SERVICE_ID   \n");  
	            query.append("   AND B.CHARGER_ID = C.USER_ID      \n");  
	            query.append("   AND B.SYSTEM_ID="+Qutter(sys_id)+"\n");  
			}else if( !cert_key.equals("")) {
				query.append(" SELECT C.SERVICE_NAME,                        \n");
				query.append("		     B.SERVICE_ID,                       \n");
				query.append("		     B.SYSTEM_NAME,                      \n");
				query.append("		     B.SYSTEM_ID ,                       \n");
				query.append("           B.HOST_ID,    		                 \n");
				query.append("		     D.NAME                              \n");
				query.append(" FROM TBL_CONN_SYSTEM A ,                      \n");
				query.append("		     TBL_SYSTEM B,                       \n");
				query.append(" 		     TBL_SERVICE C ,                     \n");
				query.append(" 		     TBL_USER D                          \n");
				query.append(" WHERE A.SYSTEM_ID = B.SYSTEM_ID               \n");
				query.append("		AND B.SERVICE_ID = C.SERVICE_ID          \n");
				query.append("		AND B.CHARGER_ID = D.USER_ID             \n");
				query.append("		AND CERT_ID = "+Qutter(cert_key)+"         \n");
			}
		}else{ // window 작업시
			if( !job_no.equals("")){	
				query.append("	    SELECT C.SERVICE_NAME,					\n");
				query.append("		     B.SERVICE_ID,                      \n");
				query.append("		     B.SYSTEM_NAME,                     \n");
				query.append("		     A.SYSTEM_ID ,                      \n");
				query.append("           B.HOST_ID,    	                    \n");
				query.append("		     D.NAME                             \n");
				query.append(" FROM TBL_JOB_SYSTEM A ,                      \n");
				query.append("		     TBL_SYSTEM B,                      \n");
				query.append(" 		     TBL_SERVICE C ,                    \n");
				query.append(" 		     TBL_USER D                         \n");
				query.append("WHERE A.SYSTEM_ID = B.SYSTEM_ID               \n");
				query.append("		AND B.SERVICE_ID = C.SERVICE_ID         \n");
				query.append("		AND B.CHARGER_ID = D.USER_ID            \n");
				query.append("		AND JOB_NO = "+Qutter(job_no)+"         \n");
				
			}else if( !sys_id.equals("") && job_no.equals("") ){
				query.append("	SELECT  C.SERVICE_NAME,					\n");	
				query.append("			     B.SERVICE_ID,	    	    \n");
				query.append("			     B.SYSTEM_NAME,	        	\n");
				query.append("		         B.SYSTEM_ID ,              \n");
				query.append("			     B.HOST_ID ,				\n");	 
				query.append("			     D.NAME						\n");
				query.append("	 FROM TBL_SYSTEM B,                     \n");
				query.append("	 		  TBL_SERVICE C ,	        	\n");
				query.append("	 		  TBL_USER D	                \n");
				query.append("	WHERE B.SERVICE_ID = C.SERVICE_ID		\n");
				query.append("	  AND B.CHARGER_ID = D.USER_ID	        \n");
				query.append("	  AND B.System_Id = "+Qutter(sys_id)+"  \n");	
	
			}
		}
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray); 
		
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		return rsTray;
	
	
}



	
	
	/**
	 * 기능:		신청현황 -> 계정신청현황 -> 승인/반려 팝업창 list
	 * 
	 */
	
	public ResultSetTray TBL_CONN_CERT_KEY_USERList(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		String cert_id = reqTray.get("cert_id");

		cert_id = "1234567892";
		
		query = new StringBuffer();
		
		query.append("SELECT INTENTION,FROM_DT,TO_DT,ADDED_FILE_PATH , ALLOWFTP                                       \n");
		query.append("FROM TBL_CONN_CERT_KEY WHERE CERT_ID="+Qutter(cert_id)+"                                       \n");
		
		//query.append(" AND ADDED_FILE_NAME                                       \n");	//파일 경로 추가 (미구현 추후 추가)
		
		
		
		
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray); 
		
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
	return rsTray;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}	
	
	
	
	
	
	
	
	
	