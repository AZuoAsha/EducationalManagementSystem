package cdut.com.cn.ems.service;

import java.util.List;

import cdut.com.cn.ems.entity.MyFinancial;

public interface MyFinancialService {
	List<MyFinancial> findList(String student_id);
}
