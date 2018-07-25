<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cn.theslikroad.LLM.UserName" %>
<%@ page import="cn.theslikroad.personal.impl.AllMsgGetimpl" %>
<%@ page import="cn.theslikroad.personal.dbc.personaldbc" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

<title>个人中心</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/index7.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/subNav.css" />
<script src="<%=path %>/js/js.js"type="text/javascript"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-1.11.1.min.js"></script> 
<script type="text/javascript" src="<%=path %>/js/cropbox.js"></script>
<link rel="stylesheet" href="<%=path %>/css/style1.css" type="text/css" />
 </head>
 <style>
 .main-bottom{
	/* height: 100%; */
	width: 80%;
	font-family: "微软雅黑";
	margin-top: 0;
	position: absolute;
	background-color: #FCFCFC;

	}
 </style>
 
 <script >
 var ajax;


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
  function chackUsername(id,flag)
  {
    console.log("true");
  	createXMLHttp();
  	console.log("true");
  	if(flag==2)
  	{
  		ajax.open("POST","/TheSlikRoad/deleteBg?id="+id,true);
  	}
  	else if(flag==1)
  	{
  		ajax.open("POST","/TheSlikRoad/deleteColletion?id="+id,true);
  	}
  	else if(flag==3)
  	{
  		ajax.open("POST","/TheSlikRoad/deleteBrower?id="+id,true);
  	}else if(flag==4)
  	{
  		ajax.open("POST","/TheSlikRoad/deletetalking?id="+id,true);
  	}
  	
  	
  	
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
  			console.log("true");
  		}
  		else if(text=="false")
  		{
  				
  		   
 			console.log("false");
  					
  		}
  	}
  	    
  		
  	}
  
  }
  function uf(id,url,flag){


	chackUsername(url,flag);
	id.style.opacity="0";
    id.style.filter="Alpha(opacity=0)";
    setTimeout(function(){ disappeare(id)},700);
	
}
   </script>
  
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
			<li><a href="<%=path %>/html/personal homepage.jsp"target="_blank">个人中心</a></li>
       <li><a href="<%=path %>/ChangeName">退出</a></li>
         <% }%>
        </ul>
	</li>
</ul>
</div>
<%
AllMsgGetimpl impl=new AllMsgGetimpl();
personaldbc dbc=impl.AllMsgGet();
String bg=dbc.getBg();
String Img=dbc.getImg();
%>
<div class="header box-shadow">
	<img src="<%=path %>/<%=bg %>" width="1040" height="299" onclick="pop2()" id="bgImage"  onerror="this.src='../png/background.png'"><!-- 背景图片 -->
<div class="name">
<%=UserName.username%>
</div>
<div class="avatar"><img src="<%=path %>/<%=Img %>" width="104" height="104" alt="" onclick="pop1()" id="userImage" onerror="this.src='../png/avatar.png'"/></div><!-- 用户图片 -->
</div>

<div class="main">
<div class="main-top  box-shadow">
	<a class="main-top-section"id="s1"><font color="black">关注</font></a>
	<a class="main-top-section"id="s2"><font color="black">收藏</font></a>
	<a class="main-top-section"id="s3"><font color="black">历史</font></a>
	<a class="main-top-section"id="s4"><font color="black">回复</font></a>
</div>
<div class="main-bottom box-shadow"id="b2" style="display:none">
<%if(dbc.getBgImge().size()>0&&dbc.getBgImge()!=null){ %>

<%for(int i=0;i<dbc.getBgImge().size();i++){ %>
<div class="news2"id="n<%=i%>"onmouseover="show(d<%=i%>)" onmouseout="disappear(d<%=i %>)">
<img src="<%=dbc.getBgImge().get(i).getUrl()%>"width="260" height="260">
<div class="delect"id="d<%=i %>"style="display: none">
<a class="btn" onClick="uf(n<%=i %>,<%=dbc.getBgImge().get(i).getId()%>,2)"  >
<img src="../png/delect.png" width="50px"></a>
</div>
</div>
<%} }else{%>
<center>
<img src="<%=path%>/image/none.jpg"width="500" height="500">
</center>
<% 
}%>
</div>
<div class="main-bottom box-shadow"id="b3" style="display:none">
<%if(dbc.getBrowtalk().size()>0&&dbc.getBrowtalk()!=null) {%>
<%for(int i=0;i<dbc.getBrowtalk().size();i++){ %>
<div class="news1" id="f<%=i%>" >
您于<%=dbc.getBrowtalk().get(i).getTime() %>浏览了<a href="/TheSlikRoad/Gettitle?titleid=<%=dbc.getBrowtalk().get(i).getTitleid()%>" target="_blank" class="title" ><%=dbc.getBrowtalk().get(i).getTitle() %></a>话题
<div class="unfollow"onClick="uf(f<%=i%>,<%=dbc.getBrowtalk().get(i).getTitleid() %>,3)"  ><img src="../png/unfollow.png" width="20px"></div>
</div>
<%}
} else{%>
<center>
<img src="<%=path%>/image/none.jpg"width="500" height="500">
</center>
<% 
}%>
</div>
<div class="main-bottom box-shadow"id="b4"  style="display:none">
<%if(dbc.getTalking().size()>0&&dbc.getTalking()!=null){ %>
<%for(int i=0;i<dbc.getTalking().size();i++) {%>
<div class="news1" id="de<%=i %>">
<div class="conversation"><%=dbc.getTalking().get(i).getFrom_uid() %>：<%=dbc.getTalking().get(i).getContent() %></div>
<div class="source">回复我的主题：“<a href="/TheSlikRoad/Gettitle?titleid=<%=dbc.getTalking().get(i).getTopicid()%>" target="_blank" class="title"><%=dbc.getTalking().get(i).getTitle() %></a>”</div>
<div class="unfollow"onClick="uf(de<%=i %>,<%=dbc.getTalking().get(i).getId()%>,4)"  ><img src="../png/unfollow.png" width="20px"></div>
</div>
<%} }else{%>
<center>
<img src="<%=path%>/image/none.jpg"width="500" height="500">
</center>
<% 
}%>
</div>

