


/***************************************************************
	���: ��û��Ȳ�� ����/�ݷ� ���ý� ���� ó�� ��� 
	�ۼ���: ���漷	
	�ۼ���: 2009-01-21
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
	
	//�� �׸� ���� �˻�
	if (result == '' )
	{
			if (act=='com'){
			alert( "���� �׸��� �����ϼ���!" );
			return false;
			}

			if (act=='re'){
			alert( "�ݷ� �׸��� �����ϼ���!" );
			return false;
			}
			if (act=='de'){
			alert( "����Ű�� �����ϼ���!" );
			return false;
			}
			if (act=='command'){
			alert( "��ɾ �����ϼ���!" );
			return false;
			}
	}
	
	
//	document.form.uniq_id.value = result;
//	document.form.act.value = act;
	
	
	//�����׸� ó��
	if (act=="re")
	{
		window.alert("�ݷ��Ͻðڽ��ϱ�?");
		
//		newWin(result);
		newWin();
		return;
	}
	else if(act=="de")
	{
		if(confirm("����Ű�� ���� �Ͻðڽ��ϱ�?")) {
		document.form.submit();
		} else {	 return;	}
	}
	else if(act=="com")
	{
		//newWin2(result);
		//gFlowWait(true, false);
		alert(result);
		if(confirm("���� �Ͻðڽ��ϱ�?")) {
		document.form.submit();
		} else {	 
			return;	
			}
	}
	else if(act=="command")
	{
		if(confirm("���� �Ͻðڽ��ϱ�?")) {
	//	document.form.target ="_blank"
		document.form.action = "command_del.php"
		document.form.submit();
		} else {	 return;	}
	}
	else
	{
		if(confirm("���� �Ͻðڽ��ϱ�?")) {
		
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
	���: ��û��Ȳ�� �ݷ� ó�� 
	�ۼ���: ���漷	
	�ۼ���: 2009-01-21
****************************************************************/
function newWin()
{
//	var result;
	
	if (result.indexOf(",") > 0)
	{
		alert ("�ݷ��� �Ѱ��� ���� �� �� �ֽ��ϴ�.");
		return false;
	}

//	var url="require\require_return.jsp"+result;
	var url="require\require_return.jsp";
	
	var re = "toolbar=no, resizable=0,scrollbars=auto, status=0,location=no, resize=no, menubar=no, directories=no, copyhistory=0, width=503, height=150, top=200, left=370";

	if (newPoup != null)     
		newPoup.close();

	newPoup = window.open(url, 'pop', re);
}





