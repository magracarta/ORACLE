package JDBC03;

import java.util.Scanner;

public class Member_Delete {

	public static void main(String[] args) {
		MemberDao mdao = new MemberDao();
		MemberDto mdto = new MemberDto();
		Scanner sc = new Scanner(System.in);
		
		System.out.printf("삭제할 회원 번호를 입력해주세요 ->");
		int num = Integer.parseInt(sc.nextLine());
		
		if(mdao.getMember(num) == null){
			System.out.println("조회된 회원이 없습니다.");
			return;
		}
		
		int result =  mdao.deletMember(num);
		
		if(result== 1) System.out.println("삭제에 성공했습니다.");
		else System.out.println("삭제에 실패했습니다.");
		
	}

}
