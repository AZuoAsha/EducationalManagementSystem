package cdut.com.cn.ems.entity;

import java.util.Date;

public class Student {

	private long id;
	private String student_id;
	private String student_name;
	private String student_idcard;
	private String student_class;
	private String student_sex;
	private String student_age;
	private String student_college;
	private String student_profession;
	private String confirmpassword;
	private String password;
	private String baomingTime;
	private String baokaoCengci;
	private String phone;
	private String baokaoLeibie;
	private String firstProfession;
	private String phone2;
	private String status;
	private String email;
	private String address;
	private String kaoJihao;
	private String qq;
	private String banjiQq;
	private String teacher;
	private String teacherPhone;
	private Date loginTime;
	private String college_id;
	private String student_header;
	private String student_class_name;
	
	
	public String getStudent_class_name() {
		return student_class_name;
	}
	public void setStudent_class_name(String student_class_name) {
		this.student_class_name = student_class_name;
	}
	public String getStudent_header() {
		return student_header;
	}
	public void setStudent_header(String student_header) {
		this.student_header = student_header;
	}
	public String getCollege_id() {
		return college_id;
	}
	public void setCollege_id(String college_id) {
		this.college_id = college_id;
	}
	public Date getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}
	public String getTeacherPhone() {
		return teacherPhone;
	}
	public void setTeacherPhone(String teacherPhone) {
		this.teacherPhone = teacherPhone;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getBanjiQq() {
		return banjiQq;
	}
	public void setBanjiQq(String banjiQq) {
		this.banjiQq = banjiQq;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
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
	public String getStudent_idcard() {
		return student_idcard;
	}
	public void setStudent_idcard(String student_idcard) {
		this.student_idcard = student_idcard;
	}
	public String getStudent_class() {
		return student_class;
	}
	public void setStudent_class(String student_class) {
		this.student_class = student_class;
	}
	public String getStudent_sex() {
		return student_sex;
	}
	public void setStudent_sex(String student_sex) {
		this.student_sex = student_sex;
	}
	public String getStudent_age() {
		return student_age;
	}
	public void setStudent_age(String student_age) {
		this.student_age = student_age;
	}
	public String getStudent_college() {
		return student_college;
	}
	public void setStudent_college(String student_college) {
		this.student_college = student_college;
	}
	public String getStudent_profession() {
		return student_profession;
	}
	public void setStudent_profession(String student_profession) {
		this.student_profession = student_profession;
	}
	public String getConfirmpassword() {
		return confirmpassword;
	}
	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getBaomingTime() {
		return baomingTime;
	}
	public void setBaomingTime(String baomingTime) {
		this.baomingTime = baomingTime;
	}
	public String getBaokaoCengci() {
		return baokaoCengci;
	}
	public void setBaokaoCengci(String baokaoCengci) {
		this.baokaoCengci = baokaoCengci;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBaokaoLeibie() {
		return baokaoLeibie;
	}
	public void setBaokaoLeibie(String baokaoLeibie) {
		this.baokaoLeibie = baokaoLeibie;
	}
	public String getFirstProfession() {
		return firstProfession;
	}
	public void setFirstProfession(String firstProfession) {
		this.firstProfession = firstProfession;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getKaoJihao() {
		return kaoJihao;
	}
	public void setKaoJihao(String kaoJihao) {
		this.kaoJihao = kaoJihao;
	}
	public Student(long id, String student_id, String student_name, String student_idcard, String student_class,
			String student_sex, String student_age, String student_college, String student_profession,
			String confirmpassword, String password, String baomingTime, String baokaoCengci, String phone,
			String baokaoLeibie, String firstProfession, String phone2, String status, String email, String address,
			String kaoJihao, String qq, String banjiQq, String teacher, String teacherPhone, Date loginTime,
			String college_id, String student_header, String student_class_name) {
		super();
		this.id = id;
		this.student_id = student_id;
		this.student_name = student_name;
		this.student_idcard = student_idcard;
		this.student_class = student_class;
		this.student_sex = student_sex;
		this.student_age = student_age;
		this.student_college = student_college;
		this.student_profession = student_profession;
		this.confirmpassword = confirmpassword;
		this.password = password;
		this.baomingTime = baomingTime;
		this.baokaoCengci = baokaoCengci;
		this.phone = phone;
		this.baokaoLeibie = baokaoLeibie;
		this.firstProfession = firstProfession;
		this.phone2 = phone2;
		this.status = status;
		this.email = email;
		this.address = address;
		this.kaoJihao = kaoJihao;
		this.qq = qq;
		this.banjiQq = banjiQq;
		this.teacher = teacher;
		this.teacherPhone = teacherPhone;
		this.loginTime = loginTime;
		this.college_id = college_id;
		this.student_header = student_header;
		this.student_class_name = student_class_name;
	}
	@Override
	public String toString() {
		return "Student [id=" + id + ", student_id=" + student_id + ", student_name=" + student_name
				+ ", student_idcard=" + student_idcard + ", student_class=" + student_class + ", student_sex="
				+ student_sex + ", student_age=" + student_age + ", student_college=" + student_college
				+ ", student_profession=" + student_profession + ", confirmpassword=" + confirmpassword + ", password="
				+ password + ", baomingTime=" + baomingTime + ", baokaoCengci=" + baokaoCengci + ", phone=" + phone
				+ ", baokaoLeibie=" + baokaoLeibie + ", firstProfession=" + firstProfession + ", phone2=" + phone2
				+ ", status=" + status + ", email=" + email + ", address=" + address + ", kaoJihao=" + kaoJihao
				+ ", qq=" + qq + ", banjiQq=" + banjiQq + ", teacher=" + teacher + ", teacherPhone=" + teacherPhone
				+ ", loginTime=" + loginTime + ", college_id=" + college_id + ", student_header=" + student_header
				+ ", student_class_name=" + student_class_name + "]";
	}
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Student(String student_id, String student_header) {
		super();
		this.student_id = student_id;
		this.student_header = student_header;
	}
	
}
