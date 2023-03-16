package console.admin.cmd;
//=======================================================================
//시스템구분 : CONSOLE
//실행  환경  : TOMCAT, MySql, JAVA
//프로그램명 : 
//기      능     : 회원가입 (system 목록 보여 주기 )
//특이  사항   :  
//======================================================================


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.common.util.CommonUtil;
import console.admin.dao.AdminDao;

//=======================================================================
//								system 목록 보여 주기   
//=======================================================================
public class AdminUserJoinSysNameCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public AdminUserJoinSysNameCmd() {
		setNextPage("/admin/admin_user_join_sysname.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;
		ResultSetTray rsTray2     = null;
		ResultSetTray checkoptiontray     = null;
		
		try {
			AdminDao dao = new AdminDao();
	
			rsTray=dao.JoinSysName(getConnection(),reqTray); 	// 서비스 선택 목록 불러 오기 
			rsTray2=dao.JoinSysName2(getConnection(),reqTray); 	// 서비스 선택 목록 불러 오기2 
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)", ex);
	}
		finally{
			request.setAttribute("rsTray", rsTray);  // 서비스 선택 목록 불러 오기  
			request.setAttribute("rsTray2", rsTray2);  // 서비스 선택 목록 불러 오기  
		}
	}
	
	
	
	
	
}
