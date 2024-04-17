package JDBC;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RentDao {
	
	private RentDao(){ }
	private static RentDao itc = new RentDao();
	public  static RentDao getInstance(){
		
		return itc;
	}
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<RentDto> selectRent() {
		ArrayList<RentDto> list = new ArrayList<RentDto>();
		con = Dbman.getConnection();
		String sql ="select * from rentDetail order by numseq desc";
		
		/* mysql 에서  view를 만듬으로써 아래와 같이 길게 쓰는 것을 방지 할 수 있다.
		String sql = "select  a.numseq, date_format(a.rentdate , '%Y-%m-%d') as rd , "
				+ "			a.bnum , b.subject, a.mnum , c.name , b.rentprice, a.discount, "
				+ "			(b.rentprice - a.discount) AS \"amount\""
				+ "from rentlist a, booklist b, memberlist c"
				+ "where a.bnum = b.booknum AND a.mnum = c.membernum;";
		*/
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				RentDto rdto = new RentDto();
				rdto.setNumseq(rs.getInt("numseq"));
				rdto.setRentdate(rs.getString("rd"));
				rdto.setBnum(rs.getInt("bnum"));
				rdto.setSubject(rs.getString("subject"));
				rdto.setMnum(rs.getInt("mnum"));
				rdto.setName(rs.getString("name"));
				rdto.setRentprice(rs.getInt("rentprice"));
				rdto.setDiscount(rs.getInt("discount"));
				rdto.setAmount(rs.getInt("amount"));
				
				list.add(rdto);
			}
			
		} catch (SQLException e) { e.printStackTrace();
		} finally{
			Dbman.close(con, pstmt, rs); }
		
		
		
		return list;
	}

	public int memberOk(String membernum) {
		int result = 0;
		con = Dbman.getConnection();
		//String sql = "select count(*) as cnt from memberlist where membernum =?";
		String sql = "select * from memberlist where membernum =?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(membernum));
			rs = pstmt.executeQuery();
			if(rs.next()){
				//result = rs.getInt("cnt");
				result = 1;
			}
			
		} catch (SQLException e) { e.printStackTrace();
		} finally{
			Dbman.close(con, pstmt, rs); }
		return result;
	}

	public int bookOk(String booknum) {
		int result = 0;
		con = Dbman.getConnection();
		String sql = "select * from booklist where booknum =?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(booknum));
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = 1;
			}
			
		} catch (SQLException e) { e.printStackTrace();
		} finally{
			Dbman.close(con, pstmt, rs); }
		return result;
	}

	public int inserRent(RentDto rdto) {
		int result = 0;
		con = Dbman.getConnection();
		String sql = "insert into rentlist(bnum , mnum , discount) values(?,?,?) ";
		/*(b.rentprice - a.discount)   rentlist a, booklist b*/
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rdto.getBnum());
			pstmt.setInt(2, rdto.getMnum());
			pstmt.setInt(3, rdto.getDiscount());
			result = pstmt.executeUpdate();
		} catch (SQLException e) { e.printStackTrace();
		} finally{
			Dbman.close(con, pstmt, rs); }
		
		return result;
	}
	
	
}
