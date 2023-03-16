package ssh2;

import java.io.BufferedWriter;
import java.io.OutputStreamWriter;

public class Ssh2InputThread extends Thread{
	private Ssh2Io io;
	

public 	Ssh2InputThread(Ssh2Io io){
	this.io=io; 
	
}
	
	

public void run() {
	
	char temp=0;  
	try {
		    int ch;
		    System.out.println(".........INput Read .........."); 
			String str="";
			 OutputStreamWriter out=new OutputStreamWriter(io.getOut());
			   BufferedWriter buout=new BufferedWriter(out);
			   LimitCmd.setBool(false);
			   
			   do{
				ch=io.getIn().read();
				 if (ch<0) return;
				 System.out.print((char)ch);
				 System.out.flush();
				 io.getSocketout().write(ch);
			  }while(true);	
			
		
			
		//	String str=  String.valueOf(temp);
		//	 System.out.println(str); 
			
	} catch (Exception e) {
		 e.printStackTrace();
		  }
	
	
}
	
	


}
