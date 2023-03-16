<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ page import="console.common.tray.ResultSetTray" %>
<%@ page import="console.common.util.Util"%>
<%@include file="/common/common.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
		int AdminUserCount  	=   0;		

		String div				= 	"";
		String str_order 		=	"";
		String str_value		=   "";
		String str_kind			=	"";
		String KIND				=   "";
		String SID				=	"";					// 사용자 ID 값
		String pageNum		 	=   "";
		boolean KIND_CEHCK		=	false;
		
		
		
		SID 						   = "ngsadmin";			//임시 아이디 값 부여 
	    ResultSetTray Admin_UserList   = null;   	 	//
	    String	checkbox			   = "";       		// select box 값 
	    
		div 	= 	request.getParameter("div");		// left 메뉴 값 
		if (div == "" || div == null) div ="ALL";
		
		str_order =	request.getParameter("o");			// 검색 타입 조건 1일 경우 desc 
		str_value =	request.getParameter("s");			// 검색 타입 조건 1일 경우 desc
	     
	    checkbox	=	(String)request.getAttribute("checkbox");
		
		pageNum	 =	request.getParameter("page");	
		if (pageNum == "" || pageNum == null) { pageNum ="1";} 
		
		if(request.getAttribute("rsTray") !=null){
			Admin_UserList = (ResultSetTray)request.getAttribute("rsTray");
			AdminUserCount = Admin_UserList.getRowCount();
		}
		

		
%>
<html>
<head>
<title>사용자관리>사용자관리</title>
<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=EUC-KR">
<META NAME="CONTENT-LANGUAGE" CONTENT="KR">		
<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Form.css' TYPE='TEXT/CSS'>
<LINK REL='STYLESHEET' HREF='<%=DIR_CSS%>skt_Default.css' TYPE='TEXT/CSS'>
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
<script type="text/javascript">
function List()
{
 	var frm=document.look;
 		frm.action="/admin.do?cmd=admin_user_list";
 		frm.method="post";
 		frm.target="_self";
 		frm.submit();
}

//임시 엑셀 다운로드 값 (장비 접속 엑셀 다운 로드 기능) 추후에 작업 
function ExcelDown(){
 	var frm = document.look;
 		frm.action="/server.do?cmd=exceldown";
 		frm.method="post";
 		frm.target="_self";
 		frm.submit();
 }
 
function allRefresh()
	{
		//window.parent.frames["leftFrame"].location.reload() ;
		//window.parent.frames["mainFrame"].location.reload();
		location.reload();
	}

function godelete(user_id,name,uKind)
	{
			var name;
			var cert_id;
			if(confirm(name+"님을 삭제 하시겠습니까?")) {
			//window.alert("삭제 준비 중입니다");
			 location.href="/admin.do?admin_user_del&uid="+user_id+"&k="+uKind
			} else {
			  return;
			}
	}

function emergency(val)
	{	
	
	  if (val)
	  {
		  if(confirm("긴급장애  상황에따른 접속 권한이 변경됩니다.\n\n변경하시겠습니까?\n\n※장애복구완료시 권한해제를 하시기바랍니다!")) {
				window.alert("준비중입니다");
				//HiddenFrame.location.href="user_emergency.php?f=1"
			}
			else return;
	  }
	 else
	  {
		  if(confirm("일반 사용자의 권한으로 복귀 합니다.")) {
				window.alert("준비 중입니다");
				//HiddenFrame.location.href="user_emergency.php?f=2"
			}
			else return;		
		}
		
	}
	var newPoup;    // 전역변수로 선언한 뒤...	
function newWin(val,act)
	{
		var result;
		//window.alert("사용자 아이디:"+val)
		//window.alert("사용자 액션 내용 "+val)
		if (act=="insert") var url="admin.do?cmd=admin_user_join&uid="+val
		if (act=="edit"){  var url="admin.do?cmd=admin_user_edit&uid="+val
		//window.alert("수정 준비중입니다"); 
		
		}
	var re = "toolbar=no, resizable=0,scrollbars=no, status=0,location=no, resize=0, menubar=no, directories=no, copyhistory=0, width=1010, height=530, top=100, left=50";
	 if (newPoup != null)     newPoup.close();
	newPoup=window.open(url, 'user', re);
	}

