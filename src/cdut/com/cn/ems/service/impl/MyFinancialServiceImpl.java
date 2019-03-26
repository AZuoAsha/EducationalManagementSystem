package cdut.com.cn.ems.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cdut.com.cn.ems.dao.MyFinancialDao;
import cdut.com.cn.ems.entity.MyFinancial;
import cdut.com.cn.ems.service.MyFinancialService;

@Service("myFinancialService")
public class MyFinancialServiceImpl implements MyFinancialService {

	@Autowired
	private MyFinancialDao myFinancialDao;
	@Override
	public List<MyFinancial> findList(String student_id) {
		List<MyFinancial> list=myFinancialDao.findList(student_id);
		return list;
	}

}
