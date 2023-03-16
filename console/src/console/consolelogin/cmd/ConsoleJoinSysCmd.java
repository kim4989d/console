//=======================================================================
//시스템구분 : CONSOLE
//실행  환경  : TOMCAT, MySql, JAVA
//프로그램명 : 
//기      능     : 회원가입 (system 목록 보여 주기 )
//특이  사항  :  
//작	 성  자   : 김 명 진 
//날         짜  : 2009-02-06
//======================================================================
package console.consolelogin.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.common.util.CommonUtil;
import console.consolelogin.dao.ConsoleJoinDao;

//=======================================================================
//								system 목록 보여 주기   
//=======================================================================
public class ConsoleJoinSysCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public ConsoleJoinSysCmd() {
		setNextPage("/consolelogin/console_join_sys.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray service_list     = null;			// 서비스 선택 목록 불러 오기 
		ResultSetTray app_system       = null;			// 등록 시스템 목록 불러 오기 
		
		try {
			ConsoleJoinDao dao = new ConsoleJoinDao();

			service_list=dao.service_list(getConnection(), reqTray); 	// 서비스 선택 목록 불러 오기
			app_system= dao.app_system(getConnection(), reqTray);  		// 등록 시스템 목록 불러 오기 
			
			
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)占쏙옙占쏙옙 占싹뱄옙 占쏙옙占쏙옙 占쌩삼옙", ex);
	}
		finally{
			request.setAttribute("rsTray", service_list); 	 // 서비스 선택 목록 불러 오기
			request.setAttribute("rsTray2", app_system);     // 등록 시스템 목록 불러 오기 

		}
	}
	
	
	
	
	
}
