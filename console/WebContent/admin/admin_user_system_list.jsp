<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="console.common.tray.ResultSetTray" %>
<%@ page import="console.common.util.Util"%>
<%@include file="/common/common.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
		int AdminUserSystemCount  	=   0;
		int	 		k				=	0;
		String SID					=	"";
		String str_kind				=	"";
		String USER_KIND			=	"";
		String class_name			=	"";
		String exp_date 			=	"";
		String userid				=	"";
		userid						=	"";
		
		String USER_ID 				=	"";
		String UNAME				=	"";
		String USER_KIN				=	"";
		String USER_COMPANY			=	"";
		
		USER_ID 			= 	request.getParameter("userid");
		UNAME 				= 	request.getParameter("unm");
		USER_KIND 			= 	request.getParameter("kind");
		USER_COMPANY 		= 	request.getParameter("comp");

		
		//$USER_ID = $_REQUEST["uid"];
		//$UNAME = $_REQUEST["unm"];
		//$USER_KIND = $_REQUEST["kind"];
		//$USER_COMPANY = str_replace("^","&",str_replace("*"," ",$_REQUEST["comp"]));
		
		
	    ResultSetTray Admin_UserSystemList   	= null;   	 		//
	    String	checkbox			   			= "";       		// select box 값 
	     
	    //checkbox	=	(String)request.getAttribute("checkbox");

		if(request.getAttribute("rsTray") !=null){
			Admin_UserSystemList = (ResultSetTray)request.getAttribute("rsTray");
			AdminUserSystemCount = Admin_UserSystemList.getRowCount();
		}
			
		//USER_KIND = kind;											// 사용자 유형 값 
%>

<%	
		if (USER_KIND.equals("A")){
			str_kind="관 리 자";
		}else if (USER_KIND.equals("O")){
			str_kind="운 용 자";
		}else if (USER_KIND.equals("G")){
			str_kind="일반 사용자";
		}else if (USER_KIND.equals("E")){
			str_kind="응급 사용자";
		}else if (USER_KIND.equals("M")){
			str_kind="유지 보수";
		}else{
			str_kind="";
		}
%>		
<html>
<head>
<!-- 팝업사이즈  500 * 555-->
<title>팝업_사용자관리_장비현황</title>
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
	}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
function popUpCalendar(ctl, ctl2, format) {
    var leftpos = 0;
    var toppos = 0;

    if(bPageLoaded) {
        if(crossobj.visibility == "hidden") {
            ctlToPlaceValue    = ctl2;
            dateFormat=format;
            formatChar = " ";
            aFormat    = dateFormat.split(formatChar);

                if(aFormat.length<3) {
                    formatChar = "/";
                    aFormat    = dateFormat.split(formatChar);

                    if(aFormat.length<3) {
                        formatChar = ".";
                        aFormat    = dateFormat.split(formatChar);

                        if(aFormat.length<3) {
                            formatChar = "-";
                            aFormat    = dateFormat.split(formatChar);

                            if (aFormat.length<3) {
                                formatChar="";
                            }
                        }
                    }
                }
                tokensChanged =    '0';

                if(formatChar != "") {
                    aData =    ctl2.value.split(formatChar);

                    for(i=0;i<3;i++) {
                        if ((aFormat[i]=="d") || (aFormat[i]=="dd")) {
                            dateSelected = parseInt(aData[i], 10);
                            tokensChanged++;
                        } else
                        if((aFormat[i]=="m") || (aFormat[i]=="mm")) {
                            monthSelected =    parseInt(aData[i], 10) - 1;
                            tokensChanged++;
                        } else
                        if(aFormat[i]=="yyyy") {
                            yearSelected = parseInt(aData[i], 10);
                            tokensChanged++;
                        }else
                        if(aFormat[i]=="mmm") {

                            for(j=0; j<12;    j++) {
                                if (aData[i]==monthName[j]) {
                                    monthSelected=j;
                                    tokensChanged++;
                                }
                            }
                        } else
                        if(aFormat[i]=="mmmm") {
                            for(j=0; j<12;    j++) {
                                if (aData[i]==monthName2[j]) {
                                    monthSelected=j;
                                    tokensChanged ++;
                                }
                            }
                        }
                    }
                }

                if((tokensChanged!=3)||isNaN(dateSelected)||isNaN(monthSelected)||isNaN(yearSelected)) {
                    dateSelected = dateNow;
                    monthSelected =    monthNow;
                    yearSelected = yearNow;
                }
                odateSelected=dateSelected;
                omonthSelected=monthSelected;
                oyearSelected=yearSelected;

                aTag = ctl;
                do {
                    aTag = aTag.offsetParent;
                    leftpos    += aTag.offsetLeft;
                    toppos += aTag.offsetTop;
                } while(aTag.tagName!="BODY");

                crossobj.left =    fixedX==-1 ? ctl.offsetLeft    + leftpos :    fixedX;
                crossobj.top = fixedY==-1 ?    ctl.offsetTop +    toppos + ctl.offsetHeight +    2 :    fixedY;
                constructCalendar (1, monthSelected, yearSelected);
                crossobj.visibility=(dom||ie)? "visible" : "show";

                hideElement('SELECT', document.getElementById("calendar"));
                hideElement('APPLET', document.getElementById("calendar"));            

                bShow = true;
            } else {
                hideCalendar();

                if (ctlNow!=ctl) {
                    popUpCalendar(ctl, ctl2, format);
                }
            }
            ctlNow = ctl;
        }
    }



	 function Zero(num,leng) {
        var zero=leng-(""+num).length;
        if (typeof(num)=="number" && zero>0) {
            var tmp="";
            for (var i=0; i<zero; i++) tmp+="0";
            return tmp+num;
        } else return num;
    }
