package console.qadb.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.qadb.dao.LoginDao;


public class LoginCmd extends BaseCommand {
	
	public LoginCmd() {
		setNextPage("console_login.jsp");
	}

	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		LoginDao       loginDao = null;
		ResultSetTray  rsTray   = null;
		ResultSetTray  authTray = null;

		try {
			loginDao = new LoginDao();
			rsTray = loginDao.findEmpInfo(getConnection(), reqTray);
			System.out.println("count 0>:"+rsTray.getRowCount());
//			if ( rsTray.getRowCount() > 0 ) {
//				authTray = loginDao.findDeptAuth(getConnection(), rsTray);
//				request.setAttribute("dept_auth", authTray);
//			
//			System.out.println("count 0>:"+rsTray.getRowCount());
//			}
		}
		catch (AppException ex) {
			throw ex;
		}
		catch (Exception ex) {
			throw new AppException("LoginDao.findEmpInfo(Connection conn, Tray reqTray)에서 일반 예외 발생", ex);
		}
		finally {
			request.setAttribute("LogInAuth", rsTray);
		}
	}
}
