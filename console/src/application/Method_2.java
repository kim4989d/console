package application;

public class Method_2 {

	// 전역변수는 움직일수없다
	// 모든 움직이는건 동사이다
	// 메소드는 모두 동사이다
	// 메소드는 반드시 괄호가 있다
	// 변수는 괄호가 없다
	// 변수는 한타입만 받는다
	// get:얻는다
	// set:설정,삽입
	// list:출력
	// put,set:삽입,설정
	// index:무저건 0부터 시작
	String name = "아무개";

	public String getName() {

		return name;
	}

	public static void main(String[] args) {

		Method_2 me=new Method_2();
		me.getName();
		//말을할수있게하는 출력메소드 syso
		System.out.println(me.getName());
//	나이 주소 출력 get메소드 
	}
}
