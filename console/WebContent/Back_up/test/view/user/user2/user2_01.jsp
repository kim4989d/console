<%@ page language="java" pageEncoding="EUC-KR" %>

<!-- 유저용 UNIX 작업등록 구현페이지-->
<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "user.unix.reg.UnixDataBean" %>
<%@ page import = "user.unix.reg.UnixRegDBBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%!
    int pageSize = 5;
    SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm");
%>
<%
	//페이지 count처리
    String pageNum = request.getParameter("pageNum");

    if (pageNum == null) {
        pageNum = "1";
    }
    
    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count  = 0;
    int number = 0;

    //DB처리
    List articleList = null;
    UnixRegDBBean dbPro = UnixRegDBBean.getInstance();
    count = dbPro.getArticleCount();
    
    if (count > 0) {
        articleList = dbPro.getArticles(startRow, pageSize);
    }
	number = count-(currentPage-1) * pageSize;
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>▒▒ VACCS (Vpn Access Control Certification System Project ▒▒</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url();
	background-color: "";
}
-->
</style>
<link href="../comm/css/default.css" rel="stylesheet" type="text/css">
<link href="../comm/css/Form.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="../comm/js/Calendar2.js"></script>
<script language="JavaScript" src="../comm/js/find1.js"></script>
<script language="JavaScript">
var winfo;
function newWin(val1)
{
	var Pwidth=801;
	var Pheight=457;
	var url
	locW = (screen.availWidth-Pwidth)/2;
	locH = (screen.availHeight-Pheight)/2;
	if (val1 > 0) url = "job_content_unix.php?c="+val1
	else url="connection_req.php?c=C&f=U";
	 if (winfo != null)     winfo.close();
		 winfo = window.open(url,"jobWin","width="+Pwidth+",height="+Pheight+",top="+locH+",left="+locW+",toolbar=no,scrollbars=0, resizable=0, toolbar=0, menubar= 0,location=0, directories=0, status=0");
	 //gFlowWait(false, false);
}
	function allRefresh()
	{
		window.parent.frames["topFrame"].location.reload();		
		window.parent.frames["leftFrame"].location.reload();
		window.parent.frames["mainFrame"].location.reload();
	}

	function openReg(){
        url = "/ngs/view/user/user2/writeForm.jsp" ;
        open(url, "confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=650, height=350");
        allRefresh();
    }
</script>
</head>

