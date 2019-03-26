package cdut.com.cn.ems.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import cdut.com.cn.ems.dao.DownLoadAndUploadMaterialDao;
import cdut.com.cn.ems.entity.DownLoadAndUploadMaterial;
import cdut.com.cn.ems.service.DownLoadAndUploadMaterialService;

@Service("downLoadAndUploadMaterialService")
public class DownLoadAndUploadMaterialServiceImpl implements DownLoadAndUploadMaterialService {

	@Autowired
	private DownLoadAndUploadMaterialDao downLoadAndUploadMaterialDao;
	
	@Override
	public int addFile(HttpServletRequest request, String path) {
		List<String> list = new ArrayList<String>(); // 存放结果
		// 1、将当前上下文初始化给CommonMutipartResolver
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		// 2、检查Form中encType是否为multipart/form-data
		if (multipartResolver.isMultipart(request)) {
			// 将request转为MultipartHttpServletRequest
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			// 获取迭代器遍历multipartRequest里的文件名
			Iterator<String> iter = multipartRequest.getFileNames();
			while (iter.hasNext()) {
				// 获取文件并向下遍历
				MultipartFile file = multipartRequest.getFile(iter.next().toString());
				System.out.println("file=" + file.getSize());
				if (file != null) {
					// 获取文件类型，即后缀名
					String str = file.getOriginalFilename();
					String suffix = str.substring(str.lastIndexOf("."));
					System.out.println("str=" + str);
					// 用 当前日期+UUID作为文件名避免重名
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					String dateStr = sdf.format(new Date()).replaceAll("-", "");
					System.out.println("dateStr=" + dateStr);

					String materialId = dateStr + UUID.randomUUID().toString().replaceAll("-", "");

					// 拼接文件绝对路径
					String filePath = path + materialId + suffix;

					String fileName = materialId + suffix;
					String myPath = "uploadFile/" + fileName;
					System.out.println("filePath=" + filePath);
					downLoadAndUploadMaterialDao.addFile(new DownLoadAndUploadMaterial( materialId,fileName,str.trim(),new Date(), filePath));
					try {
						file.transferTo(new File(filePath));
						
					} catch (IllegalStateException | IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					list.add(filePath);
				}
			}
		}
		return 1;
	}

	@Override
	public List<DownLoadAndUploadMaterial> findList() {
		List<DownLoadAndUploadMaterial> downLoadAndUploadMaterials=downLoadAndUploadMaterialDao.findList();
		
		return downLoadAndUploadMaterials;
	}

	@Override
	public DownLoadAndUploadMaterial findOneDownload(String materialId) {
		DownLoadAndUploadMaterial findResult=downLoadAndUploadMaterialDao.findOneDownload(materialId);
		return findResult;
	}

	@Override
	public List<DownLoadAndUploadMaterial> findList(DownLoadAndUploadMaterial downLoadAndUploadMaterial,HttpServletRequest request) {
		int flag=downLoadAndUploadMaterial.getFlag();
		HttpSession session=request.getSession();
		List<DownLoadAndUploadMaterial> meratialSize=(List<DownLoadAndUploadMaterial>)session.getAttribute("fileListTotal");
		downLoadAndUploadMaterial.setCount(15);
		//首页
		if (flag==-1) {
			downLoadAndUploadMaterial.setStartPage(0);
			session.setAttribute("startPage", downLoadAndUploadMaterial.getStartPage());
			session.setAttribute("count", downLoadAndUploadMaterial.getCount());
		}
		//上一页
		if (flag==-2) {
			int result=(int)session.getAttribute("startPage")-15;
			if (result<0) {
				result=0;
				downLoadAndUploadMaterial.setStartPage(result);
				session.setAttribute("startPage", result);
			}
			if (result>=0){
				downLoadAndUploadMaterial.setStartPage(result);
				session.setAttribute("startPage", result);
			}
			
		}
		//下一页
		if (flag==-3) {
			int result=(int)session.getAttribute("startPage")+15;
			if (result>meratialSize.size()&&result<=meratialSize.size()+15) {
				int num=(int) Math.floor(meratialSize.size()/15);
				downLoadAndUploadMaterial.setStartPage(num*15);
				session.setAttribute("startPage", num*15);
			}
			if (result<=meratialSize.size()) {
				downLoadAndUploadMaterial.setStartPage(result);
				session.setAttribute("startPage", result);
			}
		}
		//尾页
		if (flag==-4) {
			int num=(int) Math.floor(meratialSize.size()/15);
			downLoadAndUploadMaterial.setStartPage(num*15);
			session.setAttribute("startPage", num*15);
			System.out.println("num="+num);
		}
		
		if (flag>=0) {
			int startPage=flag*15;
			if (startPage>meratialSize.size()&&startPage<=meratialSize.size()+15) {
				int num=(int) Math.floor(meratialSize.size()/15);
				downLoadAndUploadMaterial.setStartPage(num*15);
				session.setAttribute("startPage", num*15);
			}
			if (startPage<=meratialSize.size()) {
				downLoadAndUploadMaterial.setStartPage(startPage);
				session.setAttribute("startPage", startPage);
			}
		}
		
		List<DownLoadAndUploadMaterial> downLoadAndUploadMaterials=downLoadAndUploadMaterialDao.findList(downLoadAndUploadMaterial);
		System.out.println("flag="+flag+",count="+downLoadAndUploadMaterial.getCount()+",startPage="+downLoadAndUploadMaterial.getStartPage());
		return downLoadAndUploadMaterials;
	}

}
