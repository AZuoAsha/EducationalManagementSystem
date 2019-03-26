<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+
			":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件上传</title>
<base href="<%=basePath%>">
<style type="text/css">
.img{
height:70px;
width:18%;
border-radius:8px;
border:2px solid #7B7B7B;
}
</style>
</head>
<body>
<div align="center">
<form action="uploadAndDownload/upload.do" method="post" enctype="multipart/form-data">
请选择文件:<input type="file" name="file" style="border: 1px solid #AE8F00;border-radius:6px;height:30px;width:140px;opacity: 0.5;background:#AFAF61" required/>
<input type="submit" value="上传" style="border:1px solid #616130;border-radius:6px;height:30px;width:100px;margin-top:10px"/>
</form><br><br>

</div><br>
<div align="center" class="index">
 
</div>
</body>
</html>