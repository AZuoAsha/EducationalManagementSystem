package cdut.com.cn.ems.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cdut.com.cn.ems.dao.MyFinancialDao;
import cdut.com.cn.ems.entity.MyFinancial;

@Repository("myFinancialDao")
public class MyFinancialDaoImpl extends SqlSessionDaoSupport implements MyFinancialDao {
	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	@Override
	public List<MyFinancial> findList(String student_id) {
		String statement="cdut.com.cn.ems.mappers.MyFinancialMapper.findList";
		List<MyFinancial> findList=getSqlSession().selectList(statement, student_id);
		return findList;
	}


}
