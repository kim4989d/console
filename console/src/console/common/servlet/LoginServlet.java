package console.common.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import console.common.execption.AppException;
import console.common.session.QADBSessionManager;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.common.util.Logger;
import console.login.cmd.LoginCmd;
import console.common.session.ConSessionManager;
import console.common.tray.NomalTray;
public class LoginServlet extends BaseServlet {
	
	protected void setNoCache(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		super.setNoCache(request, response);
	}
	
	
	
	public final void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Tray               reqTray        = null;
		ResultSetTray      rtnTray        = null;
		LoginCmd       	   command        = null;
		String		       loginRs        = null;
		String             nextPage       = "/ci_login.jsp";
		QADBSessionManager sessionManager = null;
		setNoCache(request,response);
		NomalTray			sesTray		  = null;
		try {
			sessionManager  = new QADBSessionManager();
			//System.out.println("start");
			reqTray = getRequestTray(request);
			
			
			//System.out.println("reqTray  :"+reqTray.toString());
					
			
		//	System.out.println("######################"+sesTray.get("CONSOLE_USERID"));
			
			
			command = new LoginCmd();
			command.execute(reqTray, request, response);


			rtnTray =(ResultSetTray)request.getAttribute("LoginCheck");
			
/*			if(rtnTray.getRowCount()==1){
				ConSessionManager.setConsoleInfo(request,rtnTray);
				nextPage="/require.do?cmd=require_list&kind="+rtnTray.getString("kind");	*/
			if(rtnTray.getRowCount()==1){
			String kind=	rtnTray.get("kind");
				if(kind.equals("M") || kind.equals("E") || kind.equals("G")){
					nextPage="/usermain/index.jsp";	
				}else{
				
				
				
				nextPage="/main/index.jsp";	
				}
			
				ConSessionManager.setConsoleInfo(request,rtnTray);
				
			
			}else{
				nextPage="/ci_login.jsp";
				System.out.println("ci_login.jsp");
			}
					
			
			
			
			//	if ( reqTray.getString("prc").equals("loginReq") ) {
//				rtnTray = (ResultSetTray)request.getAttribute("LogInAuth");					
//				loginRs = "" + rtnTray.getRowCount();
//
//				if (rtnTray.getRowCount() > 0) {
//					if (rtnTray.getString("empl_passwd").equals(reqTray.getString("pwd"))) {
//						sessionManager.initSession(request, rtnTray);
//						nextPage = "/jsp/qa_frame.jsp";
//					} else {
//						loginRs = "5";
//						nextPage = "/jsp/qa_login.jsp";
//					}
//				} else {
//					sessionManager.clearSession(request);
//					nextPage = "/jsp/qa_login.jsp";
//				}
//			} else { 
//				loginRs = "";
//				sessionManager.clearSession(request);
//				nextPage = "/jsp/qa_login.jsp";
//			}
			
			
			//sessionManager.initSession(request, rtnTray);
			//nextPage = "/vaatz/src/vsim/CInet/hmc/kr/Basic/Basic.jsp";
			
		//	request.setAttribute("loginRes", loginRs);
		//	request.setAttribute("user_id", reqTray.getString("user_id"));
		} catch (Exception ex) {
			Logger.trace("LoginServlet.doService ���� ��, �Ϲ� ���� �߻�", ex);
            throw new AppException("LoginServlet.doService ���� ��, �Ϲ� ���� �߻�", ex);
		} finally {
            setNoCache(request, response);
		}
		forward(request, response, nextPage);
	}
}