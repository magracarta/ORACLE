package EXJDBC;

import java.util.ArrayList;

public class BoardSelect {
	public static void main(String[] args) {
		BoardDao bdao = BoardDao.getInstance();
		ArrayList <BoardDto> list = bdao.selectBoard();
		
		// boardDetail board
		// b num (boardnum) ,a name, a  email , b writer , b subject , b content , b writedate , b readcount
		System.out.print("no\t이름\t\temail\t\t\t\t\t\t작성자\t\t제목\t\t\t\t\t내용\t\t\t\t\t등록날자\t\t조회수\n");
		System.out.println("----------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
		
		for(BoardDto bdto : list){
			System.out.printf("%d\t%-3s\t\t%-25s\t\t%-3s\t\t%-12s\t\t%-25s\t%s\t\t%d\n",
				bdto.getNum(), bdto.getName(), bdto.getEmail() , bdto.getWriter(), bdto.getSubject(), 
				bdto.getContent(), bdto.getWritedate(), bdto.getReadcount()
				);
		}
		
	}
}
