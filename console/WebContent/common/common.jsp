<%@ page import="console.common.util.Config" %>
<%@ page import="console.common.session.ConSessionManager" %>
<%@ page import="console.common.util.CommonUtil" %>

<%
request.setCharacterEncoding("euc-kr");	


    String DIR_ROOT = Config.getInstance().getProperty("DIR_ROOT");
    String DIR_HOME = Config.getInstance().getProperty("DIR_HOME");
    String DIR_JSP  = Config.getInstance().getProperty("DIR_JSP");
    String DIR_IMG  = Config.getInstance().getProperty("DIR_IMG");
    String DIR_CSS  = Config.getInstance().getProperty("DIR_CSS"); //기본 css
    String DIR_PHOTO  = Config.getInstance().getProperty("DIR_PHOTO");
    String DIR_JS   = Config.getInstance().getProperty("DIR_JS");
    String DIR_URL_CSS  = Config.getInstance().getProperty("DIR_URL_CSS");
    String UPLOAD_PATH_ROOT = Config.getInstance().getProperty("UPLOAD_PATH_ROOT");
   // String groupCd = ConSessionManager.getGroupCd(request);
    //String userGroup = ConSessionManager.getUserGroup(request);

    
    //페이지 공통적용값 처리
    String user_id	= ConSessionManager.getUserId(request);
    String name		= ConSessionManager.getName(request);
    String kind		= ConSessionManager.getKind(request);
    System.out.println("userid  :  "+user_id+"   name  :  "+name+" kind  :  "+kind);
    
   // if(user_id==null || user_id.equals("")){
   // 	response.sendRedirect("http://localhost/login.do?cmd=l");
   // }
    
    //ATTACK IMAGER PATH
    String IMG_DIST_PROFILE          = Config.getInstance().getProperty("IMG_DIST_PROFILE");
    String IMG_DIST_EVALUATION       = Config.getInstance().getProperty("IMG_DIST_EVALUATION");
    String IMG_DIST_CRI              = Config.getInstance().getProperty("IMG_DIST_CRI");
    String IMG_DEAL_PROFILE          = Config.getInstance().getProperty("IMG_DEAL_PROFILE");
    String IMG_DEAL_EVALUATION       = Config.getInstance().getProperty("IMG_DEAL_EVALUATION");
    String IMG_DEAL_CRI              = Config.getInstance().getProperty("IMG_DEAL_CRI");

    //FILE UPLOAD PATH
    String DIST_PROFILE_ROOT          = Config.getInstance().getProperty("DIST_PROFILE_ROOT");
    String DIST_EVALUATION_ROOT       = Config.getInstance().getProperty("DIST_EVALUATION_ROOT");
    String DIST_CRI_ROOT              = Config.getInstance().getProperty("DIST_CRI_ROOT");
    String DEAL_PROFILE_ROOT          = Config.getInstance().getProperty("DEAL_PROFILE_ROOT");
    String DEAL_EVALUATION_ROOT       = Config.getInstance().getProperty("DEAL_EVALUATION_ROOT");
    String DEAL_CRI_ROOT              = Config.getInstance().getProperty("DEAL_CRI_ROOT");

    //board upload/download path
    String BOARD_UPLOAD_PATH_ROOT     = Config.getInstance().getProperty("BOARD_UPLOAD_PATH_ROOT");
    
    int DISP_PAGE_IN_PAGEGROUP        = Integer.parseInt(Config.getInstance().getProperty("DISP_DATA_IN_PAGE"));
    int startPage = 1;
    //Message
    String message_yn ="";
    String errMsg     = "";
    String init       =   Config.getInstance().getProperty("FIRSTMSG");
    String search     =   Config.getInstance().getProperty("SEARCHMSG");
    String insert     =   Config.getInstance().getProperty("INSERTMSG");
    String update     =   Config.getInstance().getProperty("UPDATEMSG");
    String delete     =   Config.getInstance().getProperty("DELETEMSG");
/*
    if(msg.getErrorCode() != null || !msg.getErrorCode().equals("")){
      message_yn = msg.getErrorCode();
      errMsg     = msg.getErrorMsg();
    }

try {
        startPage = FormatUtil.getStartPage(request);
    } catch(Exception e){}

 */

	System.out.println(" all system sucess...");
%>
<script src="<%=DIR_JS%>common.js" type="text/javascript"></script>
<script src="<%=DIR_JS%>Calendar.js" type="text/javascript"></script>
<!--<script src="<%=DIR_JS%>require_com.js" type="text/javascript"></script>-->
<script src="<%=DIR_JS%>server.js" type="text/javascript"></script>

