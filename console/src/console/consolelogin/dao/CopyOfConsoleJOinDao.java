//====================================================================================
//시스템구분 : CONSOLE
//실행  환경  : TOMCAT, MySql, JAVA
//프로그램명 : 
//기      능     :  회원가입에 관한 전체 DB
//특이  사항   :  
//=====================================================================================
package console.consolelogin.dao;

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

public class CopyOfConsoleJOinDao extends BaseDao{
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

//=======================================================================================
//									회사 이름 불러 오기 
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
	
//	  $STR_AND=" and b.charger_id='".base64_Decode($cid)."' ";
//    $SVC="SELECT b.SERVICE_id  ";
//    $SVC=$SVC."  from TBL_SERVICE a , ";
//    $SVC=$SVC."       TBL_SVC_USER b , ";
//    $SVC=$SVC."       TBL_SVC_COMPANY c ";
//    $SVC=$SVC." where b.SERVICE_id = a.SERVICE_id ".$STR_AND;
//    $SVC=$SVC."   and b.service_id = c.service_id ";
//    $SVC=$SVC."   and c.company_id = '".$company_id."' ";
//    $SVC=$SVC." order by a.SERVICE_NAME ";
//	  $row = $db->queryFetch($SVC);
//=====================================================================================
//								서비스 선택 목록 불러 오기 
//=====================================================================================
		public ResultSetTray service_list(Connection conn,Tray reqTray){
			 
			QueryRunner    queryRunner = null;
			ResultSetTray  rsTray      = null;
			StringBuffer   query       = null;
			String STR_AND = "";
			query=new StringBuffer();
			
			//$STR_AND=" and b.charger_id='".base64_Decode($cid)."' ";  Deconde 로 id 암호화 부분 
			STR_AND = " and b.charger_id=:cid";
		    
			query.append("	SELECT b.SERVICE_id 	 					\n");
			query.append("  	from TBL_SERVICE a , 					\n");
		    query.append("       TBL_SVC_USER b , 						\n");
		    query.append("     	  TBL_SVC_COMPANY c 					\n");
		    query.append("		 where b.SERVICE_id = a.SERVICE_id "+STR_AND);
		    query.append("   and b.service_id = c.service_id 			\n");
		    query.append("   and c.company_id =:com						\n");
		    query.append(" 	order by a.SERVICE_NAME 					\n");
	

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
		
//		$SQL="select a.service_id,b.service_name from TBL_SVC_USER a,TBL_SERVICE b ";
//		$SQL=$SQL."where a.charger_id='".$uid."' and a.service_id=b.service_id ";
//		$SQL=$SQL."order by b.service_name";
		
		
		
		
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
//		<?
//				$temp_len=str_count($sys_id);
//
//				IF ($temp_len==0 ){
//				 	if ($sys_id!=""){
//						$str_find=" and system_id<>'".$sys_id."' ";
//					}
//				}ELSE{
//					$temp_sys_id=split(",",$sys_id);
//					FOR ($i=0 ;$i< $temp_len;$i++){
//						$str_find=" system_id!='".$temp_sys_id[$i]."'  and  ".$str_find;
//					}
//					$str_find=" and ".substr($str_find,0,strlen($str_find)-5);
//				}
//
//				$sys="select system_id,host_id from TBL_SYSTEM where upper(service_id)=upper('".$svc_id."')".$str_find ;
//				$sys=$sys." and system_id not in (select system_id from TBL_USER_SYSTEM where user_id='".$uid."' and admit_flag='1' and upper(service_id)=upper('".$svc_id."')) order by system_name";
//				//echo $sys;
//				$row = $db->queryFetch($sys);
//		?>
//		
		String 	sys_id = reqTray.getString("syc_id");
	   	int temp_len = 0;		
	 	String[] values1 = sys_id.split(",");
	 	for(int x = 0; x < values1.length; x++ ){ 
	 	temp_len =+ x;	 
		  } 
		String str_find = "";

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
				//	$str_find=" and ".substr($str_find,0,strlen($str_find)-5);
					str_find = " and "+substring(str_find,0,length(str_find)-5);  //문자로 반환 
					}
				
//					StringTokenizer temp_sys_id = new StringTokenizer(sys_id,",");
//					for (int i=0 ;i< temp_len; i++){
//						str_find="system_id!='"+temp_sys_id[i]+"'  and  "+str_find;
//					}
//					str_find=" and ".substr(str_find,0,strlen(str_find)-5);
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
		query.append(" 			and admit_flag='1'  order by name		\n");
		
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
		//query.append("			 and to_number(admit_flag) >=0  				\n");
		
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data

