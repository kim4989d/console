package ssh2;

public class LimitCmd {

static	boolean bool=false;

	public static boolean KeyWord(String choice){
		System.out.println("key word start...........................");
		String str="";
		boolean boochoice=false;
		if(choice.trim().equals("dir")){
			str="dir limit keyword!!";
			System.out.println(str);
			boochoice=true;
			setBool(boochoice);
		}else if(choice.trim().equals("ipconfig"))
		{	str="ipconfig limit keyword!!";
			System.out.println(str);	
			boochoice=true;
			setBool(boochoice);
		}
	//	System.out.println("ipconfig limit keyword!!");
	//	System.out.println("nslookup limit keyword!!");
			
		
		
		return bool;
	}

	public static boolean isBool() {
		return bool;
	}

	public static void setBool(boolean bool) {
		LimitCmd.bool = bool;
	}






}