function SetScrollPos_Sample(tagDIV)
    {
        var positionTop = 0;
        if (tagDIV != null)
        {
            positionTop = parseInt(tagDIV.scrollTop, 10);
            document.getElementById("SAMPLE_TABLE").style.top = positionTop;
        }
    }
    function SetScrollPos(tagDIV)
    {
        var positionTop = 0;
        if (tagDIV != null)
        {
            positionTop = parseInt(tagDIV.scrollTop, 10);
            document.getElementById("SAMPLE_TABLE1").style.top = positionTop;
        }
    }	
	function godelete(uid,sysid)
	{
		
			var uid;
			var sysid;
			if(confirm(sysid+"을삭제 하시겠습니까?")) {
			window.alert("삭제 준비 중입니다");
			//  HiddenFrame.location.href="user_system_del.php?uid="+uid+"&sys_id="+sysid
			} else { 
			}
	}
	function onChange(obj,val)
	{
	
		var selectValue = obj.value;
		var input;
		var date
		 today= new Date();
	    var year  =today.getYear();
		var mon  =today.getMonth()+1;
	    var sday =today.getDate();

		if (selectValue == "P")
		{
			input = eval("document.form.cal"+val)
			input.value=year+"/"+Zero(mon,2)+"/"+Zero(sday,2)	
			input.style.background='#FFFFFF';
		}
		else
		{
			input = eval("document.form.cal"+val)
			input.value=""		
			input.style.background='#CCCCCC';
		}
	}

