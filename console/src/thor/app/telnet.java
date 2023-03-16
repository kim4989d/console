package thor.app;

import java.net.*;
import java.io.*;

import ssh2.BaseThread;
import thor.net.*;
import java.net.ServerSocket;

class SimpleTelnetTerminalHandler extends DefaultTelnetTerminalHandler
    implements TelnetConstants {
  public void LineFeed() {
    System.out.print('\n');
    System.out.flush();
  }
  public void CarriageReturn() {
    System.out.print('\r');
    System.out.flush();
  }
  public void BackSpace() {
    System.out.print((char)BS);
    System.out.flush();
  }
  public void HorizontalTab() {
    System.out.print((char)HT);
    System.out.flush();
  }
}

/** telnet is the simplest telnet you can write.
 *  It is intended to show how to use the library
 *  for connecting to another host. It will expose
 *  your password though.
 *
 *  <pre>
 *  use:
 *    java thor.app.telnet myhost [myport]
 *  </pre>
 *
 *
 *  -- Daniel Kristjansson   May 27, 2000
 *  <i>The <a href=http://www.gnu.org/copyleft/lgpl.html>LGPL</a>
 *  applies to this software.<br>
 *  Unless otherwise stated the software is
 *  Copyright 1996,2000 Daniel Kristjansson</i>
 */

public class telnet{
	static volatile boolean closed=false;
  
	static InputStream in;
	static OutputStream out;
  
  public static void main(String[] args) {
    try {
   	//[1]���� �غ�
        int serverPort=5001;           //��Ʈ��ȣ�� Ŭ���̾�Ʈ�� ��ġ
        ServerSocket server =new ServerSocket(serverPort);
 
        //[2]���� ȹ��
        System.out.println("������ ������Դϴ�.");
 
//        BaseThread base=new BaseThread(server);
 //       base.start();
        
        Socket socket = server.accept();
        
 
        //[3]Socket���� ���� InputStream, OutputStream����.
        //������ ��Ʈ��ũ�� �ڼ� ����ͷ� ���
        InputStream is = socket.getInputStream();                //Stream����
        OutputStream output = socket.getOutputStream();
        
        
        
        InputStreamReader isr = new InputStreamReader(is);    	 //���ڴ���
        BufferedReader br = new BufferedReader(isr);             //���δ���
        
        
//        int read = is.read();    //System.in.read();
        int read = is.read();    //System.in.read();

        System.out.println((char)read);
 
//        String line = null;
 
//        OutputStreamWriter osw =new OutputStreamWriter(System.out);
//        PrintWriter pw =new PrintWriter(osw);
      
        System.out.print("���۹��� �� : " );
        System.out.print( br.readLine());

        
        /********************************************************/
 
       
    String host = (args.length>0)?args[0]:"172.18.165.242";
    int port = (args.length>1)?Integer.parseInt(args[1]):23;	
    URL url=new URL("telnet", host, port, "23",
		      new thor.net.URLStreamHandler());
      URLConnection urlConnection=url.openConnection();
      urlConnection.connect();
      if (urlConnection instanceof TelnetURLConnection) {
	((TelnetURLConnection)urlConnection).
	  setTelnetTerminalHandler(new SimpleTelnetTerminalHandler());
      }
      OutputStream out=urlConnection.getOutputStream();
      final InputStream in=urlConnection.getInputStream();
      (new Thread(new Runnable() {
	public void run() {
	  try {
	    int ch;
	    do {
	      ch=in.read();
	      if (ch<0) return;
	      System.out.print((char)ch);
	      System.out.flush();
	    } while(true);
	  } catch (Exception e) {
	    if (!closed) e.printStackTrace();
	  }
	}
      })).start();

      int key;
      while (true) {
	key=System.in.read();
	if (key==(']'-64)) break;
		out.write(key);
     
      System.out.println(key);
      }
      closed=true;
      
      while (true) {
    		key=System.in.read();
    		if (key==(']'-64)) break;
    			output.write(key);
    	     
    	      System.out.println(key);
    	      }
    	      closed=true;
    	      
      
      
      ((TelnetURLConnection)urlConnection).disconnect();
    } catch (IOException e) {e.printStackTrace();}		
  }
}

