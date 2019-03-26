package cdut.com.cn.ems.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Repository;

import cdut.com.cn.ems.dao.StudentDao;
import cdut.com.cn.ems.entity.DownLoadAndUploadMaterial;
import cdut.com.cn.ems.entity.Student;

@Repository("studentDao")
public class StudentDaoImpl extends SqlSessionDaoSupport implements StudentDao {

	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	@Override
	public int add(Student student) {
		String statement="cdut.com.cn.ems.mappers.StudentMapper.add";
		int add=getSqlSession().insert(statement, student);
		return add;
	}

	@Override
	public int delete(String student_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Student student) {
		if (student.getPassword()!=null) {
		String statement="cdut.com.cn.ems.mappers.StudentMapper.update";
		int update=getSqlSession().update(statement, student);
		//System.out.println("StudentDaoImple:   update ;  "+update);
		return update;
		}else {
			String statement2="cdut.com.cn.ems.mappers.StudentMapper.updatePhone";
			int updateResult=getSqlSession().update(statement2, student);
			return updateResult;
		}
		
		
	}

	@Override
	public Student findOne(Student student) {
		if (student.getPassword()!=null&&student.getStudent_id()!=null&&student.getConfirmpassword()==null) {
		String statement="cdut.com.cn.ems.mappers.StudentMapper.login";
		Student login=getSqlSession().selectOne(statement, student);
		System.out.println("Dao login 执行");
		return login;
		}else {
			String statement2="cdut.com.cn.ems.mappers.StudentMapper.findOne";
			Student findOne=getSqlSession().selectOne(statement2, student);
			System.out.println("findOne="+findOne);
			return findOne;
		}
		
		
	}

	@Override
	public List<Student> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected void checkDaoConfig() throws IllegalArgumentException {
		// TODO Auto-generated method stub

	}

	@Override
	public void addFile(Student student) {
		String statement="cdut.com.cn.ems.mappers.StudentMapper.updateHeader";
		int update=getSqlSession().update(statement, student);
		
	}
}
