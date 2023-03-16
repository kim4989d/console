<%@page contentType="text/html;charset=euc-kr"%>
<%
	



	String loginRes = (String)request.getAttribute("loginRes");
	String usr_id   = (String)request.getAttribute("usr_id");
	String message  = "";
	
	if (usr_id == null) usr_id = "";
	
	if ( loginRes == null ) {
	} else if ( loginRes.equals("0") ) {
		message = "미등록 사용자 아이디(사원번호)입니다.";
	} else if ( loginRes.equals("5") ) {
		message = "비밀번호가 틀렸습니다.";
	} else {
	    usr_id = "";
		message = "로그아웃 되었습니다.";
	}
%>

<html>
<head>
<title>GS홈쇼핑 - 품질정보 DB 시스템</title>
<link rel="stylesheet" href="/images/style.css" type="text/css">

<script language="javascript">

function closeSelfAfterLogin() {
	if (confirm("윈도우를 종료하려고 합니다.")) {
		if (self.parent.opener == null || self.parent.opener == 'undefined') {
			self.parent.opener = self;
		} 
		self.parent.close();
	}
}

function login() {
	with (document.loginfrm) {
			method="post";
			action="/login.do";
			cmd.value = "login";
			method.target="_self";
			submit();
		
	}
}

function loginout(){

	with (document.loginfrm) {
			method="post";
			action="/login.do";
			cmd.value = "login";
			logout.value="logout";
			method.target="_self";
			submit();
		
	}

}


</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<center>
<form name="loginfrm">
<input type="hidden" name="cmd" value="login">
<input type="hidden" name="logout" value="">

<table width="100%" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td width="1000" valign="top">
			<table width="100%" cellspacing="0" cellpadding="0" border="0">
				<tr>
					<td height="232"></td>
				</tr>
				<tr>
					<td height="70" bgcolor="#FBE4A3"></td>
				</tr>
				<tr>
					<td height="150" bgcolor="#70B7CD"></td>
				</tr>
			</table>
		</td>
		<td>
			<table width="920" cellspacing="0" cellpadding="0" border="0">
				<tr>
					<td width="206" valign="top">
						<table width="100%" cellspacing="0" cellpadding="0" border="0">
							<tr>
								<td height="232"></td>
							</tr>
							<tr>
								<td height="70" bgcolor="#FBE4A3"></td>
							</tr>
							<tr>
								<td height="150" bgcolor="#70B7CD"></td>
							</tr>
						</table>
					</td>
					<td width="550" align="center">
						<table cellspacing="0" cellpadding="0" border="0">
							<tr>
								<td height="232" colspan="2" valign="bottom"><img src="/images/1_img1.gif"></td>
							</tr>
							<tr>
								<td colspan="2" bgcolor="#FBE4A3"><img src="/images/1_img2.gif"></td>
							</tr>
							<tr>
								<td valign="top" bgcolor="#70B7CD"><img src="/images/1_img4.gif"></td>
								<td rowspan="2" bgcolor="#70B7CD"><img src="/images/1_img3.gif"></td>
							</tr>
							<tr>
								<td bgcolor="#70B7CD" valign="top">
									<table width="100%" cellspacing="0" cellpadding="0" border="0">
										<tr>
											<td width="21" align="right"><img src="/images/1_id.gif"></td>
											<td width="140" style="padding-left:5">
											<input name="user_id" value="<%=usr_id%>" max=5 type="txt" style="width:132" class="txt" tabindex="1"></td>
											<td rowspan="2">
											<input type="button"  tabindex="3" onClick="javascript:login();" value="send">
											<input type="button"  tabindex="3" onClick="javascript:loginout();" value="logout"></td>
										</tr>
										<tr>
											<td align="right"><img src="/images/1_pw.gif"></td>
											<td style="padding-left:5"><input name="passwd" type="password" style="width:132" class="txt" tabindex="2"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="right"><img src="/images/1_img5.gif"></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><img src="/images/copyright.gif"></td>
							</tr>
						</table>
					</td>
					<td width="164" valign="top">
						<table width="100%" cellspacing="0" cellpadding="0" border="0">
							<tr>
								<td height="232"></td>
							</tr>
							<tr>
								<td height="70" bgcolor="#FBE4A3"></td>
							</tr>
							<tr>
								<td height="150" bgcolor="#70B7CD"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
		<td width="1000" valign="top">
			<table width="100%" cellspacing="0" cellpadding="0" border="0">
				<tr>
					<td height="232"></td>
				</tr>
				<tr>
					<td height="70" bgcolor="#FBE4A3"></td>
				</tr>
				<tr>
					<td height="150" bgcolor="#70B7CD"></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>