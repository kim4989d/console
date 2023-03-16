<%@page contentType="text/html; charset=euc-kr"%>
<%@page import="console.common.tray.ResultSetTray"%>
<%//@include file="/common/common.jsp" %>


<%
	/* 계정 신청 상세 페이지(승인/반려) 작업 */
	ResultSetTray companyListTray = null;

	if( request.getAttribute("") != null ){
		companyListTray = (ResultSetTray)request.getAttribute("rsCompanyListTray");
	}
	
	
	int companyAllCount =  companyCountTray.getRowCount();						//TBL_COMPANY 회사 전체 개수를  구한다.
	
	/*
	String uid 	 	 	 =  companyListTray.get("user_id");
	String pwd		  	 =  companyListTray.get("password");
	String uname 	 	 =  companyListTray.get("NAME");
	String uKind 	 	 =  companyListTray.get("Kind");
	String sType 	 	 =  companyListTray.get("TYPE");
	String object	 	 =  companyListTray.get("INTENTION");
	String company	 	 =  companyListTray.get("COMPANY_ID");
	String hp		 	 =  companyListTray.get("CELL_NUM");
	String tel		 	 =  companyListTray.get("COMPANY_TEL");
	String fax 	 		 =  companyListTray.get("COMPANY_FAX");
	String charger_id 	 =  companyListTray.get("CHARGER_ID");
	String cert_key 	 =  companyListTray.get("CERT_KEY");
	String isported 	 =  companyListTray.get("ISPORTED");
	*/
	
	
%>

<%
/*
	
	
	$uid=$_REQUEST["uid"];	//신규 신청자 신청자에 대한  request 받는다.

	
	
	//신청된 내용 가공 
	//처리 완료 
	$SQL="select user_id,password,NAME,Kind,TYPE,INTENTION,COMPANY_ID,CELL_NUM,COMPANY_TEL, ";
	$SQL=$SQL."COMPANY_FAX,RSNO,CHARGER_ID,CERT_KEY,IFNULL(ISPORTED,'0') ISPORTED";
	$SQL=$SQL."  from TBL_USER  where user_id='".$uid."'";

	
	$row = $db->queryOne($SQL);
	
	$uid=$row[0];
	$pwd=$row[1];
	$uname=$row[2];
	$uKind=$row[3];

	
	IF($uKind=="O"){
		$str_url="svc_name";
	}ELSE{
		$str_url="svc_system";
	}
	
	$sType=$row[4];
	$object=$row[5];
	$company=$row[6];

	$hp =$row[7];
	
	
	if (strlen($hp) >10){
		$hp1=substr($hp,0,3);
		$hp2=substr($hp,3,4);
		$hp3=substr($hp,-4);
	}else{
		$hp1=substr($hp,0,3);
		$hp2=substr($hp,3,3);
		$hp3=substr($hp,-4);
	}

	$tel=$row[8];
	IF($tel!=""){
		$tel = explode("-",$tel);  
		$tel1=$tel[0];
		$tel2=$tel[1];
		$tel3=$tel[2];
	}

	$fax=$row[9];
	IF($fax!=""){
		$fax = explode("-",$fax);  
		$fax1=$fax[0];
		$fax2=$fax[1];
		$fax3=$fax[2];
	}
	$ssn=$row[10];
	$CHARGER_ID=$row[11];
	$CERT_KEY=$row[12];
	$isported =$row[13];

	
	
	
	
	
	
	
	
	//레벨에 따른 service 및 시스템 선택 값 적용 
	IF ($uKind=="O"){
		$sys="select service_id from TBL_SVC_USER where charger_id='".$uid."'";
		$row = $db->queryFetch($sys);
		IF(count($row)!=0){
			for($i=0; $i<count($row); $i++){
				$service_id=$row[$i][0].",".$service_id;

			}
			$service_id=substr($service_id,0,strlen($service_id)-1);
		}
	}ELSE{
		$sys="select a.system_id,b.host_id,a.service_id,a.intention,a.REG_DT ";
		$sys=$sys."from TBL_USER_SYSTEM a,TBL_SYSTEM b ";
		$sys=$sys."where a.user_id='".$uid."' and a.system_id=b.system_id ";
		$sys=$sys." order by system_name desc";

		//echo $sys; 
		$row = $db->queryFetch($sys);
		
		IF(count($row)!=0){
			for($i=0; $i<count($row); $i++){
				$sys_id=$row[$i][0].",".$sys_id;
				$sys_name=$row[$i][1].",".$sys_name;
				$sys_intention=$row[$i][3];
				$REG_DT=$row[$i][4];

			}
		$sys_id=substr($sys_id,0,strlen($sys_id)-1);
		$sys_name=substr($sys_name,0,strlen($sys_name)-1);
		}
	}
?>

*/

