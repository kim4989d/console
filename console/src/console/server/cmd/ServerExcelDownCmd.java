//=======================================================================
//½Ã½ºÅÛ±¸ºÐ : CONSOLE
//½ÇÇà  È¯°æ  : TOMCAT, MySql, JAVA
//ÇÁ·Î±×·¥¸í : 
//±â      ´É    : ¿¢¼¿ ´Ù¿î ·Îµå 
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
//								¿¢¼¿ ´Ù¿î ·Îµå 
//=======================================================================
public class ServerExcelDownCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public ServerExcelDownCmd() {
		setNextPage("/server/exceldown.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;
		ResultSetTray rsTray2     = null;
		ResultSetTray checkoptiontray     = null;
		ResultSetTray checkoptiontray2     = null;
//		String cmd=reqTray.get("cmd");
//		String write="";
		
		try {
			ListDao dao = new ListDao();
		
//			checkoptiontray=dao.ServerCheckBoxList(getConnection(),reqTray);
//			checkbox =	CommonUtil.SelectBox(checkoptiontray,reqTray); // Select ¸¦ ºÒ·¯¿ò (DBÃ³¸® )
						
			//rsTray=dao.EquipmentCount(getConnection(),reqTray);  /ÀüÃ¼ ·¹ÄÚµå¸¦ ±¸ÇØ¿È 
			rsTray2=dao.exceldown(getConnection(),reqTray);      //Àåºñ¸ñ·ÏÀ» ºÒ·¯¿È (¿¢¼¿ ÀúÀå)
			
			System.out.println("=========================");
			System.out.println(rsTray);
			System.out.println(rsTray2);
			System.out.println("=========================");
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)ï¿½ï¿½ï¿½ï¿½ ï¿½Ï¹ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ß»ï¿½", ex);
	}
		finally{
			request.setAttribute("rsTray", rsTray);
			request.setAttribute("rsTray2", rsTray2);  //È­¸é¿¡ »Ñ·ÁÁÙ Àåºñ ¸ñ·Ï 
		//	request.setAttribute("checkbox",checkbox);
		}
	}
	
	
	
	
	
}
