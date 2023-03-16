package console.admin.dao;
//====================================================================================
//시스템구분 : CONSOLE
//실행  환경  : TOMCAT, MySql, JAVA
//프로그램명 : 
//기      능     :  회원가입에 관한 전체 DB
//특이  사항   :  
//=====================================================================================

import java.sql.Array;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.StringTokenizer;

import console.common.sql.QueryRunner;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.list.BoardBean;
import console.common.dao.BaseDao;

import console.common.util.Util;



public class AdminDao extends BaseDao{
public String nextpage="";


private String substring(String str_find, int i, int j)
{
	String str = substring(str_find, i, j);
	return str;
}

private int length(String str_find)
{
	int xx = 0;
	xx = str_find.length();
	return xx;
}
//======================================================================================
//									사용자 관리 목록 불러오기 
//=====================================================================================
public ResultSetTray AdminUserList(Connection conn,Tray reqTray){
	 
	QueryRunner    queryRunner = null;
	ResultSetTray  rsTray      = null;
	StringBuffer   query       = null;

	query=new StringBuffer();
	
	String key 			= "";
	String find 		= "";		
	String div 			= "";		// left 값 
	String str_order	= "";		// 정렬 
	String str_value	= "";		// 정렬
	String KIND			= "";		// 사용자 유형 
	String name 		= "";		// 사용자 이름 
	String user_id		= "";		// 사용자 아이디 
	
	KIND   		= 	reqTray.getString("kind");			 	 // 사용자 종류 
	name   		= 	reqTray.getString("name");				 // 사용자 이름
	user_id 		=	reqTray.getString("user_id"); 		 // 사용자 아이디 
	
	//KIND 		= 	"A";			//임시 사용자 유형 값 
	//userid 		= 	"ngsadmin";		//임시 아이디 값 
	
	key 		= 	reqTray.get("key");
	find 		= 	reqTray.get("find");
	div 		= 	reqTray.get("div");
	//KIND		=   reqTray.get("KIND");

	str_order 	=	reqTray.get("o");
	str_value 	= 	reqTray.get("s");

	if (str_value.equals("")) {str_value = "0";}
	if (str_order.equals("")) {str_order = "name";}
	if (str_value.equals("1")) str_order = str_order+" desc";

  if (div.equals("") || div.equals("ALL")){
		query.append("	select distinct a.user_id,a.name,c.COMPANY_NAME,					\n");
		query.append("		a.cell_num,a.KIND,												\n");
		query.append("			date_format(a.last_login_dt,'%Y/%m/%d %H:%i'),				\n");
		query.append("					a.SESSION_POLICY_ID,								\n");
		query.append(" 		ifnull(f.name,'담당자없음') as CNAME,a.ADMIT_FLAG 				\n");
		query.append(" 	from TBL_USER a left join TBL_COMPANY c  							\n");
		query.append("				on a.company_id = c.company_id 							\n");
		query.append("				    left join TBL_USER f  on a.charger_id = f.user_id 	\n");
		query.append(" 	where a.admit_flag='1' 												\n");
//		if(!find !=""){
//			$SQL = $SQL. " AND a." .$key . " = '".check_web2db($find). "' ";
//		}
		if (KIND.equals("O")){
		query.append(" and a.kind != 'A' and a.kind!='O' 									\n");
		query.append(" and exists(select service_id 										\n"); 
		query.append(" 		from TBL_USER_SYSTEM c 											\n");
		query.append("		where c.user_id = a.user_id and c.admit_flag='1' 				\n");
		query.append(" and exists(select service_id 										\n");
		query.append("		from TBL_SVC_USER d 											\n");
		query.append("		where c.service_id = d.service_id 								\n");
		query.append(" and d.charger_id = '"+user_id+"')) 									\n");
		}
		
  }else if(div.equals("admin") || div.equals("operator")) {
		query.append("select distinct a.user_id,a.name,c.COMPANY_NAME,						\n");
		query.append("			a.cell_num,a.KIND,											\n");
		query.append("		date_format(a.last_login_dt,'%Y/%m/%d %H:%i'),					\n");
		query.append("			a.SESSION_POLICY_ID,										\n");
		query.append(" 		ifnull(f.name,'담당자없음') as CNAME,a.ADMIT_FLAG 				\n");
		query.append(" from TBL_USER a left join 											\n"); 
		query.append("		TBL_COMPANY c  on a.company_id = c.company_id 					\n");
		query.append("			left join TBL_USER f  on a.charger_id = f.user_id 			\n");
		query.append(" 	where a.admit_flag='1' 												\n");
//		IF ($find !=""){
//			$SQL = $SQL. " AND a." .$key . " = '".check_web2db($find). "' ";
//		}

		if (div.equals("admin")){
		query.append("and a.KIND='A' 														\n");
		}else{
		query.append("and a.KIND='O' 														\n");
		}
		
  }else{
		query.append("select distinct a.user_id,a.name,b.COMPANY_NAME,						\n");
		query.append("		a.cell_num,a.KIND,												\n");
		query.append("				date_format(a.last_login_dt,'%Y/%m/%d %H:%i'),			\n");
		query.append("					a.SESSION_POLICY_ID,								\n");
		query.append(" 		ifnull(f.name,'담당자없음') as CNAME ,a.ADMIT_FLAG  				\n");
		query.append(" from TBL_USER a left join TBL_COMPANY b  							\n");
		query.append("		on a.company_id =b.company_id 									\n");
		query.append("			left join TBL_USER_SYSTEM c on a.user_id = c.user_id 		\n");
		query.append("			left join TBL_USER f  on a.charger_id = f.user_id 			\n");
		query.append(" where a.admit_flag='1' and c.admit_flag = '1' 						\n");
//		IF ($find != ""){
//			$SQL = $SQL. " AND a." .$key . " = '" .$find. "' ";
//		}
		if (KIND.equals("O")){
		query.append(" and a.kind != 'A' and a.kind!='O' 									\n");
		}
		query.append(" and c.service_id = '"+div+"' 										\n");
		  
			}
		if(!reqTray.getString("txtsearch").equals("")){
	
			String value = reqTray.getString("txtsearch");
			System.out.println(value+"========================");
			if(reqTray.getString("selectoption").equals("USERID")){  query.append("  AND a.user_id like "); //like 함수 표현 방식(페이지 모든 검색조건이 이렇게 구성되어 있음
																     query.append("'%");
																     query.append(value);
																     query.append("%'"); }  
			if(reqTray.getString("selectoption").equals("USERNAME")){query.append("  AND a.name like ");
																	 query.append("'%");
																	 query.append(value);
																	 query.append("%'"); 
												}
		}
		query.append(" order by a."+str_order);
	
//	$AllRsCnt = $db->NumRows($SQL);  //전체 레코드수 

	queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
	rsTray = (ResultSetTray)queryRunner.query(conn);
	
	//reg_data
	
return rsTray;
}

//echo $SQL;

//=======================================================================================
//							 사용자 관리 (시스템 목록 불러 주기 )
//=======================================================================================
	public ResultSetTray UserSystemList(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;

		query=new StringBuffer();
		
		String KIND		=	"";
		String name 	=	"";
		String user_id	=	"";
		String company	=	"";
		
		
		//공통 값 
		KIND   		= 	reqTray.getString("kind");					 // 사용자 종류 
		name   		= 	reqTray.getString("name");			 		 // 사용자 이름
		user_id 		=	reqTray.getString("user_id"); 	 		 // 사용자 아이디 
		company		=	reqTray.getString("company");	     		 // 회사 
		
		KIND 		=	"A";								 		 // 임시 사용자 유형 
		user_id		= 	"ngsadmin";							 		 // 임시 아이디 
		
		query.append("	SELECT a.SERVICE_ID,a.SYSTEM_ID,										\n");
		query.append("			a.EXP_DATE,IFNULL(a.CONN_TYPE,'C') AS  CONN_TYPE , b.host_id 	\n");
		query.append("	FROM TBL_USER_SYSTEM a , TBL_SYSTEM b 									\n");
		query.append("			WHERE  a.admit_flag='1' and 									\n");
		query.append("	a.USER_ID =:userid and a.system_id = b.system_id  						\n"); 

		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data
		
	return rsTray;
	}
//=======================================================================================
//								사용자 관리 (수정목록 불러 오기 )
//=======================================================================================
	public ResultSetTray UserEditList(Connection conn,Tray reqTray){

		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();
		String user_id	=	"";
		String gubun	=	"";
		String uid		=	"";
		
//		
//		uid 			=	reqTray.get("uid");
		gubun			=	reqTray.get("g");
//
		query.append("	select user_id,password,NAME,Kind,TYPE,INTENTION,					 \n");
		query.append("			COMPANY_ID,CELL_NUM,COMPANY_TEL, 							 \n");
		query.append("			COMPANY_FAX,RSNO,CHARGER_ID,IFNULL(SESSION_POLICY_ID,'') 	 \n");
		query.append("			SESSION_POLICY_ID,IFNULL(isported,'0')						 \n");
		query.append("			isported,cert_date,cert_key 							   	 \n");
		query.append("	from TBL_USER  where user_id=		:uid							 \n");
		
		
//		query.append(" select COMPANY_ID,COMPANY_NAME from TBL_COMPANY \n"); //전체 레코드수 
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
			//reg_data

	return rsTray;
}

//=======================================================================================
//									사용자관리 (service_id) 
//=======================================================================================
	public ResultSetTray UserServiceId(Connection conn,Tray reqTray,String uid){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;

		query=new StringBuffer();
		
//		IF ($uKind=="O" || $uKind=="A"){
//		$sys="select service_id from TBL_SVC_USER where charger_id='".$uid."'";
//		$row = $db->queryFetch($sys);
//		IF(count($row)!=0){
//			for($i=0; $i<count($row); $i++){
//				$service_id=$row[$i][0].",".$service_id;
//
//			}
//			$service_id=substr($service_id,0,strlen($service_id)-1);
//		}
		query.append("	select service_id 								\n"); 
		query.append("			from TBL_SVC_USER 						\n");
		query.append("				where charger_id	=	:uid		\n");
		
		//query.append(" select COMPANY_ID,COMPANY_NAME from TBL_COMPANY \n"); //전체 레코드수 

		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data
		
	return rsTray;
	}
//=======================================================================================
//							사용자 관리 (System 리스트)
//=======================================================================================
	public ResultSetTray UserSystemList2(Connection conn,Tray reqTray, String uid){

		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();
		
//		}ELSEIF ($uKind!="O"){
		query.append("	select a.system_id,b.host_id,a.service_id,a.intention,a.REG_DT 			\n");
		query.append("			from TBL_USER_SYSTEM a,TBL_SYSTEM b 							\n");
		query.append("			where a.user_id='"+uid+"' 							     		\n");
		query.append("		and a.system_id=b.system_id and admit_flag !=-1 					\n");
		query.append(" 		order by system_name desc											\n");
		
//		query.append(" select COMPANY_ID,COMPANY_NAME from TBL_COMPANY \n"); //전체 레코드수 
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data

	return rsTray;
}

//=======================================================================================
//									SMS 
//=======================================================================================
	public ResultSetTray UserSmsWork(Connection conn,Tray reqTray,String uid){

		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();
		String hp			=	"";		// 추후에 작업 예정 SMS 인증 확인 
		String cert_key		=	"";		// 추후에 작업 예정 SMS 인증 확인 
		
//		If (($uKind =="G" || $uKind=="M") && $cert_date==""){
		query.append("select work_flag  												\n");
		query.append("		from TBL_SMS_WORK where 									\n"); 
		query.append("				cell_num='"+hp+"' and conn_key='"+cert_key+"'		\n");
//		
		
//		query.append(" select COMPANY_ID,COMPANY_NAME from TBL_COMPANY \n"); //전체 레코드수 
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data

	return rsTray;
}



//=======================================================================================
//								회사 이름 불러 오기 
//=======================================================================================
	public ResultSetTray CompanyName(Connection conn,Tray reqTray){

		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();
		
		query.append(" select COMPANY_ID,COMPANY_NAME from TBL_COMPANY \n"); //전체 레코드수 
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);

//reg_data

