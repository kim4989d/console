package application;


import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.DataInputStream;
import java.io.InputStreamReader;

public class IOTest {

	/**
	 * @param args
	 */
	public static void main(String[] args)throws Exception {
		// TODO Auto-generated method stub

		InputStream in=System.in;
		
		InputStreamReader input=new InputStreamReader(in);
		
		int c=input.read();
		String str="";
		Character chart=null;
		String temp="";
		int i=0;
		while(c !=-1){
				
			++i;
			System.out.print((char)c);
			System.out.print("  i: "+i);		
			
			c=input.read();
				
		
		}
	
	}	
}
