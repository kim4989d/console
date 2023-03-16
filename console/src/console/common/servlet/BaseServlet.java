package console.common.servlet;


import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import console.common.cmd.BaseCommand;
import console.common.cmd.CommandManager;
import console.common.cmd.ErrorCommand;
import console.common.execption.AppException;
import console.common.tray.RequestTrayFactory;
import console.common.tray.Tray;
import console.common.tray.TrayFactory;
import console.common.util.Logger;



public class BaseServlet extends HttpServlet {
	
	private static final String   COMMAND_MANAGER = "COMMAND_MAPPING";

	public void init() throws ServletException {
		System.out.println("BaseServlet init() start");
		CommandManager commandManager = new CommandManager();
		
		getServletContext().setAttribute(BaseServlet.COMMAND_MANAGER, commandManager.getCommandMapping());
	
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		
		System.out.println("get");
		doService(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		System.out.println("get");
		doService(request, response);
	}
	
	public void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doservice");
	}

	protected Tray getRequestTray(HttpServletRequest request) {
		TrayFactory requestFactory = null;
		Tray        reqTray        = null;

		requestFactory  = new RequestTrayFactory();
		reqTray         = requestFactory.getTray(request);
		
		
		//System.out.println("reqTray:"+reqTray.);
		request.setAttribute("reqTray", reqTray);
		
		Logger.debug("\n======================================\n");
		Logger.debug("\nRemoteAddr:" + request.getRemoteAddr() + '\n');
		Logger.debug(reqTray.toString());

		return reqTray;
	}
    
	protected BaseCommand createCommand(String commandName) throws AppException {
		BaseCommand   command        = null;
		ErrorCommand  errorCommand   = null;
		String        exceptionType  = null;
		String        classFullPath  = null;
		System.out.println("getCommand start");
		classFullPath = getCommand(commandName);
		System.out.println("classFullPath instance name:  "+classFullPath);
		if (classFullPath != null && classFullPath.length() > 0) {
			System.out.println("classFullPath "+classFullPath);
			try {
				command = (BaseCommand) Class.forName(classFullPath).newInstance();
				System.out.println("command "+command.toString());
				if(command==null)
				System.out.println("null");
			} catch (ClassNotFoundException ex) {
				command = null;
				exceptionType = "ClassNotFoundException";
			} catch (IllegalAccessException ex) {
				command = null;
				exceptionType = "IllegalAccessException";
			} catch (InstantiationException ex) {
				command = null;
				exceptionType = "InstantiationException";
			}
		}

		if (command == null) {
			errorCommand = new ErrorCommand();
			errorCommand.setException(commandName, exceptionType, classFullPath);
			command = errorCommand;
		}
		
		return command;
	}
	
	private String getCommand(String commandName) {
		Map    map     = null;
		String command = null;
		
		map = (Map)getServletContext().getAttribute(BaseServlet.COMMAND_MANAGER);
		command = (String)map.get(commandName);

		return command;
	}

	protected void forward(HttpServletRequest request, HttpServletResponse response, String nextPage) 
	throws ServletException, IOException {
		RequestDispatcher dispatcher = null;
		dispatcher = getServletContext().getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}

	protected void setNoCache(HttpServletRequest request, HttpServletResponse response) {
		if ( request.getProtocol().compareTo("HTTP/1.0") == 0 ) {
			response.setHeader("Pragma", "no-cache");
		}
		else if ( request.getProtocol().compareTo("HTTP/1.1") == 0 ) {
			response.setHeader("Cache-Control", "no-cache");
		}
		response.setDateHeader("Expires", 0);
	}
}
