package console.left.cmd;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.login.dao.LoginDao;
import console.common.util.CommonUtil;
import console.left.dao.LeftDao;



public class LeftCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public LeftCmd() {
		setNextPage("/main/index.jsp");
	}
	
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray    		  = null;
		ResultSetTray checkoptiontray     = null;
	
		
		//String cmd=reqTray.get("cmd");
		//String write="";
		
		try {
			LeftDao dao = new LeftDao();
		//checkbox list option 	
		//checkoptiontray=dao.CheckBoxList(getConnection(),reqTray);
		// checkbox=	CommonUtil.SelectBox(checkoptiontray,reqTray);

			


//			신청현황 -> 인증키 미사용 현황 LIST

//			flagValues
//			div = left menu values
			//
//			request values
//			kind	= 공통 
//			user_id	= 공통

			dao.KeyNotList(getConnection(),reqTray);	


//			신청현황 -> 시스템 사용신청 현황 List

//			flagValue
//			div	= left request vlaue
			//
//			request values
//			kind	= 공통

//			dao.SystemUseList(getConnection(),reqTray);


//			신청현황 -> 	계정 신청현황 List


//			flagValues
//			div = left Menue value
			//
//			request vlaues
//			user_id	= 공통
//			kind	= 공통


//			dao.UserInputList(getConnection(),reqTray);



//			신청현황 -> NT 작업신청현황

//			flag values
//			div 	= left메뉴에서 넘어 오는 값
			//
//			request values
//			kind	= 공통
//			user_id = 공통


//			dao.NtWorkList(getConnection(),reqTray);

//			신청현황 -> Unix 작업신청현황 LIST
//			user_id	= 공통 
//			kind 	= 공통 

//			dao.UnixWorkList(getConnection(),reqTray);	

			
			
			
//			======================================================================================
//			사용자 관리 목록 불러오기 
//		=====================================================================================

//			dao.UserManagementList(getConnection(),reqTray);	
			
//			=======================================================================================
//			사용자 관리 (시스템 목록 불러 주기 )
//		=======================================================================================
//			dao.UserManagementSystemList(getConnection(),reqTray);			
		
			
//			/=========================================================================================
//			장비 목록 불러 오기  (서비스 사용 장비 현황_장비 접속  )
//		=========================================================================================
			
			
//			dao.UserUseServerConnList(getConnection(),reqTray);
			
			

//			===========================================================================                           
//			장비 목록 불러 오기  (서비스 사용 장비 현황_삭제  )             
//		===========================================================================                           
			
//			dao.UserUseServeDeleterList(getConnection(),reqTray);
			
			
			getConnection().close();		
			
			
			
			
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)에서 일반 예외 발생", ex);
	}
		finally{
			request.setAttribute("LoginCheck", rsTray);
			request.setAttribute("checkbox",checkbox);
				
		
		}
	}
	
	
	
	
	
}
