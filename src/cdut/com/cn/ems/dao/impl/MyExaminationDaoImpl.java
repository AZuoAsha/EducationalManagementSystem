package cdut.com.cn.ems.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cdut.com.cn.ems.dao.MyExaminationDao;
import cdut.com.cn.ems.entity.MyExamination;

@Repository("myExaminationDao")
public class MyExaminationDaoImpl extends SqlSessionDaoSupport implements MyExaminationDao {

	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	@Override
	public List<MyExamination> findList(String student_id) {
		String statement="cdut.com.cn.ems.mappers.MyExaminationMapper.findList";
		List<MyExamination> findList=getSqlSession().selectList(statement, student_id);
		return findList;
	}

}
