package console.user_unix.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import console.common.dao.BaseDao;
import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.list.BoardBean;
import console.user_window.dao.UserDao;
import console.common.util.Util;

public class UserUnixDao extends BaseDao{
//public String nextpage="";
	
	
	public ResultSetTray UnixIns(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;

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
		query.append("		RandomNum, SID, NULL,                   \n");
		query.append("		NULL, now(), content,                   \n");
		query.append("		fileurl, new_file_name,	                \n");
		query.append("		FROM_DT, TO_DT, 0,		        		\n");
		query.append("		now(), SID, USE_FTP                     \n");
		query.append("	)					   						\n");

		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data
		
	return rsTray;
	}
	

}
