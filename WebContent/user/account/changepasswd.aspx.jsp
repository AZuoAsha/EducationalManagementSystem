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
<base  href="<%=basePath%>">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>学生信息管理平台</title>
<link href="style/StudentStyle.css" rel="stylesheet"
	type="text/css" />
<link href="script/jBox/Skins/Blue/jbox.css" rel="stylesheet"
	type="text/css" />
<link href="style/ks.css" rel="stylesheet" type="text/css" />
<script src="script/jBox/jquery-1.4.2.min.js"
	type="text/javascript"></script>
<script src="script/jBox/jquery.jBox-2.3.min.js"
	type="text/javascript"></script>
<script src="script/jBox/i18n/jquery.jBox-zh-CN.js"
	type="text/javascript"></script>
<script src="script/Common.js" type="text/javascript"></script>
<script src="script/Data.js" type="text/javascript"></script>
<%Student student=(Student)session.getAttribute("student"); %>
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
               /*  StudentLogin.loginOut(function (data) {
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

<script type="text/javascript" language="javascript">
    function changePassword() {
        var oldPwd = $("#txtOldPwd").val();
        var newPwd = $("#txtNewPwd").val();
        var confirmNewPwd = $("#txtConfirmNewPwd").val();

        if (oldPwd == "" || newPwd == "" || confirmNewPwd=="") {
            $.jBox.tip("学号或新密码或确认新密码不能为空！", 'error');
            return false;
        }
        if (oldPwd.length < 6 || oldPwd.length > 16) {
            $.jBox.tip("学号为6~16个字符，区分大小写！", 'error');
            return false;
        }
        if (newPwd.length < 6 || newPwd.length > 16) {
            $.jBox.tip("新密码为6~16个字符，区分大小写！", 'error');
            return false;
        }
        if (newPwd != confirmNewPwd) {
            $.jBox.tip("新密码两次输入不一致！", 'error');
            return false;
        }

        $.ajax({
            type: "get",
             url: "ems/findOne.do?student_id=" + oldPwd ,
            dataType: "json",
            success: function (data, textStatus, jqXHR) {
                if(data=='success'){
                 $.ajax({
                         type: "get",
                         url: "ems/update.do?student_id=" + oldPwd + "&password=" + newPwd+"&confirmpassword="+confirmNewPwd,
                         dataType: "json",
                         success: function (data, textStatus, jqXHR) {
                         // alert("请求成功"+data);
                         if(data=='success'){
                        	 jBox.tip("密码修改成功！");
                             setTimeout(function () {
                                 window.location.reload();
                             }, 1000);
                         return false;
                         }else{
                        	 jBox.tip("密码修改失败！");
                         return false;
                         }
                         },
                         error: function (XMLHttpRequest, textStatus, errorThrown) {
                        	 jBox.tip("请求失败！");
                     }
                 });
                }else{
                	jBox.tip("此用户不存在！");
                    return false;
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
            	jBox.tip("请求失败！");
            }
        });
        
       
        studentAccount.changePassword(oldPwd, newPwd, function (data) {
            var obj = $.parseJSON(data);
            if (obj.ok) {
                jBox.alert(obj.message, "提示");
                setTimeout(function () {
                    window.location.reload();
                }, 1500);
            }
            else {
                jBox.tip(obj.message, 'error');
            }
        });
    }
</script>
<style type="text/css">
.txtinput1 {
	width: 180px;
}
</style>
</head>
<body>

	<div class="banner">
		<div class="bgh">
			<div class="page">
				<div id="logo">
					<a href="edu_index.jsp"> <img
						src="images/student/logo.gif" alt="" width="185" height="68"
						style="margin-top: -12px" />
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
						href="user/account/changepasswd.aspx.jsp">密码修改</a> <a onclick="loginOut()"
						href="javascript:">安全退出</a>
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

				<h2 class="mbx">我的信息 &gt; 密码修改</h2>
				<div class="cztable">
					<table border="0" cellspacing="0" cellpadding="0" width="500px"
						style="margin: 30px auto 0px auto;font-size:12px">
						<tr align="center">
							<th style="width: 20%; text-align: left;">学号：</th>
							<td style="width: 70%; text-align: left;"><input
								id="txtOldPwd" value="" type="text" class="input_2 txtinput1" /></td>
						</tr>
						<tr align="center">
							<th style="width: 20%; text-align: left;">新密码：</th>
							<td style="width: 70%; text-align: left;"><input
								id="txtNewPwd" value="" type="password"
								class="input_2 txtinput1" />&nbsp;&nbsp;6~16个字符，区分大小写</td>
						</tr>
						<tr align="center">
							<th style="width: 20%; text-align: left;">确认新密码：</th>
							<td style="width: 70%; text-align: left;"><input
								id="txtConfirmNewPwd" value="" type="password"
								class="input_2 txtinput1" /></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;"><input
								type="submit" id="btnSubmit" value="确认修改"
								onclick="changePassword()" class="input2" /></td>
						</tr>
					</table>
				</div>

			</div>
		</div>
		<div class="footer">
			<p>&copy;copyright 2018 成都理工大学教务管理 版权所有</p>
		</div>
	</div>
</body>
</html>
