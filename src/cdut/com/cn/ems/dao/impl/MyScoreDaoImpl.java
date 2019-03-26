package cdut.com.cn.ems.dao.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cdut.com.cn.ems.dao.MyScoreDao;
import cdut.com.cn.ems.entity.MyBook;
import cdut.com.cn.ems.entity.MyScore;

@Repository("myScoreDao")
public class MyScoreDaoImpl extends SqlSessionDaoSupport implements MyScoreDao {
	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	@Override
	public List<MyScore> findScore(String student_id, HttpServletRequest request) {
		String statement="cdut.com.cn.ems.mappers.MyScoreMapper.findList";
		List<MyScore> findList=getSqlSession().selectList(statement, student_id);
		return findList;
	}

}
