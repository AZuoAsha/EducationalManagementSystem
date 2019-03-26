package cdut.com.cn.ems.entity;

import java.util.Date;

public class Message {
	private String messageTitle;
	
	private long id;
	
	private String messageType;
	
	private String messageContext;
	
	private String messager;
	
	private Date createTime;
	
	private String messageReceiver;

	private String receiver_id;
	
	public String getReceiver_id() {
		return receiver_id;
	}

	public void setReceiver_id(String receiver_id) {
		this.receiver_id = receiver_id;
	}

	public String getMessageTitle() {
		return messageTitle;
	}

	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getMessageType() {
		return messageType;
	}

	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}

	public String getMessageContext() {
		return messageContext;
	}

	public void setMessageContext(String messageContext) {
		this.messageContext = messageContext;
	}

	public String getMessager() {
		return messager;
	}

	public void setMessager(String messager) {
		this.messager = messager;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getMessageReceiver() {
		return messageReceiver;
	}

	public void setMessageReceiver(String messageReceiver) {
		this.messageReceiver = messageReceiver;
	}
	@Override
	public String toString() {
		return "Message [messageTitle=" + messageTitle + ", id=" + id + ", messageType=" + messageType
				+ ", messageContext=" + messageContext + ", messager=" + messager + ", createTime=" + createTime
				+ ", messageReceiver=" + messageReceiver + ", receiver_id=" + receiver_id + "]";
	}

	public Message(String messageTitle, long id, String messageType, String messageContext, String messager,
			Date createTime, String messageReceiver, String receiver_id) {
		super();
		this.messageTitle = messageTitle;
		this.id = id;
		this.messageType = messageType;
		this.messageContext = messageContext;
		this.messager = messager;
		this.createTime = createTime;
		this.messageReceiver = messageReceiver;
		this.receiver_id = receiver_id;
	}

	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}

}
