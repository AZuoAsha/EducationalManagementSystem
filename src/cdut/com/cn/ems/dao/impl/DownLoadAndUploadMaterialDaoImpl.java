package cdut.com.cn.ems.dao.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cdut.com.cn.ems.dao.DownLoadAndUploadMaterialDao;
import cdut.com.cn.ems.entity.DownLoadAndUploadMaterial;

@Repository("downLoadAndUploadMaterialDao")
public class DownLoadAndUploadMaterialDaoImpl extends SqlSessionDaoSupport implements DownLoadAndUploadMaterialDao {
	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	@Override
	public int uploadFile(HttpServletRequest request, String path) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<DownLoadAndUploadMaterial> findList() {
		String statement="cdut.com.cn.ems.mappers.DownLoadAndUploadMaterialMapper.findList";
		List<DownLoadAndUploadMaterial> downLoadAndUploadMaterials=getSqlSession().selectList(statement);	
		return downLoadAndUploadMaterials;
	}

	@Override
	public DownLoadAndUploadMaterial findOneDownload(String materialId) {
		String statement="cdut.com.cn.ems.mappers.DownLoadAndUploadMaterialMapper.findOne";
		DownLoadAndUploadMaterial downLoadAndUploadMaterial=getSqlSession().selectOne(statement, materialId);
		return downLoadAndUploadMaterial;
	}

	@Override
	public int addFile(DownLoadAndUploadMaterial downLoadAndUploadMaterial) {
		String statement="cdut.com.cn.ems.mappers.DownLoadAndUploadMaterialMapper.addFile";
		int addResult=getSqlSession().insert(statement, downLoadAndUploadMaterial);
		return addResult;
	}

	@Override
	public List<DownLoadAndUploadMaterial> findList(DownLoadAndUploadMaterial downLoadAndUploadMaterial) {
		String statement="cdut.com.cn.ems.mappers.DownLoadAndUploadMaterialMapper.findList2";
		List<DownLoadAndUploadMaterial> downLoadAndUploadMaterials=getSqlSession().selectList(statement,downLoadAndUploadMaterial);
		return downLoadAndUploadMaterials;
	}

}
