package cdut.com.cn.ems.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cdut.com.cn.ems.entity.MyObjection;
import cdut.com.cn.ems.entity.Student;
import cdut.com.cn.ems.service.MyObjectionService;

@Controller
@RequestMapping("/addObjection")
public class MyObjectioncontroller {
	@Autowired
	private MyObjectionService myObjectionService;
	
	@RequestMapping("/insert.do")
	@ResponseBody
	public int addObjection(MyObjection myObjection,HttpServletRequest request) {
		System.out.println("添加异议..");
		HttpSession session=request.getSession();
		Student student=(Student) session.getAttribute("student");
		String student_id=student.getStudent_id();
		int addResult=myObjectionService.addObjection(myObjection,request);
		List<MyObjection> myObjections=myObjectionService.findList(student_id);
		session.setAttribute("myObjection", myObjections);
		return addResult;
	}

}
