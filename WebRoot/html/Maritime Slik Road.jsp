<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cn.theslikroad.LLM.TheMaritimeSlikroad" %>
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
<link rel="stylesheet" type="text/css" href="<%=path %>/css/style2.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/htmleaf-demo.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
<script src="<%=path %>/js/js.js"type="text/javascript"></script>
<script src="<%=path %>/js/findMname.js"type="text/javascript"></script>
 <%request.setCharacterEncoding("utf-8");%> 
       
</script>
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

<div class="header">&nbsp;&nbsp;&nbsp;<a href="<%=path %>/index.jsp"><font color="bule">首页 </font></a>&nbsp;>&nbsp;探索&nbsp;>&nbsp;海上文物</div>
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
<jsp:useBean id="landroaddata" scope="request" class="cn.theslikeroad.dataPrepare.MaritimeData"/>
<% ArrayList list= (ArrayList)landroaddata.GetMaritimeData();
int rows=list.size();
int pages=(rows%pagesize==0)?(rows/pagesize):rows/pagesize+1;
%>

<%!

int pagesize=9;
int t=0;
int currentpage;
int limitpage;
int tempcurrent;
 %>
<%


String curpage=request.getParameter("page");
if(curpage==null)
{
	t=0;
	currentpage=1;
	limitpage=currentpage+8;
	tempcurrent=1;
}
else
{
	t=Integer.parseInt(curpage)*9;
	currentpage=t/9;
	tempcurrent=currentpage;
    limitpage=currentpage+8;
}

%>
<h4>一共有：<%=rows %>条记录 共<%=pages-1%>页</h4>
</div>

</div>

<div class="content">


<%for(int i=0;i<3;i++){
 %>	
 <div class="content-top">
<%
for(int j=0;j<3;j++){
if(t<rows)
{
TheMaritimeSlikroad data=(TheMaritimeSlikroad)list.get(t);
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
 
<center>
<div class="page">
	<div class="img-page">
<%if(currentpage>1){ %>
<%if(currentpage==2){%>
<a href="Maritime%20Slik%20Road.jsp" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow"  ><span>上一页</span></a>
<%}else {%>
<a href="Maritime%20Slik%20Road.jsp?page=<%=currentpage-1 %>" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow"  ><span>上一页</span></a>
<%} }%>
 
<% if(currentpage<=5){ 
for(int i=1;i<pages;i++)
{ 
%>

 <%if(i==currentpage){ %>
 <a href="Maritime%20Slik%20Road.jsp?page=<%=currentpage%>" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" class="selected"><span><%=currentpage%></span></a>
 <%
 }else{%>
 <a href="Maritime%20Slik%20Road.jsp?page=<%=i%>"  rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" ><span><%=i%></span></a>
 
 <%} %>
<%}
}
 %>
 <%if(currentpage>=pages-5&&(pages-5)>0) {%>
 <%for(int i=currentpage-5;i<pages;i++)
{ %>
 <%if(i==currentpage){ %>
 <a href="Maritime%20Slik%20Road.jsp?page=<%=currentpage%>" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" class="selected"><span><%=currentpage%></span></a>
 <%
 }else{%>
 <a href="Maritime%20Slik%20Road.jsp?page=<%=i%>"  rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" ><span><%=i%></span></a>
 
 <%} %>

<%} %>
 <%}else if(currentpage>=5&&currentpage<pages-5){ %>
 <a href="Maritime%20Slik%20Road.jsp?page=<%=currentpage%>" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" class="selected"><span><%=currentpage%></span></a>
<%while(currentpage<limitpage&&currentpage<pages){
	currentpage++;
 %>
   <a href="Maritime%20Slik%20Road.jsp?page=<%=currentpage%>"  rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" ><span><%=currentpage%></span></a>
  <%
  
  } %> 
<%} %>   
  <%
  if(tempcurrent!=pages-1){ 
  %> 
  <a href="Maritime%20Slik%20Road.jsp?page=<%=tempcurrent+1 %>" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow" rel="external nofollow"  ><span>下一页</span></a>
   <%}
   %>
   
   
	</div>
	</div>

	
	
<div class="foot"></div>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	 <script>
  $(function(){
  $('.img-page a').on('click',function(){
   $(this).addClass('selected').siblings('a').removeClass('selected');
  })
  })
 </script>

</center>
</div>
</body>
</html>