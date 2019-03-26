<%@page import="java.text.SimpleDateFormat"%>
<%@page import="cdut.com.cn.ems.entity.MyExamination"%>
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
</title><link href="../style/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="../script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" /><link href="../style/ks.css" rel="stylesheet" type="text/css" />
    <script src="../script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="../script/jBox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <script src="../script/Common.js" type="text/javascript"></script>
    <script src="../script/Data.js" type="text/javascript"></script>
     <%Student student=(Student)session.getAttribute("student"); %>
     <%List<MyExamination> myExaminations=(List<MyExamination>)session.getAttribute("myExamination") ;%>
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
    
    <script src="../script/jquery-1.4.1.js" type="text/javascript"></script>
    <link href="../style/history.css" rel="stylesheet" type="text/css" />
</head>
<body>


    <div class="banner">
        <div class="bgh">
            <div class="page">
                <div id="logo">
                    <a href="../edu_index.jsp">
                        <img src="../images/student/logo.gif" alt="" width="185" height="68" style="margin-top:-12px"/>
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
                    <%=student.getStudent_id()%>学员：<%=student.getStudent_name() %>，欢迎您！ <a href="../myinfor/index.aspx.jsp">我的信息</a> <a href="../user/studentinfor/systemmsge.aspx.jsp">
                        通知</a> <a href="../user/account/changepasswd.aspx.jsp">密码修改</a> <a onclick="loginOut()"
                            href="javascript:">安全退出</a>
                </div>
                <div class="blog_nav">
                    <ul>
                        <li><a href="../edu_index.jsp">首页</a></li>
                        <li><a href="../educationcenter/score.aspx.jsp">教务中心</a></li>
                        <li><a href="../myaccount/wdcw.aspx.jsp">我的学费</a></li>
                        <li><a href="studentmaterial.aspx.jsp">资料中心</a></li>
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
                            <a href="../myinfor/index.aspx.jsp">我的信息</a></div>
                        <div>
                            <a href="../myinfor/classinfo.aspx.jsp">班级信息 </a>
                        </div>
                        <div>
                            <a href="../user/studentinfor/letter.aspx.jsp">短信息</a></div>
                        <div>
                            <a href="../user/studentinfor/systemmsge.aspx.jsp">学院通知</a></div>
                        <div>
                            <a href="../myinfor/objection.aspx.jsp">我的异议</a></div>
                    </div>
                    <div class="ta1">
                        <strong>教务中心</strong>
                        <div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="../educationcenter/application.aspx.jsp">我的报考</a></div>
                        <div>
                            <a href="../educationcenter/score.aspx.jsp">我的成绩</a></div>
                        <div>
                            <a href="../educationcenter/book.aspx.jsp">我的书籍</a></div>
                    </div>
                    <div class="ta1">
                        <strong>学习中心</strong><div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="studentmaterial.aspx.jsp">资料下载</a></div>
                        <div>
                            <a href="studentstudyrecordlist.aspx.jsp">学习历程</a></div>
                    </div>
                   
                    <div class="ta1">
                        <strong>财务中心</strong><div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="../myaccount/wdcw.aspx.jsp">我的财务</a></div>
                    </div>
<div class="ta1">
                        <a href="" target="_blank"><strong>教学系统</strong></a>
                        <div class="leftbgbt2">
                        </div>
                    </div>
                </div>
            </div>
            <div class="rightbox">
                
    <h2 class="mbx">
        教学中心 &gt; 我的学习历程</h2>
    <div class="history">
        <div class="history-date">
            <ul id="hData">
            </ul>
        </div>
    </div>
    <div class="time_bm">
    <%for(MyExamination myExamination:myExaminations){ %>
    <%SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String dateString = formatter.format(myExamination.getCreateTime()); %>
        <span style="color: red"><%=dateString %></span>我报考了<span style="color: red"><%=myExamination.getExaminationName() %></span>，重新打开学习之门！<br><%} %></div>
    <input type="hidden" id="stuId" value="7c50f70a-775b-4aef-8bf2-5010ec612c0d" />
    <script type="text/javascript">
        var pageIndex = 1; //当前加载页数
        var hasData = true; //是否还有数据可以加载
        var yearData = ""; //年份
        var monthData = ""; //月.日
        var $dt = null; //追加数据的jq对象
        function loadData() {
            if (hasData) {
                var stuId = $("#stuId").val();
                if (stuId.length > 1) {
                    $.ajax({
                        url: "StudyGetData.ashx",
                        type: "post",
                        data: "stuId=" + stuId + "&pageIndex=" + pageIndex,
                        success: function (data) {
                            pageIndex++;
                            var s1 = data.split('$1$')[0];
                            if (s1 == "0") {
                                hasData = false;
                            }
                            var s2 = data.split('$1$')[1];
                            showData(s2);
                        }
                    });
                }
            }
        }
        function showData(str) {
            var s3 = str.split('$3$');
            for (i = 0; i < s3.length; i++) {
                var s4 = s3[i].split('$2$');
                if (s4[0] != yearData) {
                    var t = "<li><h2 class='first'><a href='#nogo'>" + s4[0] + "年</a></h2></li>";
                    $("#hData").append(t);
                    yearData = s4[0];
                }
                if (s4[1] != monthData) {
                    var $li = $("<li class='green'><h3>" + s4[1] + "<span>" + yearData + "</span></h3></li>");
                    var $div = $("<div class='lc_right'></div>");
                    var $dl = $("<dl></dl>");
                    var $tdiv = $("<div class='time_ico'></div>");
                    $dt = $("<dt></dt>");
                    $dt.appendTo($dl);
                    $tdiv.appendTo($dl);
                    $dl.appendTo($div);
                    $div.appendTo($li);
                    $li.appendTo($("#hData"));
                    monthData = s4[1];
                }
                if ($dt) {
                    var pathA = s4[6];
                    var $span;
                    if (pathA.length < 1) {
                        $span = $("<span>" + s4[2] + " " + s4[3] + "<a>" + s4[4] + "</a>  " + s4[5] + "</span>");
                    } else {
                        $span = $("<span>" + s4[2] + " " + s4[3] + "<a href='" + pathA + "' target='_blank'>" + s4[4] + "</a>  " + s4[5] + "</span>");
                    }
                    $dt.append($span);
                }
            }
        }

        function reachBottom() {
            var scrollTop = 0;
            var clientHeight = 0;
            var scrollHeight = 0;
            if (document.documentElement && document.documentElement.scrollTop) {
                scrollTop = document.documentElement.scrollTop;
            } else if (document.body) {
                scrollTop = document.body.scrollTop;
            }
            if (document.body.clientHeight && document.documentElement.clientHeight) {
                clientHeight = (document.body.clientHeight < document.documentElement.clientHeight) ? document.body.clientHeight : document.documentElement.clientHeight;
            } else {
                clientHeight = (document.body.clientHeight > document.documentElement.clientHeight) ? document.body.clientHeight : document.documentElement.clientHeight;
            }
            scrollHeight = Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
            alert(scrollTop);
            if (scrollTop + clientHeight == scrollHeight) {
                return true;
            } else {
                return false;
            }
        }
        $(function () {
            $(window).scroll(function () {
                var sTop = $(this).scrollTop();
                var sHeight = $(this).height();
                var scrollHeight = Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
                if (sTop + sHeight == scrollHeight) {
                    loadData();
                }
            });
            loadData();
        });
     
    </script>

            </div>
        </div>
        <div class="footer">
            <p>
                &copy;copyright 2018 成都理工大学教务管理 版权所有</p>
        </div>
    </div>
</body>
</html>