function newWin1(val1,val2,val3,val4)
	{
	var url="/admin.do?cmd=admin_user_system_list&userid="+val2+"&unm="+val1+"&kind="+val3+"&comp="+val4
	var re = "toolbar=no, resizable=0,scrollbars=no, status=0,location=no, resize=no, menubar=no, directories=no, copyhistory=0, width=502, height=546, top=200, left=370";
	 if (newPoup != null)     newPoup.close();
	newPoup=window.open(url, 'syslist', re);
	}
function SetScrollPos(tagDIV)
    {
        var positionTop = 0;
        if (tagDIV != null)
        {
            positionTop = parseInt(tagDIV.scrollTop, 10);
            document.getElementById("SAMPLE_TABLE").style.top = positionTop;
        }
    }
    
function user_sort(val,val1,val2)
	{
		var sort_value;
		var sort_name;

		sort_name =  look.sort_name.value;
		sort_value =  look.sort_value.value;
		if (val == sort_name) 
		{	
			if (sort_value == '0') {
				sort_value = '1';
			}
			else  sort_value = '0';
		}
		else
		{
			sort_value = '0';
		}
		location.href=val2+'&o='+val+"&s="+sort_value+"&div="+val1+"&page="+<%=pageNum%>;
	}
</script>
</head>
<body>
	<form name="look" method="post" action="admin_user.do?cmd=admin_user_list">
	<input type="hidden" name="div" value="<%=div%>" >
	<input type="hidden" name="sort_name" value="<%=str_order%>" >
	<input type="hidden" name="sort_value" value="<%=str_value%>" >
	<input type="hidden" name="kind" value="<%=kind%>">
	<table width="764" height="502" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="20">&nbsp;</td>
          <td width="724" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="97" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="16"></td>
                </tr>
                <tr>
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <colgroup>
                      <col width="12">
                      <col width="10%">
                      <col width="*">
                      </colgroup>
                      <tr>
                        <td><img style="margin-right:15px"src="/common/images/icon01.gif" align="absmiddle" /></td>
                        <td><img style="margin-right:15px"src="/common/images/text_top_service6.gif" /></td>
                        <td class="MenuTopText">사용자 현황 </td>
                      </tr>
                  </table></td>
                </tr>
                 <tr>
                  <td height="8"></td>
                </tr>
                <tr>
                  <td height="32" background="/common/images/search_line01.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <colgroup>
                      <col width="*">
                      <col width="30">
                      <col width="220">
                      <col width="30">
                      </colgroup>
                      <tr>
                        <td><%=checkbox%></td>
                      </tr>
                  </table></td>
                </tr>
                <tr>
                  <td height="6"></td>
                </tr>
                <tr>
                  <td align="right" class="T11PgaeNum"><img style="margin-right:10px"src="/common/images/icon02.gif" align="absmiddle">총 <strong>2</strong> 페이지 <B><FONT COLOR="ed7338">1/1</FONT></b></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <colgroup>
                        <col width="80">
						<col width="100">
                        <col width="80">
                        <col width="80">
                        <col width="170">
                        <col width="80">
                        <col width="75">
                        <col width="*">
                        </colgroup>
                        <tr class="TableBgBold">
                        <td height="34" class="TableBg"><a href="#" onClick="user_sort('name' , '<%=div%>' , 'admin.do?cmd=admin_user_list');">	사용자이름</a><img  style="margin-left:3px"src="/common/images/arrow_dowun.gif"></td>
                        <td class="TableBg">			<a href="#" onClick="user_sort('user_id' , '<%=div%>' , 'admin.do?cmd=admin_user_list');">	사용자ID</a><img  style="margin-left:3px"src="/common/images/arrow_dowun.gif"></td>
                        <td class="TableBg">소속</td>
                        <td class="TableBg">			<a href="#" onClick="user_sort('kind ' , '<%=div%>' , 'admin.do?cmd=admin_user_list');">	유형</a><img  style="margin-left:3px"src="/common/images/arrow_dowun.gif"></td>
                        <td class="TableBg">			<a href="#" onClick="user_sort('last_login_dt' , '<%=div%>' , 'admin.do?cmd=admin_user_list');">최종로그인 시간</a><img  style="margin-left:3px"src="/common/images/arrow_dowun.gif"></td>
                        <td class="TableBg">담당자이름</td>
                        <td class="TableBg">장비현황</td>
                        <td class="TableBg">관리</td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td valign="top"><div style="height:312; overflow-y:scroll;">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <colgroup>
                        <col width="80">
						<col width="100">
                        <col width="80">
                        <col width="80">
                        <col width="170">
                        <col width="80">
                        <col width="75">
                        <col width="*">
                        </colgroup>
