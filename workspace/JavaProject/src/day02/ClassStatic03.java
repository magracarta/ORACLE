package day02;

class MemberCall{
	int iv = 10; //인스턴스 변수
	static int sv = 20; //스태틱 변수
	int iv2 =sv; //스태틱 변수로 인스턴스변수값을 초기화 O
	//static int sv2 = iv; //인스턴스 변수로 스태틱변수 초기화 X  객체가 생성되지않아 인스턴스 변수가 존재하지않기 때문에 오류
	static int sv2 = new MemberCall().iv; //권장하진 않음
	
	void instanceMethod1(){//인스턴스 메서드
		System.out.println(iv); //인스턴스 메서드에서는 인스턴스 변수사용 O
		System.out.println(sv); //인스턴스 메서드에서는 스태틱 변수 사용 O
		instanceMethod2(); //인스턴스 메서드에서는 인스턴스 메서드 호출 O
		staticMethod2(); //인스턴스 메서드에서는 스태틱 메서드 호출 O
	}
	
	static void  staticMethod(){//스태틱 메서드
		//System.out.println(iv); //인스턴스 메서드에서는 인스턴스 변수사용 X
		System.out.println(sv); //인스턴스 메서드에서는 스태틱 변수 사용 O
		//instanceMethod2(); //인스턴스 메서드에서는 인스턴스 메서드 호출 X
		staticMethod2(); //인스턴스 메서드에서는 스태틱 메서드 호출 O
	}
	
	void instanceMethod2(){
		System.out.println("인스턴스 메서드입니다.");
	}
	static void staticMethod2(){
		System.out.println("스태틱 메서드입니다.");
	}
	
	
}

public class ClassStatic03 {

	public static void main(String[] args) {
		
		// 스테틱 멤버는 객체 생성없이 바로 사용이 가능
		MemberCall.sv = 300;
		MemberCall.staticMethod();
		
		// 인스턴스 메서드는 객체생성 후에 사용이 가능
		MemberCall mc = new MemberCall();
		mc.iv = 30;
		mc.instanceMethod1();
		
		//Integer.parseInt(null);
		//Math.random();
		//Math.sqrt(0);//제곱근
		//Math.abs(0);//절대값
		
		
		
	}

}



