package application;

public class Switch_1 {

	public static void main(String[] args) {
		int choice = 2;
//		break :해당하는 괄호문을 탈출한다 

		switch (choice) {
		case 1:
			System.out.println(1);

		case 2:
			System.out.println(2);
			break;

		default:
			System.out.println("etc");
			break;
		}
	}
}
