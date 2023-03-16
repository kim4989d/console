package ssh2;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import ch.ethz.ssh2.Connection;
import ch.ethz.ssh2.Session;
import ch.ethz.ssh2.StreamGobbler;

public class MiddleServerTerminal {
	static 	char temp;
	static InputStream in;
	static OutputStream output;
	static OutputStream socketout;
	static InputStream socketin;
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try
		{
		
		//[1]서버 준비
        int port=9001;           //포트번호는 클라이언트와 일치
        ServerSocket server =new ServerSocket(port);
 
        //[2]소켓 획득
        System.out.println("서버가 대기중입니다.");
 
        BaseThread base=new BaseThread(server);
        base.start();	
        
        Socket socket = server.accept();   
        System.out.println("socket connect "+socket.getInetAddress());
        
        
        
        
        socketin = socket.getInputStream();                   //Stream단위
        socketout=socket.getOutputStream();
        
        
        //InputStreamReader isr = new InputStreamReader(is);    //문자단위
        //BufferedReader br = new BufferedReader(isr);             //라인단위
        
        
       // int read = is.read();    //System.in.read();
//        System.out.println((char)read);
 
        String line = null;
 
      //  OutputStreamWriter osw =new OutputStreamWriter(System.out);
      //  PrintWriter pw =new PrintWriter(osw);
      
        System.out.print("전송받은 글 : " );
     //   System.out.print( br.readLine());
       
       String hostname = "172.18.185.196";
		String username = "suser";
		String password = "mccenter!05";

/*	
		String hostname = "192.168.0.30";
		String username = "admin";
		String password = "1234";
      
  */      
        
        
   
		
		
		/* Create a connection instance */

			Connection conn = new Connection(hostname);

			/* Now connect */

			conn.connect();

			/* Authenticate */

			boolean isAuthenticated = conn.authenticateWithPassword(username, password);

			if (isAuthenticated == false)
				throw new IOException("Authentication failed.");

			
			System.out.println("login sucess...");
			
			
			/* Create a session */

			Session sess = conn.openSession();
			int x_width = 90;
			int y_width = 30;

			sess.requestPTY("dumb", x_width, y_width, 0, 0, null);
			sess.startShell();
			
			
			 in = sess.getStdout();
			 output = sess.getStdin();
				
			
			
			
			
			//InputStream stdout = new StreamGobbler(sess.getStdout());
			//InputStream stderr = new StreamGobbler(sess.getStderr());
	
			//BufferedReader stdoutReader = new BufferedReader(new InputStreamReader(in));
			//BufferedReader stderrReader = new BufferedReader(new InputStreamReader(stderr));
			
			System.out.println("Here is the output from stdout:");
			Ssh2Io io=new Ssh2Io();
			
			io.setIn(in);
			io.setOut(output);
			
			
			io.setSocketin(socketin);
			io.setSocketout(socketout);
				
			Ssh2InputThread th=new Ssh2InputThread(io);
			th.start();
			
			Ssh2OutputThread output=new Ssh2OutputThread(io);
			output.start();
			if(!server.isBound()){	      
			System.out.println("close()");
			sess.close();
			io.InClose();
			io.outClose();
			io.SocketinClose();
			io.SocketinClose();
			base.SocketClose();
			}
			
			
			
			
			
			
			
			/* Close the connection */

		//	conn.close();
				      //[4]마무리.
				 //       br.close();
				    //    pw.close();
				    //    socket.close();
		
		
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.exit(2);
		}
		
	}
}	
		
