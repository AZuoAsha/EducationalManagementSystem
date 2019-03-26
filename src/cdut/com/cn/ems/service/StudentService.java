package cdut.com.cn.ems.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cdut.com.cn.ems.entity.Student;

public interface StudentService {

	public int add(Student student);
	public int delete(String student_id);
	public int update(Student student);
	public Student findOne(Student student);
	public List<Student> findAll() ;
	public int addFile(HttpServletRequest request, String path);
}
