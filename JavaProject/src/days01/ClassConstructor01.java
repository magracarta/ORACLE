package days01;

//생성자(Constructor)
//클래스의 객체가 생성될때, 멤버필드의 초기화 등의 목적으로 사용되는 메서드
//new에 각각의 객체가 생성될때 서로, 다른 메모리를 할당해서 서로 겹치지않게하는 기능도 포함된다.

//생성자의 특징
//1. 멤버메서드이다 (특별한 멤버메서드 - 처음 객체생성시만 호출, 중간에 호출되지 않는다.)
//2. 클래스의 이름과 동일한 이름을 갖는 메서드이다.
//3. 리턴값이 없는 메서드이다.

class Aclass{
	private int age;
	// 1. 생성자는 별도로 정의하지 않아도 디폴트 생성자(매개변수가 없는)가 존재한다.
	// 2. 컴파일러는 클래스안에 생성자 정의 내역이 없다면, 자동으로 디폴트 생성자를 만든다.
	
	
	// 생성자가 하는 일 : 메모리를 확보하고 확보된 메모리 주소를 생성자 보이지 않는 메서드의 리턴값으로 반환하는 일
	// 생성자 본연의 일이외에 다른 명령을 같이 실행하고자 한다면 숨어있는 생성자를 꺼내서 따로 정의한다.
	Aclass(){
		age = 100;
		//생성자의 원래의 일을하고 멤버변수에 100도 초기화한다.
		System.out.println("객체가 생성되었습니다. Aclass의 생성자가 호출되었습니다.");
	}


	public int getAge() { return age; }


	public void setAge(int age) { this.age = age; }
	
	
	
}

public class ClassConstructor01 {
	public static void main(String[] args) {
		Aclass a1 = new Aclass(); //Aclass() :  생성자를 호출
		
	}
}
