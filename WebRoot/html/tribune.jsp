<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cn.theslikroad.tribune.UserMsg" %>
<%@ page import="cn.theslikroad.LLM.UserName" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%request.setCharacterEncoding("utf-8");%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>论坛</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/index10.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/subNav.css" />
<script src="<%=path %>/js/js.js"type="text/javascript"></script>

<script >
	function check()
		{
		
		 	var title=document.getElementById("title").value;
		  	var context=document.getElementById("context").value;

			 if(title==null||title=="")
			 {
			 document.getElementById("title1").innerHTML = "<div class='reds' align='left'>不能为空</div>";
				return false;
			 }
             if(context.length>20)
			 {
			  document.getElementById("title1").innerHTML = "<div class='reds' align='left'>字数在50以内</div>";
			 return false;
			 }
            			
            
        
			 if( context==null|| context=="")
			 {
			 document.getElementById("context1").innerHTML = "<div class='reds' align='left'>不能为空</div>";
			 return false;
			 }
             if(context.length>20)
			 {
			  document.getElementById("context1").innerHTML = "<div class='reds' align='left'>字数在20以内</div>";
			  return false;
			 }
            			
              return true;
       
		
		
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
			<li><a href="<%=path %>/html/personal homepage.jsp"target="_blank">个人中心</a></li>
            <li><a href="<%=path %>/ChangeName">退出</a></li>
         <% }%>
        </ul>
	</li>
</ul>
</div>
<div class="header" id="topic">&nbsp;&nbsp;&nbsp;<a href="../index.jsp"><font color="bule">首页</font></a> &nbsp;>&nbsp;学术&nbsp; >&nbsp;论坛</div>
<div class="main_contents" >
<div class="main">
 <jsp:useBean id="Msg" class="cn.theslikroad.tribune.ShowMsg"/>
<% ArrayList<UserMsg>list =(ArrayList)Msg.GetData();

%>
<%
int rows=list.size();
int pages=(rows%pagesize==0)?(rows/pagesize):rows/pagesize+1;
%>

<%!

int pagesize=10;
int t=0;
int currentpage;
int limitpage;
int tempcurrent;
int limit;
 %>
<%
String curpage=request.getParameter("page");
if(curpage==null)
{
	t=0;
	currentpage=1;
	limitpage=currentpage+pagesize;
	tempcurrent=1;
	limit=t+5;
}
else
{
	t=(Integer.parseInt(curpage)-1)*pagesize;
	currentpage=t/pagesize+1;
	tempcurrent=t;
    limitpage=t+pagesize;
    limit=t+5;
}

%>

<%
	if(list.size()>0)
	{
		for(int i=tempcurrent;i<list.size()&&i<limitpage;i++)
		{
		
		%>
<div class="topicall" >
<div class="pic">
	<a><img alt="" src="<%=path %>/<%=list.get(i).getUrl() %>" width="100px"height="100px"></a>
	<br>
	<%=list.get(i).getId() %>
	<%int titleid=list.get(i).getTitleid();%>

	</div>
	<div class="post">
	<p class="topic">话题：<font color="#CD3700" size="3px"><%=list.get(i).getTitle() %></font></p>
	<br>
	<p>内容概要：<font size="1px"><%=list.get(i).getSuggest() %></font></p>
	<br>
	<p>时间：<font><%=list.get(i).getTime() %></font></p>
	<br>
	<p>浏览人数：<%=list.get(i).getVisitor() %>       </p>
	<br>
	<a href="/TheSlikRoad/Gettitle?titleid=<%=list.get(i).getTitleid()%>"><font color="#CD3700" size="+1">查看更多</font></a>
	</div>
	</div>
		
		<%
		}
	}
 %> 
<center>
<div class="topicall" id="topicnum">
<div class="page">
<div class="img-page">

<%if(currentpage>1){ %>
<a href="tribune.jsp?page=<%=currentpage-1%>" rel="external nofollow" rel="external nofollow"   ><span>上一页</span></a>
<%}%>

<%
int c=currentpage-4;
 %>
 <% if(c>0){
 while(c<currentpage){
 %>
  <a href="tribune.jsp?page=<%=c%>" rel="external nofollow" ><span><%=c%></span></a>
<% 
	c++;
} }else{ for(int i=1;i<=currentpage-1;i++){ %>
 <a href="tribune.jsp?page=<%=i%>"  rel="external nofollow"  ><span><%=i%></span></a>
<%
}}
 %>
<% 
for(int i=currentpage;i<=limit&&i<=pages;i++)
{ 
%>

 <%if(i==currentpage){ %>
 <a href="tribune.jsp?page=<%=currentpage%>" rel="external nofollow"  class="selected"><span><%=currentpage%></span></a>
 <%
 }else{%>
 <a href="tribune.jsp?page=<%=i%>"  rel="external nofollow"  ><span><%=i%></span></a>
 
 <%}} %>

<%if(currentpage+1<=pages){ %>
<a href="tribune.jsp?page=<%=currentpage+1%>" rel="external nofollow" rel="external nofollow"   ><span>下一页</span></a>
<%}%>

   
</div>
</div>
</div>
</center>


<div class="publish">
<center><h3>老板！！快来创建我的帖子</h3></center>
<form action="/TheSlikRoad/UserMsg" method="post" onsubmit="return check()" id="form1">
<div class="_title">
<input id="title" type="text" name="title"  placeholder="请填写标题" style=" height:40px;font-size:20px;width:180%;" ></div>
<div id="title1" class="title1"></div>

<div class="_content" id="comments"><textarea name="suggest" id="context"  placeholder="请输入内容"style=" height:125px ;font-size:20px; 	width:180%;"></textarea></div>
<div id="context1" class="title1"></div>
<div id="suggest"></div>
<div class="submit"><input type="submit" value="发表" style=" color= white; background:#5CACEE; height:40px;width:150%;display:inline-block;font-size:20px;cursor:pointer;border:none ; -webkit-border-radius: 15px;  -moz-border-radius: 15px;"/></div>
</form>
</div>
</div>
</div>

 
</div>
 <div class="top">
        <a href="#topic"><img src="<%=path %>/image/往上%20(1).png" alt="" width="100%"></a>
        <a href="#comments"><img src="<%=path %>/image/添加%20(1).png" alt=""  width="80%" style="margin-left: 10%;"></a>
    </div>
  </body>
</html>
