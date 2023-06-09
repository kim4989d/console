//=======================================================================
//시스템구분 : CONSOLE
//실행  환경  : TOMCAT, MySql, JAVA
//프로그램명 : 
//기      능    : 시스템 장비 목록  
//특이  사항  :  
//작	 성  자   : 김 명 진 
//날         짜  : 2009-02-06
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
//							시스템 장비 목록 불러 오기 
//=======================================================================
public class ServerListCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public ServerListCmd() {
		setNextPage("/server/server_list.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;
		ResultSetTray checkoptiontray     = null;
//		String cmd=reqTray.get("cmd");
//		String write="";
		
		try {
			ListDao dao = new ListDao();
			
			checkoptiontray=dao.ServerCheckBoxList(getConnection(),reqTray);
//			checkbox =	CommonUtil.ServerSelectBox(checkoptiontray,reqTray); // Select 를 불러움 (DB처리 )
						
			rsTray=dao.EquipmentList(getConnection(),reqTray);
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)", ex);
	}
		finally{
			request.setAttribute("rsTray", rsTray);
			request.setAttribute("checkbox",checkbox);
		}
	}
	
	
	
	
	
}
