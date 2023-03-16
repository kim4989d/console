package console.common.session;


import javax.servlet.http.HttpServletRequest;

import console.common.execption.AppException;
import console.common.tray.Tray;




public abstract class SessionManager {
	private static final String DEFAULT_SESSION_MANAGER = 
		"qadb.x.session.QADBSessionManager";
	
	public static SessionManager getInstance() {
		return getInstance(DEFAULT_SESSION_MANAGER);
	}
	
	public static SessionManager getInstance(String managerName) {
		try {
			return (SessionManager) Class.forName(managerName).newInstance();
		} catch (Exception ex) {
			throw new AppException("SessionManager.getInstance()에서 예외 발생", ex);
		}
	}
	
	abstract public Tray getUserInfo(HttpServletRequest request);
}