		return rsTray;
}
//	
//	$islogined = 0;
//	IF ($uKind=="O"){ $islogined = 1;}
//	$sdate   = getDayFormat($NOW,4);
//	$uid		=	TRIM($_REQUEST["uid"]);
//	$pwd		=	TRIM($_REQUEST["pwd1"]);
//	$pwd     =   check_web2db($pwd);
//	$uKind	=	TRIM($_REQUEST["uKind"]);
//	$policy_id=	TRIM($_REQUEST["policy_id"]);
//	$sType	=	$_REQUEST["sType"];
//	$object	=	TRIM($_REQUEST["object"]);
//	$company	=	$_REQUEST["company"];
//	$ISPORTED = $_REQUEST["isported"];
//	IF($ISPORTED =="") $ISPORTED = 0;
//
//	$hp		=	TRIM($_REQUEST["hp1"]).$_REQUEST["hp2"].$_REQUEST["hp3"];
//
//	IF ($_REQUEST["tel1"] == "" ||  $_REQUEST["tel2"]=="" || $_REQUEST["tel3"]==""){
//		$tel ="";
//	}ELSE{
//		$tel =	$_REQUEST["tel1"]."-".$_REQUEST["tel2"]."-".$_REQUEST["tel3"];
//	}
//
//	IF ($_REQUEST["fax1"] == "" || $_REQUEST["fax2"] == "" || $_REQUEST["fax3"] == ""){
//		$fax ="";
//	}ELSE{
//		$fax =	$_REQUEST["fax1"]."-".$_REQUEST["fax2"]."-".$_REQUEST["fax3"];
//	}
//	$ssn 	=	$_REQUEST["ssn1"].$_REQUEST["ssn2"];//                                   '주민번호 제거
//	$ssn="";
//	$uname	=	TRIM($_REQUEST["uname"]);
//	$uname   =   check_web2db($uname);
//	$oper	=	base64_Decode($_REQUEST["oper"]);
//
//	$sys_id          = TRIM($_REQUEST["sys_id"]);
//	$sys_name      = TRIM($_REQUEST["sys_name"]);
//	$service_id      = TRIM($_REQUEST["service_id"]);
//	$service_name = TRIM($_REQUEST["service_name"]);
//
//	$sys_intention=TRIM($_REQUEST["sys_intention"]);
//	$sys_intention = str_replace("'","''",$sys_intention);
//	$sys_intention = str_replace("<","&lt;",$sys_intention);
//	$sys_intention = str_replace("&","&amp;",$sys_intention);
//	$sys_intention = str_replace("|","chr(124)_pipe",$sys_intention);
//	$REG_DT        = "now()";
//
//IF ($uKind == "O" && $service_id==""){ echo ("<script>alert(\"정상적으로 계졍신청을 할수 없습니다. 다시 신청해주세요!\");history.back()</script>");}
//
//IF (($uKind == "G"  || $uKind == "M") && $sys_id== ""){echo ("<script>alert(\"정상적으로 계졍신청을 할수 없습니다.다시 신청해주세요!\");history.back()</script>");}
//
//	$ID_Duplicate="select count(*) cnt from TBL_USER where user_id='".$uid."' ";
//	$row = $db->queryOne($ID_Duplicate);
//
//	if( ( int)($row[cnt]) > 0 ) {
//		echo ("<script>alert(\"이미 등록된 ID 입니다. 중복체크를 해주세요\");history.back()</script>");
//	}
//
//
//	$HP_Duplicate="select count(*) cnt from TBL_USER where cell_num='".$hp."' and to_number(admit_flag) >=0";
//	$row = $db->queryOne($HP_Duplicate);
//
//	if( ( int)($row[cnt]) > 0 ){
//		echo ("<script>alert(\"이미 등록된 핸드폰 번호 입니다.\");history.back()</script>");
//	}
//
//	$CERT_KEY_NUM =  random_num(10);
//
////'사용자 계정을 TBL_USER 등록하는 쿼리
//		$INSERT_USER=" insert into TBL_USER (USER_ID,PASSWORD,KIND,CERT_KEY,INTENTION,COMPANY_ID,CELL_NUM,COMPANY_TEL,COMPANY_FAX,RSNO,NAME,CHARGER_ID,";
//		$INSERT_USER=$INSERT_USER."islogined,isblocked,admit_flag,isported,apply_date,REG_DT ) ";
//		$INSERT_USER=$INSERT_USER."values ('".$uid."','";
//		$INSERT_USER=$INSERT_USER.$pwd."','";
//		$INSERT_USER=$INSERT_USER.$uKind."','";
//		$INSERT_USER=$INSERT_USER.$CERT_KEY_NUM."','";
//		$INSERT_USER=$INSERT_USER.$object."','";
//		$INSERT_USER=$INSERT_USER.$company."','";
//		$INSERT_USER=$INSERT_USER.$hp."','";
//		$INSERT_USER=$INSERT_USER.$tel."','";
//		$INSERT_USER=$INSERT_USER.$fax."','"	;
//		$INSERT_USER=$INSERT_USER.$ssn."','";
//		$INSERT_USER=$INSERT_USER.$uname."','";
//		$INSERT_USER=$INSERT_USER.$oper."',"	;
//		$INSERT_USER=$INSERT_USER.$islogined.",";
//		$INSERT_USER=$INSERT_USER."0".",'";
//		$INSERT_USER=$INSERT_USER."0"."','";
//		$INSERT_USER=$INSERT_USER.$ISPORTED."','";
//		$INSERT_USER=$INSERT_USER.$sdate."',"		;
//		$INSERT_USER=$INSERT_USER."now()".")"	;
//		$result_user = $mysqli->query($INSERT_USER);
//
////' 사용자 유형 구분에 일반사용자는 TBL_USER_SYSTEM 운용자는 TBL_SVC_USER 에 등록 하는부분
//
//if($uKind=="O"){
//$temp_len=str_count($service_id);//						 '신청 서비스 갯수 파악
//IF ($temp_len==0){
//	$insert="insert into TBL_SVC_USER  (service_id,charger_id,reg_dt,reg_id) values ('";
//	$insert=$insert.$service_id."','";
//	$insert=$insert.$uid."',";
//	$insert=$insert."now()".",'";
//	$insert=$insert.$uid."')";
//	$result = $mysqli->query($insert);
//}ELSE{
//	$temp_svc_id=explode(",",$service_id); //서비스 시스템 분리
//	For ($i=0 ;$i<= $temp_len;$i++){
//		$insert="insert into TBL_SVC_USER  (service_id,charger_id,reg_dt,reg_id) values ('";
//		$insert=$insert.$temp_svc_id[$i]."','";
//		$insert=$insert.$uid."',";
//		$insert=$insert."now()".",'";
//		$insert=$insert.$uid."')";
//		$result = $mysqli->query($insert);
//		if($result!=1) break;
//	}
//}
//}else{
//$temp_len=str_count($sys_id);//						 '신청 서비스 갯수 파악
//IF ($temp_len==0){
//	$svc_id="select service_id from TBL_SYSTEM where system_id='".$sys_id."'";
//	$row = $db->queryOne($svc_id);
//	$svc_id=$row["service_id"];
//	$INSERT="insert into TBL_USER_SYSTEM (USER_ID,SERVICE_ID,SYSTEM_ID,ADMIT_DATE,APPLY_DATE,INTENTION,ADMIT_FLAG,";
//	$INSERT=$INSERT."REG_DT,REG_ID) VALUES (";
//	$INSERT=$INSERT."'".$uid."',";
//	$INSERT=$INSERT."'".$svc_id."',";
//	$INSERT=$INSERT."'".$sys_id."','";
//	$INSERT=$INSERT.$sdate."','";
//	$INSERT=$INSERT.$sdate."',";
//	$INSERT=$INSERT."'".$sys_intention."',";
//	$INSERT=$INSERT."'"."0"."',";
//	$INSERT=$INSERT.$REG_DT.",'";
//	$INSERT=$INSERT.$uid."')";
//	$result = $mysqli->query($INSERT);
//}ELSE{
//	$temp_sys_id=explode(",",$sys_id); //'신청 시스템 분리
//	For ($i=0 ;$i<= $temp_len;$i++){
//		$svc_id="select service_id from TBL_SYSTEM where system_id='".$temp_sys_id[$i]."'";
//		$row = $db->queryOne($svc_id);
//		$svc_id=$row["service_id"];
//		$INSERT="insert into TBL_USER_SYSTEM (USER_ID,SERVICE_ID,SYSTEM_ID,ADMIT_DATE,APPLY_DATE,INTENTION,ADMIT_FLAG,";
//		$INSERT=$INSERT."REG_DT,REG_ID) VALUES (";
//		$INSERT=$INSERT."'".$uid."',";
//		$INSERT=$INSERT."'".$svc_id."',";
//		$INSERT=$INSERT."'".$temp_sys_id[$i]."','";
//		$INSERT=$INSERT.$sdate."','";
//		$INSERT=$INSERT.$sdate."',";
//		$INSERT=$INSERT."'".$sys_intention."',";
//		$INSERT=$INSERT."'"."0"."',";
//		$INSERT=$INSERT.$REG_DT.",'";
//		$INSERT=$INSERT.$uid."')";
//		$result = $mysqli->query($INSERT);
//		if($result!=1) break;
//	}
//}
//}
//===========================================================================
//								신청 완료 페이지  
//===========================================================================
	public ResultSetTray consolejoinins(Connection conn,Tray reqTray){
	
	QueryRunner    queryRunner = null;
	ResultSetTray  rsTray      = null;
	StringBuffer   query       = null;
	
	int islogined = 0;
	if (reqTray.getString("uKind").equals("O") || reqTray.getString("uKind")=="O")
	{islogined = 1;}
	
//	SimpleDateFormat sdata = new SimpleDateFormat ("yyyy.MM.dd G 'at' hh:mm:ss a zzz");
//	Date sdate = new Date();
//	System.out.println(sdata);	
//	article.setReg_date(new Timestamp(System.currentTimeMillis()) );
//	String sdata = new Timestamp(System.currentTimeMillis());
	String sdate = "";
	sdate = Util.getDate();
	
	String hp = reqTray.get("hp1")+reqTray.get("hp2")+reqTray.get("hp3");
	System.out.println(hp);
	
	String tel ="";
	if (reqTray.get("tel1") == "" ||  reqTray.get("tel2")=="" || reqTray.get("tel3") == ""){
			tel ="";
	}else{
			tel =	reqTray.get("tel1")+"-"+reqTray.get("tel2")+"-"+reqTray.get("tel3");		
			}
	
	String fax = "";
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
//	sys_intention = str_replace("<","&lt;",sys_intention);
//	sys_intention = str_replace("&","&amp;",sys_intention);
//	sys_intention = str_replace("|","chr(124)_pipe",sys_intention);
	String REG_DT  = "now()";
	
//	int CERT_KEY_NUM =  random(10);
	
	int CERT_KEY_NUM = 0000000000;
	
	
	
	query=new StringBuffer();
	
	query.append("		insert                                                       	\n");
	query.append("		into TBL_USER                                                	\n");
	query.append("			(USER_ID,PASSWORD,KIND,CERT_KEY,INTENTION,COMPANY_ID,		\n");
	query.append("			 CELL_NUM,COMPANY_TEL,COMPANY_FAX,RSNO,              		\n");
	query.append("			 NAME,CHARGER_ID,islogined,isblocked,admit_flag,     		\n");
	query.append("			 isported,apply_date,REG_DT )                        		\n");
	query.append("		values(                                                     	\n");
	query.append("			:uid,:pwd,:uKind,"+CERT_KEY_NUM+",:object, :company,      	\n");
	query.append(hp+",'"+tel+"','"+fax+"',"+ssn+"       							\n");
	query.append("			:uname ,:oper,"+islogined+",0,0,"+isported+", 				\n");
	query.append("			"+sdate+",now()			)	                                \n");
	query.append("																		\n");
	
//	$INSERT_USER=$INSERT_USER."values ('".$uid."','";
//	$INSERT_USER=$INSERT_USER.$pwd."','";
//	$INSERT_USER=$INSERT_USER.$uKind."','";
//	$INSERT_USER=$INSERT_USER.$CERT_KEY_NUM."','";
//	$INSERT_USER=$INSERT_USER.$object."','";
//	$INSERT_USER=$INSERT_USER.$company."','";
//	$INSERT_USER=$INSERT_USER.$hp."','";
//	$INSERT_USER=$INSERT_USER.$tel."','";
//	$INSERT_USER=$INSERT_USER.$fax."','"	;
//	$INSERT_USER=$INSERT_USER.$ssn."','";
//	$INSERT_USER=$INSERT_USER.$uname."','";
//	$INSERT_USER=$INSERT_USER.$oper."',"	;
//	$INSERT_USER=$INSERT_USER.$islogined.",";
//	$INSERT_USER=$INSERT_USER."0".",'";
//	$INSERT_USER=$INSERT_USER."0"."','";
//	$INSERT_USER=$INSERT_USER.$ISPORTED."','";
//	$INSERT_USER=$INSERT_USER.$sdate."',"		;
//	$INSERT_USER=$INSERT_USER."now()".")"	;
//	
	queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
	rsTray = (ResultSetTray)queryRunner.query(conn);
	
	//reg_data

	return rsTray;
	}	

	


