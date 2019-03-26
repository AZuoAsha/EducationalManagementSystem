package cdut.com.cn.ems.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cdut.com.cn.ems.entity.MyBook;

public interface MyBookDao {
	List<MyBook> findOne(String student_id,HttpServletRequest request);
	List<MyBook> findAll();

}
