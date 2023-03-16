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

public class RequireServlet extends BaseServlet {

	public final void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Tray               reqTray        = null;
		BaseCommand       command        = null;
//		ResultSetTray      rtnTray        = null;
//		String		       loginRs        = null;
		String             nextPage       = null;
//		QADBSessionManager sessionManager = null;
		NomalTray 			sessiontray	  =null;
		request.setCharacterEncoding("euc-kr");
		
		try {
//			//sessionManager  = new QADBSessionManager();
//			//System.out.println("start");
//		
//			reqTray = getRequestTray(request);
//		
//			
//			command = new BoardCmd();
//			command.execute(reqTray, request, response);
//
//			//command.getNextPage();
//			//nextPage="/list2.jsp";	
		
			System.out.println("RequireServlet doService() start ");
			reqTray = getRequestTray(request);
			command = createCommand(reqTray.getString("cmd"));
			
			
			//System.out.println("kind:  "+sessiontray.get("kind"));
			//System.out.println("user_id:   "+sessiontray.get("user_id"));
			
			
			
			System.out.println("==========RequireServlet execute start============");
			command.execute(reqTray, request, response);
			//command.endCommand();
			nextPage = command.getNextPage();
			//command.endCommand();
			//sessionManager.initSession(request, rtnTray);
		
		} catch (Exception ex) {
			Logger.trace("RequireServlet.doService 수행 중, 일반 예외 발생", ex);
            throw new AppException("RequreServlet.doService 수행 중, 일반 예외 발생", ex);
		} finally {
			//setNoCache(request, response);
		}
		
		System.out.println("forward "+reqTray.getString("cmd"));
		
		if(reqTray.getString("cmd").equals("require_user_update_list") || reqTray.getString("cmd").equals("unix_update")){
			response.sendRedirect(command.getNextPage());
		System.out.println("forward cmd2"+reqTray.getString("cmd"));
		}else{
			forward(request, response, command.getNextPage());
			}
		}

}
