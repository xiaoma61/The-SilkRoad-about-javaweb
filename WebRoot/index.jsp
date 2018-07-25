<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cn.theslikroad.LLM.New" %>
<%@ page import="cn.theslikroad.LLM.UserName" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <!–[if lt IE 9]><script src=”http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js”></script><![endif]–>
<title>首页</title>
    
<link rel="stylesheet" type="text/css" href="<%=path %>/css/index.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/subNav.css" />
	
  </head>
 
  <body>
   <img src="<%=path %>/image/logo1.png" alt="" width="35px" style="position:fixed;left:5%;top:1%; z-index:1000;"/>
 <div class="wrap">

<div class="nav">
<ul>
     <li><a href="<%=path %>/index.jsp"><font color="#FFFFFF">首页</font></a></li>
    <li><a href="<%=path %>/html/museum.jsp"target="_blank"><font color="#FFFFFF">博物馆</font></a>
    <ul class="subNav">
        <li><a href="<%=path %>/html/museum.jsp"target="_blank">门票</a></li>
            <li><a href="<%=path %>/html/museum.jsp"target="_blank">地点</a></li>
            <li><a href="<%=path %>/html/museum.jsp"target="_blank">开放时间</a></li>
            <li><a href="<%=path %>/html/museum.jsp"target="_blank">游览需知</a></li>
        </ul>
    </li>
    <li><a href="#"><font color="#FFFFFF">探索</font></a>
    <ul class="subNav">
        <li><a href="<%=path %>/html/history.jsp"target="_blank">丝路历史</a></li>
            <li><a href="<%=path %>/html/Land Slik Road.jsp"target="_blank">陆上文物</a></li>
            <li><a href="<%=path %>/html/Maritime Slik Road.jsp"target="_blank">海上文物</a></li>
        </ul>
    </li>
    <li><a href="#"><font color="#FFFFFF">学术</font></a>
	 <ul class="subNav">
        <li><a href="<%=path %>/html/literature.jsp"target="_blank">文献</a></li>
            <li><a href="<%=path %>/html/tribune.jsp"target="_blank">论坛</a></li>
            <li><a href="<%=path %>/html/scholars of the past.jsp"target="_blank">景仁榜</a></li>
        </ul></li>
    <li><a href="#"><font color="#FFFFFF">文创</font></a>
	 <ul class="subNav">
        <li><a href="<%=path %>/html/game.jsp"target="_blank">丝路游戏</a></li>
            <li><a href="<%=path %>/html/background.jsp"target="_blank">丝路壁纸</a></li>
        </ul></li>
    <li><a href="<%=path %>/html/about.jsp"target="_blank"><font color="#FFFFFF">关于</font></a>
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
        <li><a href="<%=path %>/ChangeName" target="_blank">退出</a></li>
         <% }%>
        </ul>
	</li>
</ul>


</div>



<script src="./js/play.js"></script>

	  <nav>
            <ul id="index">
                <li class="on"></li>
                <li></li>
                <li></li>
                <li></li>
                
            </ul>
            <ul id="img">
                <li class="opa-on"><img src="image/first_bells.jpg"  width="1700"alt="img1"></li>
                <li><img src="image/first_desert.jpg" width="1700" alt="img2"></li>
                <li><img src="image/first_silk.jpg" width="1700" alt="img3"></li>
                <li><img src="image/first_tea.jpg" width="1700"  alt="img4"></li>
            </ul>
        </nav>

	

	
	
	
<div class="main">	
<div class="main-left">
<div class="main-left-top"><img src="image/first_treasure.jpg" width="883" height="442" /></div>
<div class="main-left-bottom">


<div class="main-left-bottom-left">
<br /><font size=5>丝绸之路 · 资讯</font><br /><br />

<div id="colee" style="overflow:hidden;height:200px;width:410px;">
<div id="colee1">
<jsp:useBean id="News" scope="session" class="cn.theslikeroad.dataPrepare.NewData"/>
<%
	ArrayList list=(ArrayList)News.Getdata() ;
	if(list.size()>0)
	{
	for(int i=0;i<list.size();i++)
	{
		New news=(New)list.get(i);
		
		%>
		<p class="cont"><a href="<%=news.getNewsUrl()%>" target="_blank">· <%=news.getNewsTitle()%></a></p >
		<% 
		
	}
	}
	

 %>


</div>
<div id="colee2"></div>

</div>
<script src="./js/news.js">
</script>
</div>



<div class="main-left-bottom-right"></div>
</div>
</div>

