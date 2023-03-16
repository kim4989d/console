package console.common.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import console.common.cmd.BaseCommand;
import console.common.execption.AppException;
import console.common.tray.Tray;
import console.common.util.Logger;




public class QADBServlet extends BaseServlet {

	public final void doService(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException {
		Tray               reqTray        = null;
		BaseCommand        command        = null;
		String             nextPage       = null;

		try {
			reqTray = getRequestTray(request);
			command = createCommand(reqTray.getString("cmd"));
			command.execute(reqTray, request, response);
			command.endCommand();
			nextPage = command.getNextPage();

		} catch (Exception ex) {
            Logger.trace("QADBServlet.doService 수행 중, 일반 예외 발생", ex);
            throw new AppException("QADBServlet.doService 수행 중, 일반 예외 발생", ex);
		} finally {
            setNoCache(request, response);
		}
		forward(request, response, nextPage);
	}
}