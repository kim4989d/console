package console.common.cmd;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import console.common.tray.Tray;




public interface Command {
	String execute(Tray reqTray, HttpServletRequest request, HttpServletResponse response);
}
