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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学生信息管理系统</title>
<style type="text/css">
<!--
a{ color:#008EE3}
a:link  { text-decoration: none;color:#008EE3}
A:visited {text-decoration: none;color:#666666}
A:active {text-decoration: underline}
A:hover {text-decoration: underline;color: #0066CC}
A.b:link {
	text-decoration: none;
	font-size:12px;
	font-family: "Helvetica,微软雅黑,宋体";
	color: #FFFFFF;
}
A.b:visited {.
	text-decoration: none;
	font-size:12px;
	font-family: "Helvetica,微软雅黑,宋体";
	color: #FFFFFF;
}
A.b:active {
	text-decoration: underline;
	color: #FF0000;

}
A.b:hover {text-decoration: underline; color: #ffffff}

.table1 {
	border: 1px solid #CCCCCC;
}
.font {
	font-size: 12px;
	text-decoration: none;
	color: #999999;
	line-height: 20px;
	

}
.input {
	font-size: 12px;
	color: #999999;
	text-decoration: none;
	border: 0px none #999999;


}

td {
	font-size: 12px;
	color: #007AB5;
}
form {
	margin: 1px;
	padding: 1px;
}
input {
	border: 0px;
	height: 26px;
	color: #007AB5;

	.unnamed1 {
	border: thin none #FFFFFF;
}
.unnamed1 {
	border: thin none #FFFFFF;
}
select {
	border: 1px solid #cccccc;
	height: 18px;
	color: #666666;

	.unnamed1 {
	border: thin none #FFFFFF;
}
body {
	background-repeat: no-repeat;
	background-color: #9CDCF9;
	background-position: 0px 0px;

}
.tablelinenotop {
	border-top: 0px solid #CCCCCC;
	border-right: 1px solid #CCCCCC;
	border-bottom: 0px solid #CCCCCC;
	border-left: 1px solid #CCCCCC;
}
.tablelinenotopdown {

	border-top: 1px solid #eeeeee;
	border-right: 1px solid #eeeeee;
	border-bottom: 1px solid #eeeeee;
	border-left: 1px solid #eeeeee;
}
.style6 {FONT-SIZE: 9pt; color: #7b8ac3; }

-->
</style>
<script src="js/jquery-2.1.4.min.js"></script> 
<script src="coverflow-slideshow.js"></script>
<script>
    $(document).ready(function () {
        
    });
</script>
<script>
        $(document).ready(function () {

        	function change() {
                code = $("#code");
                var arrays = new Array(
                    '1', '2', '3', '4', '5', '6', '7', '8', '9', '0',
                    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
                    'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
                    'u', 'v', 'w', 'x', 'y', 'z',
                    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
                    'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
                    'U', 'V', 'W', 'X', 'Y', 'Z'
                );
                codes = '';
                for (var i = 0; i < 4; i++) {
                    var r = parseInt(Math.random() * arrays.length);
                    codes += arrays[r];
                }
                code.val(codes);
            }

            change();
            code.click(change);
            $("#check").click(function () {
                var inputCode = $("#Code").val().toUpperCase();

                var loginname=$("#UserName").val();
                var loginpassword=$("#Password").val();
                //var inputCode2 = $("#Code").val();
                //alert(loginname+loginpassword);
                if(loginname==''||loginpassword==''){
                    alert("用户名或密码不能为空！");
                    return false;
                }else if (inputCode.length == 0) {
                    alert("请输入验证码！");
                    return false;
                }
                else if (inputCode != codes.toUpperCase()) {
                    alert("验证码输入错误!请重新输入");
                    change();
                    $("#Code").val("");
                    return false;
                } else{
                    $.ajax({
                        type: "post",
                         url: "ems/login.do",
                         data:{"student_id":loginname,
                             "password":loginpassword,
                             },
                        dataType: "json",
                        success: function (data, textStatus, jqXHR) {
                             //alert("请求成功"+data);
                            if(data=='1'){
                                window.location.href="${pageContext.request.contextPath}/edu_index.jsp";
                            }
                            if(data=='0'){
                            	alert('用户名或密码错误！');
                                return false;
                            }
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                             alert("服务器出错啦！");
                        }
                    });
                }
                //console.log(inputCode);
                
            });
           
  
		   });
		   </script>
</head>
<body>
<table width="681" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:120px">
  <tr>
    <td width="353" height="259" align="center" valign="bottom" background="images/login_1.gif"><table width="90%" border="0" cellspacing="3" cellpadding="0">
      <tr>
        <td align="right" valign="bottom" style="color:#05B8E4">Power by <a href="" target="_blank">me.net</a> Copyright 2018</td>
      </tr>
    </table></td>
    <td width="195" background="images/login_2.gif"><table width="190" height="106" border="0" align="center" cellpadding="2" cellspacing="0">
      <div>
            <tr>
              <td height="50" colspan="2" align="left">&nbsp;</td>
            </tr>
            <tr>
              <td width="60" height="30" align="left" >登陆名称</td>
              <td><input name="Name" type="TEXT" style="background:url(images/login_6.gif) repeat-x; border:solid 1px #27B3FE; height:20px; background-color:#FFFFFF" id="UserName" size="16" placeholder="学号" required></td>
            </tr>
            <tr>
              <td height="30" align="left">登陆密码</td>
              <td><input name="Password" TYPE="PASSWORD" style="background:url(images/login_6.gif) repeat-x; border:solid 1px #27B3FE; height:20px; background-color:#FFFFFF" id="Password" size="16" placeholder="初始密码身份证后六位" required></td>
            </tr>
            <tr>
              <td height="30"> 验 证 码 </td>
			  <td><input name="Code" type="text" placeholder="验证码" id="Code" size="5" style="background:url(images/login_6.gif) repeat-x; border:solid 1px #27B3FE; height:20px; background-color:#FFFFFF" maxlength="4" required>
			  <input type="button" id="code" style="height: 21px"/>
		      </td>
            </tr>
            <tr>
              <td height="40" colspan="2" align="center"><img src="images/tip.gif" width="16" height="16"> 请勿非法登陆！<a href="${pageContext.request.contextPath}/user/account/changepasswd.index.jsp">  忘记密码?</a></td>
          <tr>
              <td colspan="2" align="center"><input type="submit" style="background:url(images/login_5.gif) no-repeat" value=" 登  陆 " id="check"> 
			  <input type="reset" name="Submit" style="background:url(images/login_5.gif) no-repeat" value=" 取  消 "></td>
            <tr>
              <td height="5" colspan="2"></td>
        </div>
    </table></td>
    <td width="133" background="images/login_3.gif">&nbsp;</td>
  </tr>
  <tr>
    <td height="161" colspan="3" background="images/login_4.gif"></td>
  </tr>
</table>
</body>
</html>