	return rsTray;
}

//=====================================================================================
//								서비스 선택 목록 불러 오기 
//=====================================================================================
		public ResultSetTray service_list(Connection conn,Tray reqTray){
			 
			QueryRunner    queryRunner = null;
			ResultSetTray  rsTray      = null;
			StringBuffer   query       = null;
			
			
			String STR_AND  =   "";
			String cid		=	"";
			String KIND		=	"";
			
			KIND 	=	reqTray.get("kind");	//공통 사용자 유형 값 
			
			query=new StringBuffer();
			
			//$STR_AND=" and b.charger_id='".base64_Decode($cid)."' ";  Deconde 로 id 암호화 부분 
//			STR_AND = " and b.charger_id=:cid";
		    
//			query.append("	SELECT b.SERVICE_id 	 						\n");
//			query.append("  	from TBL_SERVICE a , 						\n");
//		    query.append("       TBL_SVC_USER b , 							\n");
//		    query.append("     	  TBL_SVC_COMPANY c 						\n");
//		    query.append("		 where b.SERVICE_id = a.SERVICE_id "+STR_AND);
//		    query.append("   and b.service_id = c.service_id 				\n");
//		    query.append("   and c.company_id = :com						\n");
//		    query.append(" 	order by a.SERVICE_NAME 						\n");
					
			STR_AND=" and b.charger_id = :user_id ";
			if (!cid.equals("") || KIND.equals("A")){
				STR_AND=" and b.charger_id=:cid ";
			}

			query.append("	SELECT b.SERVICE_ID 									\n");
			query.append("		from TBL_SERVICE a , TBL_SVC_USER b 				\n");
			query.append("			where b.SERVICE_id = a.SERVICE_id "+STR_AND		   );	
			query.append(" order by a.SERVICE_NAME									\n");
	

			queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
			rsTray = (ResultSetTray)queryRunner.query(conn);
			
			//reg_data
			System.out.println(rsTray);
		return rsTray;
		}

		
