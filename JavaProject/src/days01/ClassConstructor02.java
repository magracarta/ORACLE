package days01;

class Bclass{
	private int age;
	Bclass(){
		age = 10;	
	}
	
	Bclass(int age){
		this.age = age;
	}
	// 매개변수가 있는 생성자를 새로 정의하면, 안보이던 디폴트 생성자가 매개변수가 있는 생성자로 대체된다.
	// 디폴트 생성자는 지워지는 샘
	// 둘을 모두 사용하려면 디폴트 생성자도 따로 기술해주어야한다.
	
}

public class ClassConstructor02 {

	public static void main(String[] args) {
		Bclass b =new Bclass(); // 숨어있는 디폴트 생성자를 호출한다.
		
		Bclass c = new Bclass(20);
		Bclass d = new Bclass(30);
		
		
		
	}

}
