package cdut.com.cn.ems.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cdut.com.cn.ems.dao.CollegeNoticeDao;
import cdut.com.cn.ems.entity.CollegeNotice;
import cdut.com.cn.ems.service.CollegeNoticeService;

@Service("collegeNoticeService")
public class CollegeNoticeServiceImpl implements CollegeNoticeService {

	@Autowired
	private CollegeNoticeDao collegeNoticeDao;
	
	@Override
	public List<CollegeNotice> findList(String college_id) {
		List<CollegeNotice> collegeNotices=collegeNoticeDao.findList(college_id);
		return collegeNotices;
	}

}
