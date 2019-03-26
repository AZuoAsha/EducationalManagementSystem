package cdut.com.cn.ems.entity;

import java.util.Date;

public class MyFinancial {
	private String amountPayable;
	private String realPay;
	private String arrearage;
	private int payCount;
	private String shouldPayTotal;//毕业工本费
	private String realPayTotal;//论文答辩费
	private String arrearageTotal;//本学年学杂费
	private Date payTime;
	private int isSelfExamination;
	private String student_id;
	private String student_name;
	private int payTotalCount;
	private String arrearageName;
	private String selfExaminationName;
	
	
	public String getSelfExaminationName() {
		return selfExaminationName;
	}
	public void setSelfExaminationName(String selfExaminationName) {
		this.selfExaminationName = selfExaminationName;
	}
	public String getArrearageName() {
		return arrearageName;
	}
	public void setArrearageName(String arrearageName) {
		this.arrearageName = arrearageName;
	}
	public String getAmountPayable() {
		return amountPayable;
	}
	public void setAmountPayable(String amountPayable) {
		this.amountPayable = amountPayable;
	}
	public String getRealPay() {
		return realPay;
	}
	public void setRealPay(String realPay) {
		this.realPay = realPay;
	}
	public String getArrearage() {
		return arrearage;
	}
	public void setArrearage(String arrearage) {
		this.arrearage = arrearage;
	}
	public int getPayCount() {
		return payCount;
	}
	public void setPayCount(int payCount) {
		this.payCount = payCount;
	}
	public String getShouldPayTotal() {
		return shouldPayTotal;
	}
	public void setShouldPayTotal(String shouldPayTotal) {
		this.shouldPayTotal = shouldPayTotal;
	}
	public String getRealPayTotal() {
		return realPayTotal;
	}
	public void setRealPayTotal(String realPayTotal) {
		this.realPayTotal = realPayTotal;
	}
	public String getArrearageTotal() {
		return arrearageTotal;
	}
	public void setArrearageTotal(String arrearageTotal) {
		this.arrearageTotal = arrearageTotal;
	}
	public Date getPayTime() {
		return payTime;
	}
	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}
	public int getIsSelfExamination() {
		return isSelfExamination;
	}
	public void setIsSelfExamination(int isSelfExamination) {
		this.isSelfExamination = isSelfExamination;
	}
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getStudent_name() {
		return student_name;
	}
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
	public int getPayTotalCount() {
		return payTotalCount;
	}
	public void setPayTotalCount(int payTotalCount) {
		this.payTotalCount = payTotalCount;
	}
	
	@Override
	public String toString() {
		return "MyFinancial [amountPayable=" + amountPayable + ", realPay=" + realPay + ", arrearage=" + arrearage
				+ ", payCount=" + payCount + ", shouldPayTotal=" + shouldPayTotal + ", realPayTotal=" + realPayTotal
				+ ", arrearageTotal=" + arrearageTotal + ", payTime=" + payTime + ", isSelfExamination="
				+ isSelfExamination + ", student_id=" + student_id + ", student_name=" + student_name
				+ ", payTotalCount=" + payTotalCount + ", arrearageName=" + arrearageName + ", selfExaminationName="
				+ selfExaminationName + "]";
	}
	public MyFinancial(String amountPayable, String realPay, String arrearage, int payCount, String shouldPayTotal,
			String realPayTotal, String arrearageTotal, Date payTime, int isSelfExamination, String student_id,
			String student_name, int payTotalCount, String arrearageName, String selfExaminationName) {
		super();
		this.amountPayable = amountPayable;
		this.realPay = realPay;
		this.arrearage = arrearage;
		this.payCount = payCount;
		this.shouldPayTotal = shouldPayTotal;
		this.realPayTotal = realPayTotal;
		this.arrearageTotal = arrearageTotal;
		this.payTime = payTime;
		this.isSelfExamination = isSelfExamination;
		this.student_id = student_id;
		this.student_name = student_name;
		this.payTotalCount = payTotalCount;
		this.arrearageName = arrearageName;
		this.selfExaminationName = selfExaminationName;
	}
	public MyFinancial() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
