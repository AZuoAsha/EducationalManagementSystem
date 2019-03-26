<%@page import="java.text.SimpleDateFormat"%>
<%@page import="cdut.com.cn.ems.entity.DownLoadAndUploadMaterial"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.Math"%>
<%@page import="cdut.com.cn.ems.entity.Teacher"%>
<%@page import="cdut.com.cn.ems.entity.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" 
    + request.getServerName() + ":"
    + request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>学生信息管理平台</title>
<link href="style/StudentStyle.css" rel="stylesheet" type="text/css" />
<link href="script/jBox/Skins/Blue/jbox.css" rel="stylesheet"
	type="text/css" />
<link href="style/ks.css" rel="stylesheet" type="text/css" />
<script src="script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
<script src="script/jBox/i18n/jquery.jBox-zh-CN.js"
	type="text/javascript"></script>
<script src="script/Common.js" type="text/javascript"></script>
<script src="script/Data.js" type="text/javascript"></script>
<style type="text/css">
.active {
	background-color: #0080c4;
}
</style>
<%Student student=(Student)session.getAttribute("student"); %>
<%List<DownLoadAndUploadMaterial> dList=(List<DownLoadAndUploadMaterial>)session.getAttribute("fileList"); %>
<%List<DownLoadAndUploadMaterial> dListTotal=(List<DownLoadAndUploadMaterial>)session.getAttribute("fileListTotal"); %>
<%DownLoadAndUploadMaterial numCode=new DownLoadAndUploadMaterial(); %>
<script type="text/javascript">
        $().ready(function () {
            setStudMsgHeadTabCheck();
            showUnreadSysMsgCount();
        });

        //我的信息头部选项卡
        function setStudMsgHeadTabCheck() {
            var currentUrl = window.location.href;
            currentUrl = currentUrl.toLowerCase();
            var asmhm = "";
            $("#ulStudMsgHeadTab li").each(function () {
                asmhm = $(this).find('a').attr("href").toLowerCase();
                if (currentUrl.indexOf(asmhm) > 0) {
                    $(this).find('a').attr("class", "tab1");
                    return;
                }
            });
        }

        //显示未读系统信息
        function showUnreadSysMsgCount() {
            var unreadSysMsgCount = "0";
            if (Number(unreadSysMsgCount) > 0) {
                $("#unreadSysMsgCount").html("(" + unreadSysMsgCount + ")");
            }
        }

        //退出
        function loginOut() {
            if (confirm("确定退出吗？")) {
                /* StudentLogin.loginOut(function (data) {
                    if (data == "true") {
                        window.location = "/Login.aspx";
                    }
                    else {
                        jBox.alert("退出失败！", "提示", new { buttons: { "确定": true} });
                    }
                }); */
            	window.location.href = 'http://localhost:8080/ems/logout.do';
            }
        }
        //更改报考类别
        function changeCateory(thisObj, id) {
            var oldCateoryId = $("#cateoryId").val();
            var cateoryId = "";
            if (id != null) {
                cateoryId = id;
            }
            else {
                cateoryId = thisObj.val();
            }
            var studentId = $("#studentId").val();
            if (cateoryId.length <= 0) {
                jBox.tip("报考类别不能为空！");
                if (id == null) {
                    thisObj.val(oldCateoryId);
                }
            }
            else {
                studentInfo.changeStudentCateory(cateoryId, function (data) {
                    var result = $.parseJSON(data);
                    if ((String(result.ok) == "true")) {
                        window.location.href = "/Index.aspx";
                    }
                    else {
                        jBox.tip(result.message);
                    }
                });
            }
        }
    </script>

