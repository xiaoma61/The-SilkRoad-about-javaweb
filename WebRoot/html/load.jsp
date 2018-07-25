<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cn.theslikroad.LLM.UserName" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    

    

	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="<%=path %>/css/subNav.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/index1.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/demo.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/component.css" />
	<link href="<%=path %>/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="<%=path %>/css/general.css">
	<link rel="stylesheet" href="<%=path %>/css/set_1.css">
	<link rel="stylesheet" href="<%=path %>/css/set_6.css">
<script src="<%=path %>/js/js.js"type="text/javascript">
</script>
<script type="text/javascript">
  
  function change(){
	  var t = new Date().getTime();
	  document.getElementById("IndexCode").src="IndexCode?t="+t;
  }
  </script>
 <script language="JavaScript" type="text/JavaScript">

function check(){
        var username = document.getElementById("username");
        var password = document.getElementById("password");
        var tips = document.getElementById("tips");
        var code = document.getElementById("code");
        
        tips.style.display="block"; 
        if(username.value==null ||username.value==""){
      
            tips.innerHTML="用户名或密码错误";
            username.focus();
            setTimeout("codefans()",3000);
            return;
        }
        if(password.value==null || password.value==""){
   
            tips.innerHTML="用户名或密码错误";
            password.focus();
            setTimeout("codefans()",2000);
            return;
        }
   		  if(code.value==null || code.value==""){
   
            tips.innerHTML="验证码错误";
            code.focus();
            setTimeout("codefans()",2000);
            return;
        } 
        
        form1.submit();
       
        
    }

function codefans(){
var box=document.getElementById("tips");
box.style.display="none"; 
}

</script>
  </head>
 
  <body>
    <img src="<%=path %>/image/logo2.png" alt="" width="35px" style="position: fixed;left:5%;top:1%; z-index:1000;"/>
 <div class="wrap">

<div class="nav">
<ul>
     <li><a href="<%=path %>/index.jsp">首页</a></li>
    <li><a href="<%=path %>/html/museum.jsp"target="_blank">博物馆</a>
    <ul class="subNav">
        <li><a href="<%=path %>/html/museum.jsp"target="_blank">门票</a></li>
            <li><a href="<%=path %>/html/museum.jsp"target="_blank">地点</a></li>
            <li><a href="<%=path %>/html/museum.jsp"target="_blank">开放时间</a></li>
            <li><a href="<%=path %>/html/museum.jsp"target="_blank">游览需知</a></li>
        </ul>
    </li>
    <li><a href="#">探索</a>
    <ul class="subNav">
        <li><a href="<%=path %>/html/history.jsp"target="_blank">丝路历史</a></li>
            <li><a href="<%=path %>/html/Land Slik Road.jsp"target="_blank">陆上文物</a></li>
            <li><a href="<%=path %>/html/Maritime Slik Road.jsp"target="_blank">海上文物</a></li>
        </ul>
    </li>
    <li><a href="#">学术</a>
	 <ul class="subNav">
        <li><a href="<%=path %>/html/literature.jsp"target="_blank">文献</a></li>
            <li><a href="<%=path %>/html/tribune.jsp"target="_blank">论坛</a></li>
            <li><a href="<%=path %>/html/scholars of the past.jsp"target="_blank">景仁榜</a></li>
        </ul></li>
    <li><a href="#">文创</a>
	 <ul class="subNav">
        <li><a href="<%=path %>/html/game.jsp"target="_blank">丝路游戏</a></li>
            <li><a href="<%=path %>/html/background.jsp"target="_blank">丝路壁纸</a></li>
        </ul></li>
    <li><a href="<%=path %>/html/about.jsp"target="_blank">关于</a>
	 <ul class="subNav">
      <li><a href="<%=path %>/html/about.jsp#about1" target="_blank">关于我们</a></li>
            <li><a href="<%=path %>/html/about.jsp#contacts1" target="_blank">联系我们</a></li>
            <li><a href="<%=path %>/html/about.jsp#cooperate1" target="_blank">招商</a></li>
        </ul></li>
	<li class="person"><a href="#"><img src="<%=path %>/image/timg1.jpg.png" width="35"   /></a></center>
		 <ul class="subNav">
		 <jsp:useBean id="username" class="cn.theslikroad.LLM.UserName"></jsp:useBean>
		 <%if(UserName.username.equals(null)||UserName.username.equals("")){ %>
		   <li><a href="<%=path %>/html/load.jsp" target="_blank">登陆</a></li>
           <li><a href="<%=path %>/registe.jsp" target="_blank">注册</a></li>
		 <% }else{%>   
		<li><a href="<%=path %>/html/personal homepage.jsp" target="_blank">个人中心</a></li>
       <li><a href="<%=path %>/ChangeName">退出</a></li>
         <% }%>
        </ul>
	</li>