//=========================================================================================
//							서비스 네임 목록 불러 오기 (회원 가입 )
//=========================================================================================
	public ResultSetTray JoinSysName(Connection conn,Tray reqTray){
		 
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();
		
		query.append("select service_id,upper(service_name) 				\n");
		query.append("			from TBL_SERVICE 							\n");
		query.append("				where service_id not in					\n");
		query.append("	(select service_id from TBL_SVC_USER 				\n"); 
		query.append("		where charger_id=:uid	)						\n");
		query.append("			order by UPPER(service_name) 				\n");
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data
		
	return rsTray;
	}
	
//=========================================================================================
//							서비스 네임 목록 불러 오기2 (회원 가입 )
//=========================================================================================
	public ResultSetTray JoinSysName2(Connection conn,Tray reqTray){

		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		
		query=new StringBuffer();
		
		query.append("select a.service_id,b.service_name 				\n"); 
		query.append("		from TBL_SVC_USER a,TBL_SERVICE b 			\n");
		query.append("where a.charger_id=:uid							\n");
		query.append("		and a.service_id=b.service_id 				\n");
		query.append("	order by b.service_name							\n");
		

		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data
		
return rsTray;
}
	
//=====================================================================================
//							신청 시스템 목록 불러 오기 
//=====================================================================================
	public ResultSetTray app_system(Connection conn,Tray reqTray){

		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;

		query = new StringBuffer();
		
		int temp_len 			= 0;
		String sys_id 			= "";
		String str_find 		= "";
		
		
		sys_id = reqTray.getString("syc_id");		
	 	String[] values1 = sys_id.split(",");
	 	
	 	for(int x = 0; x < values1.length; x++ ){ 
	 	temp_len =+ x;	 
		  } 
		

//		if(svc_id == "" || svc_id == null)
//		{svc_id = "";}
			//String temp_sys_id = "";

				if (temp_len == 0){
				 	if (sys_id!=""){
						str_find=" and system_id<>:sys_id";
					}
				}else{
					String[] temp_sys_id = sys_id.split(",");
					for (int i=0 ;i< temp_len;i++){
						str_find="system_id!='"+temp_sys_id[i]+"'  and  "+str_find;
					}
					str_find = " and "+substring(str_find,0,length(str_find)-5);  //문자로 반환 
					}
				
				
				query.append("		select system_id,host_id 							\n");
				query.append("			from TBL_SYSTEM 								\n");
				query.append("		where upper(service_id)=upper(:svc_id)"+str_find 	   );
				query.append("		 and system_id not in 								\n"); 
				query.append("		(select system_id 									\n");
				query.append("		from TBL_USER_SYSTEM 								\n");
				query.append("		where user_id=:uid and admit_flag='1' and 			\n");
				query.append("			upper(service_id)=upper(:svc_id)) 				\n");
				query.append("		order by system_name								\n");
		
				queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
				rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data
		System.out.println(rsTray);
	return rsTray;
}

