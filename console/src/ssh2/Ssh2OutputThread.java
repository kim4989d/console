package ssh2;


import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.OutputStreamWriter;
import java.io.BufferedWriter;



public class Ssh2OutputThread extends Thread{

	private Ssh2Io io;
	
public Ssh2OutputThread(Ssh2Io io){
	
	this.io=io; 
}
	
	

public void run() {
	char temp=0;  
	try {
		   int key;
		   String str="";
		
		//   InputStreamReader in=new InputStreamReader(io.getSocketin());
		 //  BufferedReader buffer=new BufferedReader(in);
		   //System.out.println("buffer : "+buffer.readLine());
		  
		   
		   OutputStreamWriter out=new OutputStreamWriter(io.getOut());
		   BufferedWriter buout=new BufferedWriter(out);
		   
		   
		
		   while (true) {
				//System.in.read();
				key=io.getSocketin().read();
				
					if(key==-1) break;
					if(key !=13){
						io.getOut().write(key);
					}
				
				
			}
			 
		    
			
			
			
		//	String str=  String.valueOf(temp);
		//	 System.out.println(str); 
			
	} catch (Exception e) {
		 e.printStackTrace();
		  }
	

}
	
	
}
