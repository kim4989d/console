package application;

import java.util.ArrayList;

public class ArrayList_1 extends Object {

	String name;
	int age;
	String phone;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ArrayList_1(String name, int age, String phone) {
		// TODO Auto-generated constructor stub
		this.age = age;
		this.name = name;
		this.phone = phone;
	}

	public static void main(String[] args) {

		// java.util.ArrayList
		ArrayList list = new ArrayList();
		// index:0부터 시작 0부터 값을얻는다
		// add,put,set->값을놓는다
		// Object :최종부모 (root)맨꼭대기 부모
		// 모든 부모는 모든자식을 포함할수있다 (class)
		// Object 는모든타입을 받을수있다 (포함하고있다)
		list.add("1");
		list.add(2);
		list.add(new ArrayList_1("아무개", 20, "하와이"));

		System.out.println((String) list.get(0));
		int intvalue = (Integer) list.get(1);

//		System.out.println(list.get(1)+1); 
		System.out.println(intvalue + 1);

		ArrayList_1 array = (ArrayList_1) list.get(2);
//		Object ob=list.get(2);
		
		System.out.println(array.getName());	

	}
}
