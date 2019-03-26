<%@page import="java.text.SimpleDateFormat"%>
<%@page import="cdut.com.cn.ems.entity.MyFinancial"%>
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
    <%List<MyFinancial> mList=(List<MyFinancial>)session.getAttribute("myFinancial"); %>
     <%List<MyFinancial> mListSelf=(List<MyFinancial>)session.getAttribute("myFinancialSelf"); %>
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
    
<script type="text/javascript" language="javascript">

    function confirmStatus(pid, ptype) {
        if (confirm("确定确认无误吗？") == true) {
            financialInfor.modifyStudentPaymentStatus(pid, ptype, function (data) {
                var result = $.parseJSON(data);
                if ((String(result.ok) == "true")) {
                    jBox.alert(result.message, "提示");
                    setTimeout(function () {
                        window.location.reload();
                    }, 1500);
                }
                else {
                    $.jBox.error(result.message, '提示');
                }
            });
            
        }
    }

    function submitObjection(pid) {
        var mtitle = "缴费有异议";
        var html = "<div style='padding:10px;'><div style='width:65px; height:120px; float:left;'>异议内容：</div><div style='width:250px; height:120px; float:left;'><textarea id='objeCont' name='objeCont' style='width:250px; height:105px;'></textarea></div></div>";
		//var context=$('div div #objeCont').val();
		
        var submit = function (v, h, f) {
            if (f.objeCont == '' || f.objeCont.length > 80) {
                $.jBox.tip("请您输入异议内容，且不超过80个字！", 'error', { focusId: "objeCont" }); // 关闭设置 objeCont 为焦点
                return false;
            }

            /* StudentCompain.insertCompain('', mtitle, 2, f.objeCont, function (data) {
                var obj = $.parseJSON(data);
                var resultObj = false;
                if (obj.ok) {
                    financialInfor.modifyStudentPaymentStatus(pid, 3, function (data) {
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
            }); */

            $.ajax({
                type: "post",
                url: "addObjection/insert.do",
                data:{"mtitle": mtitle,
                    "objectionContext": f.objeCont},
                dataType: "json",
                success: function (data, textStatus, jqXHR) {
                // alert("请求成功"+data);
                if(data=='1'){
                	 jBox.tip("成功提交异议！");
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
                        <a href="" target="_blank"><strong>教学系统</strong></a>
                        <div class="leftbgbt2">
                        </div>
                    </div>
                </div>
            </div>
            <div class="rightbox">
                
<h2 class="mbx">教务中心 &gt; 我的财务</h2>
<div class="cztable">
    <div style="padding-bottom:20px;">
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr align="center" style="font-size:12px">
                <th width="20%">【<%=student.getStudent_name() %>】总缴费统计 </th>
                <th>应缴费用 </th>
                <th>实缴费用 </th>
                
                <th>欠缴费用 </th>
                <th>缴费次数 </th>
            </tr>
            <%for(MyFinancial myFinancial:mList){ %>
            <tr style="font-size:12px">
                <td align="center" class="greenfont">&nbsp;</td>
                <td align="center" class="greenfont">
                    <span style="color: #FF0000; font-size: 14px; font-weight: bold;">
                        <%=myFinancial.getShouldPayTotal() %>
                    </span>
                </td>
                <td align="center" class="greenfont">
                    <span style="color: #FF0000; font-size: 14px; font-weight: bold;">
                        <%=myFinancial.getRealPayTotal() %>
                    </span>
                </td>
                
                <td align="center" class="greenfont">
                    <span style="color: #FF0000; font-size: 14px; font-weight: bold;">
                    <%Integer shouldPay = new Integer(myFinancial.getShouldPayTotal());  Integer realPay = new Integer(myFinancial.getRealPayTotal());

                    int result = shouldPay.intValue()-realPay.intValue(); %>
                        <%=result %>
                    </span>
                </td>
                <td align="center" class="greenfont">
                    <span style="color: #FF0000; font-size: 14px; font-weight: bold;">
                       <%=myFinancial.getPayTotalCount() %>
                    </span>
                </td>
            </tr>
           <%} %>
        </table>
    </div>
<div>
注：请仔细查看自己的缴费记录，如无误请点击“<span class="red">确定无误</span>”，如不正确请点击“<span class="red">有异议</span>”。 <br />
其中缴费项目缴费说明相同，相加后的起来对比。应缴总和=实缴总和+欠缴总和 <br />
    <div>
        <p>&nbsp;</p>
        <p><strong>欠费项目：</strong></p>
    </div>
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr align="center" style="font-size:12px">
            <th>序号</th>
            <th>欠费项目</th>
            <th>应交金额</th>
            <th>已交金额</th>
            <th>欠交金额</th>
        </tr>

		<%for(int i=0;i<mList.size();i++){ %>
        <tr style="font-size:12px;">
            <td style="text-align:center">
            <span style="color: #FF0000; font-size: 14px; font-weight: bold;">
            <%=i+1 %>
            </span>
            </td>
            <td style="text-align:center">
            <span style="color: #FF0000;  font-size: 14px; font-weight: bold;">
           <%=mList.get(i).getArrearageName() %>
            </span>
            </td>
            <td style="text-align:center">
            <span style="color: #FF0000;  font-size: 14px; font-weight: bold;">
            <%=mList.get(i).getAmountPayable() %>
            </span>
            </td>
            <td style="text-align:center">
            <span style="color: #FF0000;  font-size: 14px; font-weight: bold;">
            <%=mList.get(i).getRealPay() %>
            </span>
            </td>
            <td style="text-align:center">
            <span style="color: #FF0000;  font-size: 14px; font-weight: bold;">
            <%Integer all = new Integer(mList.get(i).getAmountPayable());Integer real = new Integer(mList.get(i).getRealPay());  

            int result = all.intValue()-real.intValue(); %>
             <%= result%>
            </span>
            </td>
        </tr>

	<%} %>
        <!-- <tr>
            <td style="text-align:center">
            <span style="color: #FF0000; font-size: 16px; font-weight: bold;">
            2
            </span>
            </td>
            <td>
            <span style="color: #FF0000;  font-size: 16px; font-weight: bold;">
            论文答辩费
            </span>
            </td>
            <td style="text-align:right">
            <span style="color: #FF0000;  font-size: 16px; font-weight: bold;">
            300.00
            </span>
            </td>
            <td style="text-align:right">
            <span style="color: #FF0000;  font-size: 16px; font-weight: bold;">
            0.00
            </span>
            </td>
            <td style="text-align:right">
            <span style="color: #FF0000;  font-size: 16px; font-weight: bold;">
            300.00
            </span>
            </td>
        </tr>


        <tr>
            <td style="text-align:center">
            <span style="color: #FF0000; font-size: 16px; font-weight: bold;">
            3
            </span>
            </td>
            <td>
            <span style="color: #FF0000;  font-size: 16px; font-weight: bold;">
            第二年学费、教材费、学杂费
            </span>
            </td>
            <td style="text-align:right">
            <span style="color: #FF0000;  font-size: 16px; font-weight: bold;">
            3700.00
            </span>
            </td>
            <td style="text-align:right">
            <span style="color: #FF0000;  font-size: 16px; font-weight: bold;">
            0.00
            </span>
            </td>
            <td style="text-align:right">
            <span style="color: #FF0000;  font-size: 16px; font-weight: bold;">
            3700.00
            </span>
            </td>
        </tr> -->


    </table>

    <div>
        <p>&nbsp;</p>
        <p><strong>自考缴费：</strong></p>
    </div>
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr align="center" style="font-size:12px">
            <th>序号</th>
            <th>交费项目</th>
            <th>交费金额</th>
            
            <th>交费时间</th>
            <th>操作</th>
        </tr>

<%for(int j=0;j<mListSelf.size();j++){ %>
        <tr style="font-size:12px">
            <td style="text-align:center"><%=j+1 %></td>
            <td style="text-align:center"><%=mListSelf.get(j).getSelfExaminationName() %></td>
            <td style="text-align:center"><%=mListSelf.get(j).getRealPay() %></td>
             <%SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String dateString = formatter.format(mListSelf.get(j).getPayTime()); %>
            <td style="text-align:center"><%= dateString%></td>
            <td style="text-align:center">

                        
                           <a href="javascript:;" onclick="confirmStatus('95c4b378-6de2-41f6-a2cf-6b0e27b562f3', 2)">[确认无误]</a> &nbsp; &nbsp;
                <a href="javascript:;" onclick="submitObjection('95c4b378-6de2-41f6-a2cf-6b0e27b562f3')">[有异议]</a>
                
            </td>
        </tr>
   
    <%} %>
        <!-- <tr>
            <td style="text-align:center">2</td>
            <td>论文答辩费</td>
            <td>0.00</td>
            
            <td>2017-12-20 04:47</td>
            <td>

                        
                           <a href="javascript:;" onclick="confirmStatus('4073419c-5dfc-4629-9379-7cecc7e61200', 2)">[确认无误]</a> &nbsp; &nbsp;
                <a href="javascript:;" onclick="submitObjection('4073419c-5dfc-4629-9379-7cecc7e61200')">[有异议]</a>
                
            </td>
        </tr>
   
    
        <tr>
            <td style="text-align:center">3</td>
            <td>第二年学费、教材费、学杂费</td>
            <td>0.00</td>
            
            <td>2017-12-20 04:47</td>
            <td>

                        
                           <a href="javascript:;" onclick="confirmStatus('bb91b039-004b-4da6-b765-012d19b205f1', 2)">[确认无误]</a> &nbsp; &nbsp;
                <a href="javascript:;" onclick="submitObjection('bb91b039-004b-4da6-b765-012d19b205f1')">[有异议]</a>
                
            </td>
        </tr>
   
    
        <tr>
            <td style="text-align:center">4</td>
            <td>第一年学费、教材费、学杂费</td>
            <td>3700.00</td>
            
            <td>2017-12-20 04:47</td>
            <td>

                        
                               <font color="#008000">已审核</font>
                               
            </td>
        </tr> -->
   
    
    </table>
</div>
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
