package console.common.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import console.common.execption.AppException;
import console.common.tray.Tray;
import console.common.util.Logger;
import console.common.cmd.BaseCommand;
import console.common.tray.NomalTray;

public class AdminServlet extends BaseServlet {

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
			
			System.out.println("AdminServlet doService() start ");
			reqTray = getRequestTray(request);
			command = createCommand(reqTray.getString("cmd"));
			
			System.out.println("==========AdminServlet execute start============");

			command.execute(reqTray, request, response);
			
			nextPage = command.getNextPage();
		
		} catch (Exception ex) {
			Logger.trace("AdminreServlet.doService 수행 중, 일반 예외 발생", ex);
            throw new AppException("AdminreServlet.doService 수행 중, 일반 예외 발생", ex);
		} finally {
			//setNoCache(request, response);
		}
		
		System.out.println("forward "+reqTray.getString("cmd"));
		
		if(reqTray.getString("cmd").equals("write")){
			
			response.sendRedirect(command.getNextPage());
		System.out.println("forward cmd2"+reqTray.getString("cmd"));
		}else{
			forward(request, response, command.getNextPage());
			}
		}

}
