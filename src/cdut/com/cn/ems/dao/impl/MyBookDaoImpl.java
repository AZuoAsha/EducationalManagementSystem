package cdut.com.cn.ems.dao.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cdut.com.cn.ems.dao.MyBookDao;
import cdut.com.cn.ems.entity.MyBook;

@Repository("myBookDao")
public class MyBookDaoImpl extends SqlSessionDaoSupport implements MyBookDao {
	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	

	@Override
	public List<MyBook> findOne(String student_id, HttpServletRequest request) {
		String statement="cdut.com.cn.ems.mappers.MyBookMapper.findList";
		List<MyBook> findList=getSqlSession().selectList(statement, student_id);
		return findList;
	}

	@Override
	public List<MyBook> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
