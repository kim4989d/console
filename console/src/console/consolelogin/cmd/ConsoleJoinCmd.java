//=======================================================================
//시스템구분 : CONSOLE
//실행  환경  : TOMCAT, MySql, JAVA
//프로그램명 : 
//기      능    : 회원가입
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
//										로그인 창  
//=======================================================================
public class ConsoleJoinCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public ConsoleJoinCmd() {
		setNextPage("/consolelogin/console_join.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray Company_Id      = null;  		 // 소속사 불러오기 
		ResultSetTray User_Id         = null;        // 관리자 불러오기 
		ResultSetTray User_Id2        = null;        // 관리자 불러오기 2		
		
		ResultSetTray checkoptiontray     = null;
		
		try {
			ConsoleJoinDao dao = new ConsoleJoinDao();

			Company_Id	=	dao.Company_Id(getConnection(),reqTray); 	   	   	   // 소속사 불러오기 
			User_Id		=	dao.User_Id   (getConnection(),reqTray);	   		   // 관리자 불러오기 
			User_Id2	=	dao.User_Id2  (getConnection(),reqTray);	  		   // 관리자 불러오기 2
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)에서 일반 예외 발생", ex);
		}
		finally{
			request.setAttribute("rsTray", Company_Id);    // 소속사 불러오기 
			request.setAttribute("rsTray2", User_Id);  	   // 관리자 불러오기 
			request.setAttribute("rsTray3", User_Id2);     // 관리자 불러오기 2
			//request.setAttribute("checkbox",checkbox);
		}
	}
	
	
	
	
	
}
