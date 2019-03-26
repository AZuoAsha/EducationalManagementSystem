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
<script src="js/jquery.form.js" type="text/javascript"></script>
<%Student student=(Student)session.getAttribute("student"); %>
<style type="text/css">
#mybackground {
	background: #F0FCFC;
}
</style>
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

<script type="text/javascript">
        function submitMail() {
            var mtitle = "联系方式有修改";
            var html = "<div style='padding:10px;'><div style='width:65px; height:120px; float:left;'>修改的地方：</div><div style='width:250px; height:120px; float:left;'><textarea id='objeCont' name='objeCont' style='width:250px; height:105px;'></textarea></div></div>";

            var submit = function (v, h, f) {
                if (f.objeCont == '' || f.objeCont.length > 80) {
                    $.jBox.tip("请您输入新的联系方式，且为11位数字！", 'error', { focusId: "objeCont" }); // 关闭设置 objeCont 为焦点
                    return false;
                }

                StudentCompain.insertCompain('', mtitle, 5, f.objeCont, function (data) {
                    var obj = $.parseJSON(data);
                    var resultObj = false;
                    if (obj.ok) {
                        $.jBox.tip("成功提交联系方式的修改邮件！");
                    }
                });

                //验证输入的电话号码
                var pattern = /^1[34578]\d{9}$/; 
                var phone=pattern.test(f.objeCont);
               // alert(phone);
                if(phone==false){
                	$.jBox.tip("请您输入有效的电话号码！且为11位数字");
                	return false;
                 }
                
                
                $.ajax({
                    type: "post",
                    url: "ems/update.do",
                    data:{"student_id": <%= student.getStudent_id()%>,
                        "phone": f.objeCont},
                    dataType: "json",
                    success: function (data, textStatus, jqXHR) {
                    // alert("请求成功"+data);
                    if(data=='success'){
                    	 jBox.tip("成功修改联系方式！");
                         setTimeout(function () {
                             window.location.reload();
                         }, 1000);
                    return false;
                    }else{
                   	 jBox.tip("修改联系地址失败！");
                    return false;
                    }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                   	 jBox.tip("请求失败！");
                }
            });
                
            };

            $.jBox(html, { title: "联系方式修改的邮件", submit: submit });
        }

        function studentsInfo() {
            $.jBox.tip("数据提交成功！");
            setTimeout(function () {
                window.location.reload();
            }, 1500);
        }
        //上传头像
        function ajaxSubmitForm() {
            var options = {
                url : 'ems/upload.do',
               type : 'POST',
               dataType : 'json',
               header : {"ClientCallMode" : "ajax"}, //添加请求头部
               success : function(data) {
					if("success"==data){
                	   jBox.tip("上传成功！");
                	   setTimeout(function () {
                           window.location.reload();
                       }, 1500);
                   }
                   else{
                	   jBox.tip("上传失败,请联系管理员！");
                    return;
                   }
               },
               error: function(data) {
            	   jBox.tip("服务器出现错误！");
               }
            };
           $("#userForm").ajaxSubmit(options);
           return false; //最好返回false，因为如果按钮类型是submit,则表单自己又会提交一次;返回false阻止表单再次提交
       }
       
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

				<h2 class="mbx">我的信息 &gt; 个人资料 &nbsp;&nbsp;&nbsp;</h2>
				<div class="morebt">


					<ul id="ulStudMsgHeadTab">
						<li><a class="tab2" onclick="" href="myinfor/index.aspx.jsp">个人资料</a>
						</li>
						<li><a class="tab2" onclick=""
							href="myinfor/classinfo.aspx.jsp">班级信息</a></li>
						<li><a class="tab2" onclick=""
							href="user/studentinfor/letter.aspx.jsp">短信息</a></li>
						<li><a class="tab2" onclick=""
							href="user/studentinfor/systemmsge.aspx.jsp">通知<span
								style="color: #ff0000; padding-left: 5px;"
								id="unreadSysMsgCount"></span></a></li>
						<li><a class="tab2" onclick=""
							href="myinfor/objection.aspx.jsp">我的异议</a></li>
					</ul>

				</div>
				<div class="cztable">
					<table width="100%" cellpadding="0" cellspacing="0"
						style="font-size: 12px">
						<tr>
							<td align="right" width="80" id="mybackground">姓名</td>
							<td><%=student.getStudent_name() %>&nbsp;</td>
							<td align="right" width="90" id="mybackground">身份证号码</td>
							<td><%=student.getStudent_idcard() %>&nbsp;</td>

							<td rowspan="8" align="center"><div align="center"
									style="padding:5px 5px 5px; border:1px #ddd solid;background-image:url('<%=student.getStudent_header() %>');background-size: 100% 100%;width:140px;height:180px;">
									<form id="userForm" method="post" action="ems/upload.do"
										enctype="multipart/form-data" class="bl-form bl-formhor fl">
										<input accept="image/*" name="identitypic"
											onchange="javascript:ajaxSubmitForm();" type="file"
											id="pic_face" height="180" width="140"
											style="opacity: 0; border: 1px #ddd solid; width: 100%; height: 100%; cursor: pointer">
									</form>
									<!-- <img id="pic_face"  onclick="uploadHeader()" height="160" width="120" src="images/student/photo.jpg" style="padding:2px 2px 5px; border:1px #ddd solid;"> -->
								</div>&nbsp;以上是学籍照片</td>
						</tr>
						<tr>
							<td align="right" style="color: green" id="mybackground">核对姓名拼音</td>
							<td>
								<!-- <select><option>选择性别</option><option>男</option><option>女</option></select> -->
								<input>&nbsp;
							</td>
							<td align="right" id="mybackground">考生号</td>
							<td><%=student.getStudent_id() %>&nbsp;</td>
						</tr>
						<tr>
							<td align="right" id="mybackground">政治面貌</td>
							<td><select><option>共青团员</option>
									<option>中共预备党员</option>
									<option>中共共产党员</option></select>&nbsp;</td>
							<td align="right" id="mybackground">性别</td>
							<td>男&nbsp;</td>
						</tr>
						<tr>
							<td align="right" id="mybackground">学习方式</td>
							<td>普通全日制&nbsp;</td>
							<td align="right" id="mybackground">籍贯</td>
							<td><input>(省县/省市)&nbsp;</td>
						</tr>
						<tr>
							<td align="right" id="mybackground">高考省份</td>
							<td><input>&nbsp;</td>

							<td align="right" id="mybackground">民族</td>
							<td>彝&nbsp;</td>
						</tr>
						<tr>
							<td align="right" id="mybackground">毕业类型</td>
							<td><select><option>高中毕业</option>
									<option>初中毕业</option>
									<option>小学毕业</option></select>&nbsp;</td>
							<td align="right" id="mybackground">毕业中学：</td>
							<td><input>&nbsp;</td>
						</tr>

						<tr>
							<td colspan="4" align="center">学生在校当前最新学籍信息</td>

						</tr>
						<tr>
							<td align="right" id="mybackground">学院</td>
							<td><%=student.getStudent_college() %></td>
							<td align="right" id="mybackground">专业</td>
							<td><%=student.getFirstProfession() %></td>

						</tr>
						<tr>
							<td align="right" id="mybackground">班级</td>
							<td><%=student.getStudent_profession() %></td>
							<td align="right" id="mybackground">当前级</td>
							<td colspan="4"><%=student.getBaomingTime() %></td>

						</tr>
						<tr>
							<td align="right" id="mybackground">学制</td>
							<td>四年</td>
							<td align="right" id="mybackground">培养层次</td>
							<td colspan="4"><%=student.getBaokaoCengci() %></td>

						</tr>
						<tr>
							<td align="right" id="mybackground">联系地址</td>
							<td colspan="5"><%=student.getAddress() %></td>
						</tr>
						<tr>
							<td colspan="5" align="left" style="color: green">【姓名拼音填写：系统自动生成多个拼音的，请删除不正确的，仅保留一个正确的姓名拼音即可】</td>

						</tr>
						<tr>
							<td align="right" id="mybackground">手机号码</td>
							<td><input></td>
							<td align="right" id="mybackground">家庭固定电话</td>
							<td colspan="4"><input></td>

						</tr>
						<tr>
							<td align="right" id="mybackground">QQ</td>
							<td><input></td>
							<td align="right" id="mybackground">邮政编码</td>
							<td colspan="4"><input></td>

						</tr>
						<tr>
							<td align="right" id="mybackground">电子邮件</td>
							<td><input></td>
							<td align="right" id="mybackground">父、母姓名</td>
							<td colspan="4"><input></td>

						</tr>
						<tr>
							<td align="right" id="mybackground">家庭详细地址</td>
							<td colspan="5"><input style="width: 580px"></td>
						</tr>
						<tr>
							<td align="right" id="mybackground">个人特长</td>
							<td colspan="5"><input style="width: 580px">100字内</td>
						</tr>
						<tr>
							<td align="right" id="mybackground">获奖情况</td>
							<td colspan="5"><input style="width: 580px">100字内</td>
						</tr>

						<tr>
							<td colspan="5" align="left" style="color: green">以下是火车优惠卡信息<span
								style="color: red">(需要乘火车的同学请认真填写，不得填写与家庭居住地无关的地址，填写后不可变改！)</span></td>

						</tr>
						<tr>
							<td align="center" rowspan="2"
								style="color: black; font-size: 16px" id="mybackground">火车优惠</td>
							<td>乘车起点</td>
							<td align="center">乘车终点（只填写地名）</td>
							<td>注意事项</td>
							<td>简写家庭地址/市县即可（8字内）</td>
						</tr>
						<tr>
							<td>成都站——</td>
							<td align="right"><input></td>
							<td>如实填写家庭地址</td>
							<td><input></td>
						</tr>
						<tr>
							<td colspan="5" align="center" style="font-weight: bold">请认真填写以上信息</td>

						</tr>

						<tr>
							<td align="right" id="mybackground">学籍情况</td>
							<td colspan="5">（当前学籍状态：<%=student.getStatus() %>）——学籍动态记录：...
							</td>
						</tr>

						<tr align="center">
							<td colspan="5" height="40">
								<div align="center">

									<input type="button" id="button2" value="联系方式有修改"
										onclick="submitMail()" class="input2" />

                                    <input type="button" id="button2" value="提交信息" class="input2" onclick="studentsInfo()"/>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="5" align="left" style="color: #FF359A">注：*请认真填写，提交七天后不能再修改，如果本人照片有问题或没有，请自行准备一张标准证件照，并以自己学号命名交至本学院办公室学籍管理老师处。*.
								<p style="color: black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;以上信息属学生学籍学历基本信息库，学生必须准确填写。若因所填写内容与本人实际不符合或存在任何虚假信息，造成一切后果，概由学生本人承担相应的责任，此信息将载入学生档案。</p>
							</td>
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
