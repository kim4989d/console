package console.login.cmd;


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

public class LoginCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public LoginCmd() {
		setNextPage("/main/index.jsp");
	}
	
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;
		ResultSetTray checkoptiontray     = null;
	
		
		//		String cmd=reqTray.get("cmd");
		//		String write="";
		
		try {
			LoginDao dao = new LoginDao();
		//checkbox list option 	
		//checkoptiontray=dao.CheckBoxList(getConnection(),reqTray);
		// checkbox=	CommonUtil.SelectBox(checkoptiontray,reqTray);
			
			rsTray=dao.CheckLogin(getConnection(),reqTray);
			
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
