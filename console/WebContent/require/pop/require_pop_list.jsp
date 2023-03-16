<%@ page contentType="text/html; charset=euc-kr"%>
<%@page import="console.common.tray.ResultSetTray, console.common.util.Util" %>
<%@include file="/common/common.jsp" %>


<%

	/*	계정신청 현황 -> UNIX 작업 신청 현황 -> 팝업(승인/반려)처리 	*/
	
	ResultSetTray listTray  = null;
	int	rowCount = 0;					

	if( request.getAttribute("rsTray") !=null){
		listTray = (ResultSetTray)request.getAttribute("rsTray");
		rowCount = listTray.getRowCount();
	}
%>



<html>
<head>
<!-- 팝업사이즈  800 * 628-->
<title>팝업_작업내역승인</title>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=EUC-KR">
	<META NAME="CONTENT-LANGUAGE" CONTENT="KR">		
<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Form.css' TYPE='TEXT/CSS'>
<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Default.css' TYPE='TEXT/CSS'>

<script>


function close1(){

	window.alert("승인 완료 ");
	window.close();

}


function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function add_policy(val)
{
	if ( val != "self")
	{
		HiddenFrame.location.href="user_add_policy_list.php?f="+val;
		checked(true);
		ele(true);
		return;
	}
	else
	{
		checked(false);
		ele(false);
		form.term_time.options[0].selected = true
		form.idle_time.options[0].selected = true
		form.limitation_com.value =""
		form.term_time.focus();
	}
	
}
function check_m(val)
{
	var policy = form.policy.value
	if (policy =="self") return;
	if (val ==1) ele(false);
	else ele(true);
}

function checked(val)
{

	 if(val) document.form.selectyes.checked = true;	  
	 else document.form.selectyes.checked = false;
	  
}

function ele(val)
{
	for (var i=0; i<form.elements.length; i++) 
	{
		if (form.elements[i].name == "term_time" || form.elements[i].name=="idle_time" || form.elements[i].name=="limitation_com" )
		{		
			 if (form.elements[i].type=="textarea" || form.elements[i].type=="select-one") {
				 if (val) 
				 {
					if(form.elements[i].name  != "policy") form.elements[i].style.background="#e8e8e8"
					if(form.elements[i].type=="select-one" && form.elements[i].name != "policy"  ) form.elements[i].disabled  = true;
					form.selectyes.value = 1
				 }
				 else 
				{	
					if(form.elements[i].name  != "policy") form.elements[i].style.background="#ffffff"
					if(form.elements[i].type=="select-one" && form.elements[i].name != "policy" ) form.elements[i].disabled  = false;
					form.selectyes.value = 0

				}
			 }
		}
	}
}
var winfo;    // 전역변수로 선언한 뒤...
function newWin()
{
		var val = form.limitation_com.value;
		var act;
		var url="../code/user_command.php?command="+val
		var re = "toolbar=no, resizable=1,scrollbars=auto, status=0,location=no, resize=0 menubar=no, directories=no, copyhistory=0, width=724, height=598,top=200, left=370";
		if (winfo != null)     winfo.close();
		 winfo=window.open(url, 'command', re);
}
function newWin1()
{
	var Pwidth=802;
	var Pheight=451;
	locW = (screen.availWidth-Pwidth)/2;
	locH = (screen.availHeight-Pheight)/2;
	 if (winfo != null)     winfo.close();
		 winfo = window.open("../board/jobReg/equipfind.php?f=U","subWin","width="+Pwidth+",height="+Pheight+",top="+locH+",left="+locW+",toolbar=no,scrollbars=0, resizable=0, toolbar=0, menubar= 0,location=0, directories=0, status=0");
	//	 gFlowWait(true, false);
}

