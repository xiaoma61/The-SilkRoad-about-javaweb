<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cn.theslikroad.LLM.UserName" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  <head>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/subNav.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/index12.css" />
    <script src="<%=path %>/js/js.js"type="text/javascript"></script>
  </head>
  
  <body>
    <img src="<%=path %>/image/logo1.png" alt="" width="35px" style="position: fixed;left:5%;top:1%; z-index:1000;"/>
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
			<li><a href="<%=path %>/html/personal homepage.jsp"target="_blank">个人中心</a></li>
            <li><a href="<%=path %>/ChangeName">退出</a></li>
         <% }%>
        </ul>
	</li>
</ul>
</div>

<div class="header">&nbsp;&nbsp;&nbsp;<a href="<%=path %>/index.jsp"><font color="bule">首页</font></a>&nbsp;>&nbsp;学术&nbsp;>&nbsp;景仁榜</div>


<div class="top">“景仁榜”——“景仰仁德”之意<br />以此来表达我们对于这些在丝绸之路上作出贡献的人士的缅怀之情。<br /></div>
<div class="main">
<div class="main-top">出生日期排序</div>
<div class="main-bottom">
<div class="content"><div class="picture"><img src="<%=path %>/image/zhangqian.jpg" height="100%" width="100%" /></div><div class="introduce">张骞<br /><font size="-1">(-164--114)</font></div></div>
<div class="content"><div class="picture"><img src="<%=path %>/image/huoqu.jpg" height="100%" width="100%" /></div><div class="introduce">霍去病<br /><font size="-1">(-140--117)</font></div></div>
<div class="content"><div class="picture"><img src="<%=path %>/image/banchao.jpg" height="100%" width="100%" /></div><div class="introduce">班超<br /><font size="-1">(32-102)</font></div></div>
<div class="content"><div class="picture"><img src="<%=path %>/image/ganying.jpg" height="100%" width="100%" /></div><div class="introduce">甘英<br /><font size="-1">(生卒年不祥)</font></div></div>
<div class="content"><div class="picture"><img src="<%=path %>/image/faxian.jpg" height="100%" width="100%" /></div><div class="introduce">法显<br /><font size="-1">(334-420)</font></div></div>
<div class="content"><div class="picture"><img src="<%=path %>/image/luoshi.jpg" height="100%" width="100%" /></div><div class="introduce">鸠摩罗什<br /><font size="-1">(344-413)</font></div></div>
<div class="content"><div class="picture"><img src="<%=path %>/image/xuanzang.jpg" height="100%" width="100%" /></div><div class="introduce">玄奘<br /><font size="-1">(600-664)</font></div></div>
<div class="content"><div class="picture"><img src="<%=path %>/image/make.jpg" height="100%" width="100%" /></div><div class="introduce">马可•波罗<br /><font size="-1">(1254-1324)</font></div></div>
<div class="content"><div class="picture"><img src="<%=path %>/image/zhenghe.jpg" height="100%" width="100%" /></div><div class="introduce">郑和<br /><font size="-1">(1371-1433)</font></div></div>
<div class="content"><div class="picture"><img src="<%=path %>/image/lima.jpg" height="100%" width="100%" /></div><div class="introduce">利玛窦<br /><font size="-1">(1552-1610)</font></div></div>
<div class="content"><div class="picture"><img src="<%=path %>/image/feidi.jpg" height="100%" width="100%" /></div><div class="introduce">费迪南•冯•李希霍芬男爵<br /><font size="-1">(1833-1905)</font></div></div>
<div class="content"><div class="picture"><img src="<%=path %>/image/siwen.jpg" height="100%" width="100%" /></div><div class="introduce">斯文•赫定<br /><font size="-1">(1865-1952)</font></div></div>



</div>
</div>

</div>
</body>
  </body>
</html>
