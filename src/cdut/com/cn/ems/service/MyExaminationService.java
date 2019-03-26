package cdut.com.cn.ems.service;

import java.util.List;

import cdut.com.cn.ems.entity.MyExamination;

public interface MyExaminationService {
	List<MyExamination>  findList(String student_id);
}
