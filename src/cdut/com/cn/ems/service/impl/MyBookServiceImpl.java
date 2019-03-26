package cdut.com.cn.ems.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cdut.com.cn.ems.dao.MyBookDao;
import cdut.com.cn.ems.entity.MyBook;
import cdut.com.cn.ems.service.MyBookService;

@Service("myBookService")
public class MyBookServiceImpl implements MyBookService {
	@Autowired
	private MyBookDao myBookDao;

	@Override
	public List<MyBook> findOneBook(String student_id, HttpServletRequest request) {
		List<MyBook> findResult=myBookDao.findOne(student_id, request);
		return findResult;
	}

	@Override
	public List<MyBook> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