<!--      a.user_id,a.name,c.COMPANY_NAME,a.cell_num,a.KIND,a.last_login_dt-->
                            <%
						if(AdminUserCount==0){
					  %>
					 <tr><td colspan='4'>검색된 테이블이없습니다</td><tr>
					 <%}else{ 
					    for(int i=0;i<AdminUserCount;i++){
							KIND	=	 Admin_UserList.get("kind",i);	// 사용자 유형 분석 
							if (KIND.equals("A")){
								str_kind="관리자";
							}else if (KIND.equals("O")){
								str_kind="운용자";
							}else if (KIND.equals("G")){
								str_kind="일반사용자";
							}else if (KIND.equals("E")){
								str_kind="응급사용자";
								KIND_CEHCK = true;
							}else if (KIND.equals("M")){
								str_kind="유지보수";
							}
					    	%>
					    	<tr>
                            <td class="TableBgText"><%=Admin_UserList.get("name",i)%></td>
                            <td class="TableBgText"><a href="#" onClick="blur();newWin('<%=Admin_UserList.get("user_id",i)%>','edit');"><strong><%=Admin_UserList.get("user_id",i)%></strong></a></td>
                            <td class="TableBgText"><%=Admin_UserList.get("company_name",i) %></td>
                            <td class="TableBgText"><%=str_kind%></td>
                        	<td class="TableBgTextDate"><%=Admin_UserList.get("date_format(a.last_login_dt,'%y/%m/%d %h:%i')",i)%></td>
                            <td class="TableBgText"><%
                            if(Admin_UserList.get("kind",i).equals("A") || Admin_UserList.get("kind",i).equals("O")){%>
                            N/A
                            <%}else{%>
                            <%=Admin_UserList.get("cname",i)%>
                            <%}%>
                            </td>
                            
                            <%if(Admin_UserList.get("kind",i).equals("G") || Admin_UserList.get("kind",i).equals("M") || Admin_UserList.get("kind",i).equals("E")) {%>
                          <td class="TableBgText"><a href="#"><img src="<%=DIR_IMG%>com.gif"  onClick="newWin1('<%=Admin_UserList.get("name",i)%>','<%=Admin_UserList.get("user_id",i)%>','<%=Admin_UserList.get("kind",i)%>','<%=Admin_UserList.get("company_name",i)%>')"></a></td> 
                          <%}else{%>
                          <td class="TableBgText"><img src="<%=DIR_IMG%>com_1.gif"></td>
                          
							<%}%>
                          <td class="TableBgText"><a href="#"><img src="<%=DIR_IMG%>btn_delete.gif" border="0" align="absmiddle"  style="margin-left:10px" onClick="godelete('<%=Admin_UserList.get("user_id",i)%>','<%=Admin_UserList.get("name",i)%>','<%=Admin_UserList.get("kind",i)%>')" alt="삭제" ></a></td>
                          </tr>
                          <%} 
						 }
                          %>
                        </table>
                      </div></td>
                    </tr>
                  </table></td>
                </tr>
              </table></td>
            </tr>
          </table></td>
          <td width="20">&nbsp;</td>
        </tr>
        <tr>
          <td height="30"></td>
          <td align="center" valign="middle"><div align="center">
            <!--페이징 처리 클래스 끝-->
            <b><font color="ff7635"><img src="/common/images/btn_p1.gif" width="16" height="15" align="absmiddle">&nbsp;1&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;2&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;3&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;4&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;5&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;6&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;7&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;8&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;9&nbsp;</font><font color="cccccc">|</font><font color="404040">&nbsp;10&nbsp;</font></b> <img src="/common/images/btn_n2.gif" width="16" height="15" align="absmiddle"></div></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="29"></td>
          <td align="right" valign="top"><a href="#"><img style="margin-right:6px"src="<%=DIR_IMG%>btn_em1.gif" onclick="javascript:emergency(true);"></a><a href="#"><img style="margin-right:6px"src="/common/images/btn_renewal.gif" onclick="allRefresh();"></a><a href="#"><img style="margin-right:6px" src="/common/images/btn_excel.gif" onclick="ExcelDown();"></a><a href="#"><img src="<%=DIR_IMG%>btn_user.gif" onclick="javascript:newWin('<%=SID%>','insert')" ></a></td>
          <td></td>
        </tr>
</table>
</form>
</body>
</html>
