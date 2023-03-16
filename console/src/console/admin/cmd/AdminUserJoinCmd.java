package console.admin.cmd;
//=======================================================================
//시스템구분 : CONSOLE
//실행  환경  : TOMCAT, MySql, JAVA
//프로그램명 : 
//기      능     : 회원가입 
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
//								로그인 창  
//=======================================================================
public class AdminUserJoinCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public AdminUserJoinCmd() {
		setNextPage("/admin/admin_user_join.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {

		ResultSetTray rsTray      = null;   // 소속사  불러 오기 
		ResultSetTray rsTray2     = null;   // 관리자 불러오기 1
		ResultSetTray rsTray3     = null;   // 관리자 불러오기 2		
		
		
		try {
			AdminDao dao = new AdminDao();
			
			rsTray		=	dao.CompanyName(getConnection(),reqTray); 	   	   //   소속사 불러 오기 
			rsTray2		=	dao.selectService1(getConnection(),reqTray);	   // 	관리자 불러 오기 1  
			rsTray3		=	dao.selectService2(getConnection(),reqTray);	   // 	관리자 불러 오기 2

		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)占쏙옙占쏙옙 占싹뱄옙 占쏙옙占쏙옙 占쌩삼옙", ex);
	}
		finally{
			request.setAttribute("rsTray",  rsTray);    //  소속사 불러 오기 
			request.setAttribute("rsTray2", rsTray2);  //  관리자 불러 오기 1
			request.setAttribute("rsTray3", rsTray3);  //  관리자 불러 오기 2
		}
	}
	
	
	
	
	
}