function changetime(val1,val2,val3,val4)
{
 
  for(i=0;i<document.form.term_time.length;i++)
  {
	   if(document.form.term_time.options[i].value ==val1) 
	   {
			document.form.term_time.options[i].selected = true;	   
	   }
  }	
  for(i=0;i<document.form.idle_time.length;i++)
  {
	   if(document.form.idle_time.options[i].value ==val2) 
	   {
			document.form.idle_time.options[i].selected = true;	   
	   }
  }	

}
function Form_check()
{

	var inRowCount = iframe.mytable1.rows.length; //장비
	//------------------------------------------------------------------------------
	// value move  
	// 필수 입력 사항 Check 
	//------------------------------------------------------------------------------
	var strFullValue = "";
	var strValue     = "";
	if ( inRowCount == 0) 
	{
		alert("시스템을 선택하십시요.");
		return;
	}

	for (var i=0; i<form.elements.length; i++) 	
	{
		if (form.elements[i].type=="select-one") form.elements[i].disabled  = false;
		
	}

		var devStaDy;
		var devEndDy;
		devStaDy = removeHiphone(form.cal1.value)+form.hh1.value+form.mm1.value;
		devEndDy = removeHiphone(form.cal2.value)+form.hh2.value+form.mm2.value; 
			
		if(devStaDy != "" && devEndDy !="")
		{
			if(Number(devEndDy)  <=  Number(devStaDy))
			{
				//count++;
				alert("작업 종료시간이 작업 시작시간 이후로 설정되어야 합니다.");
				return form.cal2.select();
			}
		}
		now = new Date()
		dev_yesr = now.getYear(); 
		dev_Month = now.getMonth()+1;
		dev_day = now.getDate();
		dev_Hours = now.getHours();
		dev_Min = 	now.getMinutes();
		if ( dev_Month <=9) dev_Month ="0"+dev_Month;
		if ( dev_Hours <=9) dev_Hours ="0"+dev_Hours;
		if ( dev_day <=9) dev_day ="0"+dev_day;
		if ( dev_Min <=9) dev_Min ="0"+dev_Min;
		
		var devStaDy1;

		devStaDy1 = dev_yesr + dev_Month +dev_day + dev_Hours + dev_Min


			if(Number(devEndDy)  <=  Number(devStaDy1))
			{
				//count++;
				alert("작업 시간이 이미 종료 되었습니다!");
				return form.cal2.select();
			}
		devStaDy = form.cal1.value+" "+form.hh1.value+":"+form.mm1.value+":00";
		devEndDy = form.cal2.value+" "+form.hh2.value+":"+form.mm2.value+":00"; 

		opener.form.content.value = form.content.value;
		opener.form.st.value = devStaDy;
		opener.form.et.value = devEndDy;
		opener.form.term.value = form.term_time.value
		opener.form.idle.value = form.idle_time.value
		opener.form.lc.value = form.limitation_com.value
		
		opener.form.submit();
		window.close();

}

function Form_edit()
{
	for (var i=0; i<form.elements.length; i++) 	
	{
		if (form.elements[i].type=="select-one") form.elements[i].disabled  = false;
		
	}

		var devStaDy;
		var devEndDy;
		devStaDy = removeHiphone(form.cal1.value)+form.hh1.value+form.mm1.value;
		devEndDy = removeHiphone(form.cal2.value)+form.hh2.value+form.mm2.value; 
			
			
		if(devStaDy != "" && devEndDy !="")
		{
			if(Number(devEndDy)  <=  Number(devStaDy))
			{
				//count++;
				alert("작업 종료시간이 작업 시작시간 이후로 설정되어야 합니다.");
				return form.cal2.select();
			}
		}

	var inRowCount = iframe.mytable1.rows.length; //장비
	//------------------------------------------------------------------------------
	// value move  
	// 필수 입력 사항 Check 
	//------------------------------------------------------------------------------
	var strFullValue = "";
	var strValue     = "";
	if ( inRowCount == 0) 
	{
		alert("시스템을 선택하십시요.");
		return;
	}
	if ( inRowCount == 1)
	{
		if(iframe.frmLst.SYS_ID.value =="")			
		{
			alert("시스템을 선택하십시요.");
			//iframe.form.EQUIP_NM.focus();
			return;
		}
		strValue = iframe.frmLst.SYS_ID.value;
		strValue = strValue + "<RETURN>";
		strFullValue =  strFullValue + strValue;
	}
	else
	{
		for(var i = 0; i < inRowCount; i++)
		{ 

		if(iframe.frmLst.SYS_ID[i].value=="")			
		{
			alert("시스템을 선택하십시요.");
			iframe.frmLst.SYS_ID[i].focus();
			return;
		}
		strValue = iframe.frmLst.SYS_ID[i].value;
		strValue = strValue + "<RETURN>";
		strFullValue =  strFullValue +strValue;

		} //for	
	} //if
	//------------------------------------------------------------------------------
	// INPUT --> Element 생성 후 Form 에 Apeend Child
	//------------------------------------------------------------------------------
	var INPUTElement = document.createElement("INPUT");
	INPUTElement.setAttribute("type", "hidden");
	INPUTElement.setAttribute("name", "SYS_ID");
	INPUTElement.setAttribute("value", strFullValue);
	form.appendChild(INPUTElement);

	gFlowWait(true, false);
	form.action ="../usermode/job_content_edit.php";
	form.submit();
}
function ET_onchange(val)
{

		t = new Number(val);
	    if (t > 19) t = 23
		else t = t + 4
		document.form.ET.options[t].selected = true;
}
function newWin2(val1)
{
	var Pwidth=503;
	var Pheight=150;
	var url
	locW = (screen.availWidth-Pwidth)/2;
	locH = (screen.availHeight-Pheight)/2;
	url = "./return_ok.php?uniq_id="+val1+"&f=n";
	 if (winfo != null)     winfo.close();
		 winfo = window.open(url,"reutrn","width="+Pwidth+",height="+Pheight+",top="+locH+",left="+locW+",toolbar=no,scrollbars=0, resizable=0, toolbar=0, menubar= 0,location=0, directories=0, status=1");
	 //gFlowWait(false, false);
}



