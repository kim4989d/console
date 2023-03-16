package application;

import java.awt.datatransfer.Clipboard;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.util.Properties;

import de.mud.jta.Common;
import de.mud.jta.Main;
import de.mud.jta.Plugin;
import de.mud.jta.event.SocketRequest;

public class Telnet {
	private final static int debug = 0;

	  private final static boolean personalJava = false;

	  /** holds the last focussed plugin */
	  private static Plugin focussedPlugin;

	  /** holds the system clipboard or our own */
	  private static Clipboard clipboard;

	  private static String host, port;
	/**
	 * @param args
	 */
	public static void main(String[] args) {

		
		final Properties options = new Properties();
	    try {
	      options.load(Main.class.getResourceAsStream("/de/mud/jta/default.conf"));
	    } catch (IOException e) {
	      System.err.println("jta: cannot load default.conf");
	    }
	    String error = parseOptions(options, args);
	    if (error != null) {
	      System.err.println(error);
	      System.err.println("usage: de.mud.jta.Main [-plugins pluginlist] "
	                         + "[-addplugin plugin] "
	                         + "[-config url_or_file] "
	                         + "[-term id] [host [port]]");
	      System.exit(0);
	    }

	    String cfg = options.getProperty("Main.config");
	    if (cfg != null)
	      try {
	        options.load(new URL(cfg).openStream());
	      } catch (IOException e) {
	        try {
	          options.load(new FileInputStream(cfg));
	        } catch (Exception fe) {
	          System.err.println("jta: cannot load " + cfg);
	        }
	      }

	    host = options.getProperty("Socket.host");
	    port = options.getProperty("Socket.port");
		
		
		
		//		 configure the application and load all plugins
	    final Common setup = new Common(options);
	    System.out.println("host: "+host+"port: "+port);
        
	    host="172.18.165.242";
	    port="23";
	    setup.broadcast(new SocketRequest());
        setup.broadcast(new SocketRequest(host, Integer.parseInt(port)));
		
		
	}

	 /**
	   * Parse the command line argumens and override any standard options
	   * with the new values if applicable.
	   * <P><SMALL>
	   * This method did not work with jdk 1.1.x as the setProperty()
	   * method is not available. So it uses now the put() method from
	   * Hashtable instead.
	   * </SMALL>
	   * @param options the original options
	   * @param args the command line parameters
	   * @return a possible error message if problems occur
	   */
	  private static String parseOptions(Properties options, String args[]) {
	    boolean host = false, port = false;
	    for (int n = 0; n < args.length; n++) {
	      if (args[n].equals("-config"))
	        if (!args[n + 1].startsWith("-"))
	          options.put("Main.config", args[++n]);
	        else
	          return "missing parameter for -config";
	      else if (args[n].equals("-plugins"))
	        if (!args[n + 1].startsWith("-"))
	          options.put("plugins", args[++n]);
	        else
	          return "missing parameter for -plugins";
	      else if (args[n].equals("-addplugin"))
	        if (!args[n + 1].startsWith("-"))
	          options.put("plugins", args[++n] + "," + options.get("plugins"));
	        else
	          return "missing parameter for -addplugin";
	      else if (args[n].equals("-term"))
	        if (!args[n + 1].startsWith("-"))
	          options.put("Terminal.id", args[++n]);
	        else
	          return "missing parameter for -term";
	      else if (!host) {
	        options.put("Socket.host", args[n]);
	        host = true;
	      } else if (host && !port) {
	        options.put("Socket.port", args[n]);
	        port = true;
	      } else
	        return "unknown parameter '" + args[n] + "'";
	    }
	    return null;
	  }



}
