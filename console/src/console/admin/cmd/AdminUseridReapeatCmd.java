package console.admin.cmd;
//=======================================================================
//시스템구분 : CONSOLE
//실행  환경  : TOMCAT, MySql, JAVA
//프로그램명 : 
//기      능    : 회원가입(아이디 중복 확인) 
//특이  사항  :  
//작	 성  자   : 김 명 진 
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
public class AdminUseridReapeatCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public AdminUseridReapeatCmd() {
		setNextPage("/admin/admin_user_id_repeat.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;   //아이디 중복 확인 페이지
		
		ResultSetTray checkoptiontray     = null;
//		String cmd=reqTray.get("cmd");
//		String write="";
		
		String kind = reqTray.get("uKind");
		if(kind.equals("") || kind == null){
			kind = "G";}
		String uid = reqTray.getString("uid");
		
		try {
			AdminDao dao = new AdminDao();
			
			//checkoptiontray=dao.CheckBoxList(getConnection(),reqTray);
			//checkbox=	CommonUtil.SelectBox(checkoptiontray,reqTray);

			rsTray		=	dao.IdRepeat(getConnection(),reqTray);  	   //	아이디 중복 확인 페이지
			
			System.out.println(rsTray);						   // 	아이디 중복 확인 하기 
		
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)占쏙옙占쏙옙 占싹뱄옙 占쏙옙占쏙옙 占쌩삼옙", ex);
	}
		finally{
			request.setAttribute("rsTray", rsTray);    // 아이디 중복 확인 페이지 
			request.setAttribute("uid", uid);
			//request.setAttribute("checkbox",checkbox);
		}
	}
	
	
	
	
	
}
