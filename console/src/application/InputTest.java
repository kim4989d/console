package application;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class InputTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub


		InputStreamReader in=new InputStreamReader(System.in);
		   BufferedReader buffer=new BufferedReader(in);
		   
		   System.out.println( buffer.toString());
	
	
	}

}
