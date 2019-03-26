package cdut.com.cn.ems.service;

import javax.servlet.http.HttpServletRequest;

import cdut.com.cn.ems.entity.Assess;

public interface AssessService {
	int add(Assess assess,HttpServletRequest request);
	Assess findOne(Assess assess);

}
