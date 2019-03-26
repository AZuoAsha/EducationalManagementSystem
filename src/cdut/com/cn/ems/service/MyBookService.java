package cdut.com.cn.ems.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cdut.com.cn.ems.entity.MyBook;

public interface MyBookService {
	List<MyBook> findOneBook(String student_id,HttpServletRequest request);
	List<MyBook> findAll();

}
