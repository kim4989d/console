package application;

public class Method_3 {
	String name;
	//get값을얻는다 
	//set값을 놓는다 
	//지역변수는 값이 소멸하므로 전역변수에 값을 놓는다 
	 public void setName(String name) {
		 //지역변수와 전역변수가 같으면
		 //this.을 생략할수없다 
		 this.name=name;
	 }
	 
	 public String getName() {
		return this.name;
	}
	
	public static void main(String[] args) {

		Method_3 me=new Method_3();
		
		me.setName("아무개");
		//set 했으니 get 해야지 응?
		System.out.println(me.getName());
		
		//친구이름으로 바뀌어서 출력하시오 
		
		//package:question.qu1
//		class:Ex1_1
//		이름 나이 주소 지역변수 출력
//		이름 나이 주소 전역변수 출력
//		이름 나이 주소 get,set  출력
//		55분까지 휴식 ㅍ  
		
	}
}
