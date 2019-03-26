package cdut.com.cn.ems.entity;

import java.util.Date;

public class MyBook {
	private String bookName;
	private String student_id;
	private Date bookTime;
	private String student_name;
	private long id;
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public Date getBookTime() {
		return bookTime;
	}
	public void setBookTime(Date bookTime) {
		this.bookTime = bookTime;
	}
	public String getStudent_name() {
		return student_name;
	}
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public MyBook(String bookName, String student_id, Date bookTime, String student_name, long id) {
		super();
		this.bookName = bookName;
		this.student_id = student_id;
		this.bookTime = bookTime;
		this.student_name = student_name;
		this.id = id;
	}
	public MyBook() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "MyBook [bookName=" + bookName + ", student_id=" + student_id + ", bookTime=" + bookTime
				+ ", student_name=" + student_name + ", id=" + id + "]";
	}
	

}
