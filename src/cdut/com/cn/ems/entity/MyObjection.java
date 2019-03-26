package cdut.com.cn.ems.entity;

import java.util.Date;

public class MyObjection {
	private String mtitle;
	private String objectionContext;
	private String student_id;
	private String student_name;
	private String status;
	private String objectionType;
	private long id;
	private Date createTime;
	private String objectionName;
	
	public String getObjectionName() {
		return objectionName;
	}
	public void setObjectionName(String objectionName) {
		this.objectionName = objectionName;
	}
	public String getMtitle() {
		return mtitle;
	}
	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}
	public String getObjectionContext() {
		return objectionContext;
	}
	public void setObjectionContext(String objectionContext) {
		this.objectionContext = objectionContext;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getObjectionType() {
		return objectionType;
	}
	public void setObjectionType(String objectionType) {
		this.objectionType = objectionType;
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
	
	@Override
	public String toString() {
		return "MyObjection [mtitle=" + mtitle + ", objectionContext=" + objectionContext + ", student_id=" + student_id
				+ ", student_name=" + student_name + ", status=" + status + ", objectionType=" + objectionType + ", id="
				+ id + ", createTime=" + createTime + ", objectionName=" + objectionName + "]";
	}
	public MyObjection(String mtitle, String objectionContext, String student_id, String student_name, String status,
			String objectionType, long id, Date createTime, String objectionName) {
		super();
		this.mtitle = mtitle;
		this.objectionContext = objectionContext;
		this.student_id = student_id;
		this.student_name = student_name;
		this.status = status;
		this.objectionType = objectionType;
		this.id = id;
		this.createTime = createTime;
		this.objectionName = objectionName;
	}
	public MyObjection() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
