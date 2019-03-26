package cdut.com.cn.ems.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cdut.com.cn.ems.entity.MyScore;

public interface MyScoreDao {
	List<MyScore> findScore(String student_id,HttpServletRequest request);

}
