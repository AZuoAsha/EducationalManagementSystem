package cdut.com.cn.ems.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import cdut.com.cn.ems.entity.DownLoadAndUploadMaterial;
import cdut.com.cn.ems.service.DownLoadAndUploadMaterialService;

@Controller
@RequestMapping("/uploadAndDownload")
@SessionAttributes("status") 
public class DownLoadAndUploadMaterialController {
	@Autowired
	private DownLoadAndUploadMaterialService downLoadAndUploadMaterialService;

	@RequestMapping("/upload.do")
	public String addFile(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		// 鎷兼帴鏂囦欢瀛樺偍鐨勭洰褰�
		/*String temp = Thread.currentThread().getContextClassLoader().getResource("").getPath();
		int num = temp.indexOf(".metadata");*/
		// 鏂囦欢淇濆瓨璺緞
		String path ="D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\";
		//String path ="C:\\Soft\\apache-tomcat-8.0.28-windows-x64\\apache-tomcat-8.0.28\\webapps\\EducationalManagementSystem\\uploadFile\\";
		System.out.println("path=" + path);
		// 涓婁紶鏂囦欢
		int addResult = downLoadAndUploadMaterialService.addFile(request, path);
		request.setAttribute("path", addResult);
		System.out.println(addResult);
        return "redirect:/doUpload/upload.jsp";  
          
    }  

	@RequestMapping("/download.do")
	public void download(@RequestParam("materialId") String materialId, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		System.out.println("鏂规硶鎵ц浜唌aterialId=" + materialId);
		DownLoadAndUploadMaterial fLoad = downLoadAndUploadMaterialService.findOneDownload(materialId);
		System.out.println("fLoad=" + fLoad);
		String context = fLoad.getMaterialName();
		// String path =
		// request.getSession().getServletContext().getRealPath("filemannger\\upload")+"\\"+context;
		// 鑾峰彇椤圭洰璺緞
		String temp = Thread.currentThread().getContextClassLoader().getResource("").getPath();
		int num = temp.indexOf(".metadata");
		// 鑾峰彇鏂囦欢涓嬭浇鐨勮矾寰�
		String path = "D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\uploadFile\\" + context;
		//String path ="C:\\Soft\\apache-tomcat-8.0.28-windows-x64\\apache-tomcat-8.0.28\\webapps\\EducationalManagementSystem\\uploadFile\\"+ context;

		System.out.println("downPath=" + path);
		// 寮�濮嬫惌寤鸿鍐欐ˉ姊�
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(new File(path)));
		// BufferedReader bis=new BufferedReader(new FileReader(new File(path)));
		context = URLEncoder.encode(context, "UTF-8");
		response.addHeader("Content-Disposition", "attachment;filename=" + context);
		// 鍒ゆ柇鏂囦欢绫诲瀷
		response.setContentType("multipart/form-data");
		BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
		// 寮�濮嬩笅杞�
		int str = 0;
		byte[] buffer = new byte[8192];
		while ((str = bis.read(buffer, 0, 8192)) != -1) {
			out.write(buffer, 0, str);
			out.flush();
		}
		out.close();
	}

	@RequestMapping("/pagination.do")
	@ResponseBody
	public List<DownLoadAndUploadMaterial> searchDownLoadAndUploadMaterialList(DownLoadAndUploadMaterial downLoadAndUploadMaterial,
			HttpServletRequest request) {
		List<DownLoadAndUploadMaterial> downLoadAndUploadMaterials = downLoadAndUploadMaterialService
				.findList(downLoadAndUploadMaterial,request);
		HttpSession session=request.getSession();
		System.out.println("downLoadAndUploadMaterials=" + downLoadAndUploadMaterials+",startPage="+downLoadAndUploadMaterial.getStartPage());
		if (downLoadAndUploadMaterials!=null) {
			session.setAttribute("fileList", downLoadAndUploadMaterials);
			return downLoadAndUploadMaterials;
		}else {
			
			return null;
		}
		
	}

}
