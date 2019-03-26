package cdut.com.cn.ems.service.impl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cdut.com.cn.ems.dao.MessageDao;
import cdut.com.cn.ems.entity.Message;
import cdut.com.cn.ems.entity.Student;
import cdut.com.cn.ems.service.MessageService;

@Service("/messageService")
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	private MessageDao messageDao;

	@Override
	public int add(Message message,HttpServletRequest request) {
		HttpSession session=request.getSession();
		Student student=(Student) session.getAttribute("student");
		String messager=student.getStudent_name();
		String messageReceiver=student.getTeacher();
		message.setCreateTime(new Date());
		message.setMessager(messager);
		message.setMessageReceiver(messageReceiver);
		
		int addResult=messageDao.add(message);
		
		return addResult;
	}

	@Override
	public Message findOne(Message message) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Message> findList(String receiver_id) {
		List<Message> messages=messageDao.findList(receiver_id);
		return messages;
	}

}
