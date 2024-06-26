package day02;

class Student {
	int bunho;
	String name;
	int [] scores;
	static int cnt = 1;
	//항상 클래스관련 불변의 값을 갖고 필요할 때 불러쓸 값이 저장되기도 한다.
	static final String academyname = "himadia ascademy";
	
	Student(){
		bunho = cnt;
		name = "아무개" + cnt;
		cnt++;
		scores = new int[3];
	}
	
	Student(String name , int ... scores){
		bunho = cnt;
		this.name = name;
		this.scores = scores;
		
		cnt++;
	}
}

public class ClassStatic02 {

	public static void main(String[] args) {
		
		Student std1 = new Student();
		Student std2 = new Student();
		Student std3 = new Student();
		
		
		System.out.println("훈련기관명 : "+ Student.academyname);
		System.out.println("현재학생수 : " + (Student.cnt-1));
		
		

		//스태틱 final 값 -> 값을 변경할 수 없음 기준이 되는 값이다.
		System.out.println("int 형 자료의 가장 큰 값 : " + (Integer.MAX_VALUE));
		System.out.println("int 형 자료의 가장 작은 값 : " + (Integer.MIN_VALUE));
		
		
		
		
	}

}
