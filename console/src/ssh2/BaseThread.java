package ssh2;

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;

public class BaseThread extends Thread {

	ServerSocket socket=null;
	
	public BaseThread(ServerSocket socket){
		this.socket=socket;
	}
	
	
	public void run() {
	try{
		while(true){	
			this.socket.accept();
		}
	
	}catch(Exception e){e.printStackTrace();}	
		
	}


	public Socket getAccept()throws Exception{
		return this.socket.accept();
		
		
	}

	
	public void SocketClose()throws Exception{
		this.socket.close();
	}
	

}
