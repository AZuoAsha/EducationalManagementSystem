package cdut.com.cn.ems.dao;

import java.util.List;

import cdut.com.cn.ems.entity.Student;

public interface StudentDao {

	public int add(Student student);
	public int delete(String student_id);
	public int update(Student student);
	public Student findOne(Student student);
	public List<Student> findAll() ;
	public void addFile(Student student);
}
