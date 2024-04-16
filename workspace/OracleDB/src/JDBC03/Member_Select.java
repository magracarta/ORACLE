package JDBC03;

import java.util.ArrayList;

public class Member_Select {

	public static void main(String[] args) {
		
		MemberDao mdao = new MemberDao();
		ArrayList<MemberDto> list = mdao.selectMember();
		
		System.out.println("--------------------------------------------------------------------------------------------");
		System.out.println("회원번호\t이름\t\t전화번호\t\t\t생일\t\t\t성별\t나이\t사은 포인트");
		
		System.out.println("--------------------------------------------------------------------------------------------");
		for(MemberDto mdt : list){
			System.out.printf("%d\t\t%s\t\t%s\t\t%s\t%s\t%s\t%d\n",
					mdt.getMembernum(),mdt.getName(),mdt.getPhone(), mdt.getBirth(),
					 mdt.getGender(), mdt.getAge(),mdt.getBpoint()
				);
		}
		
		// %s 의 마법 : %s 에는 String , int , double, Date 형식 모두 별도의 조치 없이 출력이 가능합니다.
		
		
	}
		
}