%>



<html>
<head>
<title>신청현황 -> 계정신청현황->승인/상세 내역 </title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url();
}
-->
</style>
<link href="../comm/css/default.css" rel="stylesheet" type="text/css">
<link href="../comm/css/Form.css" rel="stylesheet" type="text/css">

<script language="JavaScript" src="../comm/js/Calendar.js"></script>

<script language="JavaScript">
//자리이동
function moveFocus(num,fromform,toform)
{
	var str = fromform.value.length;
	if(str == num)
       		toform.focus();
}
//글자수 체크
function getByte(s)
{
    var sum = 0;
    var len = s.length;
    for (var i=0; i<len; i++) {
        var ch = s.substring(i, i + 1);
        var en = escape(ch);
        if ( en.length <= 4 ) {
            sum++;
        }
        else {
            sum += 2;
        }
    }
    return sum;
}
function pwd_check(cmp)
{
	var temp=cmp.value.length
	if (temp<8)
	{
		alert("비밀번호는 최소 8글자 이상입니다.");
		document.form.pwd2.value="";
		document.form.pwd1.focus();
		return false;
	}
	else{
	
	if (cmp.value!=document.form.pwd2.value)
	{	
		alert("비밀번호가 서로 일치 하지 않습니다.");
		document.form.pwd2.value="";
		document.form.pwd1.select();
		return; 
	}

	}
}
function onlyNumber()
{
	if ( event.keyCode<48 || event.keyCode>57 )
		event.returnValue = false;
}  
function Form_check()
{
	var temp=document.form.uid.value
	if (temp=="")
	{
		alert("아이디를 입력해주세요")
		document.form.uid.focus();
		return false;
	}
	temp1=document.form.pwd1.value
	var temp2=document.form.pwd2.value
	if (temp1=="" || temp2=="")
	{
		alert("비밀번호를 바르게 입력해주세요")
		document.form.pwd1.focus();
		return false;
	}

	if(form.uKind.value=="")
	{
		alert("사용자 유형을 선택하세요");
		form.uKind.focus();
		return;
	}

	if(form.object.value=="")
	{
		alert("신청목적을 입력해주세요!");
		form.object.focus();
		return;
	}

	if(form.hp1.value==""|| form.hp2.value=="" || form.hp3.value=="")
	{
		alert("핸드폰번호를 바르게 입력하세요");
		form.hp1.focus();
		return;
	}
	
 	var temp=document.form.uname.value
 	
	if (temp=="")
	{
		alert("이름을 입력해주세요")
		document.form.uname.focus();
		return false;
	}
 	var temp=document.form.oper.value
	var temp1=document.form.uKind.value
	if (temp=="" && temp1!="A" && temp1!="O")
	{
		alert("담당자를 선택해주세요!")
		document.form.oper.focus();
		return false;
	}	
 	var temp=document.form.sys_id.value
	var temp1=document.form.uKind.value
	if (temp=="" && temp1!="A" && temp1!="O")
	{
		if (temp=="")
		{
			alert("시스템을 선택해주세요!")
			return false;
		}
	}
	else if (temp1=="O" )
	{
	 	var temp=document.form.service_id.value
		if (temp=="")
		{
			alert("서비스를 선택해주세요!")
			return false;
		}		
	}
	else if (temp1=="G" || temp1=="M"){
		form.sys_intention.value = HiddenFrame1.form.sys_intention.value;
		var temp = document.form.sys_intention.value
		if (temp=="" || getByte(temp) > 50 )
		{
			alert("사용목적을 선택해주세요!")
			HiddenFrame1.form.sys_intention.focus();
			return false;
		}	
	}
	form.submit();
	return;
}