</script>
</head>
<body>
<form name="form" method="post" action="user_system_edit_ins.php">
<table width=500 border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="46" background="<%=DIR_IMG%>pop_500bg_01.jpg" class="PopupTitleBgWhite"><img src="<%=DIR_IMG%>pop_img01.gif" align="absmiddle" style="margin-left:10px; margin-right:10px">사용자 시스템 현황</td>
  </tr>
  <tr>
    <td height="4"></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="5"></td>
        <td width="*" height="4" bgcolor="#9ab1cf"></td>
        <td width="5"></td>
      </tr>
      <tr>
        <td></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="30" class="PopupLine"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td class="OrangeText"><strong>사용자 정보</strong></td>
                    </tr>
                  </table></td>
                  </tr>
                <tr>
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" class="PopupBold">사용자 이름</td>
                      <td class="PopupLine"><input name="textfield" type="text" size="18" class="inputLIneGrayColor" readonly value="<%=UNAME%>"></td>
                      <td class="PopupBold">사용자 ID</td>
                      <td class="PopupLine"><input name="uid" type="text" size="20" class="inputLIneGrayColor" readonly value="<%=USER_ID%>"></td>
                    </tr>
                    <tr>
                      <td height="25" class="PopupBold">소속</td>
                      <td class="PopupLine"><input name="textfield3" type="text" size="18" class="inputLIneGrayColor" readonly value="<%=USER_COMPANY%>"></td>
                      <td class="PopupBold">사용자 유형</td>
                      <td class="PopupLine"><input name="textfield22" type="text" size="20" class="inputLIneGrayColor" readonly value="<%=str_kind%>"></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td height="30" class="PopupLine"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td class="OrangeText"><strong>장비정보</strong></td>
                    </tr>
                  </table></td>
                  </tr>
                <tr>
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <colgroup>
                        <col width="120">
                        <col width="120">
                        <col width="100">
                        <col width="*">
                        </colgroup>
                        <tr class="TableBgBold">
                          <td height="34" class="TableBg">Service ID</td>
                          <td class="TableBg">Syetem ID</td>
                          <td class="TableBg">접속기간</td>
                          <td class="TableBg">구 분</td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td>
					     <div style="height:312; overflow-y:scroll;"> 
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <colgroup>
                        <col width="120">
                        <col width="120">
                        <col width="100">
                        <col width="*">
                        </colgroup>
<%if (AdminUserSystemCount == 0){%>
                  <tr> 
                    <td height="30" colspan="4" class="PopupBold">해당 시스템이 없습니다.</td>
                  </tr>
<%
}else{
  	for(int i=0; i<AdminUserSystemCount; i++){
	 if (Admin_UserSystemList.get("conn_type,i").equals("C")){
		class_name ="InputGray";
	 }else{
		class_name ="inputLIneGrayColor";
	 }

	exp_date =Admin_UserSystemList.get("exp_date",i);
	if (!exp_date.equals("")){exp_date = Util.DataFormat_yyMMdd(exp_date);}
%>					
					 <tr>
                          <td class="TableBgText"><input name="svc_id" type="text" size="15" class="inputLIneGrayColor" value="<%=Admin_UserSystemList.get("service_id",i)%>" ReadOnly></td>
                          <td class="TableBgText"><input name="sys_id<%=k%>" type="text" size="15" class="inputLIneGrayColor" value="<%=Admin_UserSystemList.get("system_id",i)%>" ReadOnly></td>
                          <td class="TableBgText"><input name="cal<%=k%>" type="text" size="10" class="inputLIneGrayColor"  value="<%=exp_date%>" ReadOnly><img style="margin-left:4px" src="<%=DIR_IMG%>table_zoom.gif" align="absmiddle"></td>
                          <td class="TableBgText">
                          		<select name="sType<%=k%>" onChange="onChange(this,<%=k%>)" class="InputLIneSelect">
							<option value="C" <%if(Admin_UserSystemList.get("conn_type",i).equals("C")){%>SELECTED<%}%>>접속별</option>
							<option value="P" <%if(Admin_UserSystemList.get("conn_type",i).equals("P")){%>SELECTED<%}%>>기간별</option>
                      </select><a href="#" onClick="godelete('<%=userid%>','<%=Admin_UserSystemList.get("system_id",i)%>'"><img src="<%=DIR_IMG%>btn_delete.gif" border="0"  alt="시스템 삭제" align="absmiddle" style="margin-left:3px"></a></td>
                          </tr>
                          
   <% 
	k=k+1;
	}
  	
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
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td height="40" align="right"><a href="#"><img style="margin-right:6px" src="<%=DIR_IMG%>btn_modify1.gif" onClick="javascript:window.alert('준비중입니다');"></a><a href="#"><img src="<%=DIR_IMG%>btn_close.gif" width="42" height="22" onClick="javascript:window.close();"></a></td>
        <td></td>
      </tr>
    </table></td>
  </tr>
</table>
<input type="hidden" name="input_len" value="<%=k%>">
 </form>
 <iframe name="HiddenFrame" width="0" height="0" id="HiddenFrame"  scrolling=no   FRAMEBORDER="0"></iframe>

</body>
</html>