//===========================================================================
//								사용자 유형에 따른 관리자 분류
//===========================================================================
public ResultSetTray selectService1(Connection conn,Tray reqTray){

		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
			
		
		
		query=new StringBuffer();
		query.append("select user_id,name 										\n");
		query.append("			from TBL_USER 									\n");
		query.append("			where KIND ='A'  								\n");
		query.append("				and admit_flag='1' order by name			\n");
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
//reg_data

return rsTray;
}

//===========================================================================
//						사용자 유형에 따른 관리자 분류2
//===========================================================================
	public ResultSetTray selectService2(Connection conn,Tray reqTray){

		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		
		
		
		query=new StringBuffer();
		query.append("select user_id,name									\n");
		query.append("			from TBL_USER where kind='O'				\n");
		query.append(" 			and admit_flag='1'  order by name			\n");
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data
		
		return rsTray;
}

//===========================================================================
//						사용자 유형에 따른 관리자 분류3
//===========================================================================
	public ResultSetTray selectService3(Connection conn,Tray reqTray){

		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		
		
		
		query=new StringBuffer();
		query.append("select user_id,name 									\n");
		query.append("		from TBL_USER where kind='O' 					\n");
		query.append("				and admit_flag='1'  order by name		\n");
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data
		
	return rsTray;
	}
//===========================================================================
//							아이디 중복 확인 페이지 
//===========================================================================
	public ResultSetTray IdRepeat(Connection conn,Tray reqTray){

	QueryRunner    queryRunner = null;
	ResultSetTray  rsTray      = null;
	StringBuffer   query       = null;
	
	query=new StringBuffer();
	query.append("select USER_ID from TBL_USER where USER_ID=:uid			\n");
	
	queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
	rsTray = (ResultSetTray)queryRunner.query(conn);
	
	//reg_data

	return rsTray;
	}
	
//===========================================================================
//						아이디 중복 확인 페이지2 
//===========================================================================
	public ResultSetTray IdRepeat2(Connection conn,Tray reqTray){

		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();
		query.append("	select count(*) cnt from TBL_USER where user_id=:uid  \n");
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data

		return rsTray;
}
	
//	===========================================================================
//	아이디 중복 확인 페이지2 
//===========================================================================
	public ResultSetTray HpDuplicate(Connection conn,Tray reqTray){

		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		String hp = reqTray.get("hp1")+reqTray.get("hp2")+reqTray.get("hp3");
		System.out.println(hp);
		
		
		query=new StringBuffer();
		query.append("	select count(*) cnt 									\n");
		query.append("			from TBL_USER 									\n");
		query.append("	where cell_num='"+hp+"'									\n");
		//query.append("			 and to_number(admit_flag) >=0  			\n");
		
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data

		return rsTray;
}

	
	
