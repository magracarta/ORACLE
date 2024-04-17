package JDBC03;

import java.util.Scanner;

public class Member_Delete {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.printf("삭제할 회원 번호를 입력해주세요 ->");
		int membernum = Integer.parseInt(sc.nextLine());
		MemberDao mdao = new MemberDao();
		MemberDto mdto = mdao.getMember(membernum);
		
		if( mdto == null){
			System.out.println("조회된 회원이 없습니다.");
			return;
		}
		
		int result =  mdao.deletMember(membernum);
		if(result== 1) System.out.println("삭제에 성공했습니다.");
		else System.out.println("삭제에 실패했습니다.");
		
	}

}
