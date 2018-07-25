<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cn.theslikroad.LLM.UserName" %>
<jsp:useBean id="reg" scope="request" class="cn.theslikroad.LLM.Register"/> 
 <%request.setCharacterEncoding("utf-8");%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>注册</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/index2.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/subNav.css" />
<style type="text/css">
 .msgtip{ color: red;font-size:12px; }

</style>

<script src="./js/js.js"></script>

<script >
 var ajax;
  var flag=true;

  function createXMLHttp()
  {
  		if(window.XMLHttpRequest)
  		{
  			ajax=new XMLHttpRequest();
  		}else if(window.ActiveXObject)
  		{
  		
  			ajax=new ActiveXObject("Mricosoft.XMLHTTP");
  		}
  }
  function chackUsername(username)
  {
  	createXMLHttp();
  	ajax.open("POST","theslikroad/checkservlet?username="+encodeURI(encodeURI(username)),true);
  	ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	ajax.onreadystatechange=hell;
  	ajax.send(null);
  }
  function hell()
  {
	
  	if(ajax.readyState==4)
  	{
  		
  		if(ajax.status==200)
  		{
  		
  		var text=ajax.responseText;
  		if(text=="true")
  		{
  			document.getElementById("msgtip").innerHTML="该用户名重复";
  			flag=false;
  		
  		}
  		else if(text=="false")
  		{
  				
  		    document.getElementById("msgtip").innerHTML="此用户id可以注册";
  		    flag=true;
  		    
 
  					
  		}
  	}
  	    
  		
  	}
  
  }
function checkForm()
{
return flag;
}

		function check(tx)
		{
			 if(tx=='msgtip1')   {
            		document.all[tx].innerHTML = "<div class='reds' align='left'>密码必须为6-15位</div>";
            	}
		
		
		}
        function sl(tx)    {
             var username=document.getElementById("username");
        	 var password=document.getElementById("password").value;
             var repassword=document.getElementById("repassword").value;
             var phone =document.getElementById("phone").value;
             var e_mail=document.getElementById("e_mail").value; 
             var re_e_mail=document.getElementById("re_e_mail").value;           
             var reg = /^1[34578][0-9]{9}$/;
            if(tx=='msgtip')   {
          
            	document.all[tx].innerHTML = "<div class='reds' align='left'>用户名不能为空</div>";
            		flag=false;
              
                
            }
             if(tx=='msgtip1')   {

            	if(/^[a-zA-Z0-9_-]{6,15}$/.test(password))
            	{
            		document.all[tx].innerHTML = "<div class='reds' align='left'>密码正确</div>";
            		
        
            	
            	}
            	            	
                
            }
             if(tx=='msgtip2')   {
            	
              if(password===repassword&&repassword!="")
             {
              document.all[tx].innerHTML = "<div class='reds' align='left'>密码符合</div>";
             }
             else
             {
             	document.all[tx].innerHTML = "<div class='reds' align='left'>密码不正确</div>";
             	
             } 
            }   
            if(tx=='msgtip3') {
         
            if(!(reg.test(phone)))
            {
             	document.all[tx].innerHTML = "<div class='reds' align='left'>请输入11位的号码</div>";
             
            }
            else{
            	
            	
            	document.all[tx].innerHTML = "<div class='reds' align='left'>号码正确</div>";
            	
            }
             }
       	 if(tx=='msgtip4') {
            var reg1 = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");
            if(!(reg1.test(e_mail)))
            {
             	document.all[tx].innerHTML = "<div class='reds' align='left'>请输入正确的邮箱</div>";
             
            }
            else{
            	
            	
            	document.all[tx].innerHTML = "<div class='reds' align='left'>邮箱正确</div>";
            	
            }
             } 
             
           if(tx=='msgtip5') {
           
            if(re_e_mail==e_mail&&re_e_mail!="")
            {
             	document.all[tx].innerHTML = "<div class='reds' align='left'>邮箱正确</div>";
             	
             	
            }
            else{
            	
            	
            	document.all[tx].innerHTML = "<div class='reds' align='left'>邮箱错误</div>";
            	
            }
             }
            }

    </script>

</head>

<body>
 <img src="<%=path %>/image/logo1.png" alt="" width="35px" style="position: absolute;left:5%;top:1%; z-index:1000;"/>
<div class="wrap">

