<%@ page language="java" pageEncoding="EUC-KR" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>Untitled Document</title>
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
<link href="/ngs/comm/css/default.css" rel="stylesheet" type="text/css">
<link href="/ngs/comm/css/Form.css" rel="stylesheet" type="text/css">
<Script Language="JavaScript" src="/ngs/comm/js/find.js"></Script>
<script language="JavaScript" src="/ngs/comm/js/common.js"></script>
</head>

<body>
<form name="look" method="post" action="n_list.php">
<input type="hidden" name="div" value="" >
<table width="762" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="762" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="30" height="300">&nbsp;</td>
          <td width="702" height="500"  valign="top"><table width="702" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="44" valign="top"><img src="/ngs/images/content_title/title_board.gif" width="136" height="25"></td>
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
                      <td width="90" align="center"><img src="/ngs/images/common/search_01.gif" width="44" height="12"></td>
                      <td> <table width="612" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td background=""></td>
                            <td bgcolor="c5c5c5"><table width="344" border="0" align="right" cellpadding="0" cellspacing="0">
                                <tr> 
                                  <td align="right"> <select name="key" class="InputLIneGraySearch">
                                      <option value="g_user_id">작성자</option>
                                      <option value="g_title" selected>제목</option>
                                      <option value="g_name" >내용</option>									  
                                    </select>
                                    &nbsp; <input name="find" type="text" class="InputLIneGraySearch" size="20" maxlength="20"></td>
                                  <td width="56" align="right"><img src="/ngs/images/common/search_btn_ok.gif" width="40" height="20" hspace="3" class="Cursor_Hand" onClick="JavaScript:gaja();"></td>
                                </tr>
                              </table></td>
                            <td background=></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
                 <tr>
                   <td height="1" ></td>
                 </tr>
              <tr>
                <td height="1" bgcolor="#aaaaaa"></td>
              </tr>			  
                  <tr>
                    <td align="right" style="padding-top:2px;padding-bottom:3px"><table border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td background="/ngs/images/common/search_page_03.gif">
						<table border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td class="T11PgaeNum" align="center">총 0</td>
                              <td width="10"></td>
                              <td class="T11PgaeNum" align="center">페이지 1/0</td>
                            </tr>
                          </table></td>
                      </tr>
                    </table></td>
                  </tr>
              <tr> 
                <td> <table width="702" border="0" cellpadding="0" cellspacing="0">
                    <tr class="TableBgBold"> 
                      <td width="50" height="37" class="TableBg"><img src="/ngs/images/board/header01.gif" width="19" height="12"></td>
                      <td width="" class="TableBg"><img src="/ngs/images/board/header02.gif" width="20" height="12"></td>
                      <td width="60" class="TableBg"><img src="/ngs/images/board/header05.gif" width="30" height="12"></td>
                      <td width="90" class="TableBg"><img src="/ngs/images/board/header03.gif" width="30" height="12"></td>
                      <td width="60" class="TableBg"><img src="/ngs/images/board/header04.gif" width="30" height="12"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td> <table width="702" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td height="70" class="TableBgText" colspan="5"><img src="/ngs/images/board/msg_05.gif" width="191" height="42"></td>
                    </tr>
                            </table></td>
              </tr>
              <tr> 
                <td> <table width="702" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td height="35" background="/ngs/images/service/table_under_bg.gif"> 
                        <table width="702" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="180">&nbsp;</td>
                            <td><div align="center">
							  <!--페이징 처리 클래스 끝-->
																		<img src="/ngs/images/common/board_arrow_pre.gif" hspace="10" border="0" align="absbottom">
										|1|
										<img src="/ngs/images/common/board_arrow_next.gif" hspace="10" border="0" align="absbottom">
															  <!--페이징 처리 클래스 끝-->
                              </div></td>
                            <td width="200">&nbsp;</td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="9"></td>
              </tr>
              <tr> 
                <td align="right">
                                  </td>
              </tr>
              <tr> 
                <td height="40">&nbsp;</td>
              </tr>
            </table></td>
          <td width="30">&nbsp;</td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="762" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="762" border="0" cellspacing="0" cellpadding="0">
</table>
</td>
        </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>
