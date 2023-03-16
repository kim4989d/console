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
import console.common.cmd.BaseCommand;


public class RequireAccountServlet extends BaseServlet {

	public final void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Tray               reqTray        = null;
		BaseCommand       command        = null;
		String             nextPage       = null;


		try {
		
			System.out.println("BoardServlet doService() start");
			reqTray = getRequestTray(request);
			command = createCommand(reqTray.getString("cmd"));
			
			System.out.println("execute start");
			
			command.execute(reqTray, request, response);
			
			nextPage = command.getNextPage();
		
		} catch (Exception ex) {
			Logger.trace("LoginServlet.doService 수행 중, 일반 예외 발생", ex);
            throw new AppException("LoginServlet.doService 수행 중, 일반 예외 발생", ex);
		} finally {
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
