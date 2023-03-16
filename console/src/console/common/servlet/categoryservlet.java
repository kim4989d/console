package console.common.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.execption.AppException;
import console.common.session.QADBSessionManager;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.common.util.Logger;
import console.category.cmd.categorycmd;


public class categoryservlet extends BaseServlet {

	public final void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Tray               reqTray        = null;
		ResultSetTray      rtnTray        = null;
		categorycmd       command        = null;
		String		       loginRs        = null;
		String             nextPage       = null;
		QADBSessionManager sessionManager = null;

		try {
			//sessionManager  = new QADBSessionManager();
			System.out.println("start");
			reqTray = getRequestTray(request);
			
			
			command = new categorycmd();
			command.execute(reqTray, request, response);

//			if ( reqTray.getString("prc").equals("loginReq") ) {
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
				//sessionManager.clearSession(request);
//				nextPage = "/jsp/qa_login.jsp";
//			}
			
			
		//	sessionManager.initSession(request, rtnTray);
			nextPage = "/vaatz/src/vsim/CInet/hmc/kr/Basic/Basic.jsp";
			
			//request.setAttribute("loginRes", reqTray.get("buff"));
		//	request.setAttribute("user_id", reqTray.getString("user_id"));
		} catch (Exception ex) {
			Logger.trace("LoginServlet.doService 수행 중, 일반 예외 발생", ex);
            throw new AppException("LoginServlet.doService 수행 중, 일반 예외 발생", ex);
		} finally {
            setNoCache(request, response);
		}
		forward(request, response, nextPage);
	}



}
