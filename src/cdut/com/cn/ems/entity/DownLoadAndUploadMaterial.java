package cdut.com.cn.ems.entity;

import java.util.Date;

public class DownLoadAndUploadMaterial {
	private long id;
	private String materialId;
	private String materialName;
	private String materialType;
	private Date uploadTime;
	private Date downloadTime;
	private String filePath;
	private int startPage;
	private int count;
	private int flag;

	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getMaterialId() {
		return materialId;
	}
	public void setMaterialId(String materialId) {
		this.materialId = materialId;
	}
	public String getMaterialName() {
		return materialName;
	}
	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}
	public String getMaterialType() {
		return materialType;
	}
	public void setMaterialType(String materialType) {
		this.materialType = materialType;
	}
	public Date getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}
	public Date getDownloadTime() {
		return downloadTime;
	}
	public void setDownloadTime(Date downloadTime) {
		this.downloadTime = downloadTime;
	}
	public DownLoadAndUploadMaterial(long id, String materialId, String materialName, String materialType,
			Date uploadTime, Date downloadTime, String filePath, int startPage, int count, int flag) {
		super();
		this.id = id;
		this.materialId = materialId;
		this.materialName = materialName;
		this.materialType = materialType;
		this.uploadTime = uploadTime;
		this.downloadTime = downloadTime;
		this.filePath = filePath;
		this.startPage = startPage;
		this.count = count;
		this.flag = flag;
	}
	public DownLoadAndUploadMaterial( String materialId, String materialName, String materialType,
			Date uploadTime,String filePath) {
		super();
		this.materialId = materialId;
		this.materialName = materialName;
		this.materialType = materialType;
		this.uploadTime = uploadTime;
		this.filePath=filePath;
	}
	
	@Override
	public String toString() {
		return "DownLoadAndUploadMaterial [id=" + id + ", materialId=" + materialId + ", materialName=" + materialName
				+ ", materialType=" + materialType + ", uploadTime=" + uploadTime + ", downloadTime=" + downloadTime
				+ ", filePath=" + filePath + ", startPage=" + startPage + ", count=" + count + ", flag=" + flag + "]";
	}
	public DownLoadAndUploadMaterial() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
