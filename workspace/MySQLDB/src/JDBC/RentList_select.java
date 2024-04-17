package JDBC;

import java.util.ArrayList;

public class RentList_select {

	public static void main(String[] args) {
		RentDao rdao = RentDao.getInstance();
		ArrayList<RentDto> list = rdao.selectRent();
		
		System.out.printf("대여번호\t날짜\t\t\t도서번호\t회원번호\t성명\t\t대여가격\t할인가격\t매출액\t\t제목\n");
		System.out.println("---------------------------------------------------------------------------------------------------------------------------");
		
		for(RentDto rdto : list ){
			System.out.printf("%s\t\t%s\t%s\t\t%s\t\t%s\t\t%s\t\t%s\t\t%s\t\t%s\n",
					rdto.getNumseq(), rdto.getRentdate(), rdto.getBnum(), rdto.getMnum(), rdto.getName(),
					rdto.getRentprice(), rdto.getDiscount(), rdto.getAmount(), rdto.getSubject() );
		}
		
		
	}

}
