package cdut.com.cn.ems.entity;

public class Teacher {

	private long id;
	private String class_id;
	private String teachBook_name;
	private String teacher_name;
	private int age;
	private String teacher_sex;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	public String getTeachBook_name() {
		return teachBook_name;
	}
	public void setTeachBook_name(String teachBook_name) {
		this.teachBook_name = teachBook_name;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getTeacher_sex() {
		return teacher_sex;
	}
	public void setTeacher_sex(String teacher_sex) {
		this.teacher_sex = teacher_sex;
	}
	public Teacher() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Teacher(long id, String class_id, String teachBook_name, String teacher_name, int age, String teacher_sex) {
		super();
		this.id = id;
		this.class_id = class_id;
		this.teachBook_name = teachBook_name;
		this.teacher_name = teacher_name;
		this.age = age;
		this.teacher_sex = teacher_sex;
	}
}
