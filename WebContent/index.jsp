<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>学生信息管理系统</title>
<!-- For-Mobile-Apps-and-Meta-Tags -->
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="" />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //For-Mobile-Apps-and-Meta-Tags -->

<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<link href="css/jquerysctipttop.css" rel="stylesheet" type="text/css">

</head>

<body>
<h1>登录注册</h1>
<section>
  <div class="controls w3l">
    <div class="cbcontrol" id="cbControlRight"><</div>
    <div class="cbcontrol" id="cbControlLeft">></div>
    <div class="clear"></div>
  </div>
  <div class="stage">
   
    <div class="cbImage w3">
		<h3>找回密码</h3>
		<div>
			<input type="text" class="email" name="email" placeholder="输入学号" required="" id="ustudent_id">
			<input type="password" class="number" name="phone number" placeholder="设置新密码" required="" id="upassword">
			<input type="password" class="number" name="phone number" placeholder="确认密码" required="" id="upasswordcfg">
			<input type="submit" class="done" value="提交" onclick="updates()">
        </div>
		<a href="#" class="rterms">服务条款</a>
	</div>
    <div class="cbImage active signin agileits">
		<h3>登录</h3>
		<div>
			<input type="text" name="Name" class="name" placeholder="学号" id="loginname">
			<input type="password" name="password" class="password" placeholder="密码" id="loginpassword">
			<input type="submit" onclick="loginUp()" value="登录">
			<ul class="bottom">
				<!-- <li><a href="#" class="forgot">忘记密码?</a></li> -->
				<li><a href="#" class="terms">服务条款</a></li>
			</ul>
        </div>
	</div>
    <div class="cbImage agileinfo">
		<h3>注册</h3>
		<div>
			<input type="text" class="name" name="student_id" placeholder="输入学号" required="" id="student_id">
			<input type="text" class="email" name="student_idcard" placeholder="输入身份证号码" required="" id="student_idcard">
			<input type="password" class="password" name="password" placeholder="密码" required="" id="password">
			<input type="password" class="password" name="confirmpassword" placeholder="确认密码" required="" id="confirmpassword">
			<input type="submit" onclick="cambiar_sign_up()" value="注册">
		</div>
	</div>
    <div class="clear"></div>
  </div>
  <div class="clear"></div>
  <div class="footer">
  <p>&copy; 2018 成都理工大学教务管理系统 Reserved</p>
  </div>
</section>
<script src="js/jquery-2.1.4.min.js"></script> 
<script src="coverflow-slideshow.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    //注册开始
    cambiar_sign_up = function () {
        var student_id=$("#student_id").val();
        var student_idcard=$("#student_idcard").val();
        var password = $("#password").val();
        var passwordcfg = $("#confirmpassword").val();
        if(student_id==''||student_idcard==''||password==''||passwordcfg==''){
            alert('请输入完成的信息!');
            return false;
        }else{
            if(password!=passwordcfg){
			alert("密码不一致！");
			return false;
                }else{
                    $.ajax({
                        type: "get",
                        url: "ems/add.do?student_id=" + student_id + "&password=" + password+"&student_idcard="+student_idcard+"&confirmpassword="+passwordcfg,
                        dataType: "json",
                        success: function (data, textStatus, jqXHR) {
                            // alert("请求成功"+data);
                            if (data == 'success') {
                                alert("注册成功！");
                            } else {
                                alert("注册失败");
                            }
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("请求失败！");
                        }
                    });
                }
        }
        
    }
 });
</script>
<script>
        $(document).ready(function () {
           loginUp=function(){
               var loginname=$("#loginname").val();
               var loginpassword=$("#loginpassword").val();
               if(loginname==''||loginpassword==''){
                   alert("用户名或密码不能为空！");
                   return false;
               }else{
                   $.ajax({
                       type: "get",
                        url: "ems/login.do?student_id=" + loginname + "&password=" + loginpassword,
                       dataType: "json",
                       success: function (data, textStatus, jqXHR) {
                           // alert("请求成功"+data);
                           if(data!='null'){
                               window.location.href="${pageContext.request.contextPath}/edu_index.jsp";
                           }else{
                               alert('用户名或密码错误！');
                               return false;
                           }
                       },
                       error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("请求失败！");
                       }
                   });
               }
           }

           updates=function(){
               var ustudent_id=$("#ustudent_id").val();
               var upassword=$("#upassword").val();
               var upasswordcfg=$("#upasswordcfg").val();
               if(ustudent_id==''||upassword==''||upasswordcfg==''){
                    alert("请输入完整的信息！");
                    return false;
               }else{
                   if(upassword!=upasswordcfg){
                       alert("两次密码输入不一致！");
                       return false;
                   }else{
                    $.ajax({
                       type: "get",
                        url: "ems/findOne.do?student_id=" + ustudent_id ,
                       dataType: "json",
                       success: function (data, textStatus, jqXHR) {
                           if(data=='success'){
                            $.ajax({
                                    type: "get",
                                    url: "ems/update.do?student_id=" + ustudent_id + "&password=" + upassword+"&confirmpassword="+upasswordcfg,
                                    dataType: "json",
                                    success: function (data, textStatus, jqXHR) {
                                    // alert("请求成功"+data);
                                    if(data=='success'){
                                    alert("密码修改成功！");
                                    return false;
                                    }else{
                                    alert('密码修改失败！');
                                    return false;
                                    }
                                    },
                                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                                    alert("请求失败！");
                                }
                            });
                           }else{
                               alert("此用户不存在!");
                               return false;
                           }
                       },
                       error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("请求失败！");
                       }
                   });
                   }
               }
           }
       });
</script>
</body>
</html>
