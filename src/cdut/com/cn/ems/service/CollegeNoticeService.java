package cdut.com.cn.ems.service;

import java.util.List;

import cdut.com.cn.ems.entity.CollegeNotice;

public interface CollegeNoticeService {
	List<CollegeNotice> findList(String college_id);
}
