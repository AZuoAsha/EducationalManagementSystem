package cdut.com.cn.ems.service.impl;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cdut.com.cn.ems.dao.AssessDao;
import cdut.com.cn.ems.entity.Assess;
import cdut.com.cn.ems.entity.Student;
import cdut.com.cn.ems.service.AssessService;

@Service("assessService")
public class AssessServiceImpl implements AssessService {
	@Autowired
	private AssessDao assessDao;

	@Override
	public int add(Assess assess,HttpServletRequest request) {
		assess.setTeacherName("李老师");
		assess.setAssessTime(new Date());
		HttpSession session=request.getSession();
		Student student=(Student) session.getAttribute("student");
		String studentName=student.getStudent_name();
		String teacherName=student.getTeacher();
		String teacherPhone=student.getTeacherPhone();
		assess.setAssessmenter(studentName);
		assess.setTeacherName(teacherName);		
		
		int addResult=assessDao.add(assess);
		System.out.println("dao assess="+assess);
		return addResult;
	}

	@Override
	public Assess findOne(Assess assess) {
		// TODO Auto-generated method stub
		return null;
	}

}
