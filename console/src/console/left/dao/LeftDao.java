package console.left.dao;

import java.sql.Connection;

import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.common.dao.BaseDao;

public class LeftDao extends BaseDao{
public String nextpage="";

//신청현황 -> 인증키 미사용 현황 전체 검색 (super user)



public ResultSetTray KeyNotBodyList(Connection conn,Tray reqTray){
	 
	QueryRunner    queryRunner = null;
	ResultSetTray  rsTray      = null;
	StringBuffer   query       = null;
	
	query=new StringBuffer();

	query.append("SELECT 																	\n");
	query.append("	bb.user_id,bb.name,bb.intention,bb.cert_id,bb.reg_dt,bb.work_flag,bb.tbl                                                                \n");
	query.append("FROM                                                                                                                                      \n");
	query.append("(                                                                                                                                         \n");
	query.append(" 	select                                                                                                                                  \n");
	query.append(" 		aa.user_id,aa.name,aa.intention,aa.cert_id,aa.reg_dt,aa.work_flag ,'C' as tbl                                                   \n");
	query.append("    	from(                                                                                                                           \n");
	query.append("    		SELECT                                                                                                                  \n");
	query.append("    			distinct a.user_id, d.name, ifnull(a.apply_date,'') as apply_date,                                              \n");
	query.append("    			ifnull(a.intention,'') as intention, a.cert_id, a.admit_flag,                                                   \n");
	query.append("    			a.reg_dt , f.work_flag                                                                                          \n");
	query.append("         	FROM                                                                                                                            \n");
	query.append("         		TBL_CONN_CERT_KEY a, TBL_SYSTEM b, TBL_SERVICE c, TBL_USER d , TBL_CONN_SYSTEM e, TBL_SMS_WORK f                        \n");
	query.append("                WHERE                                                                                                                     \n");
	query.append("                	a.user_id = d.user_id                                                                                                   \n");
	query.append("                	and a.admit_flag = '1'                                                                                                  \n");
	query.append("                	and a.cert_id = e.cert_id                                                                                               \n");
	query.append("                	and e.system_id = b.system_id                                                                                           \n");
	query.append("                  and b.service_id = c.service_id                                                                                         \n");
	query.append("			            and d.cell_num = f.cell_num and a.cert_id = f.conn_key                                                      \n");
	query.append("                  and EXISTS(select distinct e.cert_id from TBL_CONN_SYSTEM f where f.cert_id = a.cert_id and e.cert_date is null)        \n");
	query.append("                       ) aa                                                                                                               \n");
	query.append("union all                                                                                                                                 \n");
	query.append("select                                                                                                                                    \n");
	query.append("	aa.user_id,aa.name,aa.title,aa.cert_id,aa.reg_dt,aa.work_flag ,'J' as tbl                                                               \n");
	query.append("from(                                                                                                                                     \n");
	query.append("	select                                                                                                                                  \n");
	query.append("		distinct e.user_id , h.name , e.title , e.cert_id , e.reg_dt , i.cert_date, g.work_flag                                         \n");
	query.append("      	from                                                                                                                            \n");
	query.append("      		TBL_JOB_LIST e, TBL_USER h, TBL_USER j ,                                                                                \n");
	query.append("            	(                                                                                                                       \n");
	query.append("            		select                                                                                                          \n");
	query.append("            			distinct job_no                                                                                         \n");
	query.append("            		from                                                                                                            \n");
	query.append("            			TBL_JOB_SYSTEM c LEFT JOIN                                                                              \n");
	query.append("            			(                                                                                                       \n");
	query.append("            				select                                                                                          \n");
	query.append("            					b.system_id, b.system_name, a.service_id                                                \n");
	query.append("                   			from                                                                                            \n");
	query.append("                   				TBL_SERVICE a RIGHT JOIN TBL_SYSTEM b ON a.service_id = b.service_id                    \n");
	query.append("                   		) d                                                                                                     \n");
	query.append("             	   ON c.system_id = d.system_id                                                                                         \n");
	query.append("             ) f , TBL_SMS_WORK g, TBL_JOB_SYSTEM i                                                                                       \n");
	query.append("   where e.job_no = f.job_no and e.admit_flag = 1 and h.cell_num = g.cell_num and e.cert_id = g.conn_key                                  \n");
	query.append("         and e.USER_ID = h.user_id and e.oper_id = j.user_id                                                                              \n");
	query.append("         and EXISTS                                                                                                                       \n");
	query.append("         (                                                                                                                                \n");
	query.append("         	select                                                                                                                          \n");
	query.append("         		distinct i.job_no                                                                                                       \n");
	query.append("         	from                                                                                                                            \n");
	query.append("         		TBL_JOB_SYSTEM j                                                                                                        \n");
	query.append("         	where                                                                                                                           \n");
	query.append("         		j.job_no = e.job_no                                                                                                     \n");
	query.append("         		and i.cert_date is null)                                                                                                \n");
	query.append("         )                                                                                                                                \n");
	query.append("         aa                                                                                                                               \n");
	query.append(")                                                                                                                                         \n");
	query.append("bb order by bb.reg_dt desc                                                                                                                \n");


	
	
	queryRunner = new QueryRunner("WorkedDao WorkedList(Connection conn,Tray reqTray)",query.toString(), reqTray); 
	rsTray = (ResultSetTray)queryRunner.query(conn);
	
return rsTray;
}





//신청현황 -> 인증키 미사용 현황 LIST

//flagValues
//div = left menu values
//
//request values
//kind	= 공통 
//user_id	= 공통



public ResultSetTray KeyNotList(Connection conn,Tray reqTray){
	 
	QueryRunner    queryRunner = null;
	ResultSetTray  rsTray      = null;
	StringBuffer   query       = null;
	
	query=new StringBuffer();

	
	
	
	
	
	query.append("SELECT 																	\n");
	query.append("	bb.user_id,bb.name,bb.intention,bb.cert_id,bb.reg_dt,bb.work_flag,bb.tbl                                                                \n");
	query.append("FROM                                                                                                                                      \n");
	query.append("(                                                                                                                                         \n");
	query.append(" 	select                                                                                                                                  \n");
	query.append(" 		aa.user_id,aa.name,aa.intention,aa.cert_id,aa.reg_dt,aa.work_flag ,'C' as tbl                                                   \n");
	query.append("    	from(                                                                                                                           \n");
	query.append("    		SELECT                                                                                                                  \n");
	query.append("    			distinct a.user_id, d.name, ifnull(a.apply_date,'') as apply_date,                                              \n");
	query.append("    			ifnull(a.intention,'') as intention, a.cert_id, a.admit_flag,                                                   \n");
	query.append("    			a.reg_dt , f.work_flag                                                                                          \n");
	query.append("         	FROM                                                                                                                            \n");
	query.append("         		TBL_CONN_CERT_KEY a, TBL_SYSTEM b, TBL_SERVICE c, TBL_USER d , TBL_CONN_SYSTEM e, TBL_SMS_WORK f                        \n");
	query.append("                WHERE                                                                                                                     \n");
	query.append("                	a.user_id = d.user_id                                                                                                   \n");
	query.append("                	and a.admit_flag = '1'                                                                                                  \n");
	query.append("                	and a.cert_id = e.cert_id                                                                                               \n");
	query.append("                	and e.system_id = b.system_id                                                                                           \n");
	query.append("                        and b.service_id = c.service_id                                                                                   \n");
	//query.append("if( !div.equals("") && !div.equals("ALL")  ){                                                                                             \n");
	query.append("		    and c.SERVICE_ID = :div                                                                                                     \n");
	query.append("}                                                                                                                                         \n");
	query.append("	            and d.cell_num = f.cell_num and a.cert_id = f.conn_key                                                                      \n");
	query.append("               	    and EXISTS(select distinct e.cert_id from TBL_CONN_SYSTEM f where f.cert_id = a.cert_id and e.cert_date is null)    \n");
	//query.append("if(kind.equals("O")){                                                                                                                     \n");
	query.append("                    and EXISTS(select service_id from TBL_SVC_USER f where c.service_id = f.service_id and f.charger_id = :user_id)       \n");
	query.append("}                                                                                                                                         \n");
	query.append("                       ) aa                                                                                                               \n");
	query.append("union all                                                                                                                                 \n");
	query.append("select                                                                                                                                    \n");
	query.append("	aa.user_id,aa.name,aa.title,aa.cert_id,aa.reg_dt,aa.work_flag ,'J' as tbl                                                               \n");
	query.append("from(                                                                                                                                     \n");
	query.append("	select                                                                                                                                  \n");
	query.append("		distinct e.user_id , h.name , e.title , e.cert_id , e.reg_dt , i.cert_date, g.work_flag                                         \n");
	query.append("      	from                                                                                                                            \n");
	query.append("      		TBL_JOB_LIST e, TBL_USER h, TBL_USER j ,                                                                                \n");
	query.append("            	(                                                                                                                       \n");
	query.append("            		select                                                                                                          \n");
	query.append("            			distinct job_no                                                                                         \n");
	query.append("            		from                                                                                                            \n");
	query.append("            			TBL_JOB_SYSTEM c LEFT JOIN                                                                              \n");
	query.append("            			(                                                                                                       \n");
	query.append("            				select                                                                                          \n");
	query.append("            					b.system_id, b.system_name, a.service_id                                                \n");
	query.append("                   			from                                                                                            \n");
	query.append("                   				TBL_SERVICE a RIGHT JOIN TBL_SYSTEM b ON a.service_id = b.service_id                    \n");
	//query.append("if( kind.equals("O") ){                                                                                                                   \n");
	query.append("				        where EXISTS(select aa.service_id from TBL_SERVICE aa where aa.charger_id = :user_id )                  \n");
	query.append("}                                                                                                                                         \n");
	query.append("                   		) d                                                                                                     \n");
	query.append("             	   ON c.system_id = d.system_id                                                                                         \n");
	//query.append("if( !div.equals("") && !div.equals("ALL") ){                                                                                              \n");
	query.append("              where d.SERVICE_ID = :div                                                                                                   \n");
	query.append("}                                                                                                                                         \n");
	query.append("             ) f , TBL_SMS_WORK g, TBL_JOB_SYSTEM i                                                                                       \n");
	query.append("   where e.job_no = f.job_no and e.admit_flag = 1 and h.cell_num = g.cell_num and e.cert_id = g.conn_key                                  \n");
	query.append("         and e.USER_ID = h.user_id and e.oper_id = j.user_id                                                                              \n");
	query.append("         and EXISTS                                                                                                                       \n");
	query.append("         (                                                                                                                                \n");
	query.append("         	select                                                                                                                          \n");
	query.append("         		distinct i.job_no                                                                                                       \n");
	query.append("         	from                                                                                                                            \n");
	query.append("         		TBL_JOB_SYSTEM j                                                                                                        \n");
	query.append("         	where                                                                                                                           \n");
	query.append("         		j.job_no = e.job_no                                                                                                     \n");
	query.append("         		and i.cert_date is null)                                                                                                \n");
	query.append("         )                                                                                                                                \n");
	query.append("         aa                                                                                                                               \n");
	query.append(")                                                                                                                                         \n");
	query.append("bb order by bb.reg_dt desc                                                                                                                \n");



	
	
	queryRunner = new QueryRunner("WorkedDao WorkedList(Connection conn,Tray reqTray)",query.toString(), reqTray); 
	rsTray = (ResultSetTray)queryRunner.query(conn);
	
return rsTray;
}




//신청현황 -> 시스템 사용신청 현황 List


//flagValue
//div	= left request vlaue
//
//request values
//kind	= 공통



public ResultSetTray SystemUseList(Connection conn,Tray reqTray){
	 
	QueryRunner    queryRunner = null;
	ResultSetTray  rsTray      = null;
	StringBuffer   query       = null;
	
	query=new StringBuffer();

	query.append("SELECT 										\n");
	query.append("	a.user_id, b.name, a.service_id, a.system_id, a.admit_flag,                     \n");
	query.append("	ifnull(a.intention, ' '), ifnull(a.apply_date, ' '),b.TYPE ,a.reg_dt            \n");
	query.append("FROM                                                                              \n");
	query.append("	TBL_USER_SYSTEM a, TBL_USER  b                                                  \n");
	query.append("WHERE                                                                             \n");
	query.append("	a.user_id = b.user_id                                                           \n");
	query.append("	and b.admit_flag = '1'                                                          \n");
	query.append("	and a.admit_flag='0'                                                            \n");
	//query.append("if( !div.equals("") && !div.equals("ALL") ){                                      \n");
	query.append("	and upper(a.service_id)=upper(:div)                                             \n");
	query.append("}		                                                                        \n");
	//query.append("if(kind.equals("O")){                                                             \n");
	query.append("	and EXISTS(select service_id from TBL_SVC_USER c                                \n");
	query.append("	where c.service_id = a.service_id                                               \n");
	query.append("	and c.charger_id =:user_id                                                      \n");
	query.append("	)                                                                               \n");
	query.append("}                                                                                 \n");


	
	
	queryRunner = new QueryRunner("WorkedDao WorkedList(Connection conn,Tray reqTray)",query.toString(), reqTray); 
	rsTray = (ResultSetTray)queryRunner.query(conn);
	
return rsTray;
}









//신청현황 -> 	계정 신청현황 List


//flagValues
//div = left Menue value
//
//request vlaues
//user_id	= 공통
//kind	= 공통


public ResultSetTray UserInputList(Connection conn,Tray reqTray){
	 
	QueryRunner    queryRunner = null;
	ResultSetTray  rsTray      = null;
	StringBuffer   query       = null;
	
	query=new StringBuffer();

	query.append("SELECT             								\n");                                           	             
	query.append("	a.user_id, a.name, b.company_name,                    		                \n");
	query.append("	a.kind, a.apply_date, a.intention,                    		                \n");
	query.append("	a.REG_DT                                              		                \n");
	query.append("FROM                                                          	                \n");
	query.append("	TBL_USER a right                                      		                \n");
	query.append("	join TBL_COMPANY b on a.company_id = b.company_id     		                \n");
	query.append("WHERE                                                         	                \n");
	query.append("	a.admit_flag = '0'                                    		                \n");
	query.append("	and a.kind != 'A'                                   	  	                \n");
	query.append("	and  a.company_id is not null                   	      	                \n");
	//query.append("if( kind.equals("O")){	                                                        \n");      	             
	query.append("	and EXISTS                                                    	                \n");
	query.append("	(                                                             	                \n");
	query.append("		SELECT                                        			        \n");     
	query.append("			user_id                               				\n");             
	query.append("		FROM                                          			        \n");     
	query.append("			TBL_USER_SYSTEM c                     				\n");             
	query.append("		WHERE                                         			        \n");     
	query.append("			admit_flag = '0'                      				\n");             
	query.append("		and a.user_id = c.user_id                             		        \n");     
	query.append("		and EXISTS                                            		        \n");     
	query.append("			(                                             			\n");             
	query.append("			SELECT                                        			\n");             
	query.append("				charger_id                            			\n");	             
	query.append("			FROM                                          			\n");             
	query.append("				TBL_SVC_USER d                        			\n");	            
	query.append("			WHERE                                         			\n");        
	query.append("				c.service_id = d.service_id             		\n");	                                                  
	query.append("				and d.charger_id =:user_id               		\n");	                                                  
	query.append("			)                                              			\n");                                   
	query.append("	)                                                                               \n");                   
	query.append("}        	                                                                        \n");


	
	
	queryRunner = new QueryRunner("WorkedDao WorkedList(Connection conn,Tray reqTray)",query.toString(), reqTray); 
	rsTray = (ResultSetTray)queryRunner.query(conn);
	
return rsTray;
}






//신청현황 -> NT 작업신청현황

//flag values
//div 	= left메뉴에서 넘어 오는 값
//
//request values
//kind	= 공통
//user_id = 공통


public ResultSetTray NtWorkList(Connection conn,Tray reqTray){
	 
	QueryRunner    queryRunner = null;
	ResultSetTray  rsTray      = null;
	StringBuffer   query       = null;
	
	query=new StringBuffer();

	query.append("select 											\n");
	query.append("	e.user_id , e.title , e.from_dt , e.to_dt , e.reg_dt , e.admit_flag, e.job_no,h.name    \n");
	query.append("from                                                                                      \n");
	query.append("	TBL_JOB_LIST e, TBL_USER h,                                                             \n");
	query.append("	(                                                                                       \n");
	query.append("		select                                                                          \n");
	query.append("			distinct JOB_NO                                                         \n");
	query.append("		from                                                                            \n");
	query.append("			TBL_JOB_SYSTEM c,                                                       \n");
	query.append("				(                                                               \n");
	query.append("					select                                                  \n");
	query.append("						b.system_id, b.system_name,a.service_id         \n");
	query.append("					from                                                    \n");
	query.append("						TBL_SERVICE a, TBL_SYSTEM b                     \n");
	query.append("where a.service_id = b.service_id                                                         \n");
	//query.append("if( kind.equals("O")){                                                                    \n");
	query.append("	and EXISTS(                                                                             \n");
	query.append("		select                                                                          \n");
	query.append("			aa.service_id                                                           \n");
	query.append("		from                                                                            \n");
	query.append("			TBL_SVC_USER aa                                                         \n");
	query.append("		where                                                                           \n");
	query.append("			aa.charger_id= :user_id)                                                \n");
	query.append("}                                                                                         \n");
	query.append("  ) d                                                                                     \n");
	query.append(" 	where c.system_id = d.system_id                                                         \n");
	//query.append("if( !div.equals("") && !div.equals("ALL") ){                                              \n");
	query.append("	and d.SERVICE_ID = :div                                                                 \n");
	query.append("}                                                                                         \n");
	query.append(" ) f                                                                                      \n");
	query.append("where e.job_no = f.job_no                                                                 \n");
	query.append("	and e.admit_flag = 0                                                                    \n");
	query.append("	and e.user_id =  h.user_id                                                              \n");
	query.append("	ORDER BY e.reg_dt desc                                                                  \n");


	
	
	queryRunner = new QueryRunner("WorkedDao WorkedList(Connection conn,Tray reqTray)",query.toString(), reqTray); 
	rsTray = (ResultSetTray)queryRunner.query(conn);
	
return rsTray;
}





//신청현황 -> Unix 작업신청현황 LIST
//user_id	= 공통 
//kind 	= 공통 



