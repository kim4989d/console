<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import = "java.util.*"%>
<%@page import="console.common.tray.ResultSetTray" %>
<% 


    int           rowCount          = 0;  // 서비스 선택 목록 불러 오기
    int           rowCount2         = 0;  // 등록 시스템 목록 불러 오기

    
    ResultSetTray join_list_tray   = null;  // 서비스 선택 목록 불러 오기
    ResultSetTray join_list_tray2  = null;  //  등록 시스템 목록 불러 오기


    //String	checkbox="";
    //checkbox	=	(String)request.getAttribute("checkbox");
	
	if(request.getAttribute("rsTray") !=null){
		join_list_tray = (ResultSetTray)request.getAttribute("rsTray"); // 서비스 선택 목록 불러 오기
		rowCount = join_list_tray.getRowCount();
	}else{rowCount = 0;}
	if(request.getAttribute("rsTray2") != null){
		join_list_tray2 = (ResultSetTray)request.getAttribute("rsTray2");  // 등록 시스템 목록 불러 오기 
		rowCount2 = join_list_tray2.getRowCount();
	}
	
//	if((String)request.getAttribute("svc_id")!= null)
//		{
//	svc_id = (String)request.getAttribute("svc_id");
//		}
//	else
//	{
//	svc_id = request.getParameter("svc_id");	
//	}
	
	String uid = request.getParameter("uid");
	String cid =request.getParameter("cid");
	String svc_id = request.getParameter("svc_id");
	
	String sys_id = request.getParameter("sys_id");
	if(sys_id == "" || sys_id==null){sys_id="";}
	String sys_name = request.getParameter("sys_name");
	if(sys_name == "" || sys_name==null){sys_name="";}
	
	String company_id = request.getParameter("com");
	String sys_intention = request.getParameter("sys_intention");
	if(sys_intention == null)
	{
		sys_intention = "";
	}
	//$temp_len=str_count($sys_id);
	int temp_len = 0;
	String[] value = sys_id.split(",");
	for (int i=0 ;i< value.length;i++){
		temp_len =+ i;
	}
	String[] temp_sys_id = sys_id.split(",");
	String[] temp_sys_name =sys_name.split(",");
%>

<%
//공통 파일 request 파일들 

 %>
 
<html>
<head>
<!-- 팝업사이즈  1000 * 516-->
<title>팝업_NGS 게정 신청 등록</title>
<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=EUC-KR">
<META NAME="CONTENT-LANGUAGE" CONTENT="KR">
<LINK REL='STYLESHEET' HREF='../common/css/skt_Form.css' TYPE='TEXT/CSS'>
<LINK REL='STYLESHEET' HREF='../common/css/skt_Default.css' TYPE='TEXT/CSS'>
<style type="text/css">
<!--
.style1 {
	font-size: 11px
}
-->
</style>
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
<script language='JavaScript'>

function move(fbox, tbox) {
     var arrFbox = new Array();
     var arrTbox = new Array();
     var arrLookup = new Array();
     var i;

	 for(i=0; i<tbox.options.length; i++) {
          arrLookup[tbox.options[i].text] = tbox.options[i].value;
          arrTbox[i] = tbox.options[i].text;
     	
     
     }
     var fLength = 0;
     var tLength = arrTbox.length

     for(i=0; i<fbox.options.length; i++) {
          arrLookup[fbox.options[i].text] = fbox.options[i].value;
          if(fbox.options[i].selected && fbox.options[i].value != "") {
			   arrTbox[tLength] = fbox.options[i].text;
               tLength++;
          } else {
               arrFbox[fLength] = fbox.options[i].text;
               fLength++;
          }
     }
     arrFbox.sort();
     arrTbox.sort();
     fbox.length = 0;
     tbox.length = 0;
     var c;
     for(c=0; c<arrFbox.length; c++) {
          var no = new Option();
          no.value = arrLookup[arrFbox[c]];
          no.text = arrFbox[c];
          fbox[c] = no;
	 }

     for(c=0; c<arrTbox.length; c++) {
     	var no = new Option();
     	no.value = arrLookup[arrTbox[c]];
     	no.text = arrTbox[c];
     	tbox[c] = no;
	 }
	

	sys_id(document.form.req_system);
}

function sys_id(box) {
    var result = "";
	 for(var i=0; i<box.length; i++) {
	     result +=box[i].value + ",";
     }
		 result = result.substr(0,result.length -1);
		 form.sys_id.value=result;
 		 parent.form.sys_id.value=result;

    var result = "";
	 for(var i=0; i<box.length; i++) {
	     result +=box[i].text + ",";
     }
		 result = result.substr(0,result.length -1);
		 form.sys_name.value=result;
		 parent.form.sys_name.value=result;

}

