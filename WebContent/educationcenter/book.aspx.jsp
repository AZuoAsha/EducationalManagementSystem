<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="cdut.com.cn.ems.entity.MyBook"%>
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
     <%List<MyBook> books=(List<MyBook>)session.getAttribute("findBook") ;%>
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
            	window.location.href = 'http://localhost:8080/EducationalManagementSystem/ems/logout.do';
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
    
    <script src="../script/Base.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">

        function confirmStatus(bid) {
            if (confirm("确定确认无误吗？") == true) {
                senateCenter.modifyStudentBookStatus(bid, 2, function (data) {
                    var result = $.parseJSON(data);
                    if ((String(result.ok) == "true")) {
                        jBox.alert(result.message, "提示");
                        setTimeout(function () {
                            window.location.reload();
                        }, 1500);
                    }
                    else {
                        jBox.tip(result.message);
                    }
                });
            }
        }

        function submitObjection(bid) {
            var mtitle = "书籍有异议";
            var html = "<div style='padding:10px;'><div style='width:65px; height:120px; float:left;'>异议内容：</div><div style='width:250px; height:120px; float:left;'><textarea id='objeCont' name='objeCont' style='width:250px; height:105px;'></textarea></div></div>";

            var submit = function (v, h, f) {
                if (f.objeCont == '' || f.objeCont.length > 80) {
                    $.jBox.tip("请您输入异议内容，且不超过80个字！", 'error', { focusId: "objeCont" }); // 关闭设置 objeCont 为焦点
                    return false;
                }

                StudentCompain.insertCompain('', mtitle, 2, f.objeCont, function (data) {
                    var obj = $.parseJSON(data);
                    var resultObj = false;
                    if (obj.ok) {
                        senateCenter.modifyStudentBookStatus(bid, 3, function (data) {
                            var result = $.parseJSON(data);
                            if ((String(result.ok) == "true")) {
                                jBox.alert("成功提交异议！", "提示");
                                setTimeout(function () {
                                    window.location.reload();
                                }, 1500);
                            }
                            else {
                                jBox.tip("提交异议失败！");
                                return false;
                            }
                        });
                    }
                    else {
                        jBox.tip("提交异议失败！");
                    }
                });
            };

            $.jBox(html, { title: "提交异议", submit: submit });
        }
    </script>
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
                    <%=student.getStudent_id() %>学员：<%=student.getStudent_name() %>，欢迎您！ <a href="../myinfor/index.aspx.jsp">我的信息</a> <a href="../user/studentinfor/systemmsge.aspx.jsp">
                        通知</a> <a href="../user/account/changepasswd.aspx.jsp">密码修改</a> <a onclick="loginOut()"
                            href="javascript:">安全退出</a>
                </div>
                <div class="blog_nav">
                    <ul>
                        <li><a href="../edu_index.jsp">首页</a></li>
                        <li><a href="score.aspx.jsp">教务中心</a></li>
                        <li><a href="../myaccount/wdcw.aspx.jsp">我的学费</a></li>
                        <li><a href="../onlineteaching/studentmaterial.aspx.jsp">资料中心</a></li>
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
                            <a href="application.aspx.jsp">我的报考</a></div>
                        <div>
                            <a href="score.aspx.jsp">我的成绩</a></div>
                        <div>
                            <a href="book.aspx.jsp">我的书籍</a></div>
                    </div>
                    <div class="ta1">
                        <strong>学习中心</strong><div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="../onlineteaching/studentmaterial.aspx.jsp">资料下载</a></div>
                        <div>
                            <a href="../onlineteaching/studentstudyrecordlist.aspx.jsp">学习历程</a></div>
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
        教务中心 &gt; 我的书籍</h2>
    <div class="morebt">
        <ul>
            <li><a class="tab2" href="application.aspx.jsp">我的报考</a></li>
            <li><a class="tab2" href="score.aspx.jsp">我的成绩</a></li>
            <li><a class="tab1" href="book.aspx.jsp">我的书籍</a></li>
            
        </ul>
    </div>
    
    <div class="cztable">
        <div class="tis red">
            注：请仔细核对自己的书籍发放情况，如正确请点击“确定无误”，如不正确请点击“有异议”。
        </div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr style="height: 25px" align="center">
                    <th scope="col">
                        编号
                    </th>
                    <th scope="col">
                        书籍名称
                    </th>
                    <th scope="col">
                        已发书数量
                    </th>
                    <th scope="col">
                        发书日期
                    </th>
                    <th scope="col">
                        操作
                    </th>
                </tr>
                
                <%for(MyBook book:books) {%>
                <tr align="center">
                    <td>
                       <%=book.getId() %>
                    </td>
                    <td>
                        <%=book.getBookName() %>
                    </td>
                    <td>
                        
                    </td>
                    <%SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String dateString = formatter.format(book.getBookTime()); %>
                    <td><%=dateString %>
                        
                    </td>
                    
                    <td>&nbsp;
                       
                    </td>
                </tr>
              <%}%>  
              <%-- ${ sessionScope.findBook} --%>
                <!-- <tr align="center">
                    <td>
                        2
                    </td>
                    <td>
                        00167劳动法
                    </td>
                    <td>
                        0
                    </td>
                    
                    <td>&nbsp;
                        
                    </td>
                    
                    <td>&nbsp;
                        
                    </td>
                </tr>
                
                <tr align="center">
                    <td>
                        3
                    </td>
                    <td>
                        00169房地产法
                    </td>
                    <td>
                        0
                    </td>
                    
                    <td>&nbsp;
                        
                    </td>
                    
                    <td>&nbsp;
                        
                    </td>
                </tr>
                
                <tr align="center">
                    <td>
                        4
                    </td>
                    <td>
                        00261行政法学
                    </td>
                    <td>
                        0
                    </td>
                    
                    <td>&nbsp;
                        
                    </td>
                    
                    <td>&nbsp;
                        
                    </td>
                </tr>
                
                <tr align="center">
                    <td>
                        5
                    </td>
                    <td>
                        03708中国近现代史纲要
                    </td>
                    <td>
                        0
                    </td>
                    
                    <td>&nbsp;
                        
                    </td>
                    
                    <td>&nbsp;
                        
                    </td>
                </tr>
                
                <tr align="center">
                    <td>
                        6
                    </td>
                    <td>
                        03709马克思主义基本原理概论
                    </td>
                    <td>
                        0
                    </td>
                    
                    <td>&nbsp;
                        
                    </td>
                    
                    <td>&nbsp;
                        
                    </td>
                </tr>
                
                <tr align="center">
                    <td>
                        7
                    </td>
                    <td>
                        06909行政诉讼法
                    </td>
                    <td>
                        0
                    </td>
                    
                    <td>&nbsp;
                        
                    </td>
                    
                    <td>&nbsp;
                        
                    </td>
                </tr>
                
                <tr align="center">
                    <td>
                        8
                    </td>
                    <td>
                        07944经济法学原理
                    </td>
                    <td>
                        0
                    </td>
                    
                    <td>&nbsp;
                        
                    </td>
                    
                    <td>&nbsp;
                        
                    </td>
                </tr>
                
                <tr align="center">
                    <td>
                        9
                    </td>
                    <td>
                        07945企业与公司法学
                    </td>
                    <td>
                        0
                    </td>
                    
                    <td>&nbsp;
                        
                    </td>
                    
                    <td>&nbsp;
                        
                    </td>
                </tr>
                
                <tr align="center">
                    <td>
                        10
                    </td>
                    <td>
                        07946税法原理
                    </td>
                    <td>
                        0
                    </td>
                    
                    <td>&nbsp;
                        
                    </td>
                    
                    <td>&nbsp;
                        
                    </td>
                </tr>
                
                <tr align="center">
                    <td>
                        11
                    </td>
                    <td>
                        07947金融法概论
                    </td>
                    <td>
                        0
                    </td>
                    
                    <td>&nbsp;
                        
                    </td>
                    
                    <td>&nbsp;
                        
                    </td>
                </tr>
                
                <tr align="center">
                    <td>
                        12
                    </td>
                    <td>
                        07948环境法学
                    </td>
                    <td>
                        0
                    </td>
                    
                    <td>&nbsp;
                        
                    </td>
                    
                    <td>&nbsp;
                        
                    </td>
                </tr> -->
                
            </tbody>
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
