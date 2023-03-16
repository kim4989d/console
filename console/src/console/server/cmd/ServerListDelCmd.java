//=======================================================================
//시스템구분 : CONSOLE
//실행  환경  : TOMCAT, MySql, JAVA
//프로그램명 : 
//기      능    : 시스템 장비 목록 (삭제 )
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
//						시스템 장비 목록 (삭제)
//=======================================================================
public class ServerListDelCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public ServerListDelCmd() {
		setNextPage("/server/server_list_del.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;
		ResultSetTray EquipmentCount     = null;
		ResultSetTray checkoptiontray     = null;
		
//		String cmd=reqTray.get("cmd");
//		String write="";
		
		try {
			ListDao dao = new ListDao();
			
			checkoptiontray=dao.ServerCheckBoxList(getConnection(),reqTray);
			checkbox =	CommonUtil.ServerSelectBox(checkoptiontray,reqTray);  // Select 를 불러움 (DB처리 )
			
			// 테이블 목록 삭제전 해당 HISTORY에 해당 정보를 저장후 삭제 
			// TBL_SYSTEM 에 삭제 대상의 service_id와 같은 시스템 삭제 쿼리
			rsTray  	   = dao.EquipmentListDel(getConnection(),reqTray);  // 삭제  TBL_USER_SYSTEM
			EquipmentCount = dao.EquipmentCount(getConnection()  ,reqTray);  // 전체 장비 목록  
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)占쏙옙占쏙옙 占싹뱄옙 占쏙옙占쏙옙 占쌩삼옙", ex);
	}
		finally{
			request.setAttribute("rsTray", rsTray);
			request.setAttribute("rsTray2", EquipmentCount);
			request.setAttribute("checkbox",checkbox);
		}
	}
	
	
	
	
	
}