/**
 * 
 * 
 * 관지자용 계정 신청 페이지 작성 
 * 작성자 이충섭:
 */ 
	
	public ResultSetTray adminInsert(Connection conn,Tray reqTray){
	
	QueryRunner    queryRunner = null;
	ResultSetTray  rsTray      = null;
	StringBuffer   query       = null;
	int count = 0;
	int islogined = 0;
	
	String KIND			= "";		// 사용자 유형 
	String name 		= "";		// 사용자 이름 
	String user_id		= "";		// 사용자 아이디 
	
	KIND   	= 	reqTray.getString("kind");			 	// 사용자 종류 
	name   	= 	reqTray.getString("name");			 	// 사용자 이름
	user_id 	=	reqTray.getString("userid"); 		 // 사용자 아이디 
		
	
/*	
 * 관리자용 변경로직 
 * 이충섭
 * 
 */
//	if (reqTray.getString("uKind").equals("O") || reqTray.getString("uKind")=="O")
//	{islogined = 1;}
	
		
		
	int isported = 0;	

	String sdate 			=   "";		// 날짜 
	String hp				=	"";		// 핸드폰 
	String fax				=	"";		// 팩스 
	String tel 				=	"";		// 전화 번호 
	String ssn				=	"";		// 주민등록 번호 
	String sys_intention 	=   "";		// 신청 목적 
	String REG_DT			=	"";		// 현재 날짜 
	String sType 			=   "";		//
	String oper  			=   "";		//
	
	sdate = Util.getDate();
	
	hp = reqTray.get("hp1")+reqTray.get("hp2")+reqTray.get("hp3");
	
	
	if (reqTray.get("tel1") == "" ||  reqTray.get("tel2")=="" || reqTray.get("tel3") == ""){
			tel ="";
	}else{
			tel =	reqTray.get("tel1")+"-"+reqTray.get("tel2")+"-"+reqTray.get("tel3");		
			}
	
	
	if (reqTray.get("fax1") == "" || reqTray.get("fax2") == "" || reqTray.get("fax3") == ""){
			fax ="";
	}else{
		fax =	reqTray.get("fax1")+"-"+reqTray.get("fax2")+"-"+reqTray.get("fax3");
	}
		   ssn 	=	reqTray.get("ssn1")+reqTray.get("ssn2");			// 주민번호 초기화 
		   ssn  =   "";
	 
	
	if(reqTray.get("isported").equals("")) isported = 0;
	
	
	sys_intention = Util.DataFormat( reqTray.get("sys_intention") );
	
	REG_DT  = "now()";
	
	
	/*
	 *	최고 관리자용 타입 추가  
	 */	
//	System.out.println("#####################"+ sType+"#################");

	String admit_flag 	= "1";

	KIND 	 = reqTray.get("kind");
	sType 	 = reqTray.get("sType");
	oper	 = reqTray.get("oper");
	

	System.out.println("----  kind:" + KIND + " sType: " +sType+ " oper: " + oper+"------" );
	
	
//	if(kind.equals("A") &&  oper.equals(""))
//	{
//		oper = reqTray.get("user_id");
//	}
//	System.out.println("----  kind:" + kind + " sType: " +sType+ " oper: " + oper+"------" );
	
	
	String CERT_KEY_NUM = "9999999999";
	
	
	
	query=new StringBuffer();
	
	query.append("		insert                                                       				\n");
	query.append("		into TBL_USER                                                				\n");
	query.append("			(USER_ID,PASSWORD,KIND,CERT_KEY,INTENTION,COMPANY_ID,					\n");
	query.append("			 CELL_NUM,COMPANY_TEL,COMPANY_FAX,RSNO,              					\n");
	query.append("			 NAME,CHARGER_ID,islogined,isblocked,admit_flag,     					\n");
	query.append("			 isported,apply_date,REG_DT,type )                        				\n");
	query.append("		values(                                                     				\n");
	query.append("			:uid,:pwd1,:uKind,'"+CERT_KEY_NUM+"',:object, :company,     			\n");
	query.append("'"+hp+"','"+tel+"','"+fax+"','"+ssn+"',      										\n");
	query.append("			:uname ,'"+oper+"','"+islogined+"','0','"+admit_flag+"',"+isported+", 	\n");
	query.append("			'"+sdate+"',now(),:sType)	                           				 	\n");
	query.append("																					\n");
	
	
	queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
	count = queryRunner.update(conn);	//Update처리 Methode
	System.out.println("UpPos count:  "+count);
	
	//reg_data

	return rsTray;
	}	

	
	/**
	 * 
	 * TBL_SVC_SYSTEM
	 * 
	 * 
	 */
	
public ResultSetTray consolejoinins2(Connection conn,Tray reqTray){

	QueryRunner    queryRunner = null;
	ResultSetTray  rsTray      = null;
	StringBuffer   query       = null;
	int count = 0;
	query=new StringBuffer();
	
	
	String sdate 	= 	"";
	String REG_DT	=	"";
	
	sdate 		= 	Util.getDate();
	REG_DT  	= 	"now()";
	
		query.append("insert into TBL_SVC_USER  						\n");
		query.append(" 	(service_id,charger_id,reg_dt,reg_id) 			\n");
		query.append("			values (								\n");
		query.append("				:service_id		,					\n");
		query.append("				:uid			,					\n");
		query.append("				now()			,					\n");
		query.append("				:uid				)				\n");

		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		count = queryRunner.update(conn);	//Update처리 Methode
		System.out.println("UpPos count:  "+count);
		
		//reg_data

		return rsTray;
		}
