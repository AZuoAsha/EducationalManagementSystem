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

import cdut.com.cn.ems.dao.StudentDao;
import cdut.com.cn.ems.entity.DownLoadAndUploadMaterial;
import cdut.com.cn.ems.entity.Student;
import cdut.com.cn.ems.service.StudentService;

@Service("studentService")
public class StudentServiceImpl implements StudentService {

	@Autowired
	StudentDao studentDao;
	
	@Override
	public int add(Student student) {
		int add=studentDao.add(student);
		return add;
	}

	@Override
	public int delete(String student_id) {
		int delete=studentDao.delete(student_id);
		return delete;
	}

	@Override
	public int update(Student student) {
		int update=studentDao.update(student);
		return update;
	}

	@Override
	public Student findOne(Student student) {
		Student findOne=studentDao.findOne(student);
		return findOne;
	}

	@Override
	public List<Student> findAll() {
		List<Student> findAll=studentDao.findAll();
		return findAll;
	}

	@Override
	public int addFile(HttpServletRequest request, String path) {
		List<String> list = new ArrayList<String>(); // 瀛樻斁缁撴灉
		// 1銆佸皢褰撳墠涓婁笅鏂囧垵濮嬪寲缁機ommonMutipartResolver
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		// 2銆佹鏌orm涓璭ncType鏄惁涓簃ultipart/form-data
		if (multipartResolver.isMultipart(request)) {
			// 灏唕equest杞负MultipartHttpServletRequest
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			// 鑾峰彇杩唬鍣ㄩ亶鍘唌ultipartRequest閲岀殑鏂囦欢鍚�
			Iterator<String> iter = multipartRequest.getFileNames();
			while (iter.hasNext()) {
				// 鑾峰彇鏂囦欢骞跺悜涓嬮亶鍘�
				MultipartFile file = multipartRequest.getFile(iter.next().toString());
				System.out.println("file=" + file);
				if (file != null) {
					// 鑾峰彇鏂囦欢绫诲瀷锛屽嵆鍚庣紑鍚�
					String str = file.getOriginalFilename();
					String suffix = str.substring(str.lastIndexOf("."));
					System.out.println("str=" + str);
					// 鐢� 褰撳墠鏃ユ湡+UUID浣滀负鏂囦欢鍚嶉伩鍏嶉噸鍚�
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					String dateStr = sdf.format(new Date()).replaceAll("-", "");
					System.out.println("dateStr=" + dateStr);

					String materialId = dateStr + UUID.randomUUID().toString().replaceAll("-", "");

					// 鎷兼帴鏂囦欢缁濆璺緞
					String filePath = path + materialId + suffix;

					//String fileName = materialId + suffix;
					System.out.println("filePath=" + filePath);
					HttpSession session=request.getSession();
					Student student=(Student)session.getAttribute("student");
					String myHeader=filePath.replaceAll("D:\\\\jee-oxygen\\\\EducationalManagementSystem\\\\WebContent\\\\", "");
					String lastPath=myHeader.replace("\\", "/");
					//String myrealPath=myHeader.replaceAll("\\", "/");
					student.setStudent_header(lastPath);
					studentDao.addFile(new Student(student.getStudent_id(), lastPath));
					System.out.println("myrealPath="+lastPath);
					session.setAttribute("student", student);
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

}
