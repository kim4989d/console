<%@ page contentType="text/html; charset=euc-kr"%>
<%@page import="console.common.tray.ResultSetTray,console.common.util.CommonUtil,console.common.util.Util" %>
<%@include file="/common/common.jsp" %>



<%
	ResultSetTray listTray  = null;
    int	rowCount = 0;					//게시물 전체 갯수
	
    String message=CommonUtil.Isnull((String)request.getAttribute("message"));
    
    
    if( request.getAttribute("rsTray") !=null){
		listTray = (ResultSetTray)request.getAttribute("rsTray");
		rowCount = listTray.getRowCount();
	}

%>
<%
  request.setCharacterEncoding("euc-kr");
%>

<html>
<head>
<title>계정 신청 현황</title>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=EUC-KR">
	<META NAME="CONTENT-LANGUAGE" CONTENT="KR">		
<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Form.css' TYPE='TEXT/CSS'>
<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Default.css' TYPE='TEXT/CSS'>
<style type="text/css">
<!--
table.Nnavi {height:13px;border-collapse:collapse;margin:0 auto;}
table.Nnavi {height:13px;border-collapse:collapse;margin:0 auto;}
-->
</style>
<script type="text/javascript">
<%
	if(!message.equals("")){


%>

	alert(<%=message%>);

<%
	}

%>

function choice(){
		var frm=document.requirefrm;
		var numtemp="";
		var temp ="";
		temp=frm.check;
		var len = temp.length;
		var count=0;
		var bool="false";
		var choice=0;
		
		for( var i=0; i < temp.length ; i++){
			if(temp[i].checked){
				++count;
			}
		}


		for( var j=0; j < temp.length ; j++){
			if(temp[j].checked){
				temp[j].checked=true;
			
			}else{
					if(count==0){
				
					temp[j].checked=false;
					temp[j].disabled=false;	
					}else{
					temp[j].disabled=true;	
					}
				}
		}		
}



 function SetChecked(f)
{
	var CheckBox = document.form.seqNo;
	if( !CheckBox ) return;
	var Flag = document.form.flag;
	if( Flag.value == 1 ){
		Flag.value = 0;
		document.form.check_all.checked = false;

	} else {
		Flag.value = 1;
		document.form.check_all.checked = true;
   }
	if( CheckBox.name == 'seqNo' ){
		if( Flag.value == 1 )
			CheckBox.checked=true;
		else
			CheckBox.checked=false;
	} else {
		for( i = 0; i < CheckBox.length; i++ ){
		 if( Flag.value == 1 )
			 CheckBox[i].checked=true;
		 else
			 CheckBox[i].checked=false;
		}
	}
}

function move_button(act)
{
		var frm=document.requirefrm;
		
		var numtemp="";
		var temp ="";
		temp=frm.check;
		var len = temp.length;
		var count=0;
		var bool="false";
				if(len>1){
						for(var i=0;i<len;i++){
							if(temp[i].checked){
							count++;		
							bool="true";
							}
						}
						for(var i=0;i<len;i++){
							if(temp[i].checked){
								if(count==1){
								numtemp =temp[i].value;		
								}else{
								numtemp =numtemp+"/"+ temp[i].value;		
								}
							}
						}
						if(count==0 && bool=="false"){
								alert("값을 선택하십시오");
								return;
								}
						if(confirm("승인 완료하시겠습니까?")){ 
						}else{
						return;
						}
				}else{
				
						if(temp.checked){
						numtemp=temp.value;
						bool="true";
						}
						if(count==0 && bool=="false"){
							alert("값을 선택하십시오");
							return;
							}
						if(confirm("승인완료하시겠습니까?")){ 
						}else{
						return;
						}
					}

			var seqNo=numtemp;
			
	//		window.alert(seqNo);
			
			frm.target="_self";
			frm.methode = "post";
		
			frm.seqNo.value=seqNo;
			frm.action="/require.do";
			frm.submit();
		

}




