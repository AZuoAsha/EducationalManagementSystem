package cdut.com.cn.ems.entity;

import java.util.Date;

public class CollegeNotice {
	private long id;
	private String noticeType;
	private String noticeTitle;
	private String noticeContext;
	private Date createTime;
	private String publisher_name;
	private String receiver_id;
	private String receiver_name;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getNoticeType() {
		return noticeType;
	}
	public void setNoticeType(String noticeType) {
		this.noticeType = noticeType;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContext() {
		return noticeContext;
	}
	public void setNoticeContext(String noticeContext) {
		this.noticeContext = noticeContext;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getPublisher_name() {
		return publisher_name;
	}
	public void setPublisher_name(String publisher_name) {
		this.publisher_name = publisher_name;
	}
	public String getReceiver_id() {
		return receiver_id;
	}
	public void setReceiver_id(String receiver_id) {
		this.receiver_id = receiver_id;
	}
	public String getReceiver_name() {
		return receiver_name;
	}
	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}
	@Override
	public String toString() {
		return "CollegeNotice [id=" + id + ", noticeType=" + noticeType + ", noticeTitle=" + noticeTitle
				+ ", noticeContext=" + noticeContext + ", createTime=" + createTime + ", publisher_name="
				+ publisher_name + ", receiver_id=" + receiver_id + ", receiver_name=" + receiver_name + "]";
	}
	public CollegeNotice(long id, String noticeType, String noticeTitle, String noticeContext, Date createTime,
			String publisher_name, String receiver_id, String receiver_name) {
		super();
		this.id = id;
		this.noticeType = noticeType;
		this.noticeTitle = noticeTitle;
		this.noticeContext = noticeContext;
		this.createTime = createTime;
		this.publisher_name = publisher_name;
		this.receiver_id = receiver_id;
		this.receiver_name = receiver_name;
	}
	public CollegeNotice() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
