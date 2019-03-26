package cdut.com.cn.ems.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cdut.com.cn.ems.dao.CollegeNoticeDao;
import cdut.com.cn.ems.entity.CollegeNotice;

@Repository("collegeNoticeDao")
public class CollegeNoticeDaoImpl extends SqlSessionDaoSupport implements CollegeNoticeDao {

	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	@Override
	public List<CollegeNotice> findList(String college_id) {
		String statement="cdut.com.cn.ems.mappers.CollegeNoticeMapper.findList";
		List<CollegeNotice> nCollegeNotices=getSqlSession().selectList(statement, college_id);
		return nCollegeNotices;
	}

}
