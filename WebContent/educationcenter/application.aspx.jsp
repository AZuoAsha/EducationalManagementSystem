<%@page import="cdut.com.cn.ems.entity.MyExamination"%>
<%@page import="cdut.com.cn.ems.entity.MyBook"%>
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
                $("#unreadSysMsgCount").jsp("(" + unreadSysMsgCount + ")");
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
    
    <link href="../style/StudentStyle.css" rel="stylesheet" type="text/css" />
    <script src="../script/Base.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        function confirmStatus(sid) {
            if (confirm("确定确认无误吗？") == true) {
                senateCenter.modifyStudentSignupExamStatus(sid, 2, function (data) {
                    var result = $.parseJSON(data);
                    if ((String(result.ok) == "true")) {
                        jBox.alert(result.message, '提示');
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

        function submitObjection(objId) {
            var mtitle = "报考有异议";
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
                        senateCenter.modifyStudentSignupExamStatus(objId, 3, function (data) {
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
        function showApp(i1, i2, i3) {
            var amount1 = i1 * 48;
            var amount2 = i2 * 348;
            var amount3 = i3 * 168;
            var aamount = amount1 + amount2 + amount3;
            $("#BCount").jsp(i1);
            $("#LCount").jsp(i2);
            $("#SCount").jsp(i3);
            $("#BAmount").jsp(amount1);
            $("#LAmount").jsp(amount2);
            $("#SAmount").jsp(amount3);
            $("#AAmount").jsp(aamount);
            $.jBox("id:MyAppMoney", {
                title: "报考费详情",
                width: 510,
                height: 280,
                buttons: { '关闭': true }
            });
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
                    <%=student.getStudent_id()%>学员：<%=student.getStudent_name() %>，欢迎您！ <a href="../myinfor/index.aspx.jsp">我的信息</a> <a href="../user/studentinfor/systemmsge.aspx.jsp">
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
        教务中心 &gt; 我的报考</h2>
    <div class="morebt">
        <ul>
            <li><a class="tab1" href="application.aspx.jsp">我的报考</a></li>
            <li><a class="tab2" href="score.aspx.jsp">我的成绩</a></li>
            <li><a class="tab2" href="book.aspx.jsp">我的书籍</a></li>
            
        </ul>
    </div>
    <div id="MyAppMoney" style="display: block; padding: 15px 0;">
        <table width="100%" border="0" cellspacing="0" style="border-bottom: #cfe1f9 solid 4px;
            border-right: #cfe1f9 solid 1px;">
            <tbody>
                <tr>
                    <th width="195" align="middle" style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px; background: #eef7fc url(../images/student/bgtable.jpg) repeat-x;
                        line-height: 22px; color: #185697;">
                        <strong>缴 费 项 目</strong>
                    </th>
                    <th width="206" align="middle" style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px; background: #eef7fc url(../images/student/bgtable.jpg) repeat-x;
                        line-height: 22px; color: #185697;">
                        <strong>报 考 科 次</strong>
                    </th>
                    <th width="305" align="middle" style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px; background: #eef7fc url(../images/student/bgtable.jpg) repeat-x;
                        line-height: 22px; color: #185697;">
                        <strong>单 价</strong>
                    </th>
                    <th width="199" align="middle" style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px; background: #eef7fc url(../images/student/bgtable.jpg) repeat-x;
                        line-height: 22px; color: #185697;">
                        <strong>合计</strong>
                    </th>
                </tr>
                <%for(MyExamination myExamination:myExaminations){ %>
                <tr>
                    <td align="middle" style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px;">
                        <%=myExamination.getExaminationName() %>
                    </td>
                    <td align="left" style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px;">
                        <strong id="BCount"><%=myExamination.getExaminationNumber() %></strong>
                    </td>
                    <td width="305" style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px;">
                        <%=myExamination.getPrice() %>元/科
                    </td>
                    <td align="middle" id="BAmount" style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px;">
                        <%=myExamination.getCombined() %>
                    </td>
                </tr>
                <%} %>
                <!-- <tr>
                    <td align="middle" style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px;">
                        实践课
                    </td>
                    <td align="left" style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px;">
                        <strong id="SCount">1</strong><br />
                    </td>
                    <td style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px; padding: 6px 5px;">
                        48/科 + 120/科实践考核费
                    </td>
                    <td width="199" align="middle" id="SAmount" style="border-top: #cfe1f9 solid 1px;
                        border-left: #cfe1f9 solid 1px; padding: 6px 5px;">
                        168
                    </td>
                </tr>
                <tr>
                    <td align="middle" style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px;">
                        论文
                    </td>
                    <td align="left" style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px;">
                        <strong id="LCount">1</strong>
                    </td>
                    <td style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px; padding: 6px 5px;">
                        48/科 + 300论文指导费
                    </td>
                    <td align="middle" id="LAmount" style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px;">
                        348
                    </td>
                </tr> -->
                <tr>
                    <td align="middle" style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px;">&nbsp;
                        
                    </td>
                    <td align="left" style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px;">&nbsp;
                        
                    </td>
                    <td style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px; padding: 6px 5px;">&nbsp;
                        
                    </td>
                    <td align="middle" style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px;"><%int result=0; %>
                        总计： <span class="bigfont" id="AAmount"><%for(MyExamination examination:myExaminations){Integer it = new Integer(examination.getCombined());  

 result += it.intValue(); %><%} %><%= result%>元</span>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- <div class="cztable">
        
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <th width="10%" style="text-align: center;">&nbsp;
                    
                </th>
                
                <th valign="top">
                    <div class="wzx1">
                        00015</div>
                    <div class="wzx">
                        英语（二）</div>
                </th>
                
                <th valign="top">
                    <div class="wzx1">
                        03708</div>
                    <div class="wzx">
                        中国近现代史纲要</div>
                </th>
                
                <th valign="top">
                    <div class="wzx1">
                        03709</div>
                    <div class="wzx">
                        马克思主义基本原理概论</div>
                </th>
                
                <th valign="top">
                    <div class="wzx1">
                        00169</div>
                    <div class="wzx">
                        房地产法</div>
                </th>
                
                <th valign="top">
                    <div class="wzx1">
                        00261</div>
                    <div class="wzx">
                        行政法学</div>
                </th>
                
                <th valign="top">
                    <div class="wzx1">
                        00167</div>
                    <div class="wzx">
                        劳动法</div>
                </th>
                
                <th valign="top">
                    <div class="wzx1">
                        07945</div>
                    <div class="wzx">
                        企业与公司法学</div>
                </th>
                
                <th valign="top">
                    <div class="wzx1">
                        07946</div>
                    <div class="wzx">
                        税法原理</div>
                </th>
                
                <th valign="top">
                    <div class="wzx1">
                        07947</div>
                    <div class="wzx">
                        金融法概论</div>
                </th>
                
                <th valign="top">
                    <div class="wzx1">
                        06909</div>
                    <div class="wzx">
                        行政诉讼法</div>
                </th>
                
                <th valign="top">
                    <div class="wzx1">
                        07944</div>
                    <div class="wzx">
                        经济法学原理</div>
                </th>
                
                <th valign="top">
                    <div class="wzx1">
                        07948</div>
                    <div class="wzx">
                        环境法学</div>
                </th>
                
                <th valign="top">
                    <div class="wzx1">
                        10301</div>
                    <div class="wzx">
                        经济法毕业论文</div>
                </th>
                
                <th style="text-align: center;">
                    报考费(元)
                </th>
                <th style="text-align: center;">&nbsp;
                    
                </th>
            </tr>
            
            <tr align="center">
                <td colspan="15">
                    <div style="color: #ff0000; font-weight: bold;">
                        未找到报考信息!</div>
                </td>
            </tr>
            
        </table>
        
    </div> -->
    <div class="tis red" style="color: #333; margin-bottom: 20px;">
        <p>
            <strong>特别提示：</strong></p>
        <p>
            <span class="red">1、请仔细核对并及时交清报考费，汇款后请跟班主任联系审核通过，如果没有及时交清费用，报考确认将会取消，将不能报考参加考试。</span></p>
        <p>
            2、如果已经交清，请不要理会上面的信息，直接联系班主任帮你审核通过。</p>
        <p>
            3、汇款时请多汇几元钱或者几角钱，如1000.3元，可大幅提高您汇款入账速度
        </p>
        <p>
            4、汇款后请第一时间跟班主任或教务老师联系，并提交汇款单。</p>
       
    </div>
    <h2 class="mbx">
        教务中心 &gt; 我的报考 &gt; 查看考试时间</h2>
    <div class="cztable">
        <div class="tis red">
            注：请仔细查看【报考】考试计划以及考试时间，以免错过考试。
        </div>
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr align="center">
                <th style="text-align: center;">
                    课程代码名称
                </th>
                <th style="text-align: center;">
                    是否有考试计划
                </th>
                <th style="text-align: center;">
                    所属单元
                </th>
                <th style="text-align: center;">
                    考试开始时间
                </th>
                <th style="text-align: center;">
                    考试结束时间
                </th>
            </tr>
            
            <tr style="height: 28px" class="tdbg" align="center">
                <td colspan="13" align="left" style="color: Red; font-weight: bold;">
                    未找到考试计划信息！
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
