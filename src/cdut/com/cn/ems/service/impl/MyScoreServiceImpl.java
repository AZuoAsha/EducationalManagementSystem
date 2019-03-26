package cdut.com.cn.ems.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cdut.com.cn.ems.dao.MyScoreDao;
import cdut.com.cn.ems.entity.MyScore;
import cdut.com.cn.ems.service.MyScoreService;

@Service("myScoreService")
public class MyScoreServiceImpl implements MyScoreService {
	@Autowired
	private MyScoreDao myScoreDao;

	@Override
	public List<MyScore> findScore(String student_id, HttpServletRequest request) {
		List<MyScore> findResult=myScoreDao.findScore(student_id, request);
		return findResult;
	}

}
