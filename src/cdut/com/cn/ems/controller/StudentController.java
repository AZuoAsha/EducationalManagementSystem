package cdut.com.cn.ems.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import cdut.com.cn.ems.entity.CollegeNotice;
import cdut.com.cn.ems.entity.DownLoadAndUploadMaterial;
import cdut.com.cn.ems.entity.Message;
import cdut.com.cn.ems.entity.MyBook;
import cdut.com.cn.ems.entity.MyExamination;
import cdut.com.cn.ems.entity.MyFinancial;
import cdut.com.cn.ems.entity.MyObjection;
import cdut.com.cn.ems.entity.MyScore;
import cdut.com.cn.ems.entity.Student;
import cdut.com.cn.ems.service.CollegeNoticeService;
import cdut.com.cn.ems.service.DownLoadAndUploadMaterialService;
import cdut.com.cn.ems.service.MessageService;
import cdut.com.cn.ems.service.MyBookService;
import cdut.com.cn.ems.service.MyExaminationService;
import cdut.com.cn.ems.service.MyFinancialService;
import cdut.com.cn.ems.service.MyObjectionService;
import cdut.com.cn.ems.service.MyScoreService;
import cdut.com.cn.ems.service.StudentService;

@Controller
@RequestMapping("/ems")
public class StudentController {

	@Autowired
	private StudentService studentService;

	@Autowired
	private MyBookService myBookService;

	@Autowired
	private MyScoreService myScoreService;

	@Autowired
	private MyExaminationService myExaminationService;

	@Autowired
	private MyFinancialService myFinancialService;

	@Autowired
	private MyObjectionService myObjectionService;

	@Autowired
	private MessageService messageService;

	@Autowired
	private CollegeNoticeService collegeNoticeService;

	@Autowired
	private DownLoadAndUploadMaterialService downLoadAndUploadMaterialService;

	@RequestMapping("/add.do")
	@ResponseBody
	public String add(Student student, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int add = studentService.add(student);
		System.out.println("student=" + student + ",add=" + add);
		if (add != 0) {
			return "success";
		}
		return "false";
	}

	@RequestMapping("/login.do")
	@ResponseBody
	public int login(Student student, HttpServletRequest request) {
		student.setLoginTime(new Date());
		HttpSession session = request.getSession();
		Student login = studentService.findOne(student);
		System.out.println("鐧婚檰缁撴灉login=" + login);
		if (login != null) {
			session.setAttribute("student", login);
			List<MyBook> findOne = myBookService.findOneBook(student.getStudent_id(), request);
			if (findOne != null) {
				session.setAttribute("findBook", findOne);
			}
			findScore(student, request, session);
			findMyExamination(student, request, session);
			findMyFinancial(student, request, session);
			findMyObjection(student, request, session);
			findMessage(student, request, session);
			findCollegeNotice(student, request, session);
			findFileList(request, session);
			return 1;
		} 
		{
			System.out.println("鐧婚檰涓虹┖ login="+login+",杩斿洖0");
			return 0;
		}

	}

	private void findFileList(HttpServletRequest request, HttpSession session) {
		List<DownLoadAndUploadMaterial> downLoadAndUploadMaterials = downLoadAndUploadMaterialService.findList();
		session = request.getSession();
		session.setAttribute("fileListTotal", downLoadAndUploadMaterials);
		session.setAttribute("startPage", 0);
	}

	private void findCollegeNotice(Student student, HttpServletRequest request, HttpSession session) {
		String college_id = student.getStudent_id().substring(0, 6);
		List<CollegeNotice> fCollegeNotices = collegeNoticeService.findList(college_id);
		System.out.println("college_id=" + college_id + ",fCollegeNotices=" + fCollegeNotices);
		session = request.getSession();
		session.setAttribute("collegeNotice", fCollegeNotices);

	}

	private void findMessage(Student student, HttpServletRequest request, HttpSession session) {
		List<Message> meList = messageService.findList(student.getStudent_id());
		session = request.getSession();
		session.setAttribute("messageList", meList);

	}

	private void findMyObjection(Student student, HttpServletRequest request, HttpSession session) {
		List<MyObjection> mList = myObjectionService.findList(student.getStudent_id());
		session = request.getSession();
		session.setAttribute("myObjection", mList);
		System.out.println("myObjection鎵цmList=" + mList);

	}

	private void findMyFinancial(Student student, HttpServletRequest request, HttpSession session) {
		List<MyFinancial> list = myFinancialService.findList(student.getStudent_id());
		session = request.getSession();
		System.out.println("杩欏効鎵ц浜�...list=" + list);
		for (int i = 0; i < list.size(); i++) {
			System.out.println("鎵ц浜唂or ");
			if (list.get(i).getIsSelfExamination() == 1) {
				session.setAttribute("myFinancialSelf", list);
			}
			if (list.get(i).getArrearage() != "0") {
				session.setAttribute("myFinancial", list);
			}

		}

	}

	private void findMyExamination(Student student, HttpServletRequest request, HttpSession session) {
		List<MyExamination> list = myExaminationService.findList(student.getStudent_id());
		session = request.getSession();
		session.setAttribute("myExamination", list);

	}

	private void findScore(Student student, HttpServletRequest request, HttpSession session) {
		List<MyScore> myScoreList = myScoreService.findScore(student.getStudent_id(), request);
		session = request.getSession();
		session.setAttribute("myScore", myScoreList);
	}

	@RequestMapping("/update.do")
	@ResponseBody
	public String update(Student student, HttpServletRequest request) {
		int update = studentService.update(student);
		System.out.println("update=" + update);
		if (update != 0) {
			Student findOne = studentService.findOne(student);
			HttpSession session = request.getSession();
			session.setAttribute("student", findOne);
			return "success";
		}
		return "fail";
	}

	@RequestMapping("/findOne.do")
	@ResponseBody
	public String findOne(Student student) {
		Student findOne = studentService.findOne(student);
		System.out.println("controller findOne=" + findOne);
		if (findOne == null) {
			return "null";
		} else {
			return "success";
		}
	}

	@RequestMapping("/logout.do")
	public String logOut(HttpSession httpSession) {
		System.out.println("鐢ㄦ埛閫�鍑轰簡..");
		Student student = (Student) httpSession.getAttribute("student");
		if (null != student) {
			httpSession.removeAttribute("student");
		}
		return "redirect:/login.jsp";
	}
	
	//涓婁紶澶村儚
	@RequestMapping(value="/upload.do")
	@ResponseBody
	public String uploadHeader(/*@RequestParam("filename")File filename,*/HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		// 鎷兼帴鏂囦欢瀛樺偍鐨勭洰褰�
		String temp = Thread.currentThread().getContextClassLoader().getResource("").getPath();
		String[] paths=temp.split("WEB-INF/classes");
		String path1=paths[0]+"userHeader/";
		// 鏂囦欢淇濆瓨璺緞
		String path ="D:\\jee-oxygen\\EducationalManagementSystem\\WebContent\\userHeader\\";
		System.out.println("path="+path);
		// 涓婁紶鏂囦欢
		int addResult = studentService.addFile(request, path);
		System.out.println(addResult);
		if (addResult==1) {
			return "success";
		}else {
			return "fail";
		}
	}

}
