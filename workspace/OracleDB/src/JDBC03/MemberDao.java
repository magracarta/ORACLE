package JDBC03;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDao {
	
	DateBaseManager dbm = new  DateBaseManager();
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<MemberDto> selectMember() {
		ArrayList <MemberDto> list = new ArrayList<MemberDto>();
		con = dbm.getConnection();
		String sql = "select * from memberlist";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				MemberDto mdt = new MemberDto();
				
				mdt.setMembernum(rs.getInt("membernum"));
				mdt.setName(rs.getString("name"));
				mdt.setPhone(rs.getString("phone"));
				mdt.setBirth(rs.getDate("birth"));//SQL 의 DATE 형시 -> Java.sql.Date
				mdt.setBpoint(rs.getInt("bpoint"));
				mdt.setGender(rs.getString("gender"));
				mdt.setAge(rs.getInt("age")); 
				
				list.add(mdt);
			}
			
		} catch (SQLException e) { e.printStackTrace(); 
		}
		
		dbm.close(con, pstmt, rs);
		return list;
	}

	public int inserMember(MemberDto mdto) {
		int result =0;
		
		con = dbm.getConnection();
		String sql = "INSERT INTO memberlist (membernum, name, phone,birth, bpoint, gender, age) "
		+" VALUES(member_seq.nextVal, ? ,?,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mdto.getName());
			pstmt.setString(2, mdto.getPhone());
			pstmt.setDate(3, mdto.getBirth());
			pstmt.setInt(4,mdto.getBpoint());
			pstmt.setString(5, mdto.getGender());
			pstmt.setInt(6, mdto.getAge());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) { e.printStackTrace();
		}
		dbm.close(con, pstmt, rs);
		return result;
	}
	
	public MemberDto getMember(int membernum){
		MemberDto mdto = null;
		con = dbm.getConnection();
		String sql = "select * from memberlist where membernum = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, membernum);
			rs = pstmt.executeQuery();
			if(rs.next()){
				mdto = new MemberDto();
				
				mdto.setMembernum(rs.getInt("membernum"));
				mdto.setName(rs.getString("name"));
				mdto.setPhone(rs.getString("phone"));
				mdto.setBirth(rs.getDate("birth"));//SQL 의 DATE 형시 -> Java.sql.Date
				mdto.setBpoint(rs.getInt("bpoint"));
				mdto.setGender(rs.getString("gender"));
				mdto.setAge(rs.getInt("age")); 
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		dbm.close(con, pstmt, rs);
		return mdto;
	}

	public int updateMember(MemberDto mdto) {
		int result = 0;
		
		con = dbm.getConnection();
		
		String sql = "update memberlist set name = ? , phone =?, birth=?, bpoint =? , gender = ? , age =? where membernum=?";
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,mdto.getName());
			pstmt.setString(2, mdto.getPhone());
			pstmt.setDate(3, mdto.getBirth());
			pstmt.setInt(4, mdto.getBpoint());
			pstmt.setString(5, mdto.getGender());
			pstmt.setInt(6, mdto.getAge());
			pstmt.setInt(7, mdto.getMembernum());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbm.close(con, pstmt, rs);
		
		return result;
	}

	public int deletMember(int membernum) {
		int result =0;
		
		con = dbm.getConnection();
		String sql = "delete memberlist where membernum = ? ";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, membernum);
			//결과가 테이블 형태로 받는건 -> executeQuery 
			result = pstmt.executeUpdate();
		} catch (SQLException e) { e.printStackTrace();
		}
		
		dbm.close(con, pstmt, rs);
		
		return result;
	}
	
	
}
