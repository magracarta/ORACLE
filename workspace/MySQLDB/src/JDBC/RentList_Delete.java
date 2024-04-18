package JDBC;

import java.util.Scanner;

public class RentList_Delete {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		RentDao rdao = RentDao.getInstance();
		
		//수정할 대여기록의 번호 입력
		System.out.print("삭제할 대여건의 번호를 입력하세요.");
		int numseq = Integer.parseInt( sc.nextLine() );
		RentDto rdto = rdao.getRent(numseq);
		if(rdto ==null){
			// 기록이 있는지 확인합니다. 없으면 종료
			System.out.println("입력한 번호의 대여 기록 번호가 없습니다. 프로그램이 종료됩니다.");
			return;
		}
		
		int result = rdao.deleteRent(rdto);
		
		if(result == 1) System.out.println("수정이 완료되었습니다.");
		else System.out.println("수정이 실패하였습니다.");

	}

}
