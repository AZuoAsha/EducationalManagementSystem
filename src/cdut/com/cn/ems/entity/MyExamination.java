package cdut.com.cn.ems.entity;

import java.util.Date;

public class MyExamination {
	private String examinationName;
	private int examinationNumber;
	private long id;
	private String price;
	private String combined;
	private String total;
	private String student_id;
	private String student_name;
	private Date createTime;
	private Date examinationTime;
	public String getExaminationName() {
		return examinationName;
	}
	public void setExaminationName(String examinationName) {
		this.examinationName = examinationName;
	}
	public int getExaminationNumber() {
		return examinationNumber;
	}
	public void setExaminationNumber(int examinationNumber) {
		this.examinationNumber = examinationNumber;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCombined() {
		return combined;
	}
	public void setCombined(String combined) {
		this.combined = combined;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getStudent_name() {
		return student_name;
	}
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getExaminationTime() {
		return examinationTime;
	}
	public void setExaminationTime(Date examinationTime) {
		this.examinationTime = examinationTime;
	}
	public MyExamination(String examinationName, int examinationNumber, long id, String price, String combined,
			String total, String student_id, String student_name, Date createTime, Date examinationTime) {
		super();
		this.examinationName = examinationName;
		this.examinationNumber = examinationNumber;
		this.id = id;
		this.price = price;
		this.combined = combined;
		this.total = total;
		this.student_id = student_id;
		this.student_name = student_name;
		this.createTime = createTime;
		this.examinationTime = examinationTime;
	}
	public MyExamination() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "MyExamination [examinationName=" + examinationName + ", examinationNumber=" + examinationNumber
				+ ", id=" + id + ", price=" + price + ", combined=" + combined + ", total=" + total + ", student_id="
				+ student_id + ", student_name=" + student_name + ", createTime=" + createTime + ", examinationTime="
				+ examinationTime + "]";
	}
	

}
