<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cn.theslikroad.LLM.BgImage" %>
<%@ page import="cn.theslikroad.LLM.UserName" %>
 <jsp:useBean id="username" class="cn.theslikroad.LLM.UserName"></jsp:useBean>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>

    
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/subNav.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/index3.css" />
 
    <title></title>
    
	
   <script src="../js/js.js"type="text/javascript"></script>
  </head>
  
  <body>
   <img src="<%=path %>/image/logo1.png" alt="" width="35px" style="position: absolute;left:5%;top:1%; z-index:1000;"/>
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
		 <jsp:useBean id="username1" class="cn.theslikroad.LLM.UserName"></jsp:useBean>
		 <%if(UserName.username.equals(null)||UserName.username.equals("")){ %>
		   <li><a href="<%=path %>/html/load.jsp" target="_blank">登陆</a></li>
           <li><a href="<%=path %>/registe.jsp" target="_blank">注册</a></li>
		 <% }else{%>   
		<li><a href="<%=path %>/html/personal homepage.jsp" target="_blank">个人中心</a></li>
       <li><a href="<%=path %>/ChangeName" >退出</a></li>
         <% }%>
        </ul>
	</li>
</ul>
</div>
<div class="header">&nbsp;&nbsp;&nbsp;<a href="<%=path %>/index.jsp"  target="_blank"> <font color="bule">首页 </font></a>&nbsp;>&nbsp;关于</div>

<div class="about">
<a name "about1">
<font size=6em>关于我们</font>&nbsp;about</a>
<br /><br /><hr width=100% align="left" > 
<br /><br />
<table width=80% align=center valign=middle rules="cols" border="1%" frame="void">
<tr height=50px><th>马玉丽</th>
    <th>梁彩珠</th>
	<th>卢佳婷</th>
	<th>建站时间</th>
</tr>
<tr align=center height=50px valign="top"><td>Ma Yuli</td>
    <td>Liang Caizhu</td>
	<td>Lu Jiating</td>
	<td>Time</td>
</tr>
<tr align=center><td>#</td>
    <td>#</td>
	<td>#</td>
	<td>#</td>
</tr>
<tr align=center><td>#</td>
    <td>#</td>
	<td>#</td>
	<td>#</td>
</tr>
<tr align=center><td>#</td>
    <td>#</td>
	<td>#</td>
	<td>#</td>
</tr>
<tr align=center><td>#</td>
    <td>#</td>
	<td>#</td>
	<td>#</td>
</tr>
<tr align=center><td>#</td>
    <td>#</td>
	<td>#</td>
	<td>#</td>
</tr>
<tr><td colspan="4" align=center height=100px valign="middle">SICHOUZHILU丝绸之路</td></tr>
</table>
</div>
<div class="contacts">
<font size=6em><a name="contacts1"><br /></a><br /><br /><br />联系我们</font>&nbsp;contacts
<br /><br /><hr width=100% align="left" > 
<br /><br />
<table width=80%  align=center valign=middle rules="cols" border="1%" frame="void">
<tr align=center valign="top"><td align=left width=50%>我们的地址  Address:<br /><br /><br />xxxxxxx<br /><br /><br />xxxxxxx<br /><br /><br />邮箱 email：xxxxxxx<br /><br /><br />电话 phone：xxxxxxx<br /><br /><br />传真 fax:xxxxxxxxxxxxxx&nbsp;&nbsp;</td>
    <td width=50%>写给我们 write us：<br /><br /><br />
	<form action="process.aspx"method="post">
	&nbsp;&nbsp;<input type="text"name="yourcaptcha"size=25 placeholder="名字 name:"style="background:transparent; height:45px;font-size:20px;" /><br /><br />
	&nbsp;&nbsp;<input type="text"name="yourcaptcha"size=25 placeholder="邮箱 email:"style="background:transparent; height:45px;font-size:20px;" /><br /><br />
	&nbsp;&nbsp;<input type="text"name="yourcaptcha"size=25 placeholder="电话 phone:"style="background:transparent; height:45px;font-size:20px;" /><br /><br />
    &nbsp;&nbsp;<textarea name="yoursuggest"cols="25"rows="3" placeholder="信息 message："style="background:transparent; height:50px weight：30px;font-size:20px;"></textarea><br /><br />
	&nbsp;&nbsp;<input type="submit"value="提交" style="background:transparent; height:35px;width:125px;display:inline-block;font-size:20px;cursor:pointer"/>
	</form>
</td>
</tr>
</table>
</div>
<div class="cooperate">
<a name="cooperate1">
<font size=6em>招商</font>&nbsp;cooperate</a>
<br /><br /><hr width=100% align="left" > 
<br /><br />
<table width=80%>
<tr><td align=left>感谢大家对我们的支持<br /><br /><br />尤其是学院老师和辅导员的帮助<br /><br /><br />感谢一路支持我们的小伙伴</td>
</tr>
</table>

</div>
</div>
  </body>
</html>
