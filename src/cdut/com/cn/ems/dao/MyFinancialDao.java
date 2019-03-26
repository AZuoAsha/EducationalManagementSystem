package cdut.com.cn.ems.dao;

import java.util.List;

import cdut.com.cn.ems.entity.MyFinancial;

public interface MyFinancialDao {
	List<MyFinancial> findList(String student_id);

}