<div class="nav">
<ul>
     <li><a href="<%=path %>/index.jsp"><font color="black">首页</font></a></li>
    <li><a href="<%=path %>/html/museum.jsp"target="_blank"><font color="black">博物馆</font></a>
    <ul class="subNav">
        <li><a href="<%=path %>/html/museum.jsp"target="_blank">门票</a></li>
            <li><a href="<%=path %>/html/museum.jsp"target="_blank">地点</a></li>
            <li><a href="<%=path %>/html/museum.jsp"target="_blank">开放时间</a></li>
            <li><a href="<%=path %>/html/museum.jsp"target="_blank">游览需知</a></li>
        </ul>
    </li>
    <li><a href="#"><font color="black">探索</font></a>
    <ul class="subNav">
        <li><a href="<%=path %>/html/history.jsp"target="_blank">丝路历史</a></li>
            <li><a href="<%=path %>/html/Land Slik Road.jsp"target="_blank">陆上文物</a></li>
            <li><a href="<%=path %>/html/Maritime Slik Road.jsp"target="_blank">海上文物</a></li>
        </ul>
    </li>
    <li><a href="#"><font color="black">学术</font></a>
	 <ul class="subNav">
        <li><a href="<%=path %>/html/literature.jsp"target="_blank">文献</a></li>
            <li><a href="<%=path %>/html/tribune.jsp"target="_blank">论坛</a></li>
            <li><a href="<%=path %>/html/scholars of the past.jsp"target="_blank">景仁榜</a></li>
        </ul></li>
    <li><a href="#"><font color="black">文创</font></a>
	 <ul class="subNav">
        <li><a href="<%=path %>/html/game.jsp"target="_blank">丝路游戏</a></li>
            <li><a href="<%=path %>/html/background.jsp"target="_blank">丝路壁纸</a></li>
        </ul></li>
    <li><a href="<%=path %>/html/about.jsp"target="_blank"><font color="black">关于</font></a>
	 <ul class="subNav">
      <li><a href="<%=path %>/html/about.jsp#about1" target="_blank">关于我们</a></li>
            <li><a href="<%=path %>/html/about.jsp#contacts1" target="_blank">联系我们</a></li>
            <li><a href="<%=path %>/html/about.jsp#cooperate1" target="_blank">招商</a></li>
        </ul></li>
	<li class="person"><a href="#"><img src="<%=path %>/image/timg1.jpg.png" width="35"   /></a></center>
		 <ul class="subNav">
		 <jsp:useBean id="username" class="cn.theslikroad.LLM.UserName"></jsp:useBean>
		 <%if(UserName.username.equals(null)||UserName.username.equals("")){ %>
		   <li><a href="<%=path %>/html/load.jsp">登陆</a></li>
           <li><a href="<%=path %>/registe.jsp">注册</a></li>
		 <% }else{%>   
		<li><a href="<%=path %>/html/personal homepage.jsp">个人中心</a></li>
        <li><a href="<%=path %>/ChangeName">退出</a></li>
         <% }%>
        </ul>
	</li>
</ul>
</div>

<div class="header">&nbsp;&nbsp;&nbsp;<a href="<%=path %>/index.jsp"><font color="bule">首页 </font></a>&nbsp;>&nbsp;注册</div>

<div class="rules">
<table width=100%>
<tr height=100px><th style="font-size:30px;">[成为网站会员]</th></tr>
<tr height=25px><td>欢迎您来到我们网站，在这里注册之后即可成为我们网站的会员，享受网站为您提供的一系列服务，包括：</td></tr>
<tr height=25px><td>(一)查阅文献，参与论坛讨论；</td></tr>
<tr height=25px><td>(二)阅读本网站收集的新闻，了解丝路最新展览消息和其他资讯；</td></tr>
<tr height=25px><td>(三)参与本网站的在线调查，让我们为您提供更好的服务；</td></tr>
<tr height=25px><td>您所填的个人材料受到网站的保护。（阅读《网站使用条例》）</td></tr>
</table>

</div>
<form action="UsrMsginsert.jsp"method="post" onsubmit="return checkForm()">
<div class="main1">

[基本信息]


<input id="username" type="text" name="username" placeholder="用户名" style="background:transparent; height:40px;font-size:20px;width:100%;" value="<jsp:getProperty name="reg" property="username"/>" onblur="chackUsername(this.value);" onfocus=" return sl('msgtip');"/>
 <br />
  <br />
<div  id="msgtip" class="msgtip"></div>



<input id="password" type="password" name="password" placeholder="密码"style="background:transparent; height:40px;font-size:20px;width:100%;" value="<jsp:getProperty name="reg" property="password" />" onblur="return sl('msgtip1');" onfocus="return check('msgtip1');"/>
<br />
 <br />
<div  id="msgtip1" class="msgtip"></div>


<input id="repassword" type="password"name="repassword"placeholder="确认密码"style="background:transparent; height:40px;font-size:20px;width:100%;" value="<jsp:getProperty name="reg" property="repassword"/>" onblur="return sl('msgtip2');" onfocus=" return sl('msgtip2');"/>
<br />
 <br />
<div  id="msgtip2" class="msgtip"></div>

<input id="phone" type="text"name="phone" placeholder="手机号码"style="background:transparent; height:40px;font-size:20px;width:100%;" value="<jsp:getProperty name="reg" property="phone"/>" onblur=" return sl('msgtip3');" onfocus="return sl('msgtip3');"/>
<br />
 <br />
<div  id="msgtip3" class="msgtip"> </div>

<input id="e_mail" type="text"name="e_mail" placeholder="邮箱地址"style="background:transparent; height:40px;font-size:20px;width:100%;" value="<jsp:getProperty name="reg" property="e_mail"/>" onblur=" return sl('msgtip4');" onfocus="return sl('msgtip4');"/>
<br />
 <br />
<div id="msgtip4" class="msgtip"> </div>
<input id="re_e_mail" type="text"name="re_e_mail"size=30 placeholder="确认邮箱地址"  value="<jsp:getProperty name="reg" property="re_e_mail"/>" onblur=" return sl('msgtip5');" onfocus="return sl('msgtip5');"style="background:transparent; height:50px;font-size:20px;width:100%;" />
<br />
 <br />
<div  id="msgtip5" class="msgtip"> </div>
<textarea name="introduce"  cols="25"rows="6" placeholder="自我介绍" value="<jsp:getProperty name="reg" property="re_e_mail"/>"style="background:transparent; height:80px ;font-size:20px;width:100%;"></textarea>
<br />
 <br />	
	
<input type="checkbox"name="2"value="2" />同意《网站会员注册协议》（若不同意，将不能注册）
</div>


<div class="main2">
<table  width=350px >
<tr>
<td>
<input type="submit"value="完成注册" style="background:transparent; height:35px;width:125px;display:inline-block;font-size:20px;cursor:pointer"/></td>
<td>已注册？<a href="load.jsp">请登陆</a></td>
</tr>
</table>
</div>
</form>


</body>
</html>
