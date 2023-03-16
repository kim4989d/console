package application;

import java.io.File;
import java.io.InputStream;
import java.net.URL;
import java.util.Properties;

import console.common.util.Config;

public class Properties_test extends Properties {

	

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String DIR_ROOT = Config.getInstance().getProperty("DIR_ROOT");
	    String DIR_HOME = Config.getInstance().getProperty("DIR_HOME");
	    String DIR_JSP  = Config.getInstance().getProperty("DIR_JSP");
	    String DIR_IMG  = Config.getInstance().getProperty("DIR_IMG");
	    String DIR_CSS  = Config.getInstance().getProperty("DIR_CSS");
	    String DIR_PHOTO  = Config.getInstance().getProperty("DIR_PHOTO");
	    String DIR_JS   = Config.getInstance().getProperty("DIR_JS");
	    String DIR_URL_CSS  = Config.getInstance().getProperty("DIR_URL_CSS");
	    String UPLOAD_PATH_ROOT = Config.getInstance().getProperty("UPLOAD_PATH_ROOT");
		
		
	    System.out.println(DIR_ROOT);
	
	}

}
