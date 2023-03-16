//=======================================================================
//시스템구분 : CONSOLE
//실행  환경  : TOMCAT, MySql, JAVA
//프로그램명 : 
//기      능     : 회원가입 (system 목록 보여 주기 )
//특이  사항   :
//작   성   자 : 김  명  진 
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
public class ConsoleJoinSysNameCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public ConsoleJoinSysNameCmd() {
		setNextPage("/consolelogin/console_join_sys_name.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray JoinSysName     		= null;		
		ResultSetTray JoinSysName2    		= null;
		ResultSetTray checkoptiontray       = null;
		
		try {
			ConsoleJoinDao dao = new ConsoleJoinDao();
			
			JoinSysName=dao.JoinSysName(getConnection(),reqTray); 			// 서비스 선택 목록 불러 오기 
			JoinSysName2=dao.JoinSysName2(getConnection(),reqTray); 	    // 서비스 선택 목록 불러 오기2 
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)占쏙옙占쏙옙 占싹뱄옙 占쏙옙占쏙옙 占쌩삼옙", ex);
	}
		finally{
			request.setAttribute("rsTray", JoinSysName);  // 서비스 선택 목록 불러 오기  
			request.setAttribute("rsTray2", JoinSysName2);  // 서비스 선택 목록 불러 오기  
		//	request.setAttribute("checkbox",checkbox);
		}
	}
	
	
	
	
	
}
