package cdut.com.cn.ems.entity;

import java.util.Date;

public class MyScore {
	private String bookName;
	private String student_name;
	private String student_id;
	private String code;
	private long id;
	private Date createTime;
	private int score;
	
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getStudent_name() {
		return student_name;
	}
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public MyScore(String bookName, String student_name, String student_id, String code, long id, Date createTime,
			int score) {
		super();
		this.bookName = bookName;
		this.student_name = student_name;
		this.student_id = student_id;
		this.code = code;
		this.id = id;
		this.createTime = createTime;
		this.score = score;
	}
	public MyScore() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "MyScore [bookName=" + bookName + ", student_name=" + student_name + ", student_id=" + student_id
				+ ", code=" + code + ", id=" + id + ", createTime=" + createTime + ", score=" + score + "]";
	}
	

}
