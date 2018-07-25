<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cn.theslikroad.literature.data.LiteractureData" %>
<%@ page import="cn.theslikroad.LLM.UserName" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%  
    String swfFilePath=session.getAttribute("swfpath").toString(); 
    LiteractureData data=(LiteractureData)session.getAttribute("data");
     
%> 
<html>
<head>

<link rel="stylesheet" type="text/css" href="<%=path %>/css/index13.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/subNav.css" />    
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
        <style type="text/css" media="screen"> 
			html, body	{ height:100%; }
			body { margin:0; padding:0; overflow:auto; }   
			#flashContent { display:none; }
        </style> 
        <script type="text/javascript" src="js/flexpaper_flash.js"></script>
         <script src="<%=path %>/js/js.js"type="text/javascript"></script>  
<title>文献</title>
</head>
<body>
<div class="wrap">

<div class="nav">
<ul>
     <li><a href="<%=path%>/index.jsp">首页</a></li>
    <li><a href="museum.jsp"target="_blank">博物馆</a>
    <ul class="subNav">
        <li><a href="<%=path%>/html/museum.jsp"target="_blank">门票</a></li>
            <li><a href="<%=path%>/html/museum.jsp"target="_blank">地点</a></li>
            <li><a href="<%=path%>/html/museum.jsp"target="_blank">开放时间</a></li>
            <li><a href="<%=path%>/html/museum.jsp"target="_blank">游览需知</a></li>
        </ul>
    </li>
    <li><a href="#">探索</a>
    <ul class="subNav">
        <li><a href="<%=path%>/html/history.jsp"target="_blank">丝路历史</a></li>
            <li><a href="<%=path%>/html/Land Slik Road.jsp"target="_blank">陆上文物</a></li>
            <li><a href="<%=path%>/html/Maritime Slik Road.jsp"target="_blank">海上文物</a></li>
        </ul>
    </li>
    <li><a href="#">学术</a>
	 <ul class="subNav">
        <li><a href="<%=path%>/html/literature.jsp"target="_blank">文献</a></li>
            <li><a href="<%=path%>/html/tribune.jsp"target="_blank">论坛</a></li>
            <li><a href="<%=path%>/html/scholars of the past.jsp"target="_blank">景仁榜</a></li>
        </ul></li>
    <li><a href="#">文创</a>
	 <ul class="subNav">
        <li><a href="<%=path%>/html/game.jsp"target="_blank">丝路游戏</a></li>
            <li><a href="<%=path%>/html/background.jsp"target="_blank">丝路壁纸</a></li>
        </ul></li>
    <li><a href="<%=path%>/html/about.jsp"target="_blank">关于</a>
	 <ul class="subNav">
      <li><a href="<%=path%>/html/about.jsp#about1" target="_blank">关于我们</a></li>
            <li><a href="<%=path%>/html/about.jsp#contacts1" target="_blank">联系我们</a></li>
            <li><a href="<%=path%>/html/about.jsp#cooperate1" target="_blank">招商</a></li>
        </ul></li>
	<li class="person"><a href="#"><img src="<%=path %>/image/timg1.jpg.png" width="35"   /></a></center>
		 <ul class="subNav">
		 <jsp:useBean id="username" class="cn.theslikroad.LLM.UserName"></jsp:useBean>
		 <%if(UserName.username.equals(null)||UserName.username.equals("")){ %>
		   <li><a href="<%=path%>/html/load.jsp">登陆</a></li>
           <li><a href="<%=path%>/registe.jsp">注册</a></li>
		 <% }else{%>   
		<li><a href="<%=path %>/html/personal homepage.jsp">个人中心</a></li>
       <li><a href="<%=path %>/ChangeName">退出</a></li>
         <% }%>
        </ul>
	</li>
</ul>
</div>
<div class="header">&nbsp;&nbsp;&nbsp;<a href="<%=path %>/index.jsp"><font color="bule">首页</font></a>&nbsp;>&nbsp;学术&nbsp;>&nbsp;<a href="<%=path %>/html/literature.jsp"><font color="bule">文献</font></a>&nbsp;>&nbsp;用户文献</div>


<div class="left">
	<div  class="article" id="viewerPlaceHolder">
		<div class="text-black" ></div>
</div>
</div>
<div class="right">
	<div class="text-white">
        文章标题：<div>《<%=data.getTitle() %>》</div><br />
        文章作者：<div><%=data.getWriter() %></div><br />
        作者寄予：<div><%=data.getWriterword() %></div><br />
        文章简介：<div><%=data.getArticle() %></div><br />

	</div>
</div>
<%  String saveDirectory =application.getRealPath("/")+"upload";  
//打印上传路径信息  
System.out.println(saveDirectory);
	         %>
	        <script type="text/javascript"> 
				var fp = new FlexPaperViewer(	
						 'FlexPaperViewer',
						 'viewerPlaceHolder', { config : {
						 SwfFile : escape('<%=path %>/<%=swfFilePath%>'),
						 Scale : 0.6, 
						 ZoomTransition : 'easeOut',
						 ZoomTime : 0.5,
						 ZoomInterval : 0.2,
						 FitPageOnLoad : true,
						 FitWidthOnLoad : false,
						 FullScreenAsMaxWindow : false,
						 ProgressiveLoading : false,
						 MinZoomSize : 0.2,
						 MaxZoomSize : 5,
						 SearchMatchAll : false,
						 InitViewMode : 'Portrait',
						 PrintPaperAsBitmap : false,
						 
						 ViewModeToolsVisible : true,
						 ZoomToolsVisible : true,
						 NavToolsVisible : true,
						 CursorToolsVisible : true,
						 SearchToolsVisible : true,
  						
  						 localeChain: 'en_US'
						 }});
	        </script>
</body>
</html>

