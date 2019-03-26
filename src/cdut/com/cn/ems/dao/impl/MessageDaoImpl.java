package cdut.com.cn.ems.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cdut.com.cn.ems.dao.MessageDao;
import cdut.com.cn.ems.entity.Message;

@Repository("messageDao")
public class MessageDaoImpl extends SqlSessionDaoSupport implements MessageDao {
	
	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	@Override
	public int add(Message message) {
		String statement="cdut.com.cn.ems.mappers.MessageMapper.add";
		int add=getSqlSession().insert(statement, message);
		return add;
	}

	@Override
	public Message findOne(Message message) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Message> findList(String receiver_id) {
		String statement="cdut.com.cn.ems.mappers.MessageMapper.findList";
		List<Message> fList=getSqlSession().selectList(statement, receiver_id);
		return fList;
	}

}