</script>







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
<table width="800" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="46" background="<%=DIR_IMG %>pop_800bg_01.jpg" class="PopupTitleBgWhite"><img src="<%=DIR_IMG %>pop_img01.gif" width="8" height="17" align="absmiddle" style="margin-left:10px; margin-right:10px">작업내역 승인</td>
  </tr>
  <tr>
    <td height="4"></td>
  </tr>
  <tr>
    <td><table width="800" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="5"></td>
        <td width="790" height="4" bgcolor="#9ab1cf"></td>
        <td width="5"></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                 <colgroup>
	            <col width="20">
	            <col width="110">
	            <col width="*">
	            </colgroup>
          <tr>
            <td height="30" class="PopupBold"></td>
            <td class="PopupBold">작업목적</td>
            <td class="PopupBold"><textarea name="content" cols="60" rows="3"  class="InputLIneGraySearch"  onKeyUp="chk_msg()" readonly><%=listTray.get("intention") %></textarea></td>
          </tr>
          <tr>
            <td height="30" class="PopupBold"></td>
            <td class="PopupBold">작업 시간</td>
            <td class="PopupLine"><input name="cal1" class="InputLIneGray" value="<%=listTray.get("from_dt") %>" size="10"><img src="<%=DIR_IMG %>/zoom.gif"style="margin-right:4px;margin-left:4px" align="middle"  class="Cursor_hand" onClick="popUpCalendar(this, cal1, 'yyyy/mm/dd');">
              <select name="hh1" class="InputLIneSelect">
						 <option value="00" >00</option>
						 <option value="01" >01</option>
						 <option value="02" >02</option>
						 <option value="03" >03</option>
						 <option value="04" >04</option>
						 <option value="05" >05</option>
						 <option value="06" >06</option>
						 <option value="07" >07</option>
						 <option value="08" >08</option>
						 <option value="09" >09</option>
						 <option value="10" >10</option>
						 <option value="11" >11</option>
						 <option value="12" >12</option>
						 <option value="13" >13</option>
						 <option value="14" >14</option>
						 <option value="15" >15</option>
						 <option value="16" >16</option>
						 <option value="17" SELECTED>17</option>
						 <option value="18" >18</option>
						 <option value="19" >19</option>
						 <option value="20" >20</option>
						 <option value="21" >21</option>
						 <option value="22" >22</option>
						 <option value="23" >23</option>
                </select>
              시 
                  <select name="mm1"  class="InputLIneSelect">
                                                                                    <option value="00" selected>00</option>
                                                                                 <option value="05" >05</option>
                                                                                 <option value="10" >10</option>
                                                                                 <option value="15" >15</option>
                                                                                 <option value="20" >20</option>
                                                                                 <option value="25" >25</option>
                                                                                 <option value="30" >30</option>
                                                                                 <option value="35" >35</option>
                                                                                 <option value="40" >40</option>
                                                                                 <option value="45" >45</option>
                                                                                 <option value="50" >50</option>
                                                                                 <option value="55" >55</option>
                  </select>
                          분 ~ 
                  <input name="cal2" type="text" class="InputLIneGray" size="10" VALUE="<%=listTray.get("from_dt") %>"> 
                  <img src="<%=DIR_IMG %>zoom.gif" align="middle" class="Cursor_hand" onClick="popUpCalendar(this, cal2, 'yyyy/mm/dd');"> 
                  <select name="hh2"  class="InputLIneSelect">
                                                                                    <option value="00" >00</option>
                                                                                    <option value="01" >01</option>
                                                                                    <option value="02" >02</option>
                                                                                    <option value="03" >03</option>
                                                                                    <option value="04" >04</option>
                                                                                    <option value="05" >05</option>
                                                                                    <option value="06" >06</option>
                                                                                    <option value="07" >07</option>
                                                                                    <option value="08" >08</option>
                                                                                    <option value="09" >09</option>
                                                                                    <option value="10" >10</option>
                                                                                    <option value="11" >11</option>
                                                                                    <option value="12" >12</option>
                                                                                    <option value="13" >13</option>
                                                                                    <option value="14" >14</option>
                                                                                    <option value="15" >15</option>
                                                                                    <option value="16" >16</option>
                                                                                    <option value="17" SELECTED>17</option>
                                                                                    <option value="18" >18</option>
                                                                                    <option value="19" >19</option>
                                                                                    <option value="20" >20</option>
                                                                                    <option value="21" >21</option>
                                                                                    <option value="22" >22</option>
                                                                                    <option value="23" >23</option>
                  </select>
                          시 
                          <select name="mm2"  class="InputLIneSelect">
                                                                                    <option value="00" SELECTED>00</option>
                                                                                   <option value="05" >05</option>
                                                                                   <option value="10" >10</option>
                                                                                   <option value="15" >15</option>
                                                                                   <option value="20" >20</option>
                                                                                   <option value="25" >25</option>
                                                                                   <option value="30" >30</option>
                                                                                   <option value="35" >35</option>
                                                                                   <option value="40" >40</option>
                                                                                   <option value="45" >45</option>
                                                                                   <option value="50" >50</option>
                                                                                   <option value="55" >55</option>
                  </select>
                분</td>
          </tr>
          <tr>
            <td height="30" class="PopupBold"></td>
            <td class="PopupBold">작업시스템</td>
            <td class="PopupBold"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="4"></td>
              </tr>
              <tr>
                <td><table width="666" border="0" cellpadding="0" cellspacing="0">
                  <colgroup>
                  <col width="130">
                  <col width="100">
                  <col width="130">
                  <col width="100">
                  <col width="90">
                  <col width="*">
                  </colgroup>
                  <tr class="TableBgBold">
                    <td height="34" class="TableBg">서비스 이름</td>
                    <td class="TableBg">서비스 ID </td>
                    <td class="TableBg">시스템 이름</td>
                    <td class="TableBg">시스템 ID</td>
                    <td class="TableBg">장비담당자</td>
                    <td class="TableBg">구분</td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td>
                <%String cert_id = "111111"; %>
