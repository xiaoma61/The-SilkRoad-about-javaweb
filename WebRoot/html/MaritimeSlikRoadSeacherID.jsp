<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cn.theslikroad.LLM.TheLandRoadData" %>
<%@ page import="cn.theslikroad.LLM.UserName" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>海上文物</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/index5.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/subNav.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/selectFilter.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/style2.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/htmleaf-demo.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
<style type="text/css">
</style>
<script src="<%=path %>/js/js.js"type="text/javascript"></script>
<script src="<%=path %>/js/findMname.js"type="text/javascript"></script>
 <%request.setCharacterEncoding("utf-8");%> 

</head>
<body>
  <img src="<%=path %>/image/logo1.png" alt="" width="35px" style="position: fixed;left:5%;top:1%; z-index:1000;"/>
<div class="wrap">

<div class="nav">
<ul>
     <li><a href="../index.jsp">首页</a></li>
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

<div class="header">&nbsp;&nbsp;&nbsp;<a href="../index.jsp"><font color="bule">首页 </font></a>&nbsp;>&nbsp;探索&nbsp;>&nbsp;海上文物</div>
</div>

<div class="top">
 </div>
	
<div class="search">
<div class="search1" style="">
 <div class="search d5"  >
	 <form action="/TheSlikRoad/findLoadMsg"method="post">
		  <input name="name" id="title"  type="text" placeholder="搜索从这里开始" onkeyup="sendRequest()" onclick="hiddenSuggest()" onfocus="sendRequest()" >
		  <input name="id" value="文物分类"  type="text" style="display:none" > 
		  <input name="type" value="2"  type="text" style="display:none" > 
		  <button type="submit"></button>
	</form>
	      <div id="suggest" style=" color:black;width:93%;display:none; z-index:1000; position:relative; top:3px;left:20px; background-color:white; border:0.5px solid #dbdbdb;"  ></div>
		</div>
		

</div>
<div class="search1" style="color:black; width:500px">
<div class="filter-box" style="color:black; width:400px">
		<div class="filter-text">
			<input class="filter-title" type="text"  />
			<i class="icon icon-filter-arrow"></i>
		</div>
 <form action="/TheSlikRoad/findLoadMsg"method="post">
  <select name="id" >
  <option selected="selected">文物分类</option>
   <option value="东汉">东汉</option>
  <option value="唐代">唐代</option>
  <option value="明代">明代</option>
</select>
 <input name="type" value="2"  type="text" style="display:none" > 
<input type="submit"  class="blueButton" value="搜索" style="cursor:pointer;"/>
</form>
	</div>
  
</div>
<script type="text/javascript" src="<%=path %>/js/jquery.min1.js"></script>
<script type="text/javascript" src="<%=path %>/js/selectFilter.js"></script>
<script type="text/javascript">
	
	
	
	$('.filter-box').selectFilter({
		callBack : function (val){
			//返回选择的值
			console.log(val+'-是返回的值')
		}
	});
</script>
<div class="search1">
<% 
ArrayList list= (ArrayList)session.getAttribute("ID");
int rows=list.size();
int size=0;
%>

<%!


int t=0;

 %>
<%



	t=0;
	


%>
</div>

</div>

<div class="content">
<%

if(rows%3!=0)
{
	size=(int)rows/3+1;
}
else
{
	size=(int)rows/3;
	}
 %>	

<%for(int i=0;i<=size;i++){
 %>	
 <div class="content-top">
<%
for(int j=0;j<3;j++){
if(t<rows)
{
TheLandRoadData data=(TheLandRoadData)list.get(t);
 %>
 <div class="content-one">
    	<article class="post-152 post type-post status-publish format-standard hentry category-people category-photos">  
	<div class="post-format-content">
		<div class="post-thumbnail"> <img width=490 height="280" src="<%=data.getImageurl()%>" class=			"attachment-thumbnail wp-post-image" alt="105694702"> </div>
		
	<div class="content-wrap">
			<h1 class="entry-title"><a href="" class="featured-image" rel="bookmark"><%=data.getName() %><br /><br />&nbsp;&nbsp;&nbsp;&nbsp;<%=data.getIntroduction() %></a></h1>
		</div>
	</div>
</article>
    </div>
 <%}
 t++;
 } %>
  </div>
 <%} %>
 

</div>
</body>
</html>