package application;

public class Contr_1 {

	String name;
	int age;
	String address;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public static void main(String[] args) {
		
		Contr_1 con=new Contr_1();
		con.setName("아무개");
		con.setAddress("미국");
		con.setAge(10);
		System.out.println(con.getName());
		System.out.println(con.getAge());
		System.out.println(con.getAddress());
		
		
		
		
		
		
		
		
	}
}
