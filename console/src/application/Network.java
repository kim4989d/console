package application;
import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;

import ssh2.BaseThread;
 
public class Network {
	static InputStream in;
	static OutputStream output;
	public static void main(String[] args) throws IOException{
        //[1]���� �غ�
        int port=5003;           //��Ʈ��ȣ�� Ŭ���̾�Ʈ�� ��ġ
        ServerSocket server =new ServerSocket(port);
 
        //[2]���� ȹ��
        System.out.println("������ ������Դϴ�.");
 
        BaseThread base=new BaseThread(server);
        base.start();
        
        
        
        
        Socket socket = server.accept();   
             //[3]Socket���� ���� InputStream, OutputStream����.
        //������ ��Ʈ��ũ�� �ڼ� ����ͷ� ���
         in = socket.getInputStream();                   //Stream����
         output = socket.getOutputStream();
        
        
     //   InputStreamReader isr = new InputStreamReader(is);    //���ڴ���
     //   BufferedReader br = new BufferedReader(isr);             //���δ���
        
        
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
        
       
        
        
        //[4]������.
        //br.close();
       // print.close();
    //    socket.close();
 
    }
}