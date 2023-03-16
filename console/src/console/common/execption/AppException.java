package console.common.execption;

import console.common.util.Logger;;

public class AppException extends RuntimeException {
	private String    message   = null;
    private Throwable throwable = null;

    public AppException(String msgObj) {
    	this(msgObj, (Throwable) null);
    }

    public AppException(String msgObj, Throwable throwableObj) {
        message = msgObj;
    	throwable = throwableObj;
       	writeLog();
    }

    private void writeLog() {
    	Logger.error("[x.exception.AppException]");
    	Logger.trace("AppException.message = " + message, throwable);
    }
}
