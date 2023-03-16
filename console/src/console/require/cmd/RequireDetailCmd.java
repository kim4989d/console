package console.require.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.require.dao.RequireDao;


/**
 * 
 *  내용:	계정신청 현황 -> 승인 처리시 필요한 상세페이지 작성
 *  페이지: 	require\require_user_details.jsp
 * 	작성자:	이충섭 
 */

public class RequireDetailCmd extends BaseCommand{
		
	public RequireDetailCmd() {
		setNextPage("/require/require_user_details.jsp");	
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		
		ResultSetTray userList		  = null;			//신규 계정 신청자 전체 정보
		ResultSetTray companyList     = null;			//전체 회사 정보
		
		
		try {
			RequireDao dao = new RequireDao();			
			
			userList	= dao.userList(getConnection(), reqTray);		//TBL_USER의 신규 신청자 해당 정보 
			companyList = dao.companyList(getConnection(), reqTray);	//TBL_COMPANY 의 전체 회사 정보 
			
			
			
			
			
			
			} catch (AppException ex) {
				throw ex;
	
			}
	catch (Exception ex) {
		throw new AppException("RequireDatailCmd 에서의 DAO에 대한  일반 예외 발생", ex);
	}
		finally{
			request.setAttribute("rsCompanyListTray", companyList);
			request.setAttribute("rsUserListTray", userList);
		}
	}
	
	
	
	
	
}
