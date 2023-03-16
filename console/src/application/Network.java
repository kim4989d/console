package application;
import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;

import ssh2.BaseThread;
 
public class Network {
	static InputStream in;
	static OutputStream output;
	public static void main(String[] args) throws IOException{
        //[1]서버 준비
        int port=5003;           //포트번호는 클라이언트와 일치
        ServerSocket server =new ServerSocket(port);
 
        //[2]소켓 획득
        System.out.println("서버가 대기중입니다.");
 
        BaseThread base=new BaseThread(server);
        base.start();
        
        
        
        
        Socket socket = server.accept();   
             //[3]Socket으로 부터 InputStream, OutputStream구함.
        //서버는 네트워크로 박소 모니터로 출력
         in = socket.getInputStream();                   //Stream단위
         output = socket.getOutputStream();
        
        
     //   InputStreamReader isr = new InputStreamReader(is);    //문자단위
     //   BufferedReader br = new BufferedReader(isr);             //라인단위
        
        
      //  int read = is.read();    //System.in.read();
//        System.out.println((char)read);
 
        String line = null;
 
       // OutputStreamWriter osw =new OutputStreamWriter(output);
      //  OutputStreamWriter osw =new OutputStreamWriter(System.out);
        
       // PrintWriter pw =new PrintWriter(osw);
        (new Thread(new Runnable() {
        	public void run() {
        	  try {
        	    int ch;
        	    do {
        	     
        	    	ch=in.read();
        	    	output.write(ch);
        	    	if (ch<0) return;
        	      System.out.print((char)ch);
        	      System.out.flush();
        	    } while(true);
        	  } catch (Exception e) {
        	    
        	  }
        	}
              })).start();

              int key;
              while (true) {
        	key=System.in.read();
        	if (key==(']'-64)) break;
        	output.write(key);
             
              System.out.println(key);
              }
             // closed=true;
        
       
        
        
        //[4]마무리.
        //br.close();
       // print.close();
    //    socket.close();
 
    }
}