//===========================================================================
//			 				신청 완료 페이지2-1
//===========================================================================
	public ResultSetTray consolejoinins2_1(Connection conn, Tray reqTray ){

		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int count = 0;
		
		query=new StringBuffer();
		
		
		String sdate 	= 	"";
		String REG_DT	=	"";
		
		sdate    =  Util.getDate();
		REG_DT   =  "now()";
			
		query.append("			insert into TBL_SVC_USER  						\n");
		query.append("		(service_id,charger_id,reg_dt,reg_id) values (		\n");
		query.append("		:sys_id,											\n");
		query.append("		:uid		  , 									\n");
		query.append("		now()		  ,										\n");
		query.append("		:uid					)							\n");
		

		//롤백처리
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		count = queryRunner.update(conn);	//Update처리 Methode
		System.out.println("UpPos count:  "+count);
		
		//reg_data
		
		return rsTray;
}	
//===========================================================================
//							신청 서비스 갯수 파악 
//===========================================================================
	public ResultSetTray svc_id(Connection conn,Tray reqTray){

		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();
		
		query.append("	select service_id 					\n");
		query.append("		from TBL_SYSTEM 				\n");
		query.append("			where system_id=:sys_id		\n");
		
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data
	
	return rsTray;
}


	
	
	
	/**
	 * 
	 * 
	 * TBL_USER_SYSTEM 등록 
	 * 
	 * 일반 사용자 등록 G / M
	 * 
	 * 
	 * 
	 */
	public ResultSetTray admdinUserSystmeIns(Connection conn,Tray reqTray, String svc_id){
		
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int count = 0;
		query=new StringBuffer();
		
		String sdate 			= "";
		String sys_intention 	= "";
		String REG_DT			= "";
		
		
		sdate = Util.getDate();
		REG_DT  = "now()";
		
		
		sys_intention = reqTray.get("sys_intention");
		sys_intention = Util.DataFormat(sys_intention);
		
		
			query.append("				insert into TBL_USER_SYSTEM              		\n");
			query.append("				(USER_ID,SERVICE_ID,SYSTEM_ID,ADMIT_DATE,		\n");
			query.append("				APPLY_DATE,INTENTION,ADMIT_FLAG,         		\n");
			query.append("				REG_DT,REG_ID,conn_type) VALUES (         		\n");
			query.append("				:uid,                                    		\n");
			query.append("				'"+svc_id+"',                					\n");
			query.append("				:sys_id,                                 		\n");
			query.append("				'"+sdate+"',                                  	\n");
			query.append("				'"+sdate+"',                                  	\n");
			query.append("				'"+sys_intention+"',                          	\n");
			query.append("				'1',                                       		\n");
			query.append("				"+REG_DT+",                                 	\n");
			query.append("				:uid, :sType	)                         		\n");	

			queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
			count = queryRunner.update(conn);	//Update처리 Methode
			System.out.println("UpPos count:  "+count);
//reg_data

	return rsTray;
	}

		
		
		
//===========================================================================
//							신청 서비스 갯수 파악2
//===========================================================================
		public ResultSetTray temp_sys_id(Connection conn,Tray reqTray, String temp_sys_id){

			QueryRunner    queryRunner = null;
			ResultSetTray  rsTray      = null;
			StringBuffer   query       = null;
			
//			String hp = reqTray.get("hp1")+reqTray.get("hp2")+reqTray.get("hp3");
//			System.out.println(hp);
			
//			String service_id2="";
//			
//			int rowcount = 0;
//
//			service_id2 = reqTray.getString("sys_id");
//			String[] temp_sys_id = service_id2.split(",");
//			for( int x = 0; x < temp_sys_id.length; x++ ){ 
//			System.out.println( "문자" + (x+1) + " = " + temp_sys_id[x] ); 
			System.out.println(temp_sys_id);
			
			query =new StringBuffer();
			
			query.append("	select service_id								    \n"); 
			query.append("		from TBL_SYSTEM								    \n"); 	
			query.append("			where system_id = '"+temp_sys_id+"'  	    \n");
			
//			}
			
			queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
			rsTray = (ResultSetTray)queryRunner.query(conn);
			
			
			//reg_data

			return rsTray;
	}
//===========================================================================
//								 신청 완료 페이지4
//===========================================================================
	public ResultSetTray consolejoinins4(Connection conn,Tray reqTray, String service_id, String temp_sys_id){

		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int count = 0;
		
		query=new StringBuffer();
		
		String sdate 			= 	"";
		String REG_DT			=	"";
		String sys_intention	=	"";
		
		sdate = Util.getDate();
		REG_DT  = "now()";
		sys_intention = reqTray.get("sys_intention");

		
		query.append("	insert into TBL_USER_SYSTEM 						\n");
		query.append("		(USER_ID,SERVICE_ID,SYSTEM_ID,ADMIT_DATE,		\n");
		query.append("			APPLY_DATE,INTENTION,ADMIT_FLAG,conn_type	\n");
		query.append("				REG_DT,REG_ID) VALUES (					\n");
		query.append("				:uid,									\n");
		query.append("				'"+service_id+"',						\n");
		query.append("				'"+temp_sys_id+"',						\n");
		query.append("				'"+sdate+"'	,							\n");
		query.append("				'"+sdate+"'	,							\n");
		query.append("				'"+sys_intention+"',					\n");
		query.append("				'0',									\n");
		query.append("				"+REG_DT+",								\n");
		query.append("				:uid, :sType)							\n");

		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		count = queryRunner.update(conn);	//Update처리 Methode
		System.out.println("UpPos count:  "+count);
		
		//reg_data

	return rsTray;
	}

