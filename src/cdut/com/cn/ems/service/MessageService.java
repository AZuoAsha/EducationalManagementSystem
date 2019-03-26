package cdut.com.cn.ems.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cdut.com.cn.ems.entity.Message;

public interface MessageService {
	int add(Message message,HttpServletRequest request);
	
	Message findOne(Message message);

	List<Message> findList(String receiver_id);
}
