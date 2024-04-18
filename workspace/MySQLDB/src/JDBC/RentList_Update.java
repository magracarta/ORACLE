package JDBC;

import java.util.Scanner;

public class RentList_Update {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		RentDao rdao = RentDao.getInstance();
		RentDto rdto = new RentDto();
		
		//수정할 대여기록의 번호 입력
		System.out.print("수정할 대여건의 번호를 입력하세요.");
		int numseq = Integer.parseInt( sc.nextLine() );
		rdto = rdao.getRent(numseq);
		if(rdto ==null){
			// 기록이 있는지 확인합니다. 없으면 종료
			System.out.println("입력한 번호의 대여 기록 번호가 없습니다. 프로그램이 종료됩니다.");
			return;
		}
		
		
		//수정할 대여날짜를 입력
		System.out.printf("날짜 :%s\n ", rdto.getRentdate());
		System.out.print("수정할 날짜를 입력하세요.(yyyy-mm-dd) 수정하지 않으려면 엔터만 입력하세요. ");
		String rentdata =sc.nextLine(); // 20240418
		if( !rentdata.equals("") ) rdto.setRentdate(rentdata);
		
		
		// 수정할 도서번호 입력. 입력한 번호가 도서가 없으면 없으면 다시 입력
		System.out.printf("도서번호 :%s\n ", rdto.getBnum());
		System.out.print("수정할 도서번호를 입력하세요. 수정하지 않으려면 엔터만 입력하세요. ");
		String booknum = sc.nextLine();
		if(!booknum.equals("")) rdto.setBnum(Integer.parseInt(booknum));
		
		
		// 수정할 회원번호를 입력. 입력한 번호가 도서가 없으면 없으면 다시 입력
		System.out.printf("회원번호 :%s\n ", rdto.getMnum());
		System.out.print("수정할 회원번호를 입력하세요. 수정하지 않으려면 엔터만 입력하세요. ");
		String membernum = sc.nextLine();
		if(!membernum.equals("")) rdto.setMnum(Integer.parseInt(membernum));
		

		// 수정할 인금액 입력 수정
		System.out.printf("할인금액 :%s\n ", rdto.getDiscount());
		System.out.print("수정할 할인금액를 입력하세요. 수정하지 않으려면 엔터만 입력하세요. ");
		String discount = sc.nextLine();
		if(!discount.equals("")) rdto.setDiscount(Integer.parseInt(discount));
		
		
		// RentDto 에 모두 담아서 updateRent 메서드에 전송
		int result = rdao.updateRent(rdto);
		
		if(result == 1) System.out.println("수정이 완료되었습니다.");
		else System.out.println("수정이 실패하였습니다.");
		
	}

}
