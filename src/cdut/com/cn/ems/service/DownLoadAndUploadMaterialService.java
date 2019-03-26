package cdut.com.cn.ems.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cdut.com.cn.ems.entity.DownLoadAndUploadMaterial;

public interface DownLoadAndUploadMaterialService {

	int addFile(HttpServletRequest request,String path);
	List<DownLoadAndUploadMaterial> findList();
	List<DownLoadAndUploadMaterial> findList(DownLoadAndUploadMaterial downLoadAndUploadMaterial,HttpServletRequest request);
	DownLoadAndUploadMaterial findOneDownload(String materialId);
	
}