<!--                <div style="height:130; overflow-y:scroll;"> -->
               <iframe id="iframe" name="iframe" src="/require.do?cmd=unix_equip_list&s=&c=<%=cert_id%>&flag=unix" width="630" scrolling="auto" height="145" marginwidth="0" frameborder="0"></iframe></td>
               
               
              
<!--                </div>-->
                
                
                </td>
              
              
              </tr>
              <tr>
                <td height="34" align="right"><img src="<%=DIR_IMG %>btn_add.gif"></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="30" class="PopupBold"></td>
            <td class="PopupBold">FTP 사용</td>
            <td class="PopupLine"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><input type="radio" name="ftp" value="1" >
                    <B><FONT COLOR="ff3116">사용</FONT></B>
                    <input type="radio" name="ftp" value="0" checked>
                  미사용 </td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="30" class="PopupBold"></td>
            <td class="PopupBold">보안정책 설정</td>
            <td class="PopupLine"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="100"><select name="policy"  class="InputLIneSelect" onChange="add_policy(this.value)">
                    <option value="self">사용자정의입력</option>
                </select></td>
                <td class="T11PopupText"><input type="checkbox" name="selectyes" value="0" onClick="check_m(this.value)">
                  사용자정의 수정</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="30" class="PopupBold"></td>
            <td class="PopupBold">유효시간</td>
            <td class="PopupLine"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="100"><select name="term_time"  class="InputLIneSelect">
                    <option value="1">01</option>
                    <option value="2">02</option>
                    <option value="3">03</option>
                    <option value="4">04</option>
                    <option value="5">05</option>
                    <option value="6">06</option>
                    <option value="7">07</option>
                    <option value="8">08</option>
                    <option value="9">09</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                    <option value="13">13</option>
                    <option value="14">14</option>
                    <option value="15">15</option>
                    <option value="16">16</option>
                    <option value="17">17</option>
                    <option value="18">18</option>
                    <option value="19">19</option>
                    <option value="20">20</option>
                    <option value="21">21</option>
                    <option value="22">22</option>
                    <option value="23">23</option>
                    <option value="24">24</option>
                </select></td>
                <td>[단위:시간]</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="30" class="PopupBold"></td>
            <td class="PopupBold">유휴시간</td>
            <td class="PopupLine"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="100"><select name="idle_time" class="InputLIneSelect">
                  <option value="5">05</option>
                  <option value="6">06</option>
                  <option value="7">07</option>
                  <option value="8">08</option>
                  <option value="9">09</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                  <option value="13">13</option>
                  <option value="14">14</option>
                  <option value="15">15</option>
                  <option value="16">16</option>
                  <option value="17">17</option>
                  <option value="18">18</option>
                  <option value="19">19</option>
                  <option value="20">20</option>
                  <option value="21">21</option>
                  <option value="22">22</option>
                  <option value="23">23</option>
                  <option value="24">24</option>
                  <option value="25">25</option>
                  <option value="26">26</option>
                  <option value="27">27</option>
                  <option value="28">28</option>
                  <option value="29">29</option>
                  <option value="30">30</option>
                  <option value="31">31</option>
                  <option value="32">32</option>
                  <option value="33">33</option>
                  <option value="34">34</option>
                  <option value="35">35</option>
                  <option value="36">36</option>
                  <option value="37">37</option>
                  <option value="38">38</option>
                  <option value="39">39</option>
                  <option value="40">40</option>
                  <option value="41">41</option>
                  <option value="42">42</option>
                  <option value="43">43</option>
                  <option value="44">44</option>
                  <option value="45">45</option>
                  <option value="46">46</option>
                  <option value="47">47</option>
                  <option value="48">48</option>
                  <option value="49">49</option>
                  <option value="50">50</option>
                  <option value="51">51</option>
                  <option value="52">52</option>
                  <option value="53">53</option>
                  <option value="54">54</option>
                  <option value="55">55</option>
                </select></td>
                <td>[단위:분]</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="30" class="PopupBold"></td>
            <td class="PopupBold">금지명령어</td>
            <td class="PopupLine"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td class="PopupLine" style="padding-top:5px; padding-bottom:5px"><textarea name="limitation_com" cols="110" rows="5" class="InputLIneSelect" readonly></textarea></td>
              </tr>
              <tr>
                <td height="34" align="right"><img src="<%=DIR_IMG %>tn_inhibition.gif"></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="30" class="PopupBold"></td>
            <td class="PopupLine"><strong>첨부파일</strong></td>
            <td class="PopupBold"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="300" height="18">&nbsp;</td>
                <td width="100" align="center"><strong>작업결과</strong></td>
                <td>&nbsp;</td>
              </tr>
            </table></td>
          </tr>
          
        </table></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td></td>
        <td height="40" align="right"><a href="#"><img style="margin-right:6px"src="<%=DIR_IMG %>btn_renewal.gif" width="42" height="22"></a><a href="#">
        <img style="margin-right:6px"src="<%=DIR_IMG %>btn_agree.gif" width="42" height="22" onclick="close1();"></a><a href="#"><img style="margin-right:6px" src="<%=DIR_IMG %>btn_return.gif" width="42" height="22"></a><a href="#"><img src="<%=DIR_IMG %>btn_close.gif" width="42" height="22"></a></td>
        <td></td>
      </tr>
      
      
    </table></td>
  </tr>
</table>
</body>
</html>
