<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

include "../comm/inc/init.php";
include $_HOME["INC_HOME"]."/header.php";    //공통 인크르드 파일
include $_HOME["INC_HOME"]."/login_check.php";    //Login check

include $_HOME["FNC_HOME"]."/svc_system_sub.php";    // 쿼리문  function 
include $_HOME["FNC_HOME"]."/sms_send.php";    

		$islogined = 0;
		$sdate   = getDayFormat($NOW,4);



		//01.request 받는다
		$uid		=	TRIM($_REQUEST["uid"]);
		$pwd		=	TRIM($_REQUEST["pwd1"]);
		$uKind	=	TRIM($_REQUEST["uKind"]);
		$pre_kind  = TRIM($_REQUEST["pre_kind"]);

		$policy_id=	TRIM($_REQUEST["policy_id"]);
		$sType	=	$_REQUEST["sType"];  //  'C(접속별 승인), 기간별은 P(기간별 승인)
		$object	=	TRIM($_REQUEST["object"]);
		$company	=	$_REQUEST["company"];
		$ISPORTED = $_REQUEST["isported"];
		IF($ISPORTED =="") 
			$ISPORTED = 0;

		$hp		=	TRIM($_REQUEST["hp1"]).$_REQUEST["hp2"].$_REQUEST["hp3"];

		IF ($_REQUEST["tel1"] == "" ||  $_REQUEST["tel2"]=="" || $_REQUEST["tel3"]==""){
			$tel ="";
		}ELSE{
			$tel =	$_REQUEST["tel1"]."-".$_REQUEST["tel2"]."-".$_REQUEST["tel3"];
		}

		IF ($_REQUEST["fax1"] == "" || $_REQUEST["fax2"] == "" || $_REQUEST["fax3"] == ""){
			$fax ="";
		}ELSE{
			$fax =	$_REQUEST["fax1"]."-".$_REQUEST["fax2"]."-".$_REQUEST["fax3"];
		}
		$ssn 	=	$_REQUEST["ssn1"].$_REQUEST["ssn2"];//                                   '주민번호 제거
		$uname	=	TRIM($_REQUEST["uname"]);
		$oper	=	$_REQUEST["oper"];
		$cert_key=   $_REQUEST["cert_key"];
		$admit_flag = 1;
		$object = str_replace("'","''",$object);
		$object = str_replace("<","&lt;",$object);
		$object = str_replace(".","&amp;",$object);
		$object = str_replace("|","chr(124)_pipe",$object);

		$sys_id=TRIM($_REQUEST["sys_id"]);
		$sys_name=TRIM($_REQUEST["sys_name"]);
		$service_id=TRIM($_REQUEST["service_id"]);
		$sys_intention=TRIM($_REQUEST["sys_intention"]);
		$sys_intention = str_replace("'","''",$sys_intention);
		$sys_intention = str_replace("<","&lt;",$sys_intention);
		$sys_intention = str_replace(".","&amp;",$sys_intention);
		$sys_intention = str_replace("|","chr(124)_pipe",$sys_intention);

		$REG_DT = "now()";
		$MESSAGE  = "[".$uid."]"."로그인 인증키".$cert_key;






		
		//02.승인전 반려 여부 체크 
		$user_check="select count(user_id) cnt from TBL_USER  where user_id='".$uid."' and admit_flag = -1 ";
		//echo $user_check;exit;
		$row = $db->queryOne($user_check);

		if( ( int)$row[cnt] != 0) {
			WinLocation($_HOME['WEB_ROOT']."/application/return_false.html", "", "");
		}
		
		
		
		
	

    //03.사용자 승인 및 수정 사항 업데이트
	$update="update TBL_USER set ";
	$update=$update. "	USER_ID	='".$uid	."',";
	$update=$update. "	PASSWORD	='".$pwd	."',";
	$update=$update. "	NAME	='".$uname	."',";
	$update=$update. "	KIND	='".$uKind	."',";
	$update=$update. "	session_policy_id	='".$policy_id	."',";
	$update=$update. "	ADMIT_FLAG	=".$admit_flag.",";
	$update=$update. "	APPLY_DATE	=".	$sdate.",";
	$update=$update. "	ADMIT_DATE	=".	$sdate.",";
	$update=$update. "	ISLOGINED	=".$islogined	.",";
	$update=$update. "	CHARGER_ID	='".$oper		."',";
	$update=$update. "	UPDT_ID	='".$SID		."',";
	$update=$update. "	UPDT_DT	= now(),";
	$update=$update. "	INTENTION	='".$object	."',";
	$update=$update. "	CELL_NUM	='".$hp	."',";
	$update=$update. "	COMPANY_ID	='".$company	."',";
	$update=$update. "	COMPANY_TEL	='".$tel	."',";
	$update=$update. "	COMPANY_FAX	='".$fax	."',";
	$update=$update. "	RSNO	='".$ssn	."',";
	$update=$update. "	ISBLOCKED	="."0"	.",";
	$update=$update. "	ISPORTED	=".$ISPORTED .",";
	$update=$update. "	TYPE	='".$sType	."'";
	$update=$update. " where user_id='".$uid."'";
	
	
	$result = $mysqli->query($update);
	
	$result1 =1;
	$result2 = 1;
	$result3 = 1;
	
	
	
	
	
	//' 사용자 유형이 G 또는 M 일때 시스템 장비에 승인을 하는부분
	if ($uKind=="O"){
		$temp_len=str_count($service_id);
		$result1 = SERVICE_DEL($uid,"");
		IF ($service_id !=""  && $temp_len == 0){
			$result2= SERVICE_INS($uid,$service_id,$SID);
		}ELSEIF ($temp_len > 0  && $service_id !=""){
			$temp_svc_id=explode(",",$service_id);                   //'서비스 시스템 분리
			For ($i= 0 ; $i<= $temp_len;$i++){
				$result2 = SERVICE_INS($uid,$temp_svc_id[$i],$SID);
				if($result2!=1) break;
			}
		}
		If ($uKind != $pre_kind ){
			$delete_system = "delete from TBL_USER_SYSTEM WHERE USER_ID='".$uid."'";
			$result3 = $mysqli->query($delete_system);
		}		
		
		
	}ELSEIF($uKind=="G" || $uKind=="M"){
		$temp_len = str_count($sys_id);						// '신청 시스템 갯수 파악
		$result1 = SYSTEM_DEL($uid,"");
		IF ($uKind=="G" && $sType=="P"){
			$admit_flag="0";
		}
		IF ($temp_len == 0 && $sys_id !=""){
			$result2 = SYSTEM_INS($uid,$sys_id,$sdate,$sys_intention,$admit_flag,$REG_DT,$sType,$SID);
		}ELSEIF($temp_len > 0 && $sys_id !=""){
			$temp_sys_id=explode(",",$sys_id);								// '신청 시스템 분리
			For ($i= 0 ; $i<= $temp_len;$i++){
				$result2 = SYSTEM_INS($uid,$temp_sys_id[$i],$sdate,$sys_intention,$admit_flag,$REG_DT,$sType,$SID);
				if($result2!=1) break;
				}
			}
			If ($uKind != $pre_kind ){
				$delete_svc_user = "delete from TBL_SVC_USER WHERE charger_id='".$uid."'";
				$result3 = $mysqli->query($delete_svc_user);
			}		
			
	}ELSEIF($uKind=="A"){
		If ($pre_kind =="O"){
			$delete_svc_user = "delete from TBL_SVC_USER WHERE charger_id='".$uid."'";
			$result3 = $mysqli->query($delete_svc_user);
		}Else{
			$delete_system = "delete from TBL_USER_SYSTEM WHERE USER_ID='".$uid."'";
			$result3 = $mysqli->query($delete_system);
		}	
	}
	
	
	
	IF($result != 1 || $result1 != 1 || $result2 != 1 || $result3 != 1)   {  //쿼리가 한개라도 실패시 롤백 처리
		$mysqli->rollback(); //DB RollBack
		echo ("<script>alert(\"작업중 에러가 발생했습니다.모든 작업을 취소합니다.\");history.back()</script>");
	}ELSE{
		$mysqli->commit();  //DB Commit
	}
	
	
	
	
	//SMS 처리 로직 
	IF ($uKind=="A" || $uKind=="O"){
		$result3 = SEND_SMS($hp,$uid,$uname,$cert_key,$SID,$MESSAGE,$ISPORTED);
		echo ("<script>opener.parent.alert(\"계정 승인 완료되었습니다.\");window.close();");
		echo ("window.opener.parent[\"leftFrame\"].location.reload() ;");
		echo ("top.opener.location.reload();");
		echo ("</script>");
		IF($result3!= 1)   {  //쿼리가 한개라도 실패시 롤백 처리
			$mysqli->rollback(); //DB RollBack
			echo ("<script>alert(\"작업중 에러가 발생했습니다.모든 작업을 취소합니다.\");history.back()</script>");
		}ELSE{
			$mysqli->commit();  //DB Commit
		}

	}ELSE{			

		IF ($uKind =="M" || $sType=="C"){          //			'ISPORTED
			$result3 = SEND_SMS($hp,$uid,$uname,$cert_key,$SID,$MESSAGE,$ISPORTED);

//			$SMS="insert into TBL_SMS_WORK (cell_num,Message,conn_key,work_flag,rcv_name,rcv_id,oper_id,ISPORTED,upd_dt) values (";
//			$SMS=$SMS."'";
//			$SMS=$SMS.$hp."','";
//			$SMS=$SMS.$MESSAGE."','";
//			$SMS=$SMS.$cert_key."','";
//			$SMS=$SMS."0"."','";
//			$SMS=$SMS.$uname."','";
//			$SMS=$SMS.$uid."','";
//			$SMS=$SMS.$SID."',";
//			$SMS=$SMS.$ISPORTED.",";
//			$SMS=$SMS."now()".")";				

			IF($result3!= 1)   {  //쿼리가 한개라도 실패시 롤백 처리
				$mysqli->rollback(); //DB RollBack
				echo ("<script>alert(\"작업중 에러가 발생했습니다.모든 작업을 취소합니다.\");history.back()</script>");
			}ELSE{
				$mysqli->commit();  //DB Commit
			}
			//		'SMS 전송 프로시져
			echo ("<script>opener.parent.alert(\"사용자 계정 및 접속 시스템 승인이 완료되었습니다.\");window.close();");
			echo ("window.opener.parent[\"leftFrame\"].location.reload() ;");
			echo ("top.opener.location.reload();");
			echo ("</script>");

		}ELSEIF($sType=="P"){

			$result3 = SEND_SMS($hp,$uid,$uname,$cert_key,$SID,$MESSAGE,$ISPORTED);
	
			IF($result3!= 1)   {  //쿼리가 한개라도 실패시 롤백 처리
				$mysqli->rollback(); //DB RollBack
				//$mysqli->close();
				echo ("<script>alert(\"작업중 에러가 발생했습니다.모든 작업을 취소합니다.\");history.back()</script>");
			}ELSE{
				$mysqli->commit();  //DB Commit
			}
			echo ("<script language='JavaScript'>");
			echo ("</script>");
			WinLocation("user_system_date.php?uid=$uid&sType=$sType", "", "");
		}
	}
	$mysqli->close();
	
	
	
	
