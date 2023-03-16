package console.common.util;

public class Logger {
	
	public static void logger(String msg){
		System.out.println(msg);
	}

	public static void debug(String msg){
		System.out.println(msg);
	}
	
	public static void error(String msg){
		System.out.println(msg);
	}

	public static void trace(String msg, Throwable throwable){
		System.out.println(msg);
		if (throwable != null ) {
			throwable.printStackTrace();
		}
	}

}
