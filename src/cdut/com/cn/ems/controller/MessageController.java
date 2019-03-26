package cdut.com.cn.ems.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cdut.com.cn.ems.entity.Message;
import cdut.com.cn.ems.entity.Student;
import cdut.com.cn.ems.service.MessageService;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	@RequestMapping("/add.do")
	@ResponseBody
	private int add(Message message,HttpServletRequest request) {
		HttpSession session=request.getSession();
		Student student=(Student) session.getAttribute("student");
		String student_id=student.getStudent_id();
		int addResult=messageService.add(message, request);
		System.out.println("message controller addResult="+addResult);
		List<Message> messages=messageService.findList(student_id);
		session.setAttribute("messageList", messages);
		return addResult;
	}

}
