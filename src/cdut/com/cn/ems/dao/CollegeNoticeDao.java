package cdut.com.cn.ems.dao;

import java.util.List;

import cdut.com.cn.ems.entity.CollegeNotice;

public interface CollegeNoticeDao {
	List<CollegeNotice> findList(String college_id);
}