<script src="script/Common.js" type="text/javascript"></script>
<script type="text/javascript">
        function searchData(ctype, type) {
            if (type == "t") {
                var c = $("#cValue").val();
                window.location = 'StudentMaterial.aspx?ctype=' + ctype + "&cid=" + c;
            } else if (type == "c") {
                var t = $("#tValue").val();
                window.location = 'StudentMaterial.aspx?cid=' + ctype + "&ctype=" + t;
            }
        }
        //查询的填充
        $().ready(function () {
            var ctype = Request.QueryString("ctype");
            var cid = Request.QueryString("cid");
            if (ctype != null && ctype != "") {
                $("#tValue").val(ctype);
                $("#" + ctype).addClass("hover");
            } else {
                $("#tAll").addClass("hover");
            }
            if (cid != null && cid != "") {
                $("#cValue").val(cid);
                $("#" + cid).addClass("hover");
            } else {
                $("#cAll").addClass("hover");
            }
        });
    </script>
<script>
    $(document).ready(function() {
    	window.onload = function(){
    		$("#numCode").text(1);
        	searcgPage(0);
    	}
    	var codeIndex=1;
    	$("#inputValue").click(function(){ 
    		var inputValue=$("#john_Page_Search").val()-1;
    		if(inputValue><%=(int)Math.ceil(dListTotal.size()/(15*1.0))-1 %>){
    			codeIndex=<%=(int)Math.ceil(dListTotal.size()/(15*1.0)) %>;
    			$("#numCode").text(codeIndex);
    			jBox.tip("最多跳到第"+<%=(int)Math.ceil(dListTotal.size()/(15*1.0))%>+"页！");
				searcgPage(<%=(int)Math.ceil(dListTotal.size()/(15*1.0))-1 %>);
				return false;
        		}
    		if($("#john_Page_Search").val()==""){
				jBox.tip("请输入页码！");
				return false;
				}
    		if($("#john_Page_Search").val()<=0){
    			jBox.tip("请输入1到"+<%=(int)Math.ceil(dListTotal.size()/(15*1.0))%>+"的页码！");
    			codeIndex=codeIndex;
        		$("#numCode").text(codeIndex);
        		return false;
            	}
        	var re=new RegExp("^[0-9]*[1-9][0-9]*$");
        	if(isNaN(inputValue)||!re.test(inputValue)){
        		codeIndex=codeIndex;
        		$("#numCode").text(codeIndex);
        		searcgPage(inputValue);
        		return false;
            	}
        	
        	else{
            		codeIndex=inputValue+1;
            		$("#numCode").text(codeIndex);
            		searcgPage(inputValue);
                	}
    
		  });
    	
        //var dots =  $('#wrapper-250').children();
       // alert(dots.length);
    	$("#select").change(function(){
			var flag =  $('#wrapper-250 #select').get(0).options.selectedIndex-1;
			if(flag==-1){
				codeIndex=1;
				$("#numCode").text(codeIndex);
				searcgPage(flag);
				}else{
					codeIndex=flag+1
					$("#numCode").text(codeIndex);
					searcgPage(flag);
				}
    	})
        //首页
		 $("#search").click(function(){
			 codeIndex=1;
			 $("#numCode").text(codeIndex);
			 var flag=-1;
	        searcgPage(flag);
    	})
    	
    	//上一页
    	$("#descIndex").click(function(){
        	codeIndex--;
        	if(codeIndex<=1){
				codeIndex=1;
            	}
    		$("#numCode").text(codeIndex);
    		var flag=-2;
			searcgPage(flag);        	
    	})
    	
    	//下一页
    	$("#increase").click(function(){
        	codeIndex++;
        	if(codeIndex>=<%=(int)Math.ceil(dListTotal.size()/(15*1.0)) %>){
				codeIndex=<%=(int)Math.ceil(dListTotal.size()/(15*1.0)) %>
            	}
        	$("#numCode").text(codeIndex);
    		var flag=-3;
        	searcgPage(flag);
    	})

    	//尾页
    	$("#tailPage").click(function(){
    		codeIndex=<%=(int)Math.ceil(dListTotal.size()/(15*1.0)) %>;
    		$("#numCode").text(codeIndex);
    		var flag=-4;
        	searcgPage(flag);
    	})
    	 
    	 
    	var searcgPage=function(flag){
				//alert(flag);
				$.ajax({
	                type: "post",
	                url: "uploadAndDownload/pagination.do",
	                data:{"flag":flag},
	                dataType: "json",
	                success: function (data, textStatus, jqXHR) {
	                	$(".cztable table tbody #tr2").remove();
		                for(var i=0;i<data.length;i++){
		                	var tabl=$(".cztable table tbody");
		                   // alert(tabl[0].tagName);
		                   var date = new Date(data[i].uploadTime);
		                   var day=date.getMinutes();
		                   if(day<10){
								day="0"+day;
			                	}
			                var trs=$("<tr  style='font-size:12px' id='tr2'></tr>");
			                tabl.append(trs);
			                trs.append("<td><img src='images/fileico/doc.gif' /></td>");
			                var td1=$("<td class='xxleft'></td>").text(data[i].materialType);
			                var td2=$("<td></td>").text("复习资料");
			                var td3=$("<td style='border-right:#cfe1f9 solid 1px;'></td>").text(date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+date.getHours()+":"+day);
			                var td4=$("<a style='cursor: pointer;'><img src='images/down.gif' alt='点击下载' /></a>").attr("id","tds"+i);
			                var td5=$("<td></td>");
			                var mytd=td5.append(td4);
			                trs.append(td1);
			                trs.append(td2);
			                trs.append(td3);
			                trs.append(td5);
			              	var href="http://localhost:8080/uploadAndDownload/download.do?materialId="+data[i].materialId;
							$("#tds"+i).attr("href",href);
		                	}
	                if(data!=null){
	               	// jBox.alert("密码修改成功！", "提示");
	                    /*  setTimeout(function () {
	                        window.location.reload();
	                    }, 0);  */
	                return false;
	                }else{
	               	 jBox.tip("跳转失败！");
	                return false;
	                }
	                },
	                error: function (XMLHttpRequest, textStatus, errorThrown) {
	               	 jBox.tip("服务器无法处理此请求！");
	            }
	        });
		}
	    	
    	
    });
    </script>
