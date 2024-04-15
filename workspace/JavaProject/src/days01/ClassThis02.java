package days01;

//this 의 용도 #2
//: 오버로딩 되어 있는 생성자들 간 서로를 재호출 하기위한 이름으로 사용.
//: 호출하는 형태(매개변수의 형태)데로 생성자가 오버라이딩 되어 있어야 사용가능

class Dclass{
	private int num1;
	private int num2;
	private int num3;
	
	Dclass(int n){
		this.num1 = n;
	}
	
	Dclass(int n1, int n2){
		//num1 = n1;
		//Dclass(n1); //생성자가 호출되므로 객체가 더 생길수도 있다. 현재 위치는 생성자를 호출할 수 있는 위치 X
		this(n1); //객체생성은 안하고 형제 생성자 코드만 실행하겠다는 호출
		this.num1 = n2;
	}
	
	Dclass(int n1, int n2, int n3){
		this(n1, n2);
		this.num3 = n3;
	}

}

public class ClassThis02 {

	public static void main(String[] args) {
		Dclass d1  =  new Dclass(10);
		Dclass d2  =  new Dclass(10, 20, 30);
	}

}
