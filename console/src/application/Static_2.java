package application;

public class Static_2 {
	public  int init=0;
	
	public int getInit() {
		return init;
	}
	public Static_2() {
		// TODO Auto-generated constructor stub
		++init;
	}
	
	public static void main(String[] args) {
		
		for(int i=1;i<=10;i++) {
			Static_2 stat=	new Static_2();
			System.out.println(stat.getInit());
		}
		
	}
	
}