//===========================================================================
//							 신청 완료 페이지2
//===========================================================================
	public ResultSetTray consolejoinins2(Connection conn,Tray reqTray){

	QueryRunner    queryRunner = null;
	ResultSetTray  rsTray      = null;
	StringBuffer   query       = null;
	
	query=new StringBuffer();
	
//	String svc_id = "";
//	svc_id = reqTray2.get("service_id");
	
	String sdate = "";
	sdate = Util.getDate();
	String REG_DT  = "now()";
	
//	if(rsTray.get("uKind") == "O"){
//=========================================================================
//		String [] temp_svc_id = new String[10];
//		temp_svc_id [0] = reqTray.get("service_id");
//		int s_id = Integer.parseInt(reqTray.get("service_id")); //'신청 서비스 갯수 파악
//		
//		int temp_len = 0; 
//			StringTokenizer tokens = new StringTokenizer(reqTray2.get("service_id"),","); //서비스 시스템 분리
//			  for( int x = 1; tokens.hasMoreElements(); x++ ){ 
//		     System.out.println( "문자" + x + " = " + tokens.nextToken() ); 
//		     temp_len = +x;
//			  }					 
//		if (temp_len == 0){
	
		query.append("insert into TBL_SVC_USER  						\n");
		query.append(" 	(service_id,charger_id,reg_dt,reg_id) 			\n");
		query.append("			values (								\n");
		query.append("				:service_id		,					\n");
		query.append("				:uid			,					\n");
		query.append("				now()			,					\n");
		query.append("				:uid								\n");

//		}else{
//			StringTokenizer st = new StringTokenizer("this is a test");
//		     while (st.hasMoreTokens()) {
//		         System.out.println(st.nextToken());
//		     }
//			$temp_svc_id=explode(",",$service_id); //서비스 시스템 분리
//		String[] temp_svc_id = "";
//		StringTokenizer temp_svc_id2 = new StringTokenizer(reqTray.get("service_id"),","); //서비스 시스템 분리
//		while(temp_svc_id2.hasMoreTokens()){
//			int i =0 ;
//			temp_svc_id [i] = temp_svc_id2.nextToken();
//			i++;
//		}
//			  String str2 = "학교,집,회사,"; 
			
//			  String service_id2 = "";
//			  service_id2 = reqTray.getString("service_id");
//			  String[] service_id = service_id2.split(",");
//			  for( int x = 0; x < service_id.length; x++ ){ 
//			     System.out.println( "문자" + (x+1) + " = " + service_id[x] ); 
//
//			query.append("			insert into TBL_SVC_USER  						\n");
//			query.append("		(service_id,charger_id,reg_dt,reg_id) values (		\n");
//			query.append("'"+service_id[x]+"',										\n");
//			query.append("		:uid		  , 									\n");
//			query.append("		now()		  ,										\n");
//			query.append("		:uid												\n");
//
//			if($result!=1) break;
//			
//		}
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
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
		
		query=new StringBuffer();
		
//		String svc_id = "";
//		svc_id = reqTray.get("service_id");
		
		String sdate = "";
		sdate = Util.getDate();
		String REG_DT  = "now()";
		
		//if(rsTray.get("uKind") == "O"){
		//=========================================================================
		//String [] temp_svc_id = new String[10];
		//temp_svc_id [0] = reqTray.get("service_id");
		//int s_id = Integer.parseInt(reqTray.get("service_id")); //'신청 서비스 갯수 파악
		//
		//int temp_len = 0; 
		//StringTokenizer tokens = new StringTokenizer(reqTray2.get("service_id"),","); //서비스 시스템 분리
		//for( int x = 1; tokens.hasMoreElements(); x++ ){ 
		//System.out.println( "문자" + x + " = " + tokens.nextToken() ); 
		//temp_len = +x;
		//}					 
		//if (temp_len == 0){
		
//		query.append("insert into TBL_SVC_USER  						\n");
//		query.append(" 	(service_id,charger_id,reg_dt,reg_id) 			\n");
//		query.append("			values (								\n");
//		query.append("				:service_id		,					\n");
//		query.append("				:uid			,					\n");
//		query.append("				now()			,					\n");
//		query.append("				:uid								\n");
		
		//}else{
		//StringTokenizer st = new StringTokenizer("this is a test");
		//while (st.hasMoreTokens()) {
		//System.out.println(st.nextToken());
		//}
		//$temp_svc_id=explode(",",$service_id); //서비스 시스템 분리
		//String[] temp_svc_id = "";
		//StringTokenizer temp_svc_id2 = new StringTokenizer(reqTray.get("service_id"),","); //서비스 시스템 분리
		//while(temp_svc_id2.hasMoreTokens()){
		//int i =0 ;
		//temp_svc_id [i] = temp_svc_id2.nextToken();
		//i++;
		//}
		//String str2 = "학교,집,회사,"; 
		
		
		
		String service_id2 = "";				//서비스 시스템 분리				
		service_id2 = reqTray.getString("service_id");
		String[] service_id = service_id2.split(",");
		for( int x = 0; x < service_id.length; x++ ){ 
		System.out.println( "문자" + (x+1) + " = " + service_id[x] ); 
		
		query.append("			insert into TBL_SVC_USER  						\n");
		query.append("		(service_id,charger_id,reg_dt,reg_id) values (		\n");
		query.append("'"+service_id[x]+"',										\n");
		query.append("		:uid		  , 									\n");
		query.append("		now()		  ,										\n");
		query.append("		:uid												\n");
		}
		
		//if($result!=1) break;
		//
		//}
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
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
		
		String hp = reqTray.get("hp1")+reqTray.get("hp2")+reqTray.get("hp3");
		System.out.println(hp);
		
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
//===========================================================================
//							 신청 완료 페이지3
//===========================================================================
	public ResultSetTray consolejoinins3(Connection conn,Tray reqTray, Tray rsTray6){
		
		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();
		
		String sdate = "";
		sdate = Util.getDate();
		String REG_DT  = "now()";
	
//		$temp_len=str_count($service_id);//						 '신청 서비스 갯수 파악
//		IF ($temp_len==0){
//		String str = "학교,집,회사,게임방"; 
//		  int ee = 0;
//		  StringTokenizer tokens = new StringTokenizer( str, "," ); 
//		  for( int x = 1; tokens.hasMoreElements(); x++ ){ 
//		     System.out.println( "문자" + x + " = " + tokens.nextToken() ); 
//		     ee = +x;
//		  }
		
//		$temp_len=str_count($sys_id);//	
//		 int temp_len = 0; 
//		StringTokenizer tokens = new StringTokenizer(reqTray.get("sys_id"),","); //서비스 시스템 분리
//		  for( int x = 1; tokens.hasMoreElements(); x++ ){ 
//	     System.out.println( "문자" + x + " = " + tokens.nextToken() ); 
//	     temp_len = +x;
//       int temp_len = Integer.parseInt(reqTray.get("sys_id"));	// '신청 서비스 갯수 파악
		 
		
//		int temp_len = 0; 
//			StringTokenizer tokens = new StringTokenizer(reqTray.get("sys_id"),","); //서비스 시스템 분리
//			  for( int x = 1; tokens.hasMoreElements(); x++ ){ 
//		     System.out.println( "문자" + x + " = " + tokens.nextToken() ); 
//		     temp_len = +x;
//			  }
//			  
//			if (temp_len==0){
//			query.append("	select service_id 					\n");
//			query.append("		from TBL_SYSTEM 				\n");
//			query.append("			where system_id=:sys_id		\n");
//			$svc_id=$row["service_id"];
			
			query.append("				insert into TBL_USER_SYSTEM              		\n");
			query.append("				(USER_ID,SERVICE_ID,SYSTEM_ID,ADMIT_DATE,		\n");
			query.append("				APPLY_DATE,INTENTION,ADMIT_FLAG,         		\n");
			query.append("				REG_DT,REG_ID) VALUES (                  		\n");
			query.append("				:uid,                                    		\n");
			query.append("				:svc_id,                                 		\n");
			query.append("				:sys_id,                                 		\n");
			query.append("				"+sdate+",                                  	\n");
			query.append("				"+sdate+",                                  	\n");
			query.append("				:sys_intention,                          		\n");
			query.append("				0,                                       		\n");
			query.append("				"+REG_DT+",                                 		\n");
			query.append("				:uid)                                    		\n");	
//			}else{
		
//		String []  temp_svc_id = new String[99];
//		StringTokenizer temp_svc_id2 = new StringTokenizer(reqTray.get("sys_id"),","); //서비스 시스템 분리
//		while(temp_svc_id2.hasMoreTokens()){
//			int i =0 ;
//			temp_svc_id [i] = temp_svc_id2.nextToken();
//			i++;
//		} //'신청 시스템 분리
//$temp_sys_id=explode(",",$sys_id); //'신청 시스템 분리
				
//		  String service_id2 = "";
//		  service_id2 = reqTray.getString("sys_id");
//		  String[] temp_svc_id = service_id2.split(",");
//		  for( int x = 0; x < temp_svc_id.length; x++ ){ 
//		     System.out.println( "문자" + (x+1) + " = " + temp_svc_id[x] ); 
//
//			query.append("	select service_id								\n"); 
//			query.append("		from TBL_SYSTEM								\n"); 	
//			query.append("			where system_id='"+temp_svc_id[x]+"'    \n");
////			$svc_id=$row[service_id];
////			
//			query.append("	insert into TBL_USER_SYSTEM 						\n");
//			query.append("		(USER_ID,SERVICE_ID,SYSTEM_ID,ADMIT_DATE,		\n");
//			query.append("			APPLY_DATE,INTENTION,ADMIT_FLAG,			\n");
//			query.append("				REG_DT,REG_ID) VALUES (					\n");
//			query.append("				:uid,									\n");
//			query.append("				:svc_id,								\n");
//			query.append("				'"+temp_svc_id[x]+"',					\n");
//			query.append("				'"+sdate+"'								\n");
//			query.append("				'"+sdate+"'								\n");
//			query.append("				:sys_intention,							\n");
//			query.append("				0,										\n");
//			query.append("				'"+REG_DT+"',							\n");
//			query.append("				:uid	)								\n");
//		
//			}
//		}
//	query.append("select USER_ID from TBL_USER where USER_ID=:uid			\n");

queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
rsTray = (ResultSetTray)queryRunner.query(conn);

//reg_data

	return rsTray;
	}

		
		
		
//===========================================================================
//							신청 서비스 갯수 파악2
//===========================================================================
		public ResultSetTray temp_sys_id(Connection conn,Tray reqTray){

			QueryRunner    queryRunner = null;
			ResultSetTray  rsTray      = null;
			StringBuffer   query       = null;
			
			String hp = reqTray.get("hp1")+reqTray.get("hp2")+reqTray.get("hp3");
			System.out.println(hp);
			
			
			query=new StringBuffer();
			query.append("	select count(*) cnt 									\n");
			query.append("			from TBL_USER 									\n");
			query.append("	where cell_num='"+hp+"'									\n");
			//query.append("			 and to_number(admit_flag) >=0  				\n");
			
			
			queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
			rsTray = (ResultSetTray)queryRunner.query(conn);
			
			//reg_data

			return rsTray;
	}
//===========================================================================
//								 신청 완료 페이지4
//===========================================================================
	public ResultSetTray consolejoinins4(Connection conn,Tray reqTray, ResultSetTray rsTray8){

		QueryRunner    queryRunner = null;
		ResultSetTray  rsTray      = null;
		StringBuffer   query       = null;
		
		query=new StringBuffer();
		
		String sdate = "";
		sdate = Util.getDate();
		String REG_DT  = "now()";
		
		//$temp_len=str_count($service_id);//						 '신청 서비스 갯수 파악
		//IF ($temp_len==0){
		//String str = "학교,집,회사,게임방"; 
		//int ee = 0;
		//StringTokenizer tokens = new StringTokenizer( str, "," ); 
		//for( int x = 1; tokens.hasMoreElements(); x++ ){ 
		//System.out.println( "문자" + x + " = " + tokens.nextToken() ); 
		//ee = +x;
		//}
		
		//$temp_len=str_count($sys_id);//	
		//int temp_len = 0; 
		//StringTokenizer tokens = new StringTokenizer(reqTray.get("sys_id"),","); //서비스 시스템 분리
		//for( int x = 1; tokens.hasMoreElements(); x++ ){ 
		//System.out.println( "문자" + x + " = " + tokens.nextToken() ); 
		//temp_len = +x;
		//int temp_len = Integer.parseInt(reqTray.get("sys_id"));	// '신청 서비스 갯수 파악
		
		
		//int temp_len = 0; 
		//StringTokenizer tokens = new StringTokenizer(reqTray.get("sys_id"),","); //서비스 시스템 분리
		//for( int x = 1; tokens.hasMoreElements(); x++ ){ 
		//System.out.println( "문자" + x + " = " + tokens.nextToken() ); 
		//temp_len = +x;
		//}
		//
		//if (temp_len==0){
		//query.append("	select service_id 					\n");
		//query.append("		from TBL_SYSTEM 				\n");
		//query.append("			where system_id=:sys_id		\n");
		//$svc_id=$row["service_id"];
		
//		query.append("				insert into TBL_USER_SYSTEM              		\n");
//		query.append("				(USER_ID,SERVICE_ID,SYSTEM_ID,ADMIT_DATE,		\n");
//		query.append("				APPLY_DATE,INTENTION,ADMIT_FLAG,         		\n");
//		query.append("				REG_DT,REG_ID) VALUES (                  		\n");
//		query.append("				:uid,                                    		\n");
//		query.append("				:svc_id,                                 		\n");
//		query.append("				:sys_id,                                 		\n");
//		query.append("				'"+sdate+"',                                  	\n");
//		query.append("				'"+sdate+"',                                  	\n");
//		query.append("				:sys_intention,                          		\n");
//		query.append("				0,                                       		\n");
//		query.append("				'"+REG_DT+"',                                 	\n");
//		query.append("				:uid)                                    		\n");	
		//}else{
		
		//String []  temp_svc_id = new String[99];
		//StringTokenizer temp_svc_id2 = new StringTokenizer(reqTray.get("sys_id"),","); //서비스 시스템 분리
		//while(temp_svc_id2.hasMoreTokens()){
		//int i =0 ;
		//temp_svc_id [i] = temp_svc_id2.nextToken();
		//i++;
		//} //'신청 시스템 분리
		//$temp_sys_id=explode(",",$sys_id); //'신청 시스템 분리
		
		String service_id2 = "";
		
		int rowcount = 0;
		rowcount = rsTray8.getRowCount();
		service_id2 = rsTray8.getString("sys_id");
		String[] temp_svc_id = service_id2.split(",");
		for( int x = 0; x < temp_svc_id.length; x++ ){ 
		System.out.println( "문자" + (x+1) + " = " + temp_svc_id[x] ); 
		//query.append("	select service_id								\n"); 
		//query.append("		from TBL_SYSTEM								\n"); 	
		//query.append("			where system_id='"+temp_svc_id[x]+"'    \n");
		//$svc_id=$row[service_id];
		for (int i=0; i<rowcount; i++)
		{
		query.append("	insert into TBL_USER_SYSTEM 						\n");
		query.append("		(USER_ID,SERVICE_ID,SYSTEM_ID,ADMIT_DATE,		\n");
		query.append("			APPLY_DATE,INTENTION,ADMIT_FLAG,			\n");
		query.append("				REG_DT,REG_ID) VALUES (					\n");
		query.append("				:uid,									\n");
		query.append("				:svc_id,								\n");
		query.append("				'"+rsTray8.get("sys_id",i)+"',			\n");
		query.append("				"+sdate+"								\n");
		query.append("				"+sdate+"								\n");
		query.append("				:sys_intention,							\n");
		query.append("				0,										\n");
		query.append("				"+REG_DT+",							\n");
		query.append("				:uid	)								\n");
			}
		}
		
		//}
		//query.append("select USER_ID from TBL_USER where USER_ID=:uid			\n");
		
		queryRunner = new QueryRunner("LoginDao CheckLogin(Connection conn,Tray reqTray)",query.toString(), reqTray);
		rsTray = (ResultSetTray)queryRunner.query(conn);
		
		//reg_data

	return rsTray;
	}

}





	

