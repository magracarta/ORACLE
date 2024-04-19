package EXJDBC;

import java.util.Scanner;

public class BoardInsert {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		BoardDao bdao = BoardDao.getInstance();
		BoardDto bdto = new BoardDto();
		
		//-- boardnum , writer , subject , content , writedate , readcount
		System.out.println("작성자 id를 입력해주세요.  :");
		String member;
		//작성자 조회
		while(true){
			member =sc.nextLine();
			int result =bdao.checkmember(member);
			if(result == 0){
				System.out.println("조회된 회원이 없습니다. 다시 작성해주세요.");
				continue;
			}else break;
		}

		System.out.println("작성된 아이디  -> :   "+ member );
		bdto.setWriter(member);
		
		// 제목 삽입.
		String subject = null;

		System.out.print("제목을 입력해주세요. :");
		while(true){
			subject = sc.nextLine();
			if(subject.equals("")){
				System.out.println("빈칸입니다. 제목을 다시 입력해주세요.");
				continue;
			}else{
				bdto.setSubject(subject);
				break;
			}
		}
		System.out.println("작성된 제목  -> :   "+ subject );
		

		// 내용 삽입.
		String content = null;
		System.out.print("내용을 입력해주세요. :");
		while(true){
			content = sc.nextLine();
			if(content.equals("")){
				System.out.println("빈칸입니다. 내용을 다시 입력해주세요.");
				continue;
			}else{
				bdto.setContent(content);
				break;
			}
		}
		System.out.println("작성된 내용 -> :   "+ content );
		
		int result = bdao.insertBoard(bdto);
		
		if(result !=0) System.out.println("삽입에 성공했습니다.");
		else System.out.println("삽입에 실패했습니다.");
		
		

	}

}
