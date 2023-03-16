//=======================================================================
//�ý��۱��� : CONSOLE
//����  ȯ��  : TOMCAT, MySql, JAVA
//���α׷��� : 
//��      ��    : �ý��� ���� 
//Ư��  ����  :  
//��	 ��  ��   : �� �� �� 
//��         ¥  : 2009-02-07
//======================================================================

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
//===========================================================================
//									��� ��� ��Ȳ 
//===========================================================================

public class ServerServlet extends BaseServlet {

	public final void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Tray               reqTray        = null;
		ResultSetTray      rtnTray        = null;
		BaseCommand       command        = null;
		String		       loginRs        = null;
		String             nextPage       = null;
		QADBSessionManager sessionManager = null;

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
		
			System.out.println("BoardServlet doService() start");
			
			reqTray = getRequestTray(request);
			command = createCommand(reqTray.getString("cmd"));
			
			System.out.println("execute start");
			
			command.execute(reqTray, request, response);
			//command.endCommand();
			nextPage = command.getNextPage();
			//command.endCommand();
			//sessionManager.initSession(request, rtnTray);
		
		} catch (Exception ex) {
			Logger.trace("LoginServlet.doService ���� ��, �Ϲ� ���� �߻�", ex);
            throw new AppException("LoginServlet.doService ���� ��, �Ϲ� ���� �߻�", ex);
		} finally {

		}
		System.out.println("forward "+reqTray.getString("cmd"));
		
		
		//	server_editIns
		//  ������Ʈ �κ� 
		if(reqTray.getString("cmd").equals("server_editIns")){
			
			response.sendRedirect(command.getNextPage());
		System.out.println("forward cmd2"+reqTray.getString("cmd"));
		}else{
			
			forward(request, response, command.getNextPage());
			
		}
		}



}
