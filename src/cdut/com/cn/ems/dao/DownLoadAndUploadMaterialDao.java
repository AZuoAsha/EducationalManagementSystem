package cdut.com.cn.ems.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cdut.com.cn.ems.entity.DownLoadAndUploadMaterial;

public interface DownLoadAndUploadMaterialDao {

	int uploadFile(HttpServletRequest request,String path);
	List<DownLoadAndUploadMaterial> findList();
	List<DownLoadAndUploadMaterial> findList(DownLoadAndUploadMaterial downLoadAndUploadMaterial);
	DownLoadAndUploadMaterial findOneDownload(String materialId);
	int addFile(DownLoadAndUploadMaterial downLoadAndUploadMaterial);
}
