package EXJDBC;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDao {
	private static BoardDao boardao = new BoardDao();
	
	
	private Connection con = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	
	public static BoardDao getInstance(){
		return boardao;
	}

	public ArrayList<BoardDto> selectBoard() {
		ArrayList<BoardDto> list = new ArrayList<>();
		
		con = DBman.getConnection();
		String sql = "select * from boardDetail order by num desc";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				// boardDetail board
				// b num (boardnum) ,a name, a  email , b writer , b subject , b content ,
				// b writedate , b readcount

				BoardDto bdto = new BoardDto();
				bdto.setNum(rs.getInt("num"));
				bdto.setName(rs.getString("name"));
				bdto.setEmail(rs.getString("email"));
				bdto.setWriter(rs.getString("writer"));
				bdto.setSubject(rs.getString("subject"));
				bdto.setContent(rs.getString("content"));
				bdto.setWritedate(rs.getString("writedate"));
				bdto.setReadcount(rs.getInt("readcount"));
				list.add(bdto);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBman.close(con, pstmt, rs);
		}
		
		return list;
	}

	public int checkmember(String member) {
		int result =0;

		con = DBman.getConnection();
		String sql = "select * from member where userid =?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member);
			rs = pstmt.executeQuery();
			
			if(rs.next()) result = 1;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBman.close(con, pstmt, rs);
		}
		
		return result;
	}

	public int insertBoard(BoardDto bdto) {
		int result =0;
		con = DBman.getConnection();
		//-- boardnum , writer , subject , content , writedate , readcount
		String sql = "insert into board (writer, subject,content) values(?,?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,bdto.getWriter() );
			pstmt.setString(2,bdto.getSubject() );
			pstmt.setString(3,bdto.getContent() );
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBman.close(con, pstmt, rs);
		}
		
		return result;
	}

	
	

}
