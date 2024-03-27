package application;

public class Contr_2 {
//기본:아귀먼트(인자)가없는생성자 
//
	String name;
	int age;
	String address;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Contr_2() {
		// TODO Auto-generated constructor stub
		System.out.println("기본생성자는생략이 가능");
	}

	public Contr_2(String name, int age, String address) {
		// TODO Auto-generated constructor stub
		this.name = name;
		this.address = address;
		this.age = age;

	}

	public static void main(String[] args) {
		Contr_2 con = new Contr_2();
		con.setName("아무개");
		System.out.println(con.getName());

		Contr_2 con2 = new Contr_2();
		con2.setName("아무개2");
		System.out.println(con2.getName());
		
		Contr_2 con4=new Contr_2("이름", 10, "미국");
		
		System.out.println(con4.getName());
		
		

	}
}
