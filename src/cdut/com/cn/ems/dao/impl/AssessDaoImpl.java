package cdut.com.cn.ems.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cdut.com.cn.ems.dao.AssessDao;
import cdut.com.cn.ems.entity.Assess;

@Repository("assessDao")
public class AssessDaoImpl extends SqlSessionDaoSupport implements AssessDao {

	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	@Override
	public int add(Assess assess) {
		String statement="cdut.com.cn.ems.mappers.AssessMapper.add";
		int add=getSqlSession().insert(statement, assess);
		return add;
	}

	@Override
	public Assess findOne(Assess assess) {
		// TODO Auto-generated method stub
		return null;
	}

}
