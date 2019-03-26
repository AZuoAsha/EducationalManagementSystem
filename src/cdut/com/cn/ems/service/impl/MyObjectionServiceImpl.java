package cdut.com.cn.ems.service.impl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cdut.com.cn.ems.dao.MyObjectionDao;
import cdut.com.cn.ems.entity.MyExamination;
import cdut.com.cn.ems.entity.MyFinancial;
import cdut.com.cn.ems.entity.MyObjection;
import cdut.com.cn.ems.entity.Student;
import cdut.com.cn.ems.service.MyObjectionService;

@Service("myObjectionService")
public class MyObjectionServiceImpl implements MyObjectionService {
	@Autowired
	private MyObjectionDao myObjectionDao;

	@Override
	public List<MyObjection> findList(String student_id) {
		List<MyObjection> myObjections=myObjectionDao.findList(student_id);
		return myObjections;
	}

	@Override
	public int addObjection(MyObjection myObjection,HttpServletRequest request) {
		myObjection.setCreateTime(new Date());
		HttpSession session = request.getSession();
		Student student=(Student) session.getAttribute("student");
		String student_id=student.getStudent_id();
		myObjection.setStudent_id(student_id);
		String student_name=student.getStudent_name();
		myObjection.setStudent_name(student_name);
		myObjection.setObjectionType("提问");
		myObjection.setStatus("正在处理");
		@SuppressWarnings("unchecked")
		List<MyFinancial> myExamination=(List<MyFinancial>) session.getAttribute("myFinancialSelf");
		String examinationName=myExamination.get(0).getSelfExaminationName();
		myObjection.setObjectionName(examinationName);
		int addResult=myObjectionDao.addObjection(myObjection);
		return addResult;
	}

}