<body>
<table width="762" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="762" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="30" height="300">&nbsp;</td>
          <td width="702" height="500" valign="top">
			<form name="look" method="post" action="job_list_unix.php">
			<input type="hidden" name="div" value="" >
              <table width="702" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td height="44" valign="top"><img src="../images/content_title/title_service16.gif" width="136" height="25"></td>
                </tr>
              <tr>
                <td height="1" bgcolor="#aaaaaa"></td>
              </tr>
                  <tr>
                    <td height="1" ></td>
                  </tr>
              <tr>
                <tr> 
                  <td valign="top"><table width="702" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="60" align="center"><img src="../images/common/search_01.gif" width="44" height="12"></td>
                        <td width="642"><table width="642" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td background=""></td>
                              <td bgcolor="c5c5c5"><table width="632" border="0" cellspacing="0" cellpadding="0">
                                  <tr> 
                                    <td align="center"><select name="key" class="InputLIneGraySearch">
                                        <option value="SERVICE_ID">서비스ID</option>
										<option value="SERVICE_NAME" selected>서비스이름</option>
                                      </select> </td>
                                    <td><input name="find" type="text" class="InputLIneGraySearch" size="12"></td>
                                    <td align="center"><select name="key1" class="InputLIneGraySearch">
                                        <option value="system_id">시스템ID</option>
										<option value="system_name" selected>시스템이름</option>
                                      </select></td>
                                    <td><input name="find1" type="text" class="InputLIneGraySearch" size="12"></td>
                                    <td width="46" align="right"><img src="../images/common/search_time.gif" width="19" height="11" hspace="7" align="absmiddle"></td>
                                    <td><input name="cal1" type="text" class="InputLIneGraySearch" id="cal1" size="10" readonly></td>
                                    <td><img src="../images/common/zoom.gif" width="19" height="19" hspace="3" class="Cursor_Hand" onClick="popUpCalendar(this, cal1, 'yyyy/mm/dd');"></td>
                                    <td width="14" align="center" class="bold">~</td>
                                    <td><input name="cal2" type="text" class="InputLIneGraySearch" id="cal2" size="10" readonly></td>
                                    <td><img src="../images/common/zoom.gif" width="19" height="19" hspace="3" class="Cursor_Hand" onClick="popUpCalendar(this, cal2, 'yyyy/mm/dd');"></td>
                                    <td width="40"><img src="../images/common/search_btn_ok.gif" width="40" height="20" hspace="0" class="Cursor_Hand" onClick="gaja();"></td>
                                  </tr>
                                </table></td>
                              <td background=""></td>
                            </tr>
                            <tr> 
                            </tr>
                          </table></td>
                      </tr>
                    </table>
                    
                  </td>
                </tr>
                 <tr>
                   <td height="1" ></td>
                 </tr>
              <tr>
                <td height="1" bgcolor="#aaaaaa"></td>
              </tr>
              <tr>				
                  <tr>
                    <td align="right" style="padding-top:2px;padding-bottom:3px"><table border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td background="../images/common/search_page_03.gif">
						<table border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td class="T11PgaeNum" align="center"></td>
                              <td width="10"></td>
                              <td class="T11PgaeNum" align="center">페이지 1/1</td>
                            </tr>
                          </table></td>
                      </tr>
                    </table></td>
                  </tr>
                <tr> 
                  <td><table width="702" border="0" cellpadding="0" cellspacing="0">
                      <tr class="TableBgBold"> 
                        <td width="90" height="37" class="TableBg"">작업자</td>
                        <td class="TableBg">작업 목적</td>
                        <td width="170" class="TableBg">작업 기간</td>
                        <td width="70" class="TableBg">등록일</td>
                        <td width="70" class="TableBg">승인담당자</td>
                        <td width="70" class="TableBg">승인결과</td>
						<td width="70" class="TableBg">상 태</td>
                      </tr>                      
					<!-- BBS 출력부분 start -->
					
				<%
					if(count ==0){
					
					}else{
				%>
					<%
					for (int i = 0 ; i < articleList.size() ; i++) {
						 UnixDataBean article = (UnixDataBean)articleList.get(i);
					 %>
		             <tr> 
		           	<!-- 작업자 -->
		             <td class="TableBgText"> <%=article.getUnix_work()%> </td>
		             <!-- 작업 목적 -->
		             <td class="TableBgText"> <%=article.getUnix_object()%> </td>
		             <!-- 작업 기간 -->
		             <td class="TableBgTextDate"> <%=sdf.format(article.getUnix_work_date_s() )%>
		              ~ <%=sdf.format(article.getUnix_work_date_e() )%> </td>
		             <!-- 등록일 -->
		             <td class="TableBgTextDate"> <%= sdf.format(article.getUnix_regdate() )%> </td>
		             <!-- 승인담당자 -->
		             <td class="TableBgText"> <%= article.getUnix_app_name() %></td>
		             <!-- 승인결과-->
		             <td class="TableBgText"><FONT COLOR='RED'><B> <%= article.getUnix_app_result() %></B></FONT></td>
		             <!-- 상 태 -->
					<td class="TableBgText"><FONT COLOR='RED'><B> <%= article.getUnix_stat() %> </B></FONT></td>
		           </tr> <% } %>
		           <%	} %>
		           </table></td>
		     	  </tr>
		     	 
                <tr> 
                  <td><table width="702" border="0" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="35" background="/ngs/images/service/table_under_bg.gif"><table width="702" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td width="180">&nbsp;</td>
                              <td><div align="center"> 
                   
							  <!--페이징 처리 클래스 끝-->
								 <img src='/ngs/images/common/board_arrow_pre.gif' hspace='10' border='0' align='absbottom'>  |<b><font color=red>1</font></b>|  <img src='/ngs/images/common/board_arrow_next.gif' hspace='10' border='0' align='absbottom'> 							  
								 <!--페이징 처리 클래스 끝-->
								</div></td>

                              <td width="180">&nbsp;</td>
                            </tr>
                          </table></td>
                      </tr>
                    </table></td>
                </tr>
                <tr> 
                  <td height="9"></td>
                </tr>
                <tr> 
                  <td align="right"><img src="/ngs/images/common/btn_renewal.gif" width="39" height="27" class="Cursor_Hand" > 
                    <img src="/ngs/images/common/btn_work_regist.gif" width="83" height="27" class="Cursor_Hand" onclick="javascript:openReg();"></td>
                </tr>
                <tr> 
                  <td height="40">&nbsp;</td>
                </tr>
              </table>
            </form>
			</td>
          <td width="30">&nbsp;</td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td>
      <table width="762" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="762" border="0" cellspacing="0" cellpadding="0">
</table>
</td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
