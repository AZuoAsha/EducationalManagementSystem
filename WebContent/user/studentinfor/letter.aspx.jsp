<%@page import="java.text.SimpleDateFormat"%>
<%@page import="cdut.com.cn.ems.entity.Message"%>
<%@page import="java.util.List"%>
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
<title>
	学生信息管理平台
</title><link href="style/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" /><link href="style/ks.css" rel="stylesheet" type="text/css" />
    <script src="script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="script/jBox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <script src="script/Common.js" type="text/javascript"></script>
    <script src="script/Data.js" type="text/javascript"></script>
     <%Student student=(Student)session.getAttribute("student"); %>
     <%List<Message> messages=(List<Message>)session.getAttribute("messageList"); %>
    <script type="text/javascript">
        $().ready(function () {
            setStudMsgHeadTabCheck();
            showUnreadSysMsgCount();
        });

        function returnBack(){
           
            	window.history.back(-1);
                
        	
            }

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
    
<script type="text/javascript">
    function returnIndex() {
        window.location = "/Index.aspx";
    }
    function showMsg(msg, obj) {
        jBox.tip(msg);
        $("#" + obj).focus();
    }
    function saveClick(studentId) {
        var Ctitle = $("#Ctitle").val();   //消息标题
        if (Ctitle == "" || Ctitle.length>20) {
            showMsg("请您输入消息标题,且不超过20个字！", "Ctitle");
            return false;
        }
        var receiver_id=$("#teacher_id").val();
        if (receiver_id == "" || receiver_id.length!=12) {
            showMsg("请您输入接收者工号,且为12为数字！", "Ctitle");
            return false;
        }
        var Ctype = $("#Ctype").val();  //消息类型
        if (Ctype == ("Unselected")) {
            showMsg("请您选择投诉类型！", "Ctype");
            return false;
        }
        var Ccontent = $("#Ccontent").val(); //消息内容
        if (Ccontent == "" || Ccontent.length>80) {
            showMsg("请您输入消息内容，且不超过80个字！", "Ccontent");
            return false;
        }
        
        
        StudentCompain.insertCompain(studentId, Ctitle, Ctype, Ccontent, function (data) {
            var obj = $.parseJSON(data);
            if (obj.ok == true) {
                jBox.alert(obj.message, "提示");
                setTimeout(function () {
                    window.location.reload();
                }, 1500);
            }
            else {
                jBox.tip(obj.message);
            }
        });

        $.ajax({
            type: "post",
            url: "message/add.do",
            dataType: "json",
            data:{"messageTitle": Ctitle,
                 "messageType":Ctype,
                 "messageContext":Ccontent,
                 "receiver_id":receiver_id
                 },
            success: function (data, textStatus, jqXHR) {
            // alert("请求成功"+data);
            if(data=='1'){
            	/* run(); 
            	var interval;
            	var number=3; 
            	function run(){ 
            	interval = setInterval(chat,"1000"); 
            	} 
            	function chat(){
					number--;
					jBox.alert('成功提交！'+number+'秒后自动关闭', "提示");
                }
            	
                setTimeout(function () {
                    window.location.reload();
                }, 3000);
            return false; */
            	jBox.tip('提交成功！');
            setTimeout(function () {
                window.location.reload();
            }, 1000);
            }else{
           	 jBox.tip("提交失败！");
            return false;
            }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
           	 jBox.tip("请求失败！");
        }
    });
    }
</script>
</head>
<body>

    <div class="banner">
        <div class="bgh">
            <div class="page">
                <div id="logo">
                    <a href="edu_index.jsp">
                        <img src="images/student/logo.gif" alt="" width="185" height="68" style="margin-top:-12px"/>
                    </a>
                </div>
                <div class="topxx">
                    <select onchange="changeCateory($(this))" style="font-size: 11px; background: #fff;color: #ccc;border:#fff">
                        
                        <option 
                            value="4">
                            远程</option>
                        
                        <option selected='selected'
                            value="1">
                            自考</option>
                        
                    </select>
                    <%=student.getStudent_id() %>学员：<%=student.getStudent_name() %>，欢迎您！ <a href="myinfor/index.aspx.jsp">我的信息</a> <a href="user/studentinfor/systemmsge.aspx.jsp">
                        通知</a> <a href="user/account/changepasswd.aspx.jsp">密码修改</a> <a onclick="loginOut()"
                            href="javascript:">安全退出</a>
                </div>
                <div class="blog_nav">
                    <ul>
                        <li><a href="edu_index.jsp">首页</a></li>
                        <li><a href="educationCenter/Score.aspx.jsp">教务中心</a></li>
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
                        <div class="leftbgbt">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="myinfor/index.aspx.jsp">我的信息</a></div>
                        <div>
                            <a href="myinfor/classinfo.aspx.jsp">班级信息 </a>
                        </div>
                        <div>
                            <a href="user/studentinfor/letter.aspx.jsp">短信息</a></div>
                        <div>
                            <a href="user/studentinfor/systemmsge.aspx.jsp">学院通知</a></div>
                        <div>
                            <a href="myinfor/objection.aspx.jsp">我的异议</a></div>
                    </div>
                    <div class="ta1">
                        <strong>教务中心</strong>
                        <div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="educationcenter/application.aspx.jsp">我的报考</a></div>
                        <div>
                            <a href="educationcenter/score.aspx.jsp">我的成绩</a></div>
                        <div>
                            <a href="educationcenter/book.aspx.jsp">我的书籍</a></div>
                    </div>
                    <div class="ta1">
                        <strong>学习中心</strong><div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="onlineteaching/studentmaterial.aspx.jsp">资料下载</a></div>
                        <div>
                            <a href="onlineteaching/studentstudyrecordlist.aspx.jsp">学习历程</a></div>
                    </div>
                   
                    <div class="ta1">
                        <strong>财务中心</strong><div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="myaccount/wdcw.aspx.jsp">我的财务</a></div>
                    </div>
