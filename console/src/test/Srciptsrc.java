package test;

public class Srciptsrc {

	public String src(){
		
		String src[]={"/vaatz/src/vsim/CInet/hmc/kr/Basic/js/left.js","/vaatz/src/vsim/CInet/hmc/kr/Basic/js/top.js"};
		String javascript="<script src='"+src[0]+"'></script>";
		javascript+="<script src='"+src[1]+"'></script>";
		
	
		
		return javascript;	
	}
	
	
}
