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
//							 사용자 관리 수정 부분 
//=======================================================================
public class AdminUserEditCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public AdminUserEditCmd() {
		setNextPage("/admin/admin_user_edit.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {

		ResultSetTray rsTray     			= null;   // 소속사  불러 오기 
		ResultSetTray rsTray2     			= null;   // 관리자 불러오기 1
		ResultSetTray rsTray3     			= null;   // 관리자 불러오기 2
		ResultSetTray UserEditList			= null;	  // 수정 목록 불러오기 
		ResultSetTray UserServiceId			= null;	  // 서비스 ID 불러오기
		ResultSetTray UserSystemList2		= null;	  // 유저 시스템 목록 
		ResultSetTray UserSmsWork			= null;	  // SMS
		
		
		String uKind 		=	"";
		String cert_date	=	"";
		String uid		=	"";
		
		try {
			AdminDao dao = new AdminDao();
			
			rsTray		=	dao.CompanyName(getConnection(),reqTray); 	   	   			//  소속사 불러 오기 
			rsTray2		=	dao.selectService1(getConnection(),reqTray);	   			// 	관리자 불러 오기 1  
			rsTray3		=	dao.selectService2(getConnection(),reqTray);	   			// 	관리자 불러 오기 2
			
			UserEditList 		= dao.UserEditList(getConnection(), reqTray);			//  수정 목록 불러 오기
			
			
			uid		=	 UserEditList.get("user_id");	
			uKind 		=	 UserEditList.get("kind");
			cert_date	=    UserEditList.get("cert_date");
			
			if (uKind.equals("O") || uKind.equals("A")){
			
			UserServiceId   	= dao.UserServiceId(getConnection(), reqTray, uid);			//  서비스 id
			
			
			}else if(!uKind.equals("O")){
				UserSystemList2		= dao.UserSystemList2(getConnection(), reqTray , uid );	//  시스템 리스트 
			}

			if ((uKind.equals("G") || uKind.equals("M")) && cert_date.equals("")){
				UserSmsWork			= dao.UserSmsWork(getConnection(), reqTray,uid);		//  SMS 

			}
			

		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)占쏙옙占쏙옙 占싹뱄옙 占쏙옙占쏙옙 占쌩삼옙", ex);
	}
		finally{
			request.setAttribute("rsTray",  rsTray);    		//  소속사 불러 오기 
			request.setAttribute("rsTray2", rsTray2);  			//  관리자 불러 오기 1
			request.setAttribute("rsTray3", rsTray3);  			//  관리자 불러 오기 2
			request.setAttribute("rsTray4", UserEditList);    	//  수정 목록 불러 오기 
			request.setAttribute("rsTray5", UserServiceId);    	//  서비스 id
			request.setAttribute("rsTray6", UserSystemList2);   //  시스템 리스트 
			request.setAttribute("rsTray7", UserSmsWork);   	//  SMS
		}
	}
	
	
	
	
	
}