<div class="main-right_top">
<div class="main-right_top-left">
<div id="rotate"><a href="html/book1.jsp" target="_blank"><img src="png/circle.png" width="100" height="100" /></a></div>
<script src="./js/revolve.js"></script>

</div>

<div class="main-right_top-middle">
<div id="rotate1"><a href="html/book2.jsp" target="_blank"><img src="png/circle.png" width="100" height="100" /></a></div>
<script src="./js/revolve1.js"></script>
</div>

<div class="main-right_top-right">
<div id="rotate2"><a href="html/book3.jsp"target="_blank"><img src="png/circle.png" width="100" height="100" /></a></div>
<script src="./js/revolve2.js"></script></div>
</div>

<div class="main-right_bottom"><!--<embed src="https://imgcache.qq.com/tencentvideo_v1/playerv3/TPout.swf?max_age=86400&v=20161117&vid=r0019mpywvz&auto=0" allowFullScreen="true" quality="high" width=714 height=544 align="middle" allowScriptAccess="always" allowFullScreen="true" mode="transparent" type="application/x-shockwave-flash"></embed>-->
<video width=714 height=550  controls="controls" poster="image/video.jpg">
<source src="http://183.6.223.85/6976ABB8932307274401A2FA7/0300200100552A41AC50E90045C43AF303EC3B-7675-D145-6539-671A3EE4638D.mp4?ccode=0502&duration=182&expire=18000&psid=dd8f836013972905b43353cd449e0e2c&sp=&ups_client_netip=79200cc6&ups_ts=1532277580&ups_userid=&utid=1biyE5a9WiICAXkgDQDzjqwL&vid=XOTM4NDI1NjI4&vkey=Bba98403ceb84ae881c85a141ac5e1e8d" /></video>
</video>
</div>

</div>

<div class="content">
<div class="content_left"><a  href="<%=path %>/html/Land Slik Road.jsp" target="_blank">丝绸之路</a> ·<a href="<%=path %>/html/Maritime Slik Road.jsp" target="_blank"> 藏品</a></font></div>
<div class="content-right">
<div class="content-right-1">
<article class="post-152 post type-post status-publish format-standard hentry category-people category-photos">  
	<div class="post-format-content">
		<div class="post-thumbnail"> <img width=100 height=423 class="attachment-thumbnail wp-post-image" > </div>
		
	<div class="content-wrap">
			<h1 class="entry-title"><a href="" class="featured-image" rel="bookmark" target="_blank">漫步丝绸之路<br><br>小雨泥淋釉伞轻，天空着意雨霏晴。<br /><br />寻遗塞外昭君怨，顿起凝愁悯泪倾。<br /><br />但使边关磐若石，丝绸古道漾萧笙。<br /><br />如今落雁尘埃远，不尽天山万古情。</a></h1>
		</div>
	</div>
</article>

</div>
<div class="content-right-2">

<article class="post-152 post type-post status-publish format-standard hentry category-people category-photos">  
	<div class="post-format-content">
		<div class="post-thumbnail"> <img width=100 height=423 class="attachment-thumbnail wp-post-image" > </div>
		
	<div class="content-wrap">
			<h1 class="entry-title"><a href="" class="featured-image" rel="bookmark">丝绸之路赋<br><br>寰球一段金飘带，乐舞长安紫禁开。<br /><br />朝野交流穿朔漠，中西融合越烽台。<br /><br />丝绸茶叶陶瓷萃，商贾僧人行旅偕。<br /><br />异域驼铃风雨路，汉唐气象大胸怀。</a></h1>
		</div>
	</div>
</article>

</div>
<div class="content-right-3">

<article class="post-152 post type-post status-publish format-standard hentry category-people category-photos">  
	<div class="post-format-content">
		<div class="post-thumbnail"> <img width=100 height=423 class="attachment-thumbnail wp-post-image" > </div>
		
	<div class="content-wrap">
			<h1 class="entry-title"><a href="" class="featured-image" rel="bookmark">丝绸之路赋<br><br>金戈铁骥下楼兰，漫卷烽烟扫宇寰。<br /><br />白骨堆山销铠甲，赤光遮眼映旌幡。<br /><br />羌笛一曲丝绸路，胡马千年五彩弦。<br /><br />古道西风今又现，葡萄美酒话缠绵。</a></h1>
		</div>
	</div>
</article>
</div>
</div>
</div>

<div class="content2">
<div class="content_left2">

<div class="content-left2-1"></div>
<div class="content-left2-2"></div>
<div class="content-left2-3"></div>
</div>

<div class="content-right2"><font size=8 color="#fffff">丝绸之路 · 邮票</font>
</div>
</div>

<div class="footer"></div></div>





  </body>
</html>
