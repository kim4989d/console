<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@page import="console.common.tray.ResultSetTray" %>
 
<% 

    int           rowCount         = 0;  //장비 등록 목록 갯수 
    int           rowCount2         = 0; //관리자 불러 오기
    int           rowCount3         = 0; //사용자 분류1
    int           rowCount4         = 0; //사용자 분류2
    int           rowCount5         = 0; //사용자 분류3
    
    ResultSetTray join_list_tray  = null;  // 
    ResultSetTray join_list_tray2  = null;  // 
    ResultSetTray join_list_tray3  = null;  //사용자 분류1
    ResultSetTray join_list_tray4  = null;  //사용자 분류2
    ResultSetTray join_list_tray5  = null;  //사용자 분류3

    //String	checkbox="";
    //checkbox	=	(String)request.getAttribute("checkbox");
	
	if(request.getAttribute("rsTray") !=null){
		join_list_tray = (ResultSetTray)request.getAttribute("rsTray");  //장비 등록 목록 불러 오기 
		rowCount = join_list_tray.getRowCount();
	
		join_list_tray2 = (ResultSetTray)request.getAttribute("rsTray2"); //관리자(매니저) 불러 오기 
		rowCount2 = join_list_tray2.getRowCount();
		
		join_list_tray3 = (ResultSetTray)request.getAttribute("rsTray3"); //사용자 분류1 
		rowCount3 = join_list_tray3.getRowCount();
		
		join_list_tray4 = (ResultSetTray)request.getAttribute("rsTray4"); //사용자 분류2 
		rowCount4 = join_list_tray4.getRowCount();
		
		join_list_tray5 = (ResultSetTray)request.getAttribute("rsTray5"); //사용자 분류3
		rowCount5 = join_list_tray5.getRowCount();
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>계정 신청 등록 </title>
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
<script language="JavaScript" src="./js/Calendar.js"></script>
<script language="JavaScript">
//자리이동
function moveFocus(num,fromform,toform)
{
	var str = fromform.value.length;
	if(str == num)
       toform.focus();
}
function id_chk() {                                                                 

	var str

		str=document.form.uid.value;
		if (str=="")
		{
			document.form.uid.focus();
			
		}
		if(str.length<3)
		{
			alert("아이디는 4자이상입니다.");
			document.form.uid.focus();
			return false;
		
		}
		else
		window.open("../id_repeat.php?id="+str,"checkid","scrollbars=no,resizeable=no,width=340,height=109, top=200, left=150");

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
function Form_check()
{

	var id_pattern = new RegExp('[^a-zA-Z0-9_]'); //아이디 패턴검사 정규식
	var passwd_pattern = new RegExp('[^a-zA-Z0-9]'); //비밀번호
	var temp=document.form.id_check.value
	if (temp=="")
	{
		alert("ID 중복확인을 해주세요")
		document.form.uid.focus();
		return false;	
	}
	var temp=document.form;
	if (temp.uid.value.length<2 || getByte(temp.uid.value)>10) 
	{
		alert("사용자 아이디는  최소 2자 이상\n10byte 넘을 수 없습니다.");
		temp.uid.value = "";
		temp.id_check.value = "";		
		temp.uid.focus();
		return;
	}
 	if (!temp.uid.value.length || id_pattern.test(temp.uid.value))
	 {
    	 alert("아이디를 영문자와 숫자, '_' 로 입력해 주세요.");
		 temp.uid.value = "";
		 temp.id_check.value = "";		
		 temp.uid.focus();
		 return;
	 }
	 if (temp.pwd1.value.length < 8 || getByte(temp.pwd1.value) > 10)
	 {
	 	  alert("비밀번호는 8자이상\n10byte 넘을 수 없습니다.");
		  temp.pwd1.select();
		  temp.pwd2.value = "";		  
		  temp.pwd1.focus();
		  return;	 	
	 }
	 if(temp.pwd1.value=="" || temp.pwd2.value=="" || passwd_pattern.exec(temp.pwd1.value)) 
	 {
	 	  alert("비밀번호를 정확하게 입력해 주세요.");
		  temp.pwd1.value = "";
		  temp.pwd2.value = "";		  
		  temp.pwd1.focus();
		  return;
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
	else if (getByte(document.form.object.value)>50 )
	{
	
		alert("신청목적 내용은 50byte를 넘을 수 없습니다.");
		form.object.select();
		return;
	}	
	if(form.hp1.value==""|| form.hp2.value=="" || form.hp3.value=="")
	{
		alert("핸드폰번호를 바르게 입력하세요");
		form.hp1.focus();
		return;
	}

	/* 2.주민번호 
	var chk =0
	var yy = form.ssn1.value.substring(0,2);
	var mm = form.ssn1.value.substring(2,4);
	var dd = form.ssn1.value.substring(4,6);
	var sex  = form.ssn2.value.substring(0,1);
	
	if ((form.ssn1.value.length!=6)||(mm <1||mm>12||dd<1))
	{
    		alert ("주민등록번호를 바로 입력하여 주십시오.");
    		form.ssn1.focus();
    		return ;
    	}
 	if ((sex != 1 && sex !=2 )||(form.ssn2.value.length != 7 ))
	{
    		alert ("주민등록번호를 바로 입력하여 주십시오.");
		form.ssn2.focus(); 
    		return ;
    	}   
	
	// 주민등록번호 체크 
  	for (var i = 0; i <=5 ; i++)
	{ 
		chk = chk + ((i%8+2) * parseInt(form.ssn1.value.substring(i,i+1)));
 	}

  	for (var i = 6; i <=11 ; i++)
	{ 
      	  	chk = chk + ((i%8+2) * parseInt(form.ssn2.value.substring(i-6,i-5)));
 	}
  	
  	chk = 11 - (chk %11);
  	chk = chk % 10;

  	if (chk != form.ssn2.value.substring(6,7))
  	{   
    		alert ("유효하지 않은 주민등록번호입니다.");
    		form.ssn1.focus();
    		return ;
    	}	
		*/
 	var temp=document.form.uname.value
	if (temp=="")
	{
		alert("이름을 입력해주세요")
		document.form.uname.focus();
		return false;
	}
 	var temp=document.form.oper.value;
	var temp1=document.form.uKind.value;
	if (temp=="" && temp1!="O")
	{
		alert("담당자를 선택해주세요!")
		document.form.oper.focus();
		return false;
	}	

 	var temp=document.form.sys_id.value;
	var temp1=document.form.uKind.value;
	if (temp1!="O" )
	{
		if (temp=="")
		{
			alert("시스템을 선택해주세요!");
			return false;
		}
	 	document.form.sys_intention.value = HiddenFrame1.form.sys_intention.value;
		var temp = document.form.sys_intention.value;
		if (temp=="" || getByte(temp) > 50 )
		{
			alert("시스템 사용목적을 선택해주세요!");
			HiddenFrame1.form.sys_intention.focus();
			return false;
		}
		
	}
	else
	{
	 	var temp=document.form.service_id.value
		if (temp=="")
		{
			alert(" 서비스를 선택해주세요!")
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
		document.form.oper.disabled=true; 				
		document.form.oper.style.background="#e8e8e8";
		HiddenFrame1.location.href="consolejoinsys_name.do?cmd=console_join_sys_name";
		return;
	}
	else
	{
		document.form.oper.disabled=false; 				
		document.form.oper.style.background="#FFFFFF";	
		HiddenFrame1.location.href="consolejoinsys.do?cmd=console_join_sys";
		return;
	}	
}


function change_service(val,val2)
{
	
	var Temp = document.form.uKind.value;
	var Temp2 = document.form.company.value
	if ( Temp2 =="")
	{
		alert("소속사를 선택 해주세요")
		document.form.oper.options[0].selected = true
		document.form.company.focus();
		return;
	}
	else{

		if (Temp == "G" || Temp == "M")
		{
			if (val != ""){
			var oper_id = val;
			HiddenFrame1.location.href="consolejoinsys.do?cmd=console_join_sys&cid="+oper_id+"&com="+val2;
			return;
			}
		}
	}
}
</script>
<!--<?include $_HOME["FNC_HOME"]."/select.php";  ?> 현재 필요한 select 메뉴를 불러옴 --> 

<SCRIPT language='JavaScript'>
function uKindChange() {
 var x = document.form.uKind.options.selectedIndex;
 var groups=document.form.uKind.options.length;
 var group=new Array(groups);
 for (i=0; i<groups; i++)
 group[i]=new Array();
 group[0][0]=new Option("선택하세요","");
 group[1][0]=new Option("admin선택","");
 group[1][1]=new Option("MC센터","bmdzYWRtaW4=");
 group[1][2]=new Option("이준석","YW1hdGV1cw==");
 group[1][3]=new Option("재웅테크","anV0X3Rlc3Q=");
 group[1][4]=new Option("최현정","ZmFyc2Vlcg==");
 group[1][5]=new Option("편수범","cHl1bg==");
 group[1][6]=new Option("플랫폼관리자1","cGxhdGZvcm0x");
 group[1][7]=new Option("플랫폼관리자2","cGxhdGZvcm0y");
 group[1][8]=new Option("하재두","amRoYTAxMQ==");
 group[2][0]=new Option("admin선택","");
 group[2][1]=new Option("ngs운용","bmdzb3Blcg==");
 group[2][2]=new Option("강동한","ZGhrYW5n");
 group[2][3]=new Option("권용찬","eWNrd29u");
 group[2][4]=new Option("기태현","d2ViMjE=");
 group[2][5]=new Option("김건중","MTEwMjA4MQ==");
 group[2][6]=new Option("김진구","MTEwNzk2Nw==");
 group[2][7]=new Option("김태우","dHdraW0=");
 group[2][8]=new Option("김태우","dHdraW0xMjM=");
 group[2][9]=new Option("김현정","MTEwNDk3OQ==");
 group[2][10]=new Option("박병규","MTEwNDE3NQ==");
 group[2][11]=new Option("박용석","eW9uZ3Nlb2t5");
 group[2][12]=new Option("박종복","amJwYXJrMDE=");
 group[2][13]=new Option("석태경","MTEwODEyMg==");
 group[2][14]=new Option("송경조","c3MxMjkw");
 group[2][15]=new Option("양호수","MTEwNDA4Mw==");
 group[2][16]=new Option("유준수","MTEwNTY4OA==");
 group[2][17]=new Option("윤형진","eWhqa2p5");
 group[2][18]=new Option("이광수","MTEwMzQxNg==");
 group[2][19]=new Option("이인복","MTEwMzA4OQ==");
 group[2][20]=new Option("이준석","b3BlcmF0b3I=");
 group[2][21]=new Option("임종순","MTEwMjExMw==");
 group[2][22]=new Option("천민태","dGVsYXJpbg==");
 group[2][23]=new Option("천왕성","YnJfb3Blcg==");
 group[2][24]=new Option("최현정","MTEwMjYyNA==");
 group[2][25]=new Option("콘솔","Y29uc29sZQ==");
 group[2][26]=new Option("하재두","MTEwNjAwNQ==");
 group[3][0]=new Option("admin선택","");
 group[3][1]=new Option("ngs운용","bmdzb3Blcg==");
 group[3][2]=new Option("강동한","ZGhrYW5n");
 group[3][3]=new Option("권용찬","eWNrd29u");
 group[3][4]=new Option("기태현","d2ViMjE=");
 group[3][5]=new Option("김건중","MTEwMjA4MQ==");
 group[3][6]=new Option("김진구","MTEwNzk2Nw==");
 group[3][7]=new Option("김태우","dHdraW0=");
 group[3][8]=new Option("김태우","dHdraW0xMjM=");
 group[3][9]=new Option("김현정","MTEwNDk3OQ==");
 group[3][10]=new Option("박병규","MTEwNDE3NQ==");
 group[3][11]=new Option("박용석","eW9uZ3Nlb2t5");
 group[3][12]=new Option("박종복","amJwYXJrMDE=");
 group[3][13]=new Option("석태경","MTEwODEyMg==");
 group[3][14]=new Option("송경조","c3MxMjkw");
 group[3][15]=new Option("양호수","MTEwNDA4Mw==");
 group[3][16]=new Option("유준수","MTEwNTY4OA==");
 group[3][17]=new Option("윤형진","eWhqa2p5");
 group[3][18]=new Option("이광수","MTEwMzQxNg==");
 group[3][19]=new Option("이인복","MTEwMzA4OQ==");
 group[3][20]=new Option("이준석","b3BlcmF0b3I=");
 group[3][21]=new Option("임종순","MTEwMjExMw==");
 group[3][22]=new Option("천민태","dGVsYXJpbg==");
 group[3][23]=new Option("천왕성","YnJfb3Blcg==");
 group[3][24]=new Option("최현정","MTEwMjYyNA==");
 group[3][25]=new Option("콘솔","Y29uc29sZQ==");
 group[3][26]=new Option("하재두","MTEwNjAwNQ==");
temp = document.form.oper;
 for (m = temp.options.length-1 ; m > 0 ; m--)
  temp.options[m]=null
 for (i=0;i<group[x].length;i++){
  temp.options[i]=new Option(group[x][i].text,group[x][i].value)
 }
 temp.options[0].selected=true
}
</SCRIPT>



</head>

<body>
<table width="800" border="0" cellpadding="0" cellspacing="1" bgcolor="">
  <tr>
    <td bgcolor=""><table width="800" border="0" cellpadding="0" cellspacing="0" bgcolor="">
        <tr>
          <td><table width="900" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="405" height="37" class="PopupTitleBgWhite"><img src="../images/common/spacer.gif" width="10" height="3">NGS 
                  계정  신청 등록</td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td height="4" bgcolor=""></td>
        </tr>
        <tr>
          <td height="10"></td>
        </tr>
        <tr>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="500">
				<form name="form" action="g_join_ins.php" method="post">
					<input type="hidden" name="id_check" >
					<input type="hidden" name="sys_id">
					<input type="hidden" name="sys_name">
					<input type="hidden" name="service_id">		
					<input type="hidden" name="service_name">		
					<input type="hidden" name="sys_intention" >				
				<table width="500" border="0" cellspacing="0" cellpadding="0">
                    <tr bgcolor=""> 
                      <td height="30" class="PopupBold"><span class="OrangeText"><strong>사용자 
                        정보</strong></span></td>
                      <td></td>
                    </tr>
                    <tr> 
                      <td width="95" height="30" class="PopupBold">사용자 ID </td>
                      <td width="405" class="PopupLine" ><table width="405" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="155"><input name="uid" type="text" class="inputLIneGrayColor" size="23" maxlength="13"></td>
                            <td width="250" class="T11PopupText"><input type="button" value="중복채크" name="idcheck" width="65" height="21" border="0" align="absmiddle" class="Cursor_Hand" id="idcheck" onClick="id_chk();"></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="30" class="PopupBold">암호</td>
                      <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="155"><input name="pwd1" type="password" class="inputLIneGrayColor" size="23" maxlength="10"></td>
                            <td width="250" class="T11PopupText">영문 숫자 조합 8자리로 입력 해주세요</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="30" class="PopupBold">암호확인</td>
                      <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="155"><input name="pwd2" type="password" class="inputLIneGrayColor" size="23" maxlength="10"></td>
                            <td width="250" class="T11PopupText">위에 입력하신 암호를 동일하게 입력하세요.</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="30" class="PopupBold">사용자 유형</td>
                      <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="155"> 
							<select name="uKind" class="inputLIneGrayColor" onChange="uKindChange();change_menu(this.form.uKind.value)">
								<OPTION value ="">선택</OPTION>
								<OPTION value ="O">운용자</OPTION>
								<OPTION value ="G" selected>일반사용자</OPTION>
								<OPTION value ="M">유지보수작업자</OPTION>
                              </select></td>
                              <td width="250" class="T11PopupText"><img src="../images/common/popup_must2.gif" width="27" height="10" align="absmiddle"></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="30" class="PopupBold">신청목적</td>
                      <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><input name="object" type="text" class="inputLIneGrayColor" size="50" maxlength="50"> 
                              <img src="../images/common/popup_must2.gif" width="27" height="10" align="absmiddle"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="30" class="PopupBold">소속사</td>
                      <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="155"> 
	<select name="company" class="inputLIneGrayColor">
                <OPTION value ="">선택</OPTION>
<% for(int i=0; i<rowCount; i++){%>
                <option value="<%=join_list_tray.get("company_id",i)%>"><%=join_list_tray.get("company_name",i)%></option>
<% 
}
%>
                              </select> </td>
                            <td width="250" class="T11PopupText"><img src="../images/common/popup_must2.gif" width="27" height="10"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="30" class="PopupBold">휴대폰</td>
                      <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><select name="hp1" size="1" class="inputLIneGrayColor">
                                <option value ="">선택하세요</option>
                                <option value ="011">011</option>
                                <option value ="016">016</option>
                                <option value ="017">017</option>
                                <option value ="018">018</option>
                                <option value ="019">019</option>
                                <option value ="010" selected>010</option>
                              </select>
                              - 
                              <input name="hp2" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();">
                              - 
                              <input name="hp3" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();">
							  <input name="isported" type="checkbox" value="1"> 번호이동일 경우 체크
							  <img src="../images/common/popup_must2.gif" width="27" height="10" align="absmiddle">
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="30" class="PopupBold">회 사 전 화</td>
                      <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><select name="tel1" class="inputLIneGrayColor">
                                <option value=''>선 택 하 세 요</option>
                                <option value='02' >02</option>
                                <option value='031'>031</option>
                                <option value='032'>032</option>
                                <option value='033'>033</option>
                                <option value='041'>041</option>
                                <option value='042'>042</option>
                                <option value='043'>043</option>
                                <option value='051'>051</option>
                                <option value='052'>052</option>
                                <option value='053'>053</option>
                                <option value='054'>054</option>
                                <option value='055'>055</option>
                                <option value='061'>061</option>
                                <option value='062'>062</option>
                                <option value='063'>063</option>
                                <option value='064'>064</option>
                              </select>
                              - 
                              <input name="tel2" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();">
                              - 
                              <input name="tel3" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();"></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="30" class="PopupBold">팩 스</td>
                      <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="155"><input name="fax1" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" >
                              - 
                              <input name="fax2" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" >
                              - 
                              <input name="fax3" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onKeyPress="onlyNumber();" ></td>
                              <td width="250" class="T11PopupText">&nbsp; </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr>  
                      <td height="30" class="PopupBold">이 름</td>
                      <td class="PopupLine"><table width="405" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="155"><input name="uname" type="text" class="inputLIneGrayColor" size="23" maxlength="20" style = "ime-mode:inable"></td>
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
							<select name="oper" class="inputLIneGrayColor" style="width:110" onchange="change_service(this.form.oper.value,this.form.company.value)">
                                <OPTION value=''>사용자유형선택</OPTION>
                            </select>
							 </td>
                            <td width="250" class="T11PopupText"><img src="../images/common/popup_must2.gif" width="27" height="10"> 
                              (매니저를 선택하세요.) </td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
				  </form>
				  </td>
                <td valign="top"><iframe name="HiddenFrame1" width="400" height="270" id="HiddenFrame1"  scrolling="NO"   FRAMEBORDER="0" src="consolejoinsys.do?cmd=console_join_sys"></iframe></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td height="10"></td>
        </tr>
        <tr>
          <td height="33" bgcolor=""><table width="900" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="95">&nbsp;</td>
                <td width="710" align="center"><input type="button" value="등록" width="39" height="27" align="absmiddle" class="Cursor_Hand" onClick="Form_check()"> 
                  <input type="button" value="닫기" width="39" height="27" align="absmiddle" class="Cursor_Hand" onClick="javascript:window.close();"></td>
                <td width="95" align="right"></td>
              </tr>
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<script language="JavaScript">
	window.document.onload = document.form.uid.focus();
	window.document.onload = uKindChange();change_menu('G')
</script>
</body>
</html>



















<html>
<head>
<!-- 팝업사이즈  1000 * 506-->
<title>팝업_NGS 게정 신청 등록</title>
<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=EUC-KR">
<META NAME="CONTENT-LANGUAGE" CONTENT="KR">
<LINK REL='STYLESHEET' HREF='../css/skt_Form.css' TYPE='TEXT/CSS'>
<LINK REL='STYLESHEET' HREF='../css/skt_Default.css' TYPE='TEXT/CSS'>
<style type="text/css">
<!--
.style1 {
	font-size: 11px
}
-->
</style>
</head>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<body>
<table width=1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="46" background="../images/pop_1000bg_01.jpg" class="PopupTitleBgWhite"><img src="../images/pop_img01.gif" width="8" height="17" align="absmiddle" style="margin-left:10px; margin-right:10px">NGS 게정 신청 등록</td>
  </tr>
  <tr>
    <td height="4"></td>
  </tr>
  <tr>
    <td><table width="1000" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="5"></td>
          <td width="790" height="4" bgcolor="#9ab1cf"></td>
          <td width="5"></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <colgroup>
              <col width="50%">
              <col width="*">
              </colgroup>
              <tr>
                <td height="30" colspan="2" class="PopupLine"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td class="OrangeText"><strong>사용자 정보</strong></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><table border="0" cellspacing="0" cellpadding="0">
                          <colgroup>
                          <col width="100">
                          <col width="*">
                          </colgroup>
                          <tr>
                            <td height="30" class="PopupBold">사용자 ID </td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="uid" type="text" class="inputLIneGrayColor" size="23" maxlength="13" /></td>
                                  <td>&nbsp;<a href="#"><img src="../images/btn_id_check.gif" align="absmiddle"></a></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold" >암호</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="pwd1" type="password" class="inputLIneGrayColor" size="23" maxlength="10"></td>
                                  <td>&nbsp;<span class="style1">영문 숫자 조합 8자리로 입력 해주세요</span></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">암호확인</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="pwd2" type="password" class="inputLIneGrayColor" size="23" maxlength="10" /></td>
                                  <td>&nbsp;<span class="style1">위에 입력하신 암호를 동일하게 입력하세요. </span></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">사용자 유형</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><select name="uKind" class="InputLIneSelect" onchange="uKindChange();change_menu(this.form.uKind.value)">
                                      <option value ="">선택</option>
                                      <option value ="O">운용자</option>
                                      <option value ="G" selected="selected">일반사용자</option>
                                      <option value ="M">유지보수작업자</option>
                                    </select></td>
                                  <td><img src="../images/dot_2.gif" align="absmiddle"><FONT COLOR="ff3116">필수</FONT></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">신청목적</td>
                            <td  class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="object" type="text" class="inputLIneGrayColor" size="50" maxlength="50">
                                    <img src="../images/dot_2.gif" align="absmiddle"><FONT COLOR="ff3116">필수</FONT></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="BlueText"><strong>소속사</strong></td>
                            <td><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><select name="company" class="InputLIneSelect">
                                      <option value ="">선택</option>
                                      <option value="ABLECOM">에이블컴</option>
                                      <option value="ADS">앞선데이타시스템</option>
                                      <option value="AHNLAB">안철수연구소</option>
                                      <option value="AIRCROSS">에어크로스</option>
                                      <option value="ATSolution">ATSolution</option>
                                      <option value="BLUEDIGM">블루다임</option>
                                      <option value="BNSWORKS">BNSWORKS</option>
                                      <option value="BTBSoluti">BTB솔루션</option>
                                      <option value="CASSIS">CASSIS</option>
                                      <option value="CITYGAME">시티게임</option>
                                      <option value="CP">커머스플래닛</option>
                                      <option value="DONGDEUK">동덕정보통신</option>
                                      <option value="EASYMON">이지몬</option>
                                      <option value="EFOTEK">이포텍</option>
                                      <option value="EMC">EMC</option>
                                      <option value="ENCOREPLUS">엔코아플러스</option>
                                      <option value="FORCS">포시에스</option>
                                      <option value="GTPLUS">GT플러스</option>
                                      <option value="HAEORUM">해오름</option>
                                      <option value="HP">HP</option>
                                      <option value="IBM">IBM</option>
                                      <option value="ICENT">아이센트</option>
                                      <option value="ICONLAB">아이콘랩</option>
                                      <option value="IGLOOSEC">이글루시큐리티</option>
                                      <option value="IMC">IMC</option>
                                      <option value="INFOSEC">인포섹</option>
                                      <option value="INNOTECH">이노테크</option>
                                      <option value="INSOFT">아이엔소프트</option>
                                      <option value="INZEN">인젠</option>
                                      <option value="ITPlus">ITPlus</option>
                                      <option value="IWT">아이더블유티</option>
                                      <option value="JAEUNGTECH">재웅테크</option>
                                      <option value="KEY2NET">KEY2NET</option>
                                      <option value="KOREANET">코리아네트</option>
                                      <option value="KORNIC">코닉글로리</option>
                                      <option value="LINUXONE">리눅스원</option>
                                      <option value="MANTECH">맨텍</option>
                                      <option value="MCURIX">엠큐릭스</option>
                                      <option value="Microsoft">Microsoft인성정보</option>
                                      <option value="NCODING">엔코딩패스</option>
                                      <option value="NEXTCODE">넥스트코드</option>
                                      <option value="NEXTGATE">넥스게이트</option>
                                      <option value="NKIA">엔키아</option>
                                      <option value="NOKIA">노키아</option>
                                      <option value="PIXBYTE">픽스바이트</option>
                                      <option value="PSYNET">사이넷</option>
                                      <option value="QCOM">큐컴</option>
                                      <option value="RATHONTECH">라톤테크</option>
                                      <option value="ROCKPLACE">락플레이스</option>
                                      <option value="RSUPPORT">알스포트</option>
                                      <option value="SIGMAINFO">시그마정보통신</option>
                                      <option value="SKCC">SK C&amp;C</option>
                                      <option value="SKTelecom">SKTelecom</option>
                                      <option value="SVL">SVL</option>
                                      <option value="TGCORP">티지코프</option>
                                      <option value="UCLICK">유클릭</option>
                                      <option value="XEST">제스트정보기술</option>
                                      <option value="ZESPRO">제스프로</option>
                                      <option value="cipher_cas">싸이퍼캐스팅</option>
                                      <option value="solvix">솔빅스</option>
                                      <option value="varobision">바로비젼</option>
                                    </select></td>
                                  <td><img src="../images/dot_2.gif" align="absmiddle" /><FONT COLOR="ff3116">필수</FONT></td>
                                </tr>
                              </table></td>
                          </tr>
                        </table></td>
                      <td valign="top"><table border="0" cellspacing="0" cellpadding="0">
                          <colgroup>
                          <col width="100">
                          <col width="*">
                          </colgroup>
                          <tr>
                            <td height="30" class="PopupBold">휴대폰</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><select name="hp4" size="1" class="InputLIneSelect">
                                      <option value ="">선택하세요</option>
                                      <option value ="011">011</option>
                                      <option value ="016">016</option>
                                      <option value ="017">017</option>
                                      <option value ="018">018</option>
                                      <option value ="019">019</option>
                                      <option value ="010" selected="selected">010</option>
                                    </select>
                                    -
                                    <input name="hp4" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onkeypress="onlyNumber();" />
                                    -
                                    <input name="hp4" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onkeypress="onlyNumber();" />
                                    <input name="isported2" type="checkbox" value="1" />
                                    <span class="style1">번호이동일 경우 체크</span><img src="../images/dot_2.gif" align="absmiddle"><FONT COLOR="ff3116">필수</FONT></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">회사전화</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><select name="tel4" class="InputLIneSelect">
                                      <option value=''>선택하세요</option>
                                      <option value='02' >02</option>
                                      <option value='031'>031</option>
                                      <option value='032'>032</option>
                                      <option value='033'>033</option>
                                      <option value='041'>041</option>
                                      <option value='042'>042</option>
                                      <option value='043'>043</option>
                                      <option value='051'>051</option>
                                      <option value='052'>052</option>
                                      <option value='053'>053</option>
                                      <option value='054'>054</option>
                                      <option value='055'>055</option>
                                      <option value='061'>061</option>
                                      <option value='062'>062</option>
                                      <option value='063'>063</option>
                                      <option value='064'>064</option>
                                    </select>
                                    -
                                    <input name="tel4" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onkeypress="onlyNumber();" />
                                    -
                                    <input name="tel4" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onkeypress="onlyNumber();" /></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">팩스</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="fax4" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onkeypress="onlyNumber();" />
                                    -
                                    <input name="fax4" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onkeypress="onlyNumber();" />
                                    -
                                    <input name="fax4" type="text" class="inputLIneGrayColor" size="5" maxlength="4" onkeypress="onlyNumber();" /></td>
                                  <td class="T11PopupText">&nbsp;</td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">이름</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><input name="uname2" type="text" class="inputLIneGrayColor" size="23" maxlength="20" style = "ime-mode:inable" /></td>
                                  <td class="T11PopupText"><img src="../images/dot_2.gif" align="absmiddle" /><FONT COLOR="ff3116">필수</FONT></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="30" class="PopupBold">담당자</td>
                            <td class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td><select name="oper2" class="InputLIneSelect" style="width:110" onchange="change_service(this.form.oper.value,this.form.company.value)">
                                      <option value=''>사용자유형선택</option>
                                    </select>
                                  </td>
                                  <td class="T11PopupText"><img src="../images/dot_2.gif" align="absmiddle" /><FONT COLOR="ff3116">필수</FONT> <span class="style1">(매니저를 선택하세요.)</span> </td>
                                </tr>
                              </table></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td height="30" colspan="2" class="PopupLine"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="4" bgcolor="#9ab1cf">
                    </tr>
                    <tr>
                      <td height="30" class="OrangeText"><strong>장비등록 현황</strong></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <colgroup>
                    <col width="40%">
                    <col width="*">
                    </colgroup>
                    <tr>
                      <td><table border="0" cellspacing="0" cellpadding="0">
                          <colgroup>
                          <col width="100">
                          <col width="*">
                          </colgroup>
                          <tr>
                            <td class="BlueText"><strong>서비스 선택</strong></td>
                            <td><select name="oper" class="InputLIneSelect">
                                <option value ="">담당자를 선택하세요</option>
                              </select></td>
                          </tr>
                        </table></td>
                      <td width="700" align="center" valign="top"><table border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td height="4"></td>
                          </tr>
                          <tr>
                            <td height="2" bgcolor="#c9c9c9"></td>
                          </tr>
                          <tr>
                            <td height="4" align="center"></td>
                          </tr>
                          <tr>
                            <td width="700" align="center"><table border="0" cellspacing="0" cellpadding="0">
                                <colgroup>
                                <col width="340">
                                <col width="*">
                                <col width="340">
                                </colgroup>
                                <tr>
                                  <td><table border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td><img src="../images/dot_1.gif" width="24" height="28" /></td>
                                        <td><strong>등록시스템</strong></td>
                                      </tr>
                                    </table></td>
                                  <td align="center">&nbsp;</td>
                                  <td><table border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td><img src="../images/dot_1.gif" width="24" height="28" /></td>
                                        <td><strong>신청시스템</strong></td>
                                      </tr>
                                    </table></td>
                                </tr>
                              </table>
                              <table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="30" align="center" class="PopupLine"><select multiple size="7" name="reg_system" style="width:340" onDblClick="move(document.form.reg_system,document.form.req_system)" class="InputGray">
                                    </select></td>
                                  <td align="center"><table border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td align="center"><img src="../images/btn_S1.gif" width="20" height="17" /></td>
                                      </tr>
                                      <tr>
                                        <td align="center">&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td align="center"><img src="../images/btn_S2.gif" width="20" height="17" /></td>
                                      </tr>
                                    </table></td>
                                  <td height="30" align="center" class="PopupLine"><select multiple size="7" name="reg_system2" style="width:340" ondblclick="move(document.form.reg_system,document.form.req_system)" class="InputGray">
                                    </select></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td height="4" align="center"></td>
                          </tr>
                          <tr>
                            <td height="2" bgcolor="#c9c9c9"></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr>
                      <td colspan="2"  class="PopupLine"><table border="0" cellspacing="0" cellpadding="0">
                          <colgroup>
                          <col width="100">
                          <col width="*">
                          </colgroup>
                          <tr>
                            <td height="30" class="PopupBold">사용목적</td>
                            <td><input name="object" type="text" class="inputLIneGrayColor" size="50" maxlength="50"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td></td>
          <td height="30" align="right"><a href="#"><img style="margin-right:6px" src="../images/btn_regist.gif" width="42" height="22" onClick="Form_check()"></a><a href="#"><img src="../images/btn_close.gif" width="42" height="22" onClick="javascript:window.close();"></a></td>
          <td></td>
        </tr>
      </table></td>
  </tr>
</table>
<script language="JavaScript">
	window.document.onload = document.form.uid.focus();
	window.document.onload = uKindChange();change_menu('G')
</script>
</body>
</html>
