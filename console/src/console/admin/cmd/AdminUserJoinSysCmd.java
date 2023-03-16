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
public class AdminUserJoinSysCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public AdminUserJoinSysCmd() {
		setNextPage("/admin/admin_user_join_sys.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;			// 서비스 선택 목록 불러 오기 
		ResultSetTray rsTray2     = null;			// 등록 시스템 목록 불러 오기 
		try {
			AdminDao dao = new AdminDao();
			
	
			rsTray=dao.service_list(getConnection(), reqTray); 	// 서비스 선택 목록 불러 오기
			rsTray2= dao.app_system(getConnection(), reqTray);  // 등록 시스템 목록 불러 오기 
			
			
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)", ex);
	}
		finally{
			request.setAttribute("rsTray", rsTray); 	 // 서비스 선택 목록 불러 오기
			request.setAttribute("rsTray2", rsTray2);    // 등록 시스템 목록 불러 오기 
		}
	}
	
	
	
	
	
}