</ul>
</div>

<div class="header">&nbsp;&nbsp;&nbsp;<a href="<%=path %>/index.jsp" target="_blank"><font color="bule">首页 </font></a>&nbsp;>&nbsp;登陆</div>
<script type="text/javascript" src="./js/jquery.min.js"></script>
<div class="main" style="background-image: url(<%=path %>/image/load.jpg)">

 <div class="contain">
 <h6 style="text-align:center;" id="tips"></h6>
<%
request.setCharacterEncoding("utf-8");
 %>
 <%
 List<String>info=(List<String>)request.getAttribute("info");
 if(info!=null)
 {
 	Iterator<String>iter=info.iterator();
 	while(iter.hasNext())
 	{
 %>		
 	<h6 style="text-align:center;" id="tips"><%=iter.next() %></h6>
 <%
 }}
  %> 
<form action="loginservlet" method="post" style="width:80%; margin-left:18%;padding: 20x;" id="form1" onSubmit="return check(this);">
	<section class="content">
				<span class="input input--kuro">
				<input class="input__field input__field--kuro" type="text" id="username" name="username" />
					
					<label class="input__label input__label--kuro" for="password">
				    <span class="input__label-content input__label-content--kuro">用户名</span>
					</label>
				</span>
	</section>
	<section class="content">
				<span class="input input--kuro">
					<input class="input__field input__field--kuro" type="password" id="password" name="password"  width="100%" />
					<label class="input__label input__label--kuro" for="username">
				    <span class="input__label-content input__label-content--kuro">密码</span>
					</label>
				</span>
				
			</section>

<section class="content " style="position:relative;">
	
				<span class="input input--madoka">
					<input class="input__field input__field--madoka" type="text" id="code" name="code"/>
					<label class="input__label input__label--madoka" for="code">
						<svg class="graphic graphic--madoka" width="100%" height="100%" viewBox="0 0 404 77" preserveAspectRatio="none">
							<path d="m0,0l404,0l0,77l-404,0l0,-77z"/>
						</svg>
					
					</label>
				</span>
			
			<span><a href="javaScript:change()"><img src="IndexCode" width="130px" height="70px" class="codeImge" id="IndexCode"/></a></span>	
			
			</section>
<!-- <input type="text"name="code"size=30 placeholder="验证码"style="height:30px" >&nbsp;
<a href="javaScript:change()"><img src="IndexCode" width="125px" height="35px" class="codeImge" id="IndexCode"/></a> -->

<br />
<a href="javascript:check();" class="set_1_btn Vbtn-3" style=" display:inline-block;margin-left:6%; color:white;"> <svg>
<rect x="0" y="0" fill="none" width="100%" height="100%"></rect>
</svg> 登陆</a> 
<div class="set_6_btn in blue" style="position:relative;top:-16px;"><a href="<%=path %>/registe.jsp" ><span style="color:white;font-size:60%;">还没注册?</span></a> 
		  <div class="corners top"></div>
		  <div class="corners bottom"></div>
		</div>

<br>
</form>


</div>
</div>
  
 <script src="js/classie.js"></script>
		<script>
			(function() {
				// trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
				if (!String.prototype.trim) {
					(function() {
						// Make sure we trim BOM and NBSP
						var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
						String.prototype.trim = function() {
							return this.replace(rtrim, '');
						};
					})();
				}

				[].slice.call( document.querySelectorAll( 'input.input__field' ) ).forEach( function( inputEl ) {
					// in case the input is already filled..
					if( inputEl.value.trim() !== '' ) {
						classie.add( inputEl.parentNode, 'input--filled' );
					}

					// events:
					inputEl.addEventListener( 'focus', onInputFocus );
					inputEl.addEventListener( 'blur', onInputBlur );
				} );

				function onInputFocus( ev ) {
					classie.add( ev.target.parentNode, 'input--filled' );
				}

				function onInputBlur( ev ) {
					if( ev.target.value.trim() === '' ) {
						classie.remove( ev.target.parentNode, 'input--filled' );
					}
				}
			})();
		</script>
</div>
</body>

</html>
