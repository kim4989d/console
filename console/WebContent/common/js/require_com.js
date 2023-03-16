


/***************************************************************
	기능: 신청현황중 승인/반려 선택시 로직 처리 기능 
	작성자: 이충섭	
	작성일: 2009-01-21
****************************************************************/

function move_button(act)
{
	window.alert("move_button Call");
	
	var Radio = document.form.check;
	var result = "";
	var txt="";

/*	
	if ( !Radio ) return;
	if (Radio.name == 'check' ){
			if ( Radio.checked ) {
					result = Radio.value;
			}
	} else {
			for ( i = 0; i < Radio.length; i++) {
					if ( document.listfrm.check[i].checked ) {
							result += document.listfrm.check[i].value + ",";
					}
			}
			result = result.substr(0,result.length -1);
	}
*/	
	
	//각 항목 조건 검사
	if (result == '' )
	{
			if (act=='com'){
			alert( "승인 항목을 선택하세요!" );
			return false;
			}

			if (act=='re'){
			alert( "반려 항목을 선택하세요!" );
			return false;
			}
			if (act=='de'){
			alert( "인증키를 선택하세요!" );
			return false;
			}
			if (act=='command'){
			alert( "명령어를 선택하세요!" );
			return false;
			}
	}
	
	
//	document.form.uniq_id.value = result;
//	document.form.act.value = act;
	
	
	//선택항목별 처리
	if (act=="re")
	{
		window.alert("반려하시겠습니까?");
		
//		newWin(result);
		newWin();
		return;
	}
	else if(act=="de")
	{
		if(confirm("인증키를 삭제 하시겠습니까?")) {
		document.form.submit();
		} else {	 return;	}
	}
	else if(act=="com")
	{
		//newWin2(result);
		//gFlowWait(true, false);
		alert(result);
		if(confirm("승인 하시겠습니까?")) {
		document.form.submit();
		} else {	 
			return;	
			}
	}
	else if(act=="command")
	{
		if(confirm("삭제 하시겠습니까?")) {
	//	document.form.target ="_blank"
		document.form.action = "command_del.php"
		document.form.submit();
		} else {	 return;	}
	}
	else
	{
		if(confirm("승인 하시겠습니까?")) {
		
		var frm = document.listfrm;
 			frm.action="/require.do?cmd=";
 			frm.method="post";
 			frm.target="_self";
		document.form.submit();
		} else {	 return;	}
	}
}
/***********************************************************************/


/***************************************************************
	기능: 신청현황중 반려 처리 
	작성자: 이충섭	
	작성일: 2009-01-21
****************************************************************/
function newWin()
{
//	var result;
	
	if (result.indexOf(",") > 0)
	{
		alert ("반려는 한개만 선택 할 수 있습니다.");
		return false;
	}

//	var url="require\require_return.jsp"+result;
	var url="require\require_return.jsp";
	
	var re = "toolbar=no, resizable=0,scrollbars=auto, status=0,location=no, resize=no, menubar=no, directories=no, copyhistory=0, width=503, height=150, top=200, left=370";

	if (newPoup != null)     
		newPoup.close();

	newPoup = window.open(url, 'pop', re);
}





