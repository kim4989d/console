<%@ page contentType="text/html; charset=euc-kr"%>
<%@page import="console.common.tray.ResultSetTray" %>
<%@include file="/common/common.jsp" %>




<%
    ResultSetTray listTray  = null;
    int	rowCount = 0;					//�Խù� ��ü ����
//    String certKey = "";				//����Ű (������)
	
    if( request.getAttribute("rsTray") !=null){
		listTray = (ResultSetTray)request.getAttribute("rsTray");
		rowCount = listTray.getRowCount();
	}
    
//    certKey = (String)request.getAttribute("cert_id");		//������
%>
<%
  request.setCharacterEncoding("euc-kr");
%>

 <html> 
 <head> 
 <script>

//���ΰ�ħ 
function Refresh(){
	window.document.location.reload();
}


function newWin()
{
	window.alert("Success");
	var url="/require/require_return.jsp";		//������ ���� �̵�
//	var url="/require.do?cmd=";

	var re = "width=300,height=100,top=115,left=0";

	if (newPoup != null)     
		newPoup.close();

	window.open(url,'pop',re);
}


//���� �� �ݷ� ó��
function move_button(input){
	var frm=document.requirefrm;
		var numtemp="";
		var temp ="";
		temp = frm.check;
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
					alert("���� �����Ͻʽÿ�");
					return;					
					}
					
			if( confirm("�����Ͻðڽ��ϱ�?") ){ 
			}else{
			return;
			}
		}else{
			if(temp.checked){
			numtemp=temp.value;
			bool="true";
			}
			if(count==0 && bool=="false"){
				alert("���� �����Ͻʽÿ�");
				return;
				}
			if(confirm("��������Ͻðڽ��ϱ�?")){ 
			}else{
			return;
			}
		}
			
			alert(numtemp);					//�ѱ�� �� Ȯ��
			//fr.changebox.value=numtemp;
			
		frm.action="/require.do?cmd=require_update&numtemp";
 		frm.method="post";
 		frm.target="_self";
 		frm.submit();

}

</script>
 </head>

 <body>
 <center><br><h2>��û��Ȳ NT/UNIX</h2><br>
 <form name="requirefrm">
 <table border="1">
 <tr>
	 <td>��ü����<input type="checkbox" name="allcheckbox" onclick="checkBox_AllCheck();"></td>
	 <td>�����  ID </td>
	 <td>����� �̸� </td>
	 <td>�۾����� </td>
	 <td>���񽺱׷� </td>
	 <td>��û�� </td>
	 <td>���ΰ�� </td>
	 <td>Cert_Key</td>
 </tr>
 
 <%
 	if(rowCount == 0)
 	{	
 	%>
	    <tr><td colspan="7" align="center">�˻��� ���̺��̾����ϴ�</td></tr>
	<%
 	}
 	else{		
   		for(int i=0;i<rowCount;i++){	%>
   			<tr>
			<td><input type="checkbox" name="check" value="<%=listTray.get("cert_id", i)%>"></td>	
		    <td><%=listTray.get("user_id", i)%></td>
		    <td><%=listTray.get("name", i) %></td>
		    <td><%=listTray.get("work_conttens", i) %></td>
		    <td><%=listTray.get("service_group", i)%></td>
		    <td><%=listTray.get("reg_dt", i)%></td>
		    <td>ó����</td>
			<td><%=listTray.get("cert_id", i)%></td>
		    </tr>
		<%	}
    	}
    %>
    <tr>
    <td>
	    <input type="button" value="����" onclick="Refresh();">
	    <input type="button" value="����" onclick="move_button('com');">
	    <input type="button" value="�ݷ�" onclick="move_button('re');">
<!--    <input type="button" value="popup" onclick="newWin();">	 -->
    </td>   
    </tr>
    
  </table>  
 </form>   
 </center> 
 </body>   
 
 </html>
    