package cdut.com.cn.ems.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cdut.com.cn.ems.entity.MyObjection;

public interface MyObjectionService {
	List<MyObjection> findList(String student_id);
	int addObjection(MyObjection myObjection,HttpServletRequest request);

}
