package console.user_main.cmd;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.user_main.dao.UserDao;
import console.common.util.CommonUtil;

public class UserMainCmd extends BaseCommand{
	public String str="testabc";
	public String checkbox="";
	
	public UserMainCmd() {
		setNextPage("user_main/index.jsp");
	}
	
	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		ResultSetTray rsTray     = null;
		ResultSetTray checkoptiontray     = null;
	
		
		//		String cmd=reqTray.get("cmd");
		//		String write="";
		
		try {
			UserDao dao = new UserDao();
		// checkbox list option 	
		// checkoptiontray=dao.CheckBoxList(getConnection(),reqTray);
		// checkbox=	CommonUtil.SelectBox(checkoptiontray,reqTray);
			
		//	rsTray=dao.CheckLogin(getConnection(),reqTray);
			
			//<?IF ($KIND == "O" || $KIND =="A")
					
//			if(rsTray.getString("kind").equals("A") || rsTray.getString("kind").equals("O"))
//			{
//				setNextPage("main/index.jsp");
//				request.setAttribute("LoginCheck", rsTray);
//			}else{
//				setNextPage("user_main/index.jsp");
//				request.setAttribute("LoginCheck", rsTray);
//			}
		
			
		} catch (AppException ex) {
		throw ex;
	}
	catch (Exception ex) {
		throw new AppException("PaymentVerifyResultEjbBean.findOrgInfo(Connection conn, Tray reqTray)에서 일반 예외 발생", ex);
	}
		finally{
			//request.setAttribute("LoginCheck", rsTray);
			//request.setAttribute("checkbox",checkbox);
				
		
		}
	}
	
	
	
	
	
}
