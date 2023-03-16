package test;

import java.io.*;
import java.util.*;

public class Settings implements SettingsSource {
	private static Settings instance;
	private Properties base = new Properties();
	private Hashtable settings = new Hashtable();
	private String baseFile;
	
	private Settings() { 
		// private constructor
	}
	
	public Settings(String baseFile) throws IOException {
		// needed???
		load(baseFile);
	}
	
	public static Settings getInstance(){
		if (instance == null){
			instance = new Settings();

			try {
				instance.load("c:/log/config.properties");
System.out.println("============================= Settings Reloaded !!! ===========================");
			} catch ( Exception e ) 
			{
				System.out.println("Settings==== Exception ["+e.toString()+"]"); 
			}


		}
		return instance;
	}

	public synchronized void load (String file) throws IOException {

                
		// load as base properties
		// refresh 
		baseFile = file;
		settings = new Hashtable(); // reset
		File propFile=new File(file); 
		base.load(new FileInputStream(propFile));
	}
	
	public synchronized void save (String key) throws IOException {
		SettingsSource temp = (SettingsSource)settings.get(key);
		if (temp!=null){
			temp.save();
		}
	}
	
	public synchronized void save () throws IOException {
		File propFile=new File(baseFile); 
		FileOutputStream fostream = new FileOutputStream(propFile);
		base.store(fostream,"");
		// save DataSources
		Enumeration enums = settings.keys();
		while (enums.hasMoreElements()){
			String key = (String)enums.nextElement();
			save(key);
		}	
		fostream.close();
	}

	public String getSetting(String key) 
	{
		String index= "";
		if ("".equals(key))
		{
			return "";
		}		
		return (base.getProperty(key));
	}
	
	public static String get(String key){
		// convenience method as shortcut for:
		return getInstance().getSetting(key);
	}
	
	public void setSetting(String key, String value) 
	{
		base.setProperty(key, value);
	}
	
	public Enumeration getPropertyNames(){
		return base.propertyNames();
	}
	
	public int size() {
		if (settings != null)
			return settings.size();
		else return 0;
	}

	public static void main(String[] args){
		// testing main
		try{
			System.out.println(" ============== Settings Start !!!! ======================");
		//getInstance().load(args[0]);
		 getInstance().load("/data2/DefaultWebApp/WEB-INF/classes/redfoxi/common/RedfoxiConfig.properties");
		}catch (IOException e){}
	}
		
}