function change_menu(val)
{
	var val;
	if (val=="O")
	{
		document.form.str1.disabled=true; 
		document.form.str2.disabled=true;
		document.form.oper.disabled=true; 				
		document.form.oper.style.background="#e8e8e8";		
		HiddenFrame1.location.href="svc_name.php?uid=<?=$uid?>";
		return;
	}
	else if(val=="A")
	{

		document.form.str1.disabled=true; 
		document.form.str2.disabled=true; 		
		document.form.oper.disabled=true; 				
		document.form.oper.style.background="#e8e8e8";		
		HiddenFrame1.location.href="space.php";
		return;
	}	
	else if(val=="M")
	{
		document.form.str1.disabled=true; 
		document.form.str2.disabled=true; 		
		document.form.oper.disabled=false; 				
		document.form.oper.style.background="#FFFFFF";	
		OnsetSubmit();
		return;
	}	
	else
	{
		document.form.str1.disabled=false; 
		document.form.str2.disabled=false; 
		document.form.oper.disabled=false; 				
		document.form.oper.style.background="#FFFFFF";			
		OnsetSubmit();
		return;
	}	
}
var CHARGER_ID ="<?=$CHARGER_ID?>"

function change_service(val)
{
	var Temp = document.form.uKind.value;
	if (Temp == "G" || Temp == "M")
	{

		var oper_id = val;
		if (oper_id == CHARGER_ID)
		{
			OnsetSubmit();
			return;			
		}
		else
		{
			HiddenFrame1.location.href="svc_system.php?cid="+oper_id;
			return;
		}
	}

}
var newPoup;
function newWin(result){
		var result;
		var url="returnuser_ok.php?uniq_id="+result+"&f=n"
	var re = "toolbar=no, resizable=0,scrollbars=auto, status=no,location=no, resize=no, menubar=no, directories=no, copyhistory=0, width=503, height=150, top=250, left=350";
    if (newPoup != null)    newPoup.close();
	newPoup=window.open(url, 'r', re);
}
function OnsetSubmit(){
	var form = document.user_system
	form.target = "HiddenFrame1";
	form.action ="<?=$str_url?>.php";
	form.method = "post";
 	form.submit();
}
</script>
<% 
/*
<?include $_HOME["FNC_HOME"]."/select_edit.php"; ?>
*/
%>
</head>

<body onload="OnsetSubmit();<% if ( kind.equals("O") || kind.equals("O") ){ %>change_menu('<%=kind %>');<%} %>">
<form name="user_system">
<%	/*
	<input type="hidden" name="uid" value="<%=uid %>">					//request받은 신청자 아이디 
	<input type="hidden" name="sys_id" value="<%=sys_id %>" >			//시스템 아이디
	<input type="hidden" name="sys_name" value="<%=sys_name %>">		//시스템 이름 
	<input type="hidden" name="svc_id"  value="<%=service_id %>">		//서비스 이름 
	<input type="hidden" name="sys_intention" value=<%=sys_intention%>">//작업 목적
	<input type="hidden" name="cid" value="<%=chaerger_id %>">			//승인한 사람
	*/
 %>	
			
