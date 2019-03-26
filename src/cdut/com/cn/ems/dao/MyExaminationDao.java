package cdut.com.cn.ems.dao;

import java.util.List;

import cdut.com.cn.ems.entity.MyExamination;

public interface MyExaminationDao {
	List<MyExamination>  findList(String student_id);

}
