<%@page import="cdut.com.cn.ems.entity.MyObjection"%>
<%@page import="cdut.com.cn.ems.entity.CollegeNotice"%>
<%@page import="cdut.com.cn.ems.entity.Message"%>
<%@page import="cdut.com.cn.ems.entity.MyFinancial"%>
<%@page import="cdut.com.cn.ems.entity.MyBook"%>
<%@page import="cdut.com.cn.ems.entity.MyScore"%>
<%@page import="cdut.com.cn.ems.entity.MyExamination"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="cdut.com.cn.ems.entity.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>
	学生信息管理系统
</title><link href="style/StudentStyle.css" rel="stylesheet" type="text/css" /><link href="script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" /><link href="style/ks.css" rel="stylesheet" type="text/css" />
    <script src="script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="script/jBox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <script src="script/Common.js" type="text/javascript"></script>
    <script src="script/Data.js" type="text/javascript"></script>
    <%Student student=(Student)session.getAttribute("student"); %>
    <%List<MyExamination> myExaminations=(List<MyExamination>)session.getAttribute("myExamination") ;%>
    <%List<MyScore> scores=(List<MyScore>)session.getAttribute("myScore"); %>
    <%List<MyBook> books=(List<MyBook>)session.getAttribute("findBook") ;%>
    <%List<MyFinancial> mList=(List<MyFinancial>)session.getAttribute("myFinancial"); %>
     <%List<MyFinancial> mListSelf=(List<MyFinancial>)session.getAttribute("myFinancialSelf"); %>
     <%List<Message> messages=(List<Message>)session.getAttribute("messageList"); %>
     <%List<CollegeNotice> collegeNotices=(List<CollegeNotice>)session.getAttribute("collegeNotice"); %>
     <%List<MyObjection> myObjList=(List<MyObjection>)session.getAttribute("myObjection"); %>
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
                $("#unreadSysMsgCount").jsp("(" + unreadSysMsgCount + ")");
            }
        }

        //退出
        function loginOut() {
            if (confirm("确定退出吗？")) {
                /* StudentLogin.loginOut(function (data) {
                    if (data == "true") {
                        window.location = "";
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
                        window.location.href = "";
                    }
                    else {
                        jBox.tip(result.message);
                    }
                });
            }
        }
    </script>
    
    <script src="script/changeOption.js" type="text/javascript"></script>
    <script src="Script/rl.js" type="text/javascript"></script>
</head>
<body>



    <div class="banner">
        <div class="bgh" style="width: 100%;border-bottom:#ccc 1px solid;">
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
                        <a href="#" target="_blank"><strong>教学系统</strong></a>
                        <div class="leftbgbt2">
                        </div>
                    </div>
                </div>
            </div>
            <div class="rightbox">
                
    <h2 class="mbx">
        我的学习中心&nbsp;&nbsp;&nbsp;&nbsp;</h2>

    <div class="dhbg">
        <div class="dh1" style="margin: 0 27px 15px 0;">
            <div class="dhwz">
                <p>
                    您共有 <span class="red"><%=collegeNotices.size() %></span>条通知信息 <span class="red"><%=collegeNotices.size() %> </span>条未读
                </p>
                <p>
                    共有 <span class="red"><%=messages.size() %> </span>条短信息、 <span class="red">0</span>个投诉、 <span class="red">
                        <%=myObjList.size() %> </span>个异议
                </p>
                <p>
                    有 <span class="red">0</span>个投诉、<span class="red"><%=myObjList.size() %>
                    </span>个异议、<span class="red"><%=messages.size() %></span>条短信息未处理</p>
                <div class="btright">
                    <a href="user/studentinfor/letter.aspx.jsp">
                        <img src="images/student/default/bt_bzr.jpg" alt="给班主任发消息" width="121" height="25" />
                    </a>
               </div>
            </div>
        </div>
        <div class="dh2">
            <div class="dhwz">
                <p>
                    你有 <span class="red"><%=myExaminations.size() %></span> 门课程要考 <a href="educationcenter/application.aspx.jsp" class="red">查看报考计划</a></p>
                <p>
                    你已经通过 <span class="red"><%=scores.size() %> </span>门课程&nbsp;共有 <span class="red"><%=scores.size() %></span> 门 <a href="educationcenter/score.aspx.jsp" class="red">查看成绩</a>
                </p>
                <p>
                    已经发放了 <span class="red"><%=books.size() %> </span>本书籍 <a href="educationcenter/book.aspx.jsp" class="red">查看书籍情况</a></p>
                <div class="btright">
                    <a href="educationcenter/application.aspx.jsp">
                        <img src="images/student/default/bt_jw.jpg" alt="进入教务中心" width="121" height="25" /></a></div>
            </div>
        </div>
        <div class="dh3" style="margin: 0 27px 15px 0;">
            <div class="dhwz">
                <p>
                    <a href="onlineteaching/index2.html">模拟考试</a></p>
                <p>
                    <a href="onlineteaching/index.html">章节练习</a>
                </p>
                <p>
                    <a href="onlineteaching/exam/index.html">网上作业</a></p>
                <div class="btright">
                    <a href="onlineteaching/exam/twts_91_course/index.html">
                        <img src="images/student/default/bt_ks.jpg" alt="进入考试中心" width="121" height="25" /></a></div>
            </div>
        </div>
        <div class="dh4">
            <div class="dhwz">
                <p>
                    你应交<span class="blue"><%=mList.get(0).getShouldPayTotal() %></span> 元，实缴 <span class="green"><%=mList.get(0).getRealPayTotal() %></span>元</p>
                    <p>
                    欠费 <span class="red"> <%Integer shouldPay = new Integer(mList.get(0).getShouldPayTotal());  Integer realPay = new Integer(mList.get(0).getRealPayTotal());

                    int result = shouldPay.intValue()-realPay.intValue(); %>
                        <%=result %></span> 元</p>
                <p>
                    你总共有<span class="red"><%=mListSelf.size() %></span> 条财务记录需要确定</p>
                
                <div class="btright">
                    <a href="myaccount/wdcw.aspx.jsp">
                        <img src="images/student/default/bt_cw.jpg" alt="进入财务中心" width="121" height="25" /></a></div>
            </div>
        </div>
    </div>

    <div class="xxlc">
        <strong class="lcbt">学历历程</strong>
    </div>
    <div class="lcbiao">
     <%SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String currentDate = dateFormat.format(new Date()); %>
             
        <div class="lctime">
            <%Date as3 = new Date(new Date().getTime()-3*24*60*60*1000);
        SimpleDateFormat matter3 = new SimpleDateFormat("yyyy-MM-dd");
        String time3 = matter3.format(as3); %><%=time3 %></div>
        <div class="lctime">
            <%Date as2 = new Date(new Date().getTime()-2*24*60*60*1000);
        SimpleDateFormat matter2 = new SimpleDateFormat("yyyy-MM-dd");
        String time2 = matter2.format(as2); %><%=time2 %></div>
        <div class="lctime">
        <%Date as = new Date(new Date().getTime()-24*60*60*1000);
        SimpleDateFormat matter1 = new SimpleDateFormat("yyyy-MM-dd");
        String time = matter1.format(as); %>
             <%=time %></div>
        <div class="lctime2">
            <%=currentDate %></div>
        <div class="lctime">
            <%Date as4 = new Date(new Date().getTime()+24*60*60*1000);
        SimpleDateFormat matter4 = new SimpleDateFormat("yyyy-MM-dd");
        String time4 = matter4.format(as4); %><%=time4 %></div>
        <div class="lctime">
             <%Date as5 = new Date(new Date().getTime()+2*24*60*60*1000);
        SimpleDateFormat matter5 = new SimpleDateFormat("yyyy-MM-dd");
        String time5 = matter5.format(as5); %><%=time5 %></div>
        <div class="lctime">
             <%Date as6 = new Date(new Date().getTime()+3*24*60*60*1000);
        SimpleDateFormat matter6 = new SimpleDateFormat("yyyy-MM-dd");
        String time6 = matter6.format(as6); %><%=time6 %></div>
    </div>
    <div class="xxjl">
    
        <div align="center">
        <span>
            <%SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");
            String dateString = formatter.format(new Date()); %>
            <%=dateString %> 登陆系统
              <a></a>
             
              </span>
            </div>
           
           
        <!-- <div align="center">
        <span>
            18:09 登陆系统
            
              <a></a>
             
              </span>
            </div>
           
           
        <div align="center">
        <span>
            18:06 登陆系统
            
              <a></a>
             
              </span>
            </div>
           
           
        <div align="center">
        <span>
            11:19 登陆系统
            
              <a></a>
             
              </span>
            </div> -->
           
           
    </div>

            </div>
        </div>
        <div class="footer">
            <p>
                &copy;copyright 2018 成都理工大学教务管理 版权所有 </p>
        </div>
    </div>
	
</body>
</html>
