package ssh2;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;


public class Ssh2Io {
	private  static InputStream in;
	private  static InputStream socketin;
	
	private  static OutputStream out;
	private  static OutputStream socketout;
	
	
	public InputStream getIn() {
		return this.in;
	}
	public void setIn(InputStream in) {
		this.in = in;
	}
	public OutputStream getOut() {
		return this.out;
	}
	public void setOut(OutputStream out) {
		this.out = out;
	}
	public static InputStream getSocketin() {
		return socketin;
	}
	public static void setSocketin(InputStream socketin) {
		Ssh2Io.socketin = socketin;
	}
	public static OutputStream getSocketout() {
		return socketout;
	}
	public static void setSocketout(OutputStream socketout) {
		Ssh2Io.socketout = socketout;
	}

	
	public void InClose(){
		try{
			in.close();
		}catch(Exception e){e.printStackTrace();}
	}
	
	public void SocketinClose(){
		try{
			socketin.close();
		}catch(Exception e){e.printStackTrace();}
	}
	
	
	public void outClose(){
		try{
			out.close();
		}catch(Exception e){e.printStackTrace();}
	}
	
	public void socketoutClose(){
		try{
			socketout.close();
		}catch(Exception e){e.printStackTrace();}
	}
	
	
	
	
	
	
	
	

}