<div class="ta1">
                        <a href="" target="_blank"><strong>教学系统</strong></a>
                        <div class="leftbgbt2">
                        </div>
                    </div>
                </div>
            </div>
            <div class="rightbox">
                
<h2 class="mbx">我的信息 &gt; 短信息</h2>
<div class="morebt">
    

<ul id="ulStudMsgHeadTab">
    <li><a class="tab2" onclick="" href="myinfor/index.aspx.jsp">个人资料</a> </li>
    <li><a class="tab2" onclick="" href="myinfor/classinfo.aspx.jsp">班级信息</a></li>
    <li><a class="tab1" onclick="" href="studentinfor/letter.aspx.jsp">短信息</a></li>
    <li><a class="tab2" onclick="" href="user/studentinfor/systemmsge.aspx.jsp">通知<span style="color:#ff0000; padding-left:5px;" id="unreadSysMsgCount"></span></a></li>
    <li><a class="tab2" onclick="" href="myinfor/objection.aspx.jsp">我的异议</a></li>
</ul>

</div>
<div class="cztable">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size:12px">
        <tr>
            <th style="text-align:center;" width="5%">序号</th>
            <th style="text-align:center;" width="10%">类型</th>
            <th width="15%">标题</th>
            <th width="20%">内容</th>
            <th style="text-align:center;" width="18%">添加时间</th>
            <th style="text-align:center;" width="13%">状态</th>
        </tr>
        <%for(int j=0;j<messages.size();j++){ %>
        <tr style="height: 28px;color:red" class="tdbg" align="center">
            <td width="5%"><%= j+1%></td>
            <td width="10%"><%=messages.get(j).getMessageType() %></td>
            <td width="15%"><%=messages.get(j).getMessageTitle() %></td>
            <td width="20%"><%=messages.get(j).getMessageContext() %></td>
            <%SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String dateString = formatter.format(messages.get(j).getCreateTime()); %>
            <td width="18%"><%= dateString%></td>
            <td width="13%">未读</td>
        </tr>
        <%} %>
    </table>
</div>

<div class="cztable">
<h2 class="mbx">我的信息 &gt; 给辅导员发短信</h2>

    <table width="100%" cellpadding="0" cellspacing="0" style="font-size:12px">
        <tr>
            <td width="15%" align="right"><div align="right">信息主题： </div></td>
            <td><input id="Ctitle" size="20" name="Ctitle" class="input_2"/></td>
        </tr>
        
        <tr>
            <td width="15%" align="right"><div align="right">接收着工号： </div></td>
            <td><input id="teacher_id" size="20" name="teacher_id" class="input_2"/></td>
        </tr>
        
        <tr>
            <td width="15%" align="right"><div align="right">信息类型： </div></td>
            <td>
                <select id="Ctype" name="Ctype">
                    <option value="Unselected">请选择</option>
                    <option value="投诉">投诉</option>
                    <option value="意见">意见</option>
                    <option value="提问">提问</option>
                    <option value="邮件">邮件</option>
                </select>
            </td>
        </tr>
        <tr>
            <td width="15%" align="right"><div align="right">信息内容： </div></td>
            <td><textarea name="Ccontent" cols="80" rows="5" id="Ccontent" class="input_2"></textarea></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <div align="center" >
                    <input type="submit" value="提交" onclick="saveClick('7c50f70a-775b-4aef-8bf2-5010ec612c0d')" class="input2" />
                    <input type="submit" value="返回" onclick="returnBack()" class="input2" />
                </div>
            </td>
        </tr>
    </table>
</div>

            </div>
        </div>
        <div class="footer">
            <p>
                &copy;copyright 2018 成都理工大学教务管理 版权所有</p>
        </div>
    </div>
</body>
</html>