var newPoup;    // 전역변수로 선언한 뒤...
	function goReturn(name,cert_id)
	{
			var name;
			var cert_id;
			if(confirm(name+"님을 반려 하시겠습니까?")) {
			  newWin(cert_id);
			} else {
			  return;
			}
	}
	function newWin(result)
	{
		var result;
		var url="returnuser_ok.php?uniq_id="+result
	var re = "toolbar=no, resizable=yes,scrollbars=auto, status=no,location=no, resize=no, menubar=no, directories=no, copyhistory=0, width=503, height=150, top=200, left=370";
    if (newPoup != null)    newPoup.close();
	newPoup=window.open(url, 'r', re);
	}
	function allRefresh()
	{
//		window.parent.frames["leftFrame"].location.reload() ;
//		window.parent.frames["mainFrame"].location.reload();
	
	}
	
	
	
	//작업승인용 요청한 내역 상세 확인
	function newWin1(val)
	{
		var val;
		var url="user_details.php?uid="+val
		var re = "toolbar=no, resizable=no,scrollbars=no, status=1,location=no, resize=no, menubar=no, directories=no, copyhistory=0, width=902, height=486, top=100, left=50";
     if (newPoup != null)     newPoup.close();
	newPoup=window.open(url, 'user', re);
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
 <form name="requirefrm">
	<input type="hidden" name="user_id" value="<%= user_id %>" >
	<input type="hidden" name="name" value="<%= name %>" >
	<input type="hidden" name="kind" value="<%= kind %>" >
	<input type="hidden" name="cmd" value="require_user_update_list" >
	<input type="hidden" name="seqNo">
	
	<table width="764" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="20">&nbsp;</td>
          <td width="724" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30"></td>
            </tr>
            <tr>
              <td height="22"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              	<colgroup>
	            <col width="12">
	            <col width="15%">
	            <col width="*">
	            </colgroup>
                <tr>
                  <td><img style="margin-left:15px; margin-right:15px"src="<%=DIR_IMG %>icon01.gif" align="absmiddle"></td>
                  <td><img style="margin-right:20px"src="<%=DIR_IMG %>text_top_service1.gif"></td>
                   <td width="78%" class="MenuTopText">>> 계정 신청현황 </td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td height="45" align="right" class="T11PgaeNum"><img style="margin-right:10px"src="<%=DIR_IMG %>icon02.gif" align="middle">
                      총 <strong><%=listTray.getRowCount() %></strong>  페이지 <B><FONT COLOR="ed7338">1/1</FONT></b></td>
            </tr>
            <tr>
              <td  valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
                <colgroup>
	            <col width="40">
	            <col width="80">
                <col width="70">
	            <col width="*">
                <col width="100">
	            <col width="80">
	            <col width="82">
	            </colgroup>
                    <tr class="TableBgBold">
                      <td height="34" class="TableBg"><img src="<%=DIR_IMG %>btn_top_all.gif" align="middle" onclick="checkBox_AllCheck();"></td>
                      <td class="TableBg">사용자ID</td>
                      <td class="TableBg">사용자이름</td>
                      <td class="TableBg">소속사</td>
                      <td class="TableBg">사용자권한</td>
                      <td class="TableBg">신청목적</td>
                      <td class="TableBg">신청일</td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
                <colgroup>
	            <col width="40">
	            <col width="80">
                <col width="70">
	            <col width="*">
                <col width="100">
	            <col width="80">
	            <col width="82">
	            </colgroup>
              	<%
			 	if(rowCount == 0)
			 	{	
			 	%>
				    <tr class="TableBgText"><td colspan="7" align="center">검색된 테이블이없습니다</td></tr>
				<%
			 	}
			 	else{		
			   		for(int i=0;i<rowCount;i++){	
			   	%>		<tr>	
							<td class="TableBgText"><input type="checkbox" name="check" value="<%=listTray.get("user_id", i)%>" onclick="choice()"></td>
						    <td class="TableBgText"><%=listTray.get("user_id", i)%></td>
						    <td class="TableBgText"><%=listTray.get("name", i) %></td>
						    <td class="TableBgText"><%=listTray.get("company_name", i) %></td>
						    <td class="TableBgText"><%=listTray.get("apply_date", i) %></td>
						    <td class="TableBgText"><%=listTray.get("intention", i)%></td>
						    <td class="TableBgTextDate"><%=Util.DataFormat_yyMMdd( listTray.get("reg_dt",i) )%></td>
					    </tr>
					<%	}
			    	}
			    %>

         
                  </table>
                  </td>
                </tr>
                <%
					if(rowCount == 0){
					}else{
				%>
                <tr>
                  <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="34">
                            <div align="center">
                                <!--페이징 처리 클래스 끝-->
                                <b><font color=ff7635>&nbsp;1&nbsp; 
                            </div>
                            <!--페이징 처리 클래스 끝-->
                            </td>
                          </tr>
                      </table></td>
                    </tr>
                  </table></td>
                </tr>
              </table></td>
            </tr>
          </table></td>
          <td width="20">&nbsp;</td>
        </tr>
        <tr>

          <td>&nbsp;</td>
          <td height="40" align="right" valign="top">
	          <img style="margin-right:6px"src="<%=DIR_IMG %>btn_renewal.gif" width="42" height="22" onclick="Refresh();">
	          <img style="margin-right:6px"src="<%=DIR_IMG %>btn_agree.gif"   width="42" height="22" onclick="move_button('co');">
	          <img style="margin-right:6px"src="<%=DIR_IMG %>btn_return.gif"  width="42" height="22" onclick="move_button('re');">
          </td>
          <%} %>
          <td>&nbsp;</td>
        </tr>
		</table>
      </form>  
             
</body>
</html>