	public ResultSetTray UnixWorkList(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();
	
		query.append("SELECT a.user_id,	                                  				 \n");
		query.append("       b.name,                                        	                         \n");
		query.append("       ifnull(a.apply_date,' '),                      	                         \n");
		query.append("       ifnull(f.service_id,' ') as service_group,     	                         \n");
		query.append("       ifnull(a.system_id,' ') as system_id,           	                         \n");
		query.append("       ifnull(a.intention,' ') as work_conttens,      	                         \n");
		query.append("       ifnull(a.cert_id,' ') as cert_id,		       	                         \n");
		query.append("       a.reg_dt                                       	                         \n");
		query.append("FROM   TBL_CONN_CERT_KEY a,                           	                         \n");
		query.append("       TBL_USER b ,                                   	                         \n");
		query.append("       (SELECT distinct                               	                         \n");
		query.append("       		c.cert_id ,                         	  	                 \n");
		query.append("       		d.service_id                          		                 \n");
		query.append("        FROM TBL_CONN_SYSTEM c,                       	                         \n");
		query.append("	        (SELECT                               		                         \n");
		query.append("	        		b.system_id,                 		                 \n");
		query.append("	                b.system_name,                		                         \n");
		query.append("	                a.service_id                  		                         \n");
		query.append("	         FROM                                 		                         \n");
		query.append("	         	TBL_SERVICE a,                			                 \n");
		query.append("	            TBL_SYSTEM b	                  		                 \n");
		query.append("	         WHERE a.service_id = b.service_id    				         \n");
		//query.append("if( !div.equals("") && !div.equals("ALL") ){ //left메뉴 플래그 값에 따른 분기  	 \n");									
		//query.append("	and a.service_id = "+Qutter(div)+"		                                 \n");
		query.append("}                                                                                  \n");
		query.append("                                                                                   \n");
		//query.append("if(kind.equals("O")){	//레벨이 운영자 일 경우                                  \n");
		query.append("	        and EXISTS(select aa.service_id  				         \n");
		query.append("	        from TBL_SVC_USER aa   							 \n");
		//query.append("	        where aa.charger_id="+Qutter(user_id)+")		                 \n");
		query.append("}                                                                                  \n");
		query.append("				        ) d                           			 \n");
		query.append("			 WHERE c.system_id = d.system_id              		         \n");
		query.append("			        ) f                                   		         \n");
		query.append("		WHERE a.cert_id = f.cert_id                           	                 \n");
		query.append("		  and a.user_id = b.user_id                           	                 \n");
		query.append("		  and a.admit_flag = '0'                              		         \n");
		query.append("		  order by a.reg_dt desc                                                 \n");

	
		
		
		queryRunner = new QueryRunner("WorkedDao WorkedList(Connection conn,Tray reqTray)",query.toString(), reqTray); 
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
	return rsTray;
	}




//	======================================================================================
//	사용자 관리 목록 불러오기 
//=====================================================================================


