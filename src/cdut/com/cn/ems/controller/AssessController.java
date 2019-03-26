package cdut.com.cn.ems.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cdut.com.cn.ems.entity.Assess;
import cdut.com.cn.ems.service.AssessService;
import javassist.bytecode.stackmap.BasicBlock.Catch;

@Controller
@RequestMapping("/assess")
public class AssessController {
	//
	@Autowired
	private AssessService assessService;
	
	@RequestMapping("/add.do")
	@ResponseBody
	public int add(Assess assess,HttpServletRequest request) {
		
		int addResult=assessService.add(assess,request);
		System.out.println("controller执行1");
		return addResult;
	}
	
}
