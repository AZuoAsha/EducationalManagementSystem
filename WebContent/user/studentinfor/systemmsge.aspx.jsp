<%@page import="java.text.SimpleDateFormat"%>
<%@page import="cdut.com.cn.ems.entity.CollegeNotice"%>
<%@page import="java.util.List"%>
<%@page import="cdut.com.cn.ems.entity.Teacher"%>
<%@page import="cdut.com.cn.ems.entity.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>
	学生信息管理平台
</title><link href="../../style/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="../../script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" /><link href="../../style/ks.css" rel="stylesheet" type="text/css" />
    <script src="../../script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../../script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../../script/jBox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <script src="../../script/Common.js" type="text/javascript"></script>
    <script src="../../script/Data.js" type="text/javascript"></script>
     <%Student student=(Student)session.getAttribute("student"); %>
     <%List<CollegeNotice> collegeNotices=(List<CollegeNotice>)session.getAttribute("collegeNotice"); %>
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
    function showMsg(msg, obj) {
        jBox.tip(msg);
        $("#" + obj).focus();
    }

    function modifySystemMsgeStatus(smid, smtype) {
        var result = false;
        studentInfo.modifySystemMesgeStatus(smid, smtype, function (data) {
            var result = $.parseJSON(data);
            if ((String(result.ok) == "true")) {
                jBox.alert("成功标记为已读！", "提示");
                setTimeout(function () {
                    window.location.reload();
                }, 1500);
            }
            else {
                $.jBox.error(result.message, '提示');
            }
        });
        return result;
    }
</script>
</head>
<body>

    <div class="banner">
        <div class="bgh">
            <div class="page">
                <div id="logo">
                    <a href="../../edu_index.jsp">
                        <img src="../../images/student/logo.gif" alt="" width="185" height="68" style="margin-top:-12px"/>
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
                    <%=student.getStudent_id() %>学员：<%=student.getStudent_name() %>，欢迎您！ <a href="../../myinfor/index.aspx.jsp">我的信息</a> <a href="systemmsge.aspx.jsp">
                        通知</a> <a href="../account/changepasswd.aspx.jsp">密码修改</a> <a onclick="loginOut()"
                            href="javascript:">安全退出</a>
                </div>
                <div class="blog_nav">
                    <ul>
                        <li><a href="../../edu_index.jsp">首页</a></li>
                        <li><a href="../../educationcenter/score.aspx.jsp">教务中心</a></li>
                        <li><a href="../../myaccount/wdcw.aspx.jsp">我的学费</a></li>
                        <li><a href="../../onlineteaching/studentmaterial.aspx.jsp">资料中心</a></li>
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
                            <a href="../../myinfor/index.aspx.jsp">我的信息</a></div>
                        <div>
                            <a href="../../myinfor/classinfo.aspx.jsp">班级信息 </a>
                        </div>
                        <div>
                            <a href="letter.aspx.jsp">短信息</a></div>
                        <div>
                            <a href="systemmsge.aspx.jsp">学院通知</a></div>
                        <div>
                            <a href="../../myinfor/objection.aspx.jsp">我的异议</a></div>
                    </div>
                    <div class="ta1">
                        <strong>教务中心</strong>
                        <div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="../../educationcenter/application.aspx.jsp">我的报考</a></div>
                        <div>
                            <a href="../../educationcenter/score.aspx.jsp">我的成绩</a></div>
                        <div>
                            <a href="../../educationcenter/book.aspx.jsp">我的书籍</a></div>
                    </div>
                    <div class="ta1">
                        <strong>学习中心</strong><div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="../../onlineteaching/studentmaterial.aspx.jsp">资料下载</a></div>
                        <div>
                            <a href="../../onlineteaching/studentstudyrecordlist.aspx.jsp">学习历程</a></div>
                    </div>
                   
                    <div class="ta1">
                        <strong>财务中心</strong><div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="../../myaccount/wdcw.aspx.jsp">我的财务</a></div>
                    </div>
<div class="ta1">
                        <a href="" target="_blank"><strong>教学系统</strong></a>
                        <div class="leftbgbt2">
                        </div>
                    </div>
                </div>
            </div>
            <div class="rightbox">
                
<h2 class="mbx">我的信息 &gt; 通知</h2>
<div class="morebt">
    

<ul id="ulStudMsgHeadTab">
    <li><a class="tab2" onclick="" href="../../myinfor/index.aspx.jsp">个人资料</a> </li>
    <li><a class="tab2" onclick="" href="../../myinfor/classinfo.aspx.jsp">班级信息</a></li>
    <li><a class="tab2" onclick="" href="letter.aspx.jsp">短信息</a></li>
    <li><a class="tab2" onclick="" href="systemmsge.aspx.jsp">通知<span style="color:#ff0000; padding-left:5px;" id="unreadSysMsgCount"></span></a></li>
    <li><a class="tab2" onclick="" href="../../myinfor/objection.aspx.jsp">我的异议</a></li>
</ul>

</div>
<div class="cztable">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <th style="text-align:left;" width="5%">序号</th>
            <th style="text-align:left;" width="10%">类型</th>
            <th width="15%">标题</th>
            <th width="20%">内容</th>
            <th style="text-align:left;" width="10%">添加时间</th>
            <th style="text-align:left;" width="8%">操作</th>
        </tr>
        <%for(int i=0;i<collegeNotices.size();i++){ %>
        <tr style="height: 28px;color:red" class="tdbg" align="left">
            <td width="5%"><%=i+1 %></td>
             <td width="10%"><%=collegeNotices.get(i).getNoticeType() %></td>
              <td width="15%"><%=collegeNotices.get(i).getNoticeTitle() %></td>
               <td width="20%"><%=collegeNotices.get(i).getNoticeContext() %></td>
               <%SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                    String dateString = formatter.format(collegeNotices.get(i).getCreateTime()); %>
                <td width="10%"><%=dateString%></td>
                 <td width="8%"></td>
        </tr>
        <%} %>
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
