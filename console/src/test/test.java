package test;

public class test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		AppLog app=null;
		try{
	
			String errMsg = "[exception] test error log write";
			 app=new AppLog();
			app.ErrorLog("class",errMsg);
			//app.SevenLog("startclass","ok");
}catch(Exception e){
	
	
}

	
	
	
	}

}
