package console.user.regist.dao;
import java.sql.Connection;

import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.common.dao.BaseDao;
import console.common.util.Util;



public class JobRegUnixDao extends BaseDao{
	
	
	
	//list
	public ResultSetTray unixJobdList(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		
		query = new StringBuffer();
		
		String kind = reqTray.get("kind");
		String user_id = reqTray.get("user_id");
		
		System.out.println("======JobRegUnixDao - user_id: "+ user_id );
		

		query.append("	select                                                         	\n");
		query.append("		e.user_id,                                             		\n");
		query.append("		e.intention,                                           		\n");
		query.append("		e.from_dt,                                             		\n");
		query.append("		e.to_dt,                                               		\n");
		query.append("		e.reg_dt,                                              		\n");
		query.append("		e.admit_flag,                                          		\n");
		query.append("		e.cert_id,                                             		\n");
		query.append("		h.name,                                                		\n");
		query.append("		j.NAME as oper_name,                                   		\n");
		query.append("		IFNULL(e.status,'0') as status,                        		\n");
		query.append("		e.service_id                                           		\n");
		query.append("	from                                                           	\n");
		query.append("		TBL_USER h,                                            		\n");
		query.append("		TBL_USER j,		                               				\n");
		query.append("	        TBL_CONN_CERT_KEY e                                    	\n");
		query.append("	        left join TBL_SERVICE g on e.service_id = g.service_id 	\n");
		query.append("	        left join TBL_SYSTEM t on e.system_id = t.system_id    	\n");
		query.append("	where                                                          	\n");
		query.append("		e.admit_flag >= 0                                      		\n");
		query.append("		and e.USER_ID =  h.user_id                             		\n");
		query.append("		and h.charger_id =  j.user_id                          		\n");
		query.append("		and e.user_id = :user_id                             		\n");
		query.append("		ORDER BY e.reg_dt desc                                 		\n");

		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		
	return rsTray;
	}
	
	
	
	
	//업데이트 처리
	public ResultSetTray UpdateList(Connection conn, Tray reqTray){
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int count = 0;
		
//		String updt_id = reqTray.getString("updt_id");
//		String cert_id = reqTray.getString("cert_id");
		
		query = new StringBuffer();
		
		query.append("		UPDATE TBL_CONN_CERT_KEY SET	\n");	
		query.append("		admit_date = now(),         	\n");		
		query.append("		admit_flag = '1' ,          	\n");
		query.append("		updt_id= :updt_id,           	\n");	//뭐지?
		query.append("		term =1, idle=20            	\n");
		query.append("		WHERE                       	\n");	
		query.append("		CERT_ID = :cert_id	        	\n");	
		query.append("		and admit_flag='0'          	\n");
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		count = queryRunner.update(conn);	//Update처리 Methode

		return rsTray;
	}
	
	
	
	
	/**
	 * 
	 * 유닉스 작업 등록 TBL_CONN_CERT_KEY 
	 * 
	 */
	public ResultSetTray TBL_CONN_CERT_KEY_Ins(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;

		String cert_id 		= 	Util.RandomNumber();	//cert_key 생성
		
		String KIND			=	"";
		String name			=	"";
		String userid		=	"";
		
		
		KIND   				= 	reqTray.getString("kind");			 // 사용자 종류 
		

//		cal1 				= 	Util.ReplaceText("/", "" , reqTray.get("cal1"));

		query=new StringBuffer();
		
		query.append("	INSERT                                     	\n");
		query.append("	into                                        \n");
		query.append("		TBL_CONN_CERT_KEY                       \n");
		query.append("	(                                           \n");
		query.append("		cert_id, user_id, system_id,            \n");
		query.append("		service_id, apply_date, intention,      \n");
		query.append("		ADDED_FILE_PATH, ADDED_FILE_NAME,       \n");
		query.append("		FROM_DT, TO_DT, admit_flag,             \n");
		query.append("		reg_dt, reg_id, allowftp                \n");
		query.append("	)                                           \n");
		query.append("	values                                      \n");
		query.append("	(                                           \n");
		query.append("		"+Qutter(cert_id)+", :user_id, NULL,                   \n");
		query.append("		NULL, now(), content,                   \n");
		query.append("		fileurl, new_file_name,	                \n");
		query.append("		FROM_DT, TO_DT, 0,		        		\n");
		query.append("		now(), SID, USE_FTP                     \n");
		query.append("	)					   						\n");

		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		
	return rsTray;
	}
	
	

	
	
	
	
}	//Class End}

	
	