</head>
<body>


	<div class="banner">
		<div class="bgh">
			<div class="page">
				<div id="logo">
					<a href="edu_index.jsp"> <img src="images/student/logo.gif"
						alt="" width="185" height="68" style="margin-top: -12px" />
					</a>
				</div>
				<div class="topxx">
					<select onchange="changeCateory($(this))"
						style="font-size: 11px; background: #fff; color: #ccc; border: #fff">

						<option value="4">远程</option>

						<option selected='selected' value="1">自考</option>

					</select>
					<%=student.getStudent_id() %>学员：<%=student.getStudent_name() %>，欢迎您！
					<a href="myinfor/index.aspx.jsp">我的信息</a> <a
						href="user/studentinfor/systemmsge.aspx.jsp"> 通知</a> <a
						href="user/account/changepasswd.aspx.jsp">密码修改</a> <a
						onclick="loginOut()" href="javascript:">安全退出</a>
				</div>
				<div class="blog_nav">
					<ul>
						<li><a href="edu_index.jsp">首页</a></li>
						<li><a href="educationcenter/score.aspx.jsp">教务中心</a></li>
						<li><a href="myaccount/wdcw.aspx.jsp">我的学费</a></li>
						<li><a href="onlineteaching/studentmaterial.aspx.jsp">资料中心</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="page">
		<div class="box mtop">
			<div class="leftbox">
				<div class="l_nav2">
					<div class="ta1">
						<strong>个人中心</strong>
						<div class="leftbgbt"></div>
					</div>
					<div class="cdlist">
						<div>
							<a href="myinfor/index.aspx.jsp">我的信息</a>
						</div>
						<div>
							<a href="myinfor/classinfo.aspx.jsp">班级信息 </a>
						</div>
						<div>
							<a href="user/studentinfor/letter.aspx.jsp">短信息</a>
						</div>
						<div>
							<a href="user/studentinfor/systemmsge.aspx.jsp">学院通知</a>
						</div>
						<div>
							<a href="myinfor/objection.aspx.jsp">我的异议</a>
						</div>
					</div>
					<div class="ta1">
						<strong>教务中心</strong>
						<div class="leftbgbt2"></div>
					</div>
					<div class="cdlist">
						<div>
							<a href="educationcenter/application.aspx.jsp">我的报考</a>
						</div>
						<div>
							<a href="educationcenter/score.aspx.jsp">我的成绩</a>
						</div>
						<div>
							<a href="educationcenter/book.aspx.jsp">我的书籍</a>
						</div>
					</div>
					<div class="ta1">
						<strong>学习中心</strong>
						<div class="leftbgbt2"></div>
					</div>
					<div class="cdlist">
						<div>
							<a href="onlineteaching/studentmaterial.aspx.jsp">资料下载</a>
						</div>
						<div>
							<a href="onlineteaching/studentstudyrecordlist.aspx.jsp">学习历程</a>
						</div>
					</div>

					<div class="ta1">
						<strong>财务中心</strong>
						<div class="leftbgbt2"></div>
					</div>
					<div class="cdlist">
						<div>
							<a href="myaccount/wdcw.aspx.jsp">我的财务</a>
						</div>
					</div>
					<div class="ta1">
						<a href="" target="_blank"><strong>教学系统</strong></a>
						<div class="leftbgbt2"></div>
					</div>
				</div>
			</div>
			<div class="rightbox">

				<h2 class="mbx">
					学习中心 &gt; <a href="onlineteaching/studentmaterial.aspx.jsp">资料中心</a>
				</h2>
				<div class="feilei">
					<a href="onlineteaching/studentmaterial.aspx.jsp"><strong>资料中心</strong></a>
				</div>
				<input type="hidden" id="cValue" value="" /> <input type="hidden"
					id="tValue" value="" />
				<div class="fllist">
					<ul>
						<li><strong>科目：</strong><a href="" id="cAll"
							onclick='searchData("","c")'>全部</a> <a href=""
							id="8c7743e8-0818-41fa-bc86-44407ca2f773"
							onclick="searchData('8c7743e8-0818-41fa-bc86-44407ca2f773','c')">
								英语（二）</a> <a href="" id="e3d9b090-9465-44a1-887c-90d74f7f7899"
							onclick="searchData('e3d9b090-9465-44a1-887c-90d74f7f7899','c')">
								中国近现代史纲要</a> <a href="" id="f3b98347-fe96-49fc-b076-93bd5855341f"
							onclick="searchData('f3b98347-fe96-49fc-b076-93bd5855341f','c')">
								马克思主义基本原理概论</a> <a href="" id="30cfc816-fbc4-4b62-b688-9be0d7b29401"
							onclick="searchData('30cfc816-fbc4-4b62-b688-9be0d7b29401','c')">
								房地产法</a> <a href="" id="8757ba5a-64eb-4a4d-83f6-aa3740cf1a6f"
							onclick="searchData('8757ba5a-64eb-4a4d-83f6-aa3740cf1a6f','c')">
								行政法学</a> <a href="" id="989d8840-4db1-4081-8c2c-6374d26e5940"
							onclick="searchData('989d8840-4db1-4081-8c2c-6374d26e5940','c')">
								劳动法</a> <a href="" id="e8d53554-c58d-4362-a02d-3fb0aab793c1"
							onclick="searchData('e8d53554-c58d-4362-a02d-3fb0aab793c1','c')">
								企业与公司法学</a> <a href="" id="69154904-33f8-4d29-8e03-61519ac50197"
							onclick="searchData('69154904-33f8-4d29-8e03-61519ac50197','c')">
								税法原理</a> <a href="" id="c003fd05-4c88-45cf-9197-95b3015ee51b"
							onclick="searchData('c003fd05-4c88-45cf-9197-95b3015ee51b','c')">
								金融法概论</a> <a href="" id="93d8e17a-4482-4129-b980-b66e9c465015"
							onclick="searchData('93d8e17a-4482-4129-b980-b66e9c465015','c')">
								行政诉讼法</a> <a href="" id="09bd4563-2f40-4894-a83d-c33607f3c6ba"
							onclick="searchData('09bd4563-2f40-4894-a83d-c33607f3c6ba','c')">
								经济法学原理</a> <a href="" id="3fdc1c15-a181-4caf-a119-e7c5ee636269"
							onclick="searchData('3fdc1c15-a181-4caf-a119-e7c5ee636269','c')">
								环境法学</a> <a href="" id="0024e13d-a2b5-46a1-bfda-aefe803aca21"
							onclick="searchData('0024e13d-a2b5-46a1-bfda-aefe803aca21','c')">
								经济法毕业论文</a></li>
						<li><strong>类型：</strong><a href="" id="tAll"
							onclick="searchData('','t')">全部</a> <a href="" id="1"
							onclick="searchData('1','t')"> 复习资料</a> <a href="" id="2"
							onclick="searchData('2','t')"> 练习题</a> <a href="" id="3"
							onclick="searchData('3','t')"> 内部资料</a> <a href="" id="4"
							onclick="searchData('4','t')"> 真题</a></li>
					</ul>
					<div class="cztable">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							style="text-align: center;" id="table">
							<tr style="font-size: 12px">
								<th width="6%">格式</th>
								<th style="padding-left: 20px;">资料名称</th>
								<th style="width: 15%; text-align: center;">资料类型</th>
								<th style="width: 15%; text-align: center;">更新时间</th>
								<th style="width: 15%; text-align: center;">操作</th>
							</tr>
							<%-- <%for(int count=0;count<dList.size();count++){ %>
                <tr  style="font-size:12px">
                <td><img src='images/fileico/doc.gif' /></td>
                    <td class="xxleft" id="type<%=count%>">
                        
                       <%=dList.get(count).getMaterialType() %>
                    </td>
                    <td>
                        复习资料
                    </td>
                    <td id="date<%=count%>">
                    <%SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                    String dateString = formatter.format(dList.get(count).getUploadTime()); %>
                       <%=dateString %>
                    </td>
                    <td>
                        <a href="http://localhost:8080/EducationalManagementSystem/uploadAndDownload/download.do?materialId=<%=dList.get(count).getMaterialId() %>" target="_blank">
                            <img src="images/down.gif" alt="点击下载" /></a>
                    </td>
                </tr>
                <%} %> --%>
							<!-- <tr>
                <td><img src='images/fileico/default.jpg' /></td>
                    <td class="xxleft">
                        
                        环境法学
                    </td>
                    <td>
                        复习资料
                    </td>
                    <td>
                        2018-09-30
                    </td>
                    <td>
                        <a href="" target="_blank">
                            <img src="images/down.gif" alt="点击下载" /></a>
                    </td>
                </tr>
                
                <tr>
                <td><img src='images/fileico/default.jpg' /></td>
                    <td class="xxleft">
                        
                        行政诉讼法
                    </td>
                    <td>
                        复习资料
                    </td>
                    <td>
                        2018-09-30
                    </td>
                    <td>
                        <a href="" target="_blank">
                            <img src="images/down.gif" alt="点击下载" /></a>
                    </td>
                </tr>
                
                <tr>
                <td><img src='images/fileico/default.jpg' /></td>
                    <td class="xxleft">
                        
                        行政诉讼法
                    </td>
                    <td>
                        复习资料
                    </td>
                    <td>
                        2018-09-30
                    </td>
                    <td>
                        <a href="" target="_blank">
                            <img src="images/down.gif" alt="点击下载" /></a>
                    </td>
                </tr>
                
                <tr>
                <td><img src='images/fileico/doc.gif' /></td>
                    <td class="xxleft">
                        
                        税法原理
                    </td>
                    <td>
                        复习资料
                    </td>
                    <td>
                        2018-09-30
                    </td>
                    <td>
                        <a href="" target="_blank">
                            <img src="images/down.gif" alt="点击下载" /></a>
                    </td>
                </tr>
                
                <tr>
                <td><img src='images/fileico/doc.gif' /></td>
                    <td class="xxleft">
                        
                        税法原理
                    </td>
                    <td>
                        复习资料
                    </td>
                    <td>
                        2018-09-30
                    </td>
                    <td>
                        <a href="" target="_blank">
                            <img src="images/down.gif" alt="点击下载" /></a>
                    </td>
                </tr>
                
                <tr>
                <td><img src='images/fileico/doc.gif' /></td>
                    <td class="xxleft">
                        
                        企业与公司法
                    </td>
                    <td>
                        复习资料
                    </td>
                    <td>
                        2018-09-30
                    </td>
                    <td>
                        <a href="" target="_blank">
                            <img src="images/down.gif" alt="点击下载" /></a>
                    </td>
                </tr>
                
                <tr>
                <td><img src='images/fileico/doc.gif' /></td>
                    <td class="xxleft">
                        
                        行政诉讼法
                    </td>
                    <td>
                        练习题
                    </td>
                    <td>
                        2018-09-29
                    </td>
                    <td>
                        <a href="" target="_blank">
                            <img src="images/down.gif" alt="点击下载" /></a>
                    </td>
                </tr>
                
                <tr>
                <td><img src='images/fileico/doc.gif' /></td>
                    <td class="xxleft">
                        
                        环境法学
                    </td>
                    <td>
                        复习资料
                    </td>
                    <td>
                        2018-09-29
                    </td>
                    <td>
                        <a href="" target="_blank">
                            <img src="images/down.gif" alt="点击下载" /></a>
                    </td>
                </tr>
                
                <tr>
                <td><img src='images/fileico/doc.gif' /></td>
                    <td class="xxleft">
                        
                        房地产法
                    </td>
                    <td>
                        复习资料
                    </td>
                    <td>
                        2018-09-29
                    </td>
                    <td>
                        <a href="" target="_blank">
                            <img src="images/down.gif" alt="点击下载" /></a>
                    </td>
                </tr>
                
                <tr>
                <td><img src='images/fileico/doc.gif' /></td>
                    <td class="xxleft">
                        
                        房地产法
                    </td>
                    <td>
                        复习资料
                    </td>
                    <td>
                        2018-09-29
                    </td>
                    <td>
                        <a href="" target="_blank">
                            <img src="images/down.gif" alt="点击下载" /></a>
                    </td>
                </tr>
                
                <tr>
                <td><img src='images/fileico/doc.gif' /></td>
                    <td class="xxleft">
                        
                        房地产法
                    </td>
                    <td>
                        复习资料
                    </td>
                    <td>
                        2018-09-29
                    </td>
                    <td>
                        <a href="" target="_blank">
                            <img src="images/down.gif" alt="点击下载" /></a>
                    </td>
                </tr>
                
                <tr>
                <td><img src='images/fileico/doc.gif' /></td>
                    <td class="xxleft">
                        
                        中国近现代史纲要
                    </td>
                    <td>
                        复习资料
                    </td>
                    <td>
                        2018-09-29
                    </td>
                    <td>
                        <a href="" target="_blank">
                            <img src="images/down.gif" alt="点击下载" /></a>
                    </td>
                </tr>
                
                <tr>
                <td><img src='images/fileico/doc.gif' /></td>
                    <td class="xxleft">
                        
                        中国近现代史纲要
                    </td>
                    <td>
                        复习资料
                    </td>
                    <td>
                        2018-09-29
                    </td>
                    <td>
                        <a href="" target="_blank">
                            <img src="images/down.gif" alt="点击下载" /></a>
                    </td>
                </tr>
                
                <tr>
                <td><img src='images/fileico/doc.gif' /></td>
                    <td class="xxleft">
                        
                        中国近现代史纲要
                    </td>
                    <td>
                        复习资料
                    </td>
                    <td>
                        2018-09-29
                    </td>
                    <td>
                        <a href="" target="_blank">
                            <img src="images/down.gif" alt="点击下载" /></a>
                    </td>
                </tr>
                
                <tr>
                <td><img src='images/fileico/doc.gif' /></td>
                    <td class="xxleft">
                        
                        英语2
                    </td>
                    <td>
                        复习资料
                    </td>
                    <td>
                        2018-09-29
                    </td>
                    <td>
                        <a href="" target="_blank">
                            <img src="images/down.gif" alt="点击下载" /></a>
                    </td>
                </tr>
                
                <tr>
                <td><img src='images/fileico/doc.gif' /></td>
                    <td class="xxleft">
                        
                        英语2
                    </td>
                    <td>
                        复习资料
                    </td>
                    <td>
                        2018-09-29
                    </td>
                    <td>
                        <a href="" target="_blank">
                            <img src="images/down.gif" alt="点击下载" /></a>
                    </td>
                </tr>
                
                <tr>
                <td><img src='images/fileico/doc.gif' /></td>
                    <td class="xxleft">
                        
                        英语2
                    </td>
                    <td>
                        复习资料
                    </td>
                    <td>
                        2018-09-29
                    </td>
                    <td>
                        <a href="" target="_blank">
                            <img src="images/down.gif" alt="点击下载" /></a>
                    </td>
                </tr>
                
                <tr>
                <td><img src='images/fileico/doc.gif' /></td>
                    <td class="xxleft">
                        
                        英语2
                    </td>
                    <td>
                        复习资料
                    </td>
                    <td>
                        2018-09-29
                    </td>
                    <td>
                        <a href="" target="_blank">
                            <img src="images/down.gif" alt="点击下载" /></a>
                    </td>
                </tr>
                
                <tr>
                <td><img src='images/fileico/doc.gif' /></td>
                    <td class="xxleft">
                        
                        英语2
                    </td>
                    <td>
                        复习资料
                    </td>
                    <td>
                        2018-09-29
                    </td>
                    <td>
                        <a href="" target="_blank">
                            <img src="images/down.gif" alt="点击下载" /></a>
                    </td>
                </tr> -->
							<%-- <%double totalPage=dList.size()/10;%> ${pageContext.request.contextPath}/uploadAndDownload/pagination.do?startPape=<%=(int)Math.ceil(totalPage) %>&count=10 --%>
						</table>
						<div class='MainStyle'>
							<div class=''>
								<a id="search" href="javascript:void(0)" target='_self'>首页</a>
							</div>
							<div class=''>
								<a id="descIndex" href='javascript:void(0)' target='_self'>上一页</a>
							</div>
							<%-- <a id="searchCode<%=num+1 %>" target='_self' style="cursor:pointer;"></a> --%>
							<div id="wrapper-250">
								<select id="select">
									<option selected>请选择页</option>
									<%for(int num=0;num<(int)Math.ceil(dListTotal.size()/(15*1.0));num++){ %>
									<option id="option" value="<%=num %>"><%=num+1 %></option>
									<%} %>
								</select>
							</div>
							<!-- <div class=''><a href='' target='_self'>2</a></div>
            <div class=''><a href='' target='_self'>3</a></div> -->
							<div class=''>
								<a href='javascript:void(0)' id="increase" target='_self'>下一页</a>
							</div>
							<div class=''>
								<a href="javascript:void(0)" id="tailPage" target='_self'>尾页</a>
							</div>
							<div class=''>
								总共<b><%=dListTotal.size() %></b>条数据
							</div>
							<div class=''>
								每页<b>15</b>条数据
							</div>
							<div class=''>
								<b id="numCode"></b>/<b><%=(int)Math.ceil(dListTotal.size()/(15*1.0)) %></b>
							</div>
							跳到
							<div class='SearchStyle'>
								<input type='text' id='john_Page_Search'
									onkeydown="if(event.keyCode == 13){page_searchIndex();}" />
							</div>
							<div class=''>
								<input id="inputValue" type='button' value='Go' />
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<div class="footer">
			<p>&copy;copyright 2018 成都理工大学教务管理 版权所有</p>
		</div>
	</div>
</body>
</html>