<div class="main-bottom box-shadow"id="b1"  style="display:none">

<%if(dbc.getColltridata().size()>0&&dbc.getColltridata()!=null){

 %>
<%for(int i=0;i<dbc.getColltridata().size();i++){ %>
<div class="news1"id="u<%=i%>">
您于<%=dbc.getColltridata().get(i).getTime()%>关注<a href="/TheSlikRoad/Gettitle?titleid=<%=dbc.getColltridata().get(i).getTitleid()%>" target="_blank" class="title" >   <%=dbc.getColltridata().get(i).getTitle() %> </a> 话题
<div class="unfollow"onClick="uf(u<%=i%>,<%=dbc.getColltridata().get(i).getTitleid()%>,1)"  ><img src="../png/unfollow.png" width="20px"></div>
</div>
<%} %>
<%} else{%>
<center>
<img src="<%=path%>/image/none.jpg"width="500" height="500">
</center>
<% 
}%>


</div>
</div>
</div>

<script src="../js/change_div.js"></script>

	<div class="shade" style="display:none" id="p1">
		
	<div class="pop box-shadow"  name="ShowDiv">
<div class="container">
 <div class="imageBox" id="i1"><!--增加id-->
     <div class="thumbBox"></div>
  <div class="spinner" style="display: none">请上传图片</div>
  </div>
  <div class="action"> 
    <div class="new-contentarea tc"> <a href="javascript:void(0)" class="upload-img">
      <label for="upload-file">上传头像</label>
      </a>
      <input type="file" class="" name="upload-file" id="upload-file1" />
    </div>
	 <input type="button" onclick="cancel1()"  class="Btnsty_peyton" value="取消">
	 <input type="button"id="save1"   class="Btnsty_peyton" value="保存">
    <input type="button" id="btnCrop1"  class="Btnsty_peyton" value="裁切">
    <input type="button" id="btnZoomIn1" class="Btnsty_peyton" value="+"  >
    <input type="button" id="btnZoomOut1" class="Btnsty_peyton" value="-" >
  </div>
   <div class="cropped" id="c1"></div><!--增加id-->
</div>


</div>
</div>
	<div class="shade" style="display:none" id="p2">
	<div class="pop box-shadow _pop"  name="ShowDiv">
<div class="container">
  <div class="imageBox _imageBox " id="i2"><!--增加id-->
    <div class="thumbBox _thumbBox"></div>
    <div class="spinner _spinner" style="display: none">请上传图片</div>
  </div>
  <div class="action"> 
    <div class="new-contentarea tc"> <a href="javascript:void(0)" class="upload-img">
      <label for="upload-file">上传壁纸</label>
      </a>
      <input type="file" class="" name="upload-file" id="upload-file2" />
    </div>
	 <input type="button" onclick="cancel2()"  class="Btnsty_peyton" value="取消">
	 <input type="button" id="save2"  class="Btnsty_peyton" value="保存">
    <input type="button" id="btnCrop2"  class="Btnsty_peyton" value="裁切">
    <input type="button" id="btnZoomIn2" class="Btnsty_peyton" value="+"  >
    <input type="button" id="btnZoomOut2" class="Btnsty_peyton" value="-" >
  </div>
<div class="cropped _cropped" id="c2"></div><!--增加id-->
</div>
</div>
</div>

  </body>
</html>
