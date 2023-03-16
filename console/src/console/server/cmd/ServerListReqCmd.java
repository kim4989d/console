//=======================================================================
//½Ã½ºÅÛ±¸ºÐ : CONSOLE
//½ÇÇà  È¯°æ  : TOMCAT, MySql, JAVA
//ÇÁ·Î±×·¥¸í : 
//±â      ´É    : ½Ã½ºÅÛ µî·Ï  
//Æ¯ÀÌ  »çÇ×  :  
//ÀÛ	 ¼º  ÀÚ   : ±è ¸í Áø 
//³¯         Â¥  : 2009-02-06
//======================================================================

package console.server.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.server.dao.ListDao;
import console.common.util.CommonUtil;


//=======================================================================
//						½Ã½ºÅÛ µî·Ï ÇÏ´Â Ã¢ 
//=======================================================================
public class ServerListReqCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";

	
	public ServerListReqCmd() {
		setNextPage("/server/server_req.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;
		ResultSetTray rsTray2     = null;
		ResultSetTray rsTray3     = null;
		ResultSetTray rsTray4     = null;
		ResultSetTray rsTray5     = null;
		ResultSetTray checkoptiontray = null;
		
		
//		String cmd=reqTray.get("cmd");
//		String write="";
		
		try {
			ListDao dao = new ListDao();
			
			checkoptiontray=dao.ServerCheckBoxList(getConnection(),reqTray);
//			checkbox=	CommonUtil.ServerSelectBox(checkoptiontray,reqTray);

			rsTray=dao.ListReq(getConnection(),reqTray);	 // Æ÷Æ® ¹øÈ£ 
			rsTray2=dao.ListReq2(getConnection(),reqTray);   // ¼Ò¼Ó ¼­ºñ½º  
			rsTray3=dao.ListReq3(getConnection(),reqTray);   // ´ã´çÀÚ 
			rsTray4=dao.ListReq4(getConnection(),reqTray);   // Á¦Á¶»ç 
			
			
			
			//System.out.println(rsTray2);
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)ï¿½ï¿½ï¿½ï¿½ ï¿½Ï¹ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ß»ï¿½", ex);
	}
		finally{
			request.setAttribute("rsTray", rsTray); 	// Æ÷Æ® ¹øÈ£ 
			request.setAttribute("rsTray2", rsTray2);   //¼Ò¼Ó¼­ºñ½º 
			request.setAttribute("rsTray3", rsTray3);   //´ã´çÀÚ
			request.setAttribute("rsTray4", rsTray4);   //Á¦Á¶»ç 
			System.out.println(rsTray2);
		}
	}
	
	
	
	
	
}
