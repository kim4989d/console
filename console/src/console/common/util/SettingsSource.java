package console.common.util;

import java.io.*;
import java.util.*;

public interface SettingsSource{
  
  public void load (String param) throws IOException ;	
  public void save () throws IOException ;

  public String getSetting(String key);

  public void setSetting(String key,String value) ; 
  
	public Enumeration getPropertyNames();
	
  public int size();

}
