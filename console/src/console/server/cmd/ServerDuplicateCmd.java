//=======================================================================
//½Ã½ºÅÛ±¸ºÐ : CONSOLE
//½ÇÇà  È¯°æ  : TOMCAT, MySql, JAVA
//ÇÁ·Î±×·¥¸í : 
//±â      ´É    : Áßº¹ È®ÀÎ 
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
import console.common.util.CommonUtil;

//=======================================================================
//								Áßº¹ È®ÀÎ Ã¢ 
//=======================================================================
public class ServerDuplicateCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public ServerDuplicateCmd() {
		setNextPage("/server/server_duplicate.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;
		ResultSetTray checkoptiontray     = null;
//		String cmd=reqTray.get("cmd");
//		String write="";
		
		try {
//			EquipmentDao dao = new EquipmentDao();
//			
//			checkoptiontray=dao.ServerCheckBoxList(getConnection(),reqTray);
//			checkbox=	CommonUtil.SelectBox(checkoptiontray,reqTray);
//						
//			rsTray=dao.EquipmentList(getConnection(),reqTray);
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)ï¿½ï¿½ï¿½ï¿½ ï¿½Ï¹ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ß»ï¿½", ex);
	}
		finally{
			request.setAttribute("rsTray", rsTray);
			//request.setAttribute("checkbox",checkbox);
		}
	}
	
	
	
	
	
}