	public ResultSetTray UserManagementList(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();
	
		query.append("			select distinct a.user_id,a.name,c.COMPANY_NAME,						\n");
				query.append("				a.cell_num,a.KIND,														|n");						
				query.append("					date_format(a.last_login_dt,'%Y/%m/%d %H:%i'),				                                                |n");
				query.append("							a.SESSION_POLICY_ID,								                        |n");
				query.append("		 		ifnull(f.name,'담당자없음') as CNAME,a.ADMIT_FLAG 				                                                |n");
				query.append("		 	from TBL_USER a left join TBL_COMPANY c  							                                        |n");
				query.append("						on a.company_id = c.company_id 							                                |n");
				query.append("						    left join TBL_USER f  on a.charger_id = f.user_id 	                                                        |n");
				query.append("		 	where a.admit_flag='1' 												                        |n");
				query.append("                                                                                                                                                          |n");
				query.append("                                                                                                                                                          |n");
				//query.append("		if (KIND.equals("O")){ 													 //   관리자 일 경우    |n");
				query.append("		                                                                                                                                                |n");
				query.append("		                                                                                                                                                |n");
				query.append("		 and a.kind != 'A' and a.kind!='O' 									                                        |n");
				query.append("		 and exists(select service_id 										                                        |n");
				query.append("		 		from TBL_USER_SYSTEM c 											                        |n");
				query.append("				where c.user_id = a.user_id and c.admit_flag='1' 				                                                |n");
				query.append("		 and exists(select service_id 										                                        |n");
				query.append("				from TBL_SVC_USER d 											                        |n");
				query.append("				where c.service_id = d.service_id 								                                |n");
			//	query.append("		 and d.charger_id = '"+user_id+"')) 									                                        |n");
				query.append("		}                                                                                                                                               |n");
				query.append("		                                                                                                                                                |n");
			//	query.append("  }else if(div.equals("admin") || div.equals("operator")) {						//   left 조건문                                |n");
				query.append("		                                                                                                                                                |n");
				query.append("		                                                                                                                                                |n");
				query.append("		select distinct a.user_id,a.name,c.COMPANY_NAME,						                                                |n");
				query.append("					a.cell_num,a.KIND,											                |n");
				query.append("				date_format(a.last_login_dt,'%Y/%m/%d %H:%i'),					                                                |n");
				query.append("					a.SESSION_POLICY_ID,										                        |n");
				query.append("		 		ifnull(f.name,'담당자없음') as CNAME,a.ADMIT_FLAG 				                                                |n");
				query.append("		 from TBL_USER a left join 											                                |n");
				query.append("				TBL_COMPANY c  on a.company_id = c.company_id 					                                                |n");
				query.append("					left join TBL_USER f  on a.charger_id = f.user_id 			                                                |n");
				query.append("		 	where a.admit_flag='1' 												                        |n");
				query.append("                                                                                                                                                          |n");
				query.append("                                                                                                                                                          |n");
			//	query.append("		if (div.equals("admin")){											   //    left 조건 문           |n");
				query.append("		and a.KIND='A' 														                        |n");
				query.append("		}else{                                                                                                                                          |n");
				query.append("		and a.KIND='O' 														                        |n");
				query.append("		}                                                                                                                                               |n");
				query.append("		                                                                                                                                                |n");
				query.append("  }else{                                                                                                                                                  |n");
				query.append("		select distinct a.user_id,a.name,b.COMPANY_NAME,						                                                |n");
				query.append("				a.cell_num,a.KIND,												                |n");
				query.append("						date_format(a.last_login_dt,'%Y/%m/%d %H:%i'),			                                                |n");
				query.append("							a.SESSION_POLICY_ID,								                        |n");
				query.append("		 		ifnull(f.name,'담당자없음') as CNAME ,a.ADMIT_FLAG  				                                                |n");
				query.append("		 from TBL_USER a left join TBL_COMPANY b  							                                                |n");
				query.append("				on a.company_id =b.company_id 									                                |n");
				query.append("					left join TBL_USER_SYSTEM c on a.user_id = c.user_id 		                                                        |n");
				query.append("					left join TBL_USER f  on a.charger_id = f.user_id 			                                                |n");
				query.append("		 where a.admit_flag='1' and c.admit_flag = '1' 						                                                        |n");

	
		
		
		queryRunner = new QueryRunner("WorkedDao WorkedList(Connection conn,Tray reqTray)",query.toString(), reqTray); 
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
	return rsTray;
	}





//	=======================================================================================
//	사용자 관리 (시스템 목록 불러 주기 )
//=======================================================================================



	
	

