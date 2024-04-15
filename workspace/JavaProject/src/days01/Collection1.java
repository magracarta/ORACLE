package days01;

import java.util.ArrayList;
import java.util.Vector;

//컬렉션 클래스
//자료구조를 구현하고 있는 클래스
//자료구조 : 각각의 데이터들을 효율적으로 저장하고 운용하기 위한 방법론


//1. 배열 - 크기가정해져 있음
//2. 리스트 - 크기가 안정해져 있음 종적으로 크기가 변함
//3. Set
//4. Map

// 리스트 클래스를 상속받는 ArrayList 또는 Vector 의 사용빈도수가 가장 높습니다.
// Map 클래스를 상속받은 HashTable 또는 HashMap 또한 못지않게 사용빈도수가 높고 중요하게 사용됩니다.

// 정적 - 실행 초에 모든걸 설정
// 동적 - 중간에 계속 설정을 바꿀 수 있는것

// Vector, ArrayList 클래스
// - 두개의 클래스는 동일한 기능을 제공
// - 쓰레드 동기화의 지원여부 크기의 제약없이 데이터를 저장 (동적으로 크기를 확장)
// - 배열과 같이 인덱스를 기반으로 데이터를 접근
// - 데이터의 중복을 허용
// - 데이터의 입력 순서를 유지

public class Collection1 {

	public static void main(String[] args) {
		
		Vector v = new Vector();
		ArrayList a = new ArrayList();
		// 동적 배열의 객체 생성 초기값으로 크기를 지정할 수 있지만 통상 크기 지정 없이 사용한다.
		
		//데이터의 추가
		v.add(10); 	v.add(20);		v.add(30);
		a.add(10); 	a.add(20);		a.add(30);
		
		// Vector와 ArrayList 저장은 int 형이 아닌 Integer 형 데이터(객체)가 저장된다.
		
		// ArrayList 안에 add 멤버 메서드가 존재하고 그 메서드를 통해 데이터를 저장
		//a.add("abc");
		//v.add("abc");
		
		//object는 모든 클래스, 자료형 등등의 부모 클래스이다.
		//add 메서드의 매개변수는 Object 인것을 예상할 수 있다.
		//public void add(Object item){  }
		
		int b = (Integer) a.get(0);
		
		for(int i =0; i < v.size(); i++) {
			b =(Integer) a.get(i);
			System.out.printf("b[%d]=%d\t\t", i,b);
		}
		
	
		
	}

}
