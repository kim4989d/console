<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/common/common.jsp" %>
<%@ page import="console.common.tray.ResultSetTray" %>
<% 

    int           rowCount          = 0;  //	신청 서비스 불러 오기 1
    int           rowCount2         = 0;  //    신청 서비스 불러 오기 2

    String svc_id = "";
    
    ResultSetTray join_list_tray   = null;  // 
    ResultSetTray join_list_tray2  = null;  // 


	
	if(request.getAttribute("rsTray") !=null){
		join_list_tray = (ResultSetTray)request.getAttribute("rsTray");  //	 신청서비스 불러 오기 
		rowCount = join_list_tray.getRowCount();
	}
	if(request.getAttribute("rsTray2") != null){
		join_list_tray2 = (ResultSetTray)request.getAttribute("rsTray2"); //  신청 서비스 불러 오기 
		rowCount2 = join_list_tray2.getRowCount();
	}
	
	
	String service_name = request.getParameter("service_name");
	String sys_id       = request.getParameter("sys_id"); 
	String uid          = request.getParameter("uid");
	
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
		 form.service_id.value=result;
 		 parent.form.service_id.value=result;

    var result = "";
	 for(var i=0; i<box.length; i++) {
	     result +=box[i].text + ",";
     }
		 result = result.substr(0,result.length -1);
		 form.service_name.value=result;
		 parent.form.service_name.value=result;

}

function selectAll(box) {
     for(var i=0; i<box.length; i++) {
     box[i].selected = true;
     document.form.sys_id.value=""
	 document.form.sys_name.value=""
	 form.submit();
	 }
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
<form name="form" method="post" action="admin.do?cmd=console_join_sys_name" class="form">
<input type="hidden" name="service_name" value="<%=service_name%>">
<input type="hidden" name="service_id"   value="<%=sys_id%>" size="100">
<input type="hidden" name ="kind" value ="<%=kind%>">          
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
                            <td class="BlueText"><strong>서비스 등록</strong></td>
                            <td>
<!--                            <select name="company2" class="InputLIneSelect">-->
<!--                                <option value ="">담당자를 선택하세요</option>-->
<!--                              </select>-->
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
                                        <td><img src="../common/images/dot_1.gif" width="24" height="28" /></td>
                                        <td><strong>서비스 이름 </strong></td>
                                      </tr>
                                    </table></td>
                                  <td align="center">&nbsp;</td>
                                  <td><table border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td><img src="../common/images/dot_1.gif" width="24" height="28" /></td>
                                        <td><strong>신청 서비스</strong></td>
                                      </tr>
                                    </table></td>
                                </tr>
                              </table>
                              <table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="30" align="center" class="PopupLine">
                                  <select multiple size="7" name="svc_name" style="width:340" onDblClick="move(document.form.svc_name,document.form.req_system)" class="InputGray">
                                    
                                    <option value="">서비스 선택</option>
						<% 
						for(int i=0; i<rowCount; i++){
						%>
						                <option value="<%=join_list_tray.get("service_id",i)%>"><%=join_list_tray.get("service_id",i)%></option>
						<%
						}
						%>
						           </select></td>
                                  <td align="center"><table border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td align="center"><input name="image3" type="image" class="" title="시스템신청" onClick="move(this.form.svc_name,this.form.req_system);return false;" src="../common/images/btn_S1.gif" width="20" height="17" /></td>
                                      </tr>
                                      <tr>
                                        <td align="center">&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td align="center"><input name="image" type="image" class="" title="시스템제거" onClick="move(this.form.req_system,this.form.svc_name);return false;" src="../common/images/btn_S2.gif" width="20" height="17" /></td>
                                      </tr>
                                    </table></td>
                                  <td height="30" align="center" class="PopupLine">
                                  
                                  <select multiple size="7" name="req_system" style="width:340" ondblclick="move(document.form.req_system,document.form.svc_name)" class="InputGray">
                                    
								<% 
								for(int i=0; i<rowCount2; i++){
							%>
								<option value="<%=join_list_tray2.get("service_id",i)%>"><%=join_list_tray2.get("service_id",i)%></option>
							<% 
								}
								%>      
                                    
                                    </select>
                                    
                                    
                                    </td>
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
                            <td><input name="object" type="text" class="inputLIneGrayColor" size="50" maxlength="50"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
           
         </form>
        </BODY>
</HTML>
        <!-- iframe    -->
        
