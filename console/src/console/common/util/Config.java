package console.common.util;

//import org.apache.log4j.Logger;

import java.util.Properties;
import java.io.InputStream;
import java.io.File;
import java.net.URL;

public class Config extends Properties {
//    private static Logger logger = LoggerFactory.getRootLogger();

    //EP Configuration File
    private static final String PROPERTY_FILE = "hddms.properties";

    //SQL Configuration
    public static final String VELOCITY_FILE_RESOURCE_LOADER_PATH = "VELOCITY_FILE_RESOURCE_LOADER_PATH";
    public static final String VELOCITY_INPUT_ENCODING = "VELOCITY_INPUT_ENCODING";

    //ConnectionPool
    public static final String ORACLE_POOL = "ORACLE_POOL";

    // URL, DIR 정보
    public static final String DIR_ROOT    = "DIR_ROOT";  // hddms root
    public static final String DIR_HOME    = "DIR_HOME";  // home directory
    public static final String DIR_JSP     = "DIR_JSP";  // jsp directory
    public static final String DIR_IMG     = "DIR_IMG";  // image directory
    public static final String DIR_CSS     = "DIR_CSS";  // css directory
    public static final String DIR_JS      = "DIR_JS";  // js directory
    public static final String DIR_URL_CSS = "DIR_URL_CSS";  // Excel 변환을 위한 css url

    // List 페이지 정보
    public static final String DISP_DATA_IN_PAGE      = "DISP_DATA_IN_PAGE";       // 출력물 갯수
    public static final String DISP_PAGE_IN_PAGEGROUP = "DISP_PAGE_IN_PAGEGROUP";  // 페이지 갯수

    // File Download Encode Type
    public static final String FILENAME_ENCODE = "FILENAME_ENCODE";             //download

    // File Upload Root
    public static final String UPLOAD_PATH_ROOT = "UPLOAD_PATH_ROOT";  // Upload path root

    //PAGE
    public static final String HDDMS_LOGIN_JSP = "HDDMS_LOGIN_JSP";  // LOGIN Page URL
    public static final String HDDMS_NOAUTH_JSP = "HDDMS_NOAUTH_JSP";  // 권한없음 Page URL

    private static Config instance;
    private static long lastModifyTime;


    private Config() {
        super();

        try {
            InputStream in = getClass().getClassLoader().getResourceAsStream(PROPERTY_FILE);

            load(in);

        } catch(Exception e){
            //logger.error("Config Load Fail!!");
        }
    }

    public static Config getInstance() {
        URL path = Config.class.getClassLoader().getResource(PROPERTY_FILE);
        System.out.println("url path -----------------"   +path.getPath());
        
        File hddmsProperties = new File(path.getPath());
        long modifyTime = hddmsProperties.lastModified();

        if (lastModifyTime != modifyTime) {
            instance = null;
            lastModifyTime = modifyTime;
        }

        if (instance == null) {
            synchronized(Config.class) {
                instance = new Config();
            }
        }
        return instance;
    }

}
