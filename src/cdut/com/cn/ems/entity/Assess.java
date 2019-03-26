package cdut.com.cn.ems.entity;

import java.util.Date;

public class Assess {
	private String assessmenter;
	private String teacherName;
	private String workAssess;
	private String problemType;
	private String problemContent;
	
	private Date assessTime;

	public String getAssessmenter() {
		return assessmenter;
	}

	public void setAssessmenter(String assessmenter) {
		this.assessmenter = assessmenter;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getWorkAssess() {
		return workAssess;
	}

	public void setWorkAssess(String workAssess) {
		this.workAssess = workAssess;
	}

	public String getProblemType() {
		return problemType;
	}

	public void setProblemType(String problemType) {
		this.problemType = problemType;
	}

	public String getProblemContent() {
		return problemContent;
	}

	public void setProblemContent(String problemContent) {
		this.problemContent = problemContent;
	}

	public Date getAssessTime() {
		return assessTime;
	}

	public void setAssessTime(Date assessTime) {
		this.assessTime = assessTime;
	}

	public Assess(String assessmenter, String teacherName, String workAssess, String problemType, String problemContent,
			Date assessTime) {
		super();
		this.assessmenter = assessmenter;
		this.teacherName = teacherName;
		this.workAssess = workAssess;
		this.problemType = problemType;
		this.problemContent = problemContent;
		this.assessTime = assessTime;
	}

	public Assess() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Assess [assessmenter=" + assessmenter + ", teacherName=" + teacherName + ", workAssess=" + workAssess
				+ ", problemType=" + problemType + ", problemContent=" + problemContent + ", assessTime=" + assessTime
				+ "]";
	}
	
	

}