</form>
<table width="800" border="0" cellpadding="0" cellspacing="1" bgcolor="8f8f8f">
  <tr>
    <td bgcolor="#FFFFFF"><table width="800" border="0" cellpadding="0" cellspacing="0" bgcolor="e8e8e8">
        <tr>
          <td><table width="900" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="405" height="37" class="PopupTitleBgWhite"><img src="../images/common/spacer.gif" width="10" height="3">NeoGate 사용자 계정 승인</td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td height="4" bgcolor="c9c9c9"></td>
        </tr>
        <tr>
          <td height="10"></td>
        </tr>
        <tr>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="500">
				<form name="form" action="user_ins.php" method="post">
					<input type="hidden" name="uid" value="<%=uid %>">
					<input type="hidden" name="pre_kind" value="<%=uKind%>"><%= %>
					<input type="hidden" name="cert_key" value="<%=cert_key %>">
					<input type="hidden" name="id_check" >
					<input type="hidden" name="sys_id"value="<%=sys_id %>" >
					<input type="hidden" name="sys_name" value="<%=sys_name %>">
					<input type="hidden" name="service_id"  value="<%=service_id %>">
					<input type="hidden" name="service_name">
					<input type="hidden" name="sys_intention" value="<%=sys_intention %>">
					<input type="hidden" name="REG_DT" value="<%=REG_DT %>">
				    <table width="500" border="0" cellspacing="0" cellpadding="0">
                      <tr bgcolor="#CCCCCC"> 
                        <td height="30" class="PopupBold"><span class="OrangeText"><strong>사용자 정보</strong></span></td>
                        <td></td>
                      </tr>
                      <tr> 
                        <td width="95" height="30" class="PopupBold">사용자 아이디</td>
                        <td width="405" class="PopupLine" ><table width="405" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td><b><?=$uid?></b></td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td height="30" class="PopupBold">암호</td>
                        <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="155"><input name="pwd1" type="password" class="InputGray" id="pwd1" size="23" maxlength="19" value="<?=$pwd?>" readonly></td>
                              <td width="250" class="T11PopupText">영문 숫자 조합 8자리 이상 </td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td height="30" class="PopupBold">암호확인</td>
                        <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="155"><input name="pwd2" type="password" class="InputGray" id="pwd2" size="23" maxlength="19" onChange="return pwd_check(document.form.pwd1);" value="<?=$pwd?>" readonly></td>
                              <td width="250" class="T11PopupText">위에 입력하신 암호를 동일하게 입력하세요. </td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td height="30" class="PopupBold">사용자 유형</td>
                        <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="155"><select name="uKind" class="inputLIneGrayColor"  onChange="uKindChange();change_menu(this.form.uKind.value)">
                                  <OPTION value ="">선택</OPTION>
                                 <%
                                 /*
                                  <?IF ($KIND=="A"){?>
                                  <OPTION value ="A" <?IF ($uKind=="A"){?>selected<?}?>>관리자</OPTION>
                                  <OPTION value ="O" <?IF ($uKind=="O" ){?>selected<?}?>>운용자</OPTION>
                                  <?}?>
                                  <OPTION value ="G" <?IF ($uKind=="G" ){?>selected<?}?>>일반사용자</OPTION>
                                  <OPTION value ="M" <?IF ($uKind=="M" ){?>selected<?}?>>유지보수작업자</OPTION>
                                  */
                                  %>
                                  <% if( kind.equals("A") ){%>
	                                  <OPTION value ="A" <% if(kind.equals("A"){ %>selected<%}%>관리자</OPTION>
	                                  <OPTION value ="O" <% if(kind.equals("O"){ %>selected<%}%>운용자</OPTION>
                                  <%} %>
	                                  <OPTION value ="G" <% if(kind.equals("G"){ %>selected<%}%>일반사용자</OPTION>
	                                  <OPTION value ="M" <% if(kind.equals("M"){ %>selected<%}%>유지보수작업자</OPTION>
                                  
                                </select></td>
                              <td width="250" class="T11PopupText">&nbsp;</td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td height="30" class="PopupBold">접속별 유형</td>
                        <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="100"><input type="radio" name="sType" value="C" checked id="str1">접속별승인</td>
                              <td width="250"><input type="radio" name="sType" value="P" id="str2">기간별승인</td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td height="30" class="PopupBold">신청목적</td>
                        <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="310" ><input name="object" type="text" class="inputLIneGrayColor" id="object" size="50" maxlength="50" value="<?=$object?>"></td>
                              <td class="T11PopupText">&nbsp;<img src="../images/common/popup_must2.gif" width="27" height="10"> 
                              </td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td height="30" class="PopupBold">소속사</td>
                        <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="155"> 
<%  
	//compnay_id, company_name  
//	$co="select COMPANY_ID,COMPANY_NAME from TBL_COMPANY";
//	$row = $db->queryFetch($co);

%> 

<select name="company" class="inputLIneGrayColor">
                                  <OPTION value ="">선택</OPTION>
<%
/*
	for($i=0; $i<count($row); $i++){?>
                <option value="<?=$row[$i][0]?>" <?IF ($company==$row[$i][0]) {?>selected<?}?>><?=$row[$i][1]?></option>
*/
%>


<!-- 
	key =
	COMPANY_ID
	COMPANY_NAME
 -->

 
<%
for(int i = 0; i < companyAllCount; i++){%>
                <option value="<?=$row[$i][0]?>" <?IF ($company==$row[$i][0]) {?>selected<?}?>><?=$row[$i][1]?></option>
                <option value="<%=companyListTray.get("COMPANY_NAME",i) %>" <%if(companyAllCount{ %>selected<% } %>><?=$row[$i][1]?></option>
                <option value="<%= companyCountTray. %>" <?IF ($company==$row[$i][0]) {?>selected<?}?>><?=$row[$i][1]?></option>
<% 
	}
%>
                                </select> 
                              <td width="250" class="T11PopupText"><img src="../images/common/popup_must2.gif" width="27" height="10"> 
                              </td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td height="30" class="PopupBold">휴대폰</td>
                        <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="155">
								<input name="hp1" type="text" class="inputLIneGrayColor" size="4" maxlength="4" onKeyPress="onlyNumber();" value="<?=$hp1?>" readonly>
                                - 
                                <input name="hp2" type="text" class="inputLIneGrayColor" size="4" maxlength="4" onKeyPress="onlyNumber();" value="<?=$hp2?>" readonly>
                                - 
                                <input name="hp3" type="text" class="inputLIneGrayColor" size="4" maxlength="4" onKeyPress="onlyNumber();" value="<?=$hp3?>" readonly></td>
                              <td width="250" class="T11PopupText"><input name="isported" type="checkbox" value="1" <?IF((int)($isported==1 )){?>CHECKED<?}?>> 번호이동일 경우 체크<img src="../images/common/popup_must2.gif" width="27" height="10"> 
                              </td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td height="30" class="PopupBold">회사전화</td>
                        <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="155"><select name="tel1" class="inputLIneGrayColor">
                                  <option value=''>선택</option>
                                  <option value='02' <?IF ($tel1=="02" ){?>selected<?}?>>02</option>
                                  <option value='031' <?IF ($tel1=="031" ){?>selected<?}?>>031</option>
                                  <option value='032' <?IF ($tel1=="032" ){?>selected<?}?>>032</option>
                                  <option value='033' <?IF ($tel1=="033" ){?>selected<?}?>>033</option>
                                  <option value='041' <?IF ($tel1=="041" ){?>selected<?}?>>041</option>
                                  <option value='042' <?IF ($tel1=="042" ){?>selected<?}?>>042</option>
                                  <option value='043' <?IF ($tel1=="043" ){?>selected<?}?>>043</option>
                                  <option value='051' <?IF ($tel1=="051" ){?>selected<?}?>>051</option>
                                  <option value='052' <?IF ($tel1=="052" ){?>selected<?}?>>052</option>
                                  <option value='053' <?IF ($tel1=="053" ){?>selected<?}?>>053</option>
                                  <option value='054' <?IF ($tel1=="054" ){?>selected<?}?>>054</option>
                                  <option value='055' <?IF ($tel1=="055" ){?>selected<?}?>>055</option>
                                  <option value='061' <?IF ($tel1=="061" ){?>selected<?}?>>061</option>
                                  <option value='062' <?IF ($tel1=="062" ){?>selected<?}?>>062</option>
                                  <option value='063' <?IF ($tel1=="063" ){?>selected<?}?>>063</option>
                                  <option value='064' <?IF ($tel1=="064" ){?>selected<?}?>>064</option>
                                </select>
                                - 
                                <input name="tel2" type="text" class="inputLIneGrayColor" size="4" maxlength="4" onKeyPress="onlyNumber();" value="<?=$tel2?>">
                                - 
                                <input name="tel3" type="text" class="inputLIneGrayColor" size="4" maxlength="4" onKeyPress="onlyNumber();" value="<?=$tel3?>"></td>
                              <td width="250" class="T11PopupText">&nbsp;</td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td height="30" class="PopupBold">팩스</td>
                        <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="155"><input name="fax1" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" value="<?=$fax1?>">
                                - 
                                <input name="fax2" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" value="<?=$fax2?>">
                                - 
                                <input name="fax3" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" value="<?=$fax3?>"></td>
                              <td width="250" class="T11PopupText">&nbsp;</td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td height="30" class="PopupBold">이름</td>
                        <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="155"><input name="uname" type="text" class="inputLIneGrayColor" size="23" maxlength="20" style = "ime-mode:active" value="<?=$uname?>" readonly></td>
                              <td width="250" class="T11PopupText"><img src="../images/common/popup_must2.gif" width="27" height="10"> 
                              </td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td height="30" class="PopupBold">담당자</td>
                        <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="155"> 
<? 
IF ($KIND=="A" && ($uKIND == "A" || $uKIND =="O") ) {
	$oper="select USER_ID,NAME,KIND from TBL_USER where KIND ='A' and admit_flag='1' ";
}ELSEIF($KIND=="A" && $uKIND == "O" ){
	$oper="select USER_ID,NAME,KIND from TBL_USER where KIND ='O' and admit_flag='1' ";
}ELSE{
	$oper="select USER_ID,NAME,KIND from TBL_USER where KIND ='O' and admit_flag='1' ";
}
	$oper=$oper." order by NAME";
   $row = $db->queryFetch($oper);
?> <select name="oper" class="inputLIneGrayColor" style="width:110" onChange="change_service(this.form.oper.value)">
                                  <?IF ($KIND=="A") {?>
                                  <OPTION value ="">담당자 선택</OPTION>
								 <?}?>	
<?for($i=0; $i<count($row); $i++){ ?>
                <option value="<?=$row[$i][0]?>" <?IF ($CHARGER_ID == $row[$i][0]) {?>selected<?}?>><?=$row[$i][1]?></option>
<?
}
?>
                                </select> </td>
                              <td width="250" class="T11PopupText"><img src="../images/common/popup_must2.gif" width="27" height="10"> 
                                (매니저를 선택하세요.) </td>
                            </tr>
                          </table></td>
                      </tr>
                    </table>
				</form>
				</td>
                <td valign="top"><iframe name="HiddenFrame1" width="400" height="270" id="HiddenFrame1"  scrolling=NO   FRAMEBORDER="0"></iframe></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td height="10"></td>
        </tr>
        <tr>
          <td height="33" bgcolor="c9c9c9"><table width="900" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="95">&nbsp;</td>
                <td width="" align="center"><img src="../images/common/btn_ok.gif" alt="사용자등록" width="39" height="27" align="middle" class="Cursor_Hand" onClick="Form_check()">&nbsp;<img src="../images/board/btn_return.gif" width="39" height="27" align="middle" class="Cursor_Hand" onClick="newWin('<?=$uid?>')" alt="반려"> 
                  <img src="../images/common/btn_close.gif" width="39" height="27" align="middle" class="Cursor_Hand" onClick="javascript:window.close();"></td>
                <td width="95" align="right"><img src="../images/popup/logo_under.gif" width="50" height="23" hspace="10"></td>
              </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<span class="PopupLine"></span>
</body>
</html>

