package application;

public class Localvar_1 {
	String name;
	
	
	public static void main(String[] args) {

		//지역변수는 해당하는괄호가 닫히면 소멸한다 
		//그러므로 무슨변수가 필요하다??
		//전역변수 
		String name="아무개";
		System.out.println(name);
		
		//세종교육 지훈이 기숙사 현재위치 찾기 
		//객체지향은 큰데에서 작은데로간다 
		//하위에있다는것을 자바에서는 모 .으로 표시한다 
		//작은데서 큰데로 갈수있다 ?
		
		
		//현재여기서 제일큰데는 class이다 
		//class.name
		//변수는오른쪽에서 왼쪽으로 값이이동한다
		//new 객체생성(타입생성)->무슨커피인지 생성(아메리카노,초코라떼)
		Localvar_1 local=new  Localvar_1();
		local.name="전역이름";
		
		
		System.out.println(local.name);
		//이런식으로 값을 저장하고 유지한다 (지역변수는값이 없어지므로)
		//나이 지역변수만들고 출력 하고 전역변수 만들고 출력 
		
	}
}
