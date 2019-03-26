package cdut.com.cn.ems.dao;

import java.util.List;

import cdut.com.cn.ems.entity.Message;

public interface MessageDao {
	int add(Message message);
	
	Message findOne(Message message);
	
	List<Message> findList(String receiver_id);

}