function selectAll(box) {
     for(var i=0; i<box.length; i++) {
     box[i].selected = true;
     document.form.sys_id.value=""
	 document.form.sys_name.value=""
	 form.submit();
	 }
}
function GOSEARCH(val)
{
	//parent.form.svc_id.value=val;
	var box=document.form.req_system
    var result = "";
	 for(var i=0; i<box.length; i++) {
	     result +=box[i].value + ",";
     }
		 result = result.substr(0,result.length -1);
		 parent.form.sys_id.value=result;

    var result = "";
	 for(var i=0; i<box.length; i++) {
	     result +=box[i].text + ",";
     }
		 result = result.substr(0,result.length -1);
		 parent.form.sys_name.value=result;
		 form.submit();
}
        function PreventSubmitOnEnter()

       {

            if(event.keyCode==13)

            {

                return false;

            }

        }

        

        function Load()

        {

            var inputs = document.getElementsByTagName("INPUT")         

            for(var i = 0; i < inputs.length ; i++)

            {               

                if(inputs[i].type == "text")

                {           

                    inputs[i].attachEvent("onkeypress", PreventSubmitOnEnter);      

                }

            }

        }
</script>
</head>  
<BODY onload="Load()">
<form name="form" method="post" action="consolejoin.do?cmd=console_join_sys" class="form">
<input type="hidden" name="sys_name" value="<%=sys_name%>">
<input type="hidden" name="sys_id" value="<%=sys_id%>" size="100">
<input type="hidden" name="uid" value="<%=uid%>" size="100">
<input type="hidden" name="cid" value="<%=cid%>" size="100">
<input type="hidden" name="com" value="<%=company_id%>" size="100">        
<!-- iframe    -->
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
                            <td>
                                                       
  					 <select name="svc_id" class="InputLIneSelect" onChange="GOSEARCH(this.form.svc_id.value)">
                              <%if(rowCount == 0){ %>
                                <option selected>담당자를 선택하세요</option>
                              <%}else{ %>
                                <option selected>서비스를 선택하세요</option>
                              <%for(int i=0; i<rowCount; i++){ %>
                       <option value="<%=join_list_tray.get("service_id",i)%>" <%if(join_list_tray.get("service_id",i) == svc_id){%>SELECTED<%}%>><%=join_list_tray.get("service_id",i)%></option>       
                              <%} %> 
                    </select> 
                    	<%} %>             
                              </td>
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
                                        <td><input name="image" type="image" class="" title="시스템신청" onClick="move(this.form.reg_system,this.form.req_system);return false;" src="../common/images/dot_1.gif" width="24" height="28" /></td>
                                        <td><strong>등록시스템</strong></td>
                                      </tr>
                                    </table></td>
                                  <td align="center">&nbsp;</td>
                                  <td><table border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td><input name="image2" type="image" class="" title="시스템제거" onClick="move(this.form.req_system,this.form.reg_system);return false;" src="../common/images/dot_1.gif" width="24" height="28" /></td>
                                        <td><strong>신청시스템</strong></td>
                                      </tr>
                                    </table></td>
                                </tr>
                              </table>
                              <table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="30" align="center" class="PopupLine">
                                  
                                  <select multiple size="7" name="reg_system" style="width:340" onDblClick="move(document.form.reg_system,document.form.req_system)" class="InputGray">
                                    
                           		<%if(rowCount2 != 0){
                           			for(int i=0; i<rowCount2; i++){   
                              	%>
                           			<option value="<%=join_list_tray2.get("system_id",i)%>"><%=join_list_tray2.get("host_id",i)%></option>
                           		<% 
                             		 }
                             		 }
								%>
                                    </select></td>
                                    
                                  <td align="center"><table border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td align="center"><input name="image" type="image" class="" title="시스템신청" onClick="move(this.form.reg_system,this.form.req_system);return false;" src="../common/images/btn_S1.gif" width="20" height="17" /></td>
                                      </tr>
                                      <tr>
                                        <td align="center">&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td align="center"><input name="image2" type="image" class="" title="시스템제거" onClick="move(this.form.req_system,this.form.reg_system);return false;" src="../common/images/btn_S2.gif" width="20" height="17" /></td>
                                      </tr>
                                    </table></td>
                                  <td height="30" align="center" class="PopupLine">
                                  
                                  <select multiple size="7" name="req_system" style="width:340" ondblclick="move(document.form.reg_system,document.form.req_system)" class="InputGray">
						<%  if (sys_id != ""){
							
									if (temp_len==0 ){
									%>
								         <option value="<%=sys_id%>"><%=sys_id%></option>
									<%}else{
									for(int i=0; i<temp_len+1; i++){
									%>
								         <option value="<%=temp_sys_id[i]%>"><%=temp_sys_id[i]%></option>
									 <%
										}
										}
									%>
									  <%}%>

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
                            <td><input name=sys_intention type="text" class="inputLIneGrayColor" size="50" maxlength="50" value="<%=sys_intention%>"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
        </form>
</body>
</html>
        <!-- iframe    -->
        
