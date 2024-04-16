package JDBC02;

// DTO : Data Transfer Object

public class BookDto {
	
	private int booknum;
	private String subject;
	private int makeyaer;
	private int inprice;
	private int outprice;
	private int  rentprice;
	
	public int getRentprice() {
		return rentprice;
	}
	public void setRentprice(int rentprice) {
		this.rentprice = rentprice;
	}
	private String grade;
	
	
	
	
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getBooknum() {
		return booknum;
	}
	public void setBooknum(int booknum) {
		this.booknum = booknum;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getMakeyaer() {
		return makeyaer;
	}
	public void setMakeyaer(int makeyaer) {
		this.makeyaer = makeyaer;
	}
	public int getInprice() {
		return inprice;
	}
	public void setInprice(int inprice) {
		this.inprice = inprice;
	}
	public int getOutprice() {
		return outprice;
	}
	public void setOutprice(int outprice) {
		this.outprice = outprice;
	}
	
	
	
	
}