	public ResultSetTray UserManagementSystemList(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();
	

		query.append("	SELECT a.SERVICE_ID,a.SYSTEM_ID,						\n");				
		query.append("			a.EXP_DATE,IFNULL(a.CONN_TYPE,'C') AS  CONN_TYPE , b.host_id 	\n");
		query.append("	FROM TBL_USER_SYSTEM a , TBL_SYSTEM b 						\n");			
		query.append("			WHERE  a.admit_flag='1' and 					\n");				
		query.append("	a.USER_ID =:userid and a.system_id = b.system_id  				\n");
		
		
		queryRunner = new QueryRunner("WorkedDao WorkedList(Connection conn,Tray reqTray)",query.toString(), reqTray); 
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
	return rsTray;
	}


//	/=========================================================================================
//	장비 목록 불러 오기  (서비스 사용 장비 현황_장비 접속  )
//=========================================================================================

	
	public ResultSetTray UserUseServerConnList(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();
	

		//query.append("if (KIND.equals("A") || KIND.equals("O")){				// 관리자 및 운용자 (매니저)			\n");
		query.append("		                                                                                                                \n");
		query.append("		select b.service_name,a.system_name,a.reg_dt,						                        \n");
		query.append("		ifnull(a.updt_dt,'') 									                        \n");
		query.append("		updt_dt, a.service_id,a.system_id ,							                        \n");
		query.append("			a.OSTYPE ,a.host_id,a.system_ip							                        \n");
		query.append("		 from TBL_SYSTEM a left join 								                        \n");
		query.append("				TBL_SERVICE b on a.service_id=b.service_id  				                        \n");
		//query.append("			where b.service_id is not null "+STR_AND);                                                              \n");
		//query.append("				                                                                                                \n");
		//query.append("		if (KIND.equals("O")) {									// 일반 사용자          \n");
		query.append("		 and a.service_id in (select service_id from 						                        \n");
		//query.append("		 TBL_SVC_USER where charger_id='"+SID+"'"		                                                        \n");
		//query.append("		 order by " + str_order					                                                        \n");
		query.append("		                                                                                                                \n");
		query.append("		                                                                                                                \n");
		//query.append("		}else if (KIND.equals("M") || KIND.equals("G")){                                                                \n");
		query.append("		                                                                                                                \n");
		query.append("			select   c.service_name, b.system_name, d.reg_dt, 					                \n");
		query.append("					ifnull(a.updt_dt,'') updt_dt, a.service_id,a.system_id  	                        \n");
		query.append("			from T  BL_SYSTEM a left join										\n");	
		query.append("					TBL_SERVICE b on a.service_id=b.service_id 					        \n");
		query.append("			where   b.service_id is not null									\n");	
		query.append("		 	and d.  system_id = b.system_id 									\n");	
						
		
		queryRunner = new QueryRunner("WorkedDao WorkedList(Connection conn,Tray reqTray)",query.toString(), reqTray); 
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
	return rsTray;
	}



//	===========================================================================                           
//	장비 목록 불러 오기  (서비스 사용 장비 현황_삭제  )             
//===========================================================================                           

	public ResultSetTray UserUseServeDeleterList(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();


	//	query.append("and  upper(a.service_id)=upper('"+div+"')";   // left 메뉴  값 			\n");
		query.append("                                                                                  \n");
		query.append("                                                                                  \n");
		query.append("select b.service_id,a.system_name,a.system_id,a.reg_dt,				\n");	
		query.append("ifnull(a.updt_dt,'') updt_dt,a.charger_id, a.OSTYPE,a.system_ip,a.HOST_ID         \n");
		query.append("from TBL_SYSTEM a left join TBL_SERVICE b on a.service_id=b.service_id 	        \n");
		query.append("where   b.service_id is not null +STR_AND                                         \n");
		query.append("                                                                                  \n");
	//	query.append("if (KIND.equals("O")) { //운용자일 경우                                           \n");
		query.append("and a.service_id in 								\n");						
	//	query.append("(select service_id from TBL_SVC_USER where charger_id='"+userid+"')		\n");	
		
		
		queryRunner = new QueryRunner("WorkedDao WorkedList(Connection conn,Tray reqTray)",query.toString(), reqTray); 
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
	return rsTray;
	}



}	//Class }