//	=======================================================================================
//										회사 이름 불러 오기 
//	=======================================================================================
		public ResultSetTray Company_Id(Connection conn,Tray reqTray){
			 
			QueryRunner    queryRunner = null;
			ResultSetTray  rsTray      = null;
			StringBuffer   query       = null;

			query=new StringBuffer();
			
			query.append(" select COMPANY_ID,COMPANY_NAME from TBL_COMPANY \n");	 //전체 레코드수 
			
			queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
			rsTray = (ResultSetTray)queryRunner.query(conn);
			
			//reg_data
			
		return rsTray;
		}
		
//	===========================================================================
//									사용자 유형에 따른 관리자 분류
//	===========================================================================
	public ResultSetTray User_Id(Connection conn,Tray reqTray){

			QueryRunner    queryRunner = null;
			ResultSetTray  rsTray      = null;
			StringBuffer   query       = null;
			
				
			
			
			query=new StringBuffer();
			query.append("select user_id,name 										\n");
			query.append("			from TBL_USER 									\n");
			query.append("			where KIND ='A'  								\n");
			query.append("				and admit_flag='1' order by name			\n");
			
			queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
			rsTray = (ResultSetTray)queryRunner.query(conn);
			
//	reg_data

	return rsTray;
	}

//	===========================================================================
//							사용자 유형에 따른 관리자 분류2
//	===========================================================================
		public ResultSetTray User_Id2(Connection conn,Tray reqTray){

			QueryRunner    queryRunner = null;
			ResultSetTray  rsTray      = null;
			StringBuffer   query       = null;
			
			
			
			
			query=new StringBuffer();
			query.append("select user_id,name									\n");
			query.append("			from TBL_USER where kind='O'				\n");
			query.append(" 			and admit_flag='1'  order by name			\n");
			
			queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
			rsTray = (ResultSetTray)queryRunner.query(conn);
			
			//reg_data
			
			return rsTray;
	}

//	===========================================================================
//									신청 완료 페이지  
//	===========================================================================
		public ResultSetTray consolejoinin(Connection conn,Tray reqTray){
		
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int count = 0;
		
		int islogined = 0;					// 사용자 유형 
		if (reqTray.getString("uKind").equals("O") || reqTray.getString("uKind")=="O")
		{islogined = 1;}
		
		String sdate = "";					// 현재 날짜
		String fax = "";					// fax
		String tel ="";						// 회사 전화
		String hp = "";						// 핸드폰 번호 
		
		
		sdate = Util.getDate();		
		
		hp = reqTray.get("hp1")+reqTray.get("hp2")+reqTray.get("hp3");
		
		if (reqTray.get("tel1") == "" ||  reqTray.get("tel2")=="" || reqTray.get("tel3") == ""){
				tel ="";
		}else{
				tel =	reqTray.get("tel1")+"-"+reqTray.get("tel2")+"-"+reqTray.get("tel3");		
				}
		
		if (reqTray.get("fax1") == "" || reqTray.get("fax2") == "" || reqTray.get("fax3") == ""){
				fax ="";
		}else{
			fax =	reqTray.get("fax1")+"-"+reqTray.get("fax2")+"-"+reqTray.get("fax3");
		}
		
		String ssn 	=	reqTray.get("ssn1")+reqTray.get("ssn2");			// 주민번호 초기화 
			   ssn  =   "";
		 
		int isported = 0;
		if(reqTray.get("isported") == "") isported = 0;
		
		String sys_intention = "";
		sys_intention = (reqTray.get("sys_intention"));
		


		sys_intention = Util.DataFormat(sys_intention);
//		sys_intention = str_replace("<","&lt;",sys_intention);
//		sys_intention = str_replace("&","&amp;",sys_intention);
//		sys_intention = str_replace("|","chr(124)_pipe",sys_intention);
		String REG_DT  = "now()";
		
//		int CERT_KEY_NUM =  random(10);
		int CERT_KEY_NUM = 0000000000;		// 랜덤으로 10자리의 숫자를 입력 
		
		
		
		query=new StringBuffer();
		
		query.append("		insert                                                       	\n");
		query.append("		into TBL_USER                                                	\n");
		query.append("			(USER_ID,PASSWORD,KIND,CERT_KEY,INTENTION,COMPANY_ID,		\n");
		query.append("			 CELL_NUM,COMPANY_TEL,COMPANY_FAX,RSNO,              		\n");
		query.append("			 NAME,CHARGER_ID,islogined,isblocked,admit_flag,     		\n");
		query.append("			 isported,apply_date,REG_DT )                        		\n");
		query.append("		values(                                                     	\n");
		query.append("			:uid,:pwd1,:uKind,'"+CERT_KEY_NUM+"',:object, :company,     \n");
		query.append("'"+hp+"','"+tel+"','"+fax+"','"+ssn+"',      							\n");
		query.append("			:uname ,:oper,'"+islogined+"','0','0',"+isported+", 		\n");
		query.append("			'"+sdate+"',now()			)	                            \n");
		query.append("																		\n");
		
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		count = queryRunner.update(conn);	//Update처리 Methode
		System.out.println("UpPos count:  "+count);
		
		//reg_data

		return rsTray;
		}	

		


