package cdut.com.cn.ems.entity;

public class Class {

	private Student student;
	private Teacher teacher;
	private String class_id;
	private String class_name;
	private long id;
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Class() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Class(Student student, Teacher teacher, String class_id, String class_name, long id) {
		super();
		this.student = student;
		this.teacher = teacher;
		this.class_id = class_id;
		this.class_name = class_name;
		this.id = id;
	}
	
}
