package cdut.com.cn.ems.dao;

import java.util.List;

import cdut.com.cn.ems.entity.MyObjection;

public interface MyObjectionDao {
	List<MyObjection> findList(String student_id);
	int addObjection(MyObjection myObjection);

}
