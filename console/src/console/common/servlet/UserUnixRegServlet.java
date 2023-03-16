package console.common.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import console.common.execption.AppException;
import console.common.session.ConSessionManager;
import console.common.session.QADBSessionManager;
import console.common.tray.ResultSetTray;
import console.common.tray.Tray;
import console.common.util.Logger;
import console.common.cmd.BaseCommand;
import console.common.tray.NomalTray;

public class UserUnixRegServlet extends BaseServlet {

	public final void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Tray				reqTray        = null;
		ResultSetTray		rtnTray        = null;
		BaseCommand			command        = null;
		String				loginRs        = null;
		String				nextPage       = null;
		QADBSessionManager	sessionManager = null;
		NomalTray			sessiontray	   = null;
		
		
		try {
			System.out.println("UserUnixRegServlet doService() start ");
			reqTray = getRequestTray(request);
			command = createCommand(reqTray.getString("cmd"));
			
			System.out.println("==========UserUnixReg execute start============");
			command.execute(reqTray, request, response);
			nextPage = command.getNextPage();
		
		} catch (Exception ex) {
			Logger.trace("UserUnixServlet.doService 수행 중, 일반 예외 발생", ex);
            throw new AppException("UserUnixServlet.doService 수행 중, 일반 예외 발생", ex);
		} finally {
		}
		
		System.out.println("Servlet.java: forward "+reqTray.getString("cmd"));
		
		if(reqTray.getString("cmd").equals("write")){
			
			response.sendRedirect(command.getNextPage());
		System.out.println("Servlet.java: forward cmd2"+reqTray.getString("cmd"));
		}else{
			forward(request, response, command.getNextPage());
			}
		}

}
