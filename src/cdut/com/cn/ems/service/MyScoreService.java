package cdut.com.cn.ems.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cdut.com.cn.ems.entity.MyScore;

public interface MyScoreService {
	List<MyScore> findScore(String student_id,HttpServletRequest request);
}