//	===========================================================================
//								 신청 서비스 등록 
//	===========================================================================
		public ResultSetTray App_Service(Connection conn,Tray reqTray){

		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		int count = 0;
		query=new StringBuffer();
		
//		String svc_id = "";
//		svc_id = reqTray2.get("service_id");
		
		String sdate = "";
		sdate = Util.getDate();
		String REG_DT  = "now()";
		
			query.append("insert into TBL_SVC_USER  						\n");
			query.append(" 	(service_id,charger_id,reg_dt,reg_id) 			\n");
			query.append("			values (								\n");
			query.append("				:service_id		,					\n");
			query.append("				:uid			,					\n");
			query.append("				now()			,					\n");
			query.append("				:uid				)				\n");

			queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
			count = queryRunner.update(conn);	//Update처리 Methode
			System.out.println("UpPos count:  "+count);
			
			//reg_data

			return rsTray;
			}
//	===========================================================================
//				 				신청 서비스 등록(여러개의 시스템이 들어올 경우)
//	===========================================================================
		public ResultSetTray AppServices(Connection conn, Tray reqTray, String temp_svc_id ){

			QueryRunner    queryRunner = null;
			ResultSetTray  rsTray      = null;
			StringBuffer   query       = null;
			int count = 0;
			
			query=new StringBuffer();
			
//			svc_id = reqTray.get("service_id");
//			String svc_id = "";
			
//			String sdate = "";
//			sdate = Util.getDate();
//			String REG_DT  = "now()";
				
//			String service_id2 = "";									//서비스 시스템 분리				
//			service_id2 = reqTray.getString("service_id");
//			String[] service_id = service_id2.split(",");
//			for( int x = 0; x < service_id.length; x++ ){ 
//			System.out.println( "문자" + (x+1) + " = " + service_id[x] ); 
//			
			query.append("			insert into TBL_SVC_USER  						\n");
			query.append("		(service_id,charger_id,reg_dt,reg_id) values (		\n");
			query.append("		'"+temp_svc_id+"',									\n");
			query.append("		:uid		  , 									\n");
			query.append("		now()		  ,										\n");
			query.append("		:uid					)							\n");
//			}

			queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
			count = queryRunner.update(conn);	//Update처리 Methode
			System.out.println("UpPos count:  "+count);
			
			//reg_data
			
			return rsTray;
	}	
//	===========================================================================
//								신청 서비스 에 대한 service_id 구하기  
//	===========================================================================
		public ResultSetTray Service_Id(Connection conn,Tray reqTray){

			QueryRunner    queryRunner = null;
			ResultSetTray  rsTray      = null;
			StringBuffer   query       = null;
			
			query=new StringBuffer();
			
			query.append("	select service_id 					\n");
			query.append("		from TBL_SYSTEM 				\n");
			query.append("			where system_id=:sys_id		\n");
			//		$svc_id=$row["service_id"];
			
			
			queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
			rsTray = (ResultSetTray)queryRunner.query(conn);
			
			//reg_data
		
		return rsTray;
	}
//	===========================================================================
//						svc_id 에 대한 갯수 별로 service_id 등록 
//	===========================================================================
		public ResultSetTray consolejoinins3(Connection conn,Tray reqTray, String svc_id){
			
			QueryRunner    queryRunner = null;
			ResultSetTray  rsTray      = null;
			StringBuffer   query       = null;
			int count = 0;
			query=new StringBuffer();
			
			String sdate = "";
			String sys_intention = "";
			String REG_DT = "";
			
			sdate = Util.getDate();
			REG_DT  = "now()";
			
			
			sys_intention = reqTray.get("sys_intention");
			sys_intention = Util.DataFormat(sys_intention);
			
				query.append("				insert into TBL_USER_SYSTEM              		\n");
				query.append("				(USER_ID,SERVICE_ID,SYSTEM_ID,ADMIT_DATE,		\n");
				query.append("				APPLY_DATE,INTENTION,ADMIT_FLAG,         		\n");
				query.append("				REG_DT,REG_ID) VALUES (                  		\n");
				query.append("				:uid,                                    		\n");
				query.append("				'"+svc_id+"',                					\n");
				query.append("				:sys_id,                                 		\n");
				query.append("				'"+sdate+"',                                  	\n");
				query.append("				'"+sdate+"',                                  	\n");
				query.append("				'"+sys_intention+"',                          	\n");
				query.append("				'0',                                       		\n");
				query.append("				"+REG_DT+",                                 	\n");
				query.append("				:uid)                                    		\n");	

				queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
				count = queryRunner.update(conn);	//Update처리 Methode
				System.out.println("UpPos count:  "+count);
//	reg_data

		return rsTray;
		}

	}



	

