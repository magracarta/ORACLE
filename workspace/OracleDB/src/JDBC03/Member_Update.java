package JDBC03;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Scanner;

public class Member_Update {

	public static void main(String[] args) throws ParseException {
		MemberDao mdao = new MemberDao();
		MemberDto mdto = new MemberDto();
		Scanner sc = new Scanner(System.in);
		
		System.out.printf("수정할 회원 번호를 입력해주세요 ->");
		int num = Integer.parseInt(sc.nextLine());
		
		if(mdao.getMember(num) == null){
			System.out.println("회원조회가 안됩니다.");
			return;
		}
		
		mdto.setMembernum(num);
		System.out.printf("수정할 이름을 입력해주세요 (변경하지 않으려면 Enter) ->");
		String name = sc.nextLine();
		if(!name.equals("") ) mdto.setName(name);
		System.out.printf("수정할 전화번호를 입력해주세요 (변경하지 않으려면 Enter) ->");
		String phone = sc.nextLine();
		if(!phone.equals("") ) mdto.setPhone(phone);
		SimpleDateFormat sdt = new SimpleDateFormat("yyyy-MM-dd");
		System.out.printf("수정할 생일을 입력해주세요 (변경하지 않으려면 Enter) (YYYY-MM-DD) ->");
		String birthInput = sc.nextLine();
		
		if(!birthInput.equals("") ){
			java.util.Date d = sdt.parse(birthInput);
			java.sql.Date birth = new java.sql.Date( d.getTime());
			mdto.setBirth(birth);
			
			Calendar today = Calendar.getInstance();
			Calendar c = Calendar.getInstance();
			c.setTime(d);
			
			//나이
			int age = today.get(Calendar.YEAR) - c.get(Calendar.YEAR);
			mdto.setAge(age);
		}
		System.out.printf("수정할  성별을 입력해주세요 (F/M) (변경하지 않으려면 Enter) ->");
		String gender = sc.nextLine();
		if(!gender.equals("")) mdto.setGender(gender);
		
		System.out.printf("수정할 포인트를 입력해주세요. (변경하지 않으려면 Enter) ->");
		String point = sc.nextLine();
		if(!point.equals("")) mdto.setBpoint(Integer.parseInt(point));
		
		int result = mdao.updateMember(mdto);
		if(result == 1) System.out.println("레코드 수정 성공");
		else  System.out.println("레코드 수정 실패");
		

	}

}
