package cdut.com.cn.ems.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cdut.com.cn.ems.dao.MyExaminationDao;
import cdut.com.cn.ems.entity.MyExamination;
import cdut.com.cn.ems.service.MyExaminationService;

@Service("myExaminationService")
public class MyExaminationServiceImpl implements MyExaminationService {

	@Autowired
	private MyExaminationDao myExaminationDao;
	
	@Override
	public List<MyExamination> findList(String student_id) {
		List<MyExamination> list=myExaminationDao.findList(student_id);
		return list;
	}

}
