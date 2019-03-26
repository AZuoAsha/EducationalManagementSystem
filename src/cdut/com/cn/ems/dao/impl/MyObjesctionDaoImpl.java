package cdut.com.cn.ems.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cdut.com.cn.ems.dao.MyObjectionDao;
import cdut.com.cn.ems.entity.MyObjection;

@Repository("myObjectionDao")
public class MyObjesctionDaoImpl extends SqlSessionDaoSupport implements MyObjectionDao {
	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	

	@Override
	public List<MyObjection> findList(String student_id) {
		String statement="cdut.com.cn.ems.mappers.MyObjectionMapper.findList";
		List<MyObjection> findList=getSqlSession().selectList(statement, student_id);
		return findList;
	}

	@Override
	public int addObjection(MyObjection myObjection) {
		String state="cdut.com.cn.ems.mappers.MyObjectionMapper.addObjection";
		int addResult=getSqlSession().insert(state, myObjection);
		return addResult;
	}

}
