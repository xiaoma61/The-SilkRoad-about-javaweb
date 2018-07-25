<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page  import="cn.theslikroad.LLM.literatureData" %>
<%@page  import="cn.theslikroad.literature.data.LiteractureData" %>
<%@ page import="cn.theslikroad.LLM.UserName" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 <%request.setCharacterEncoding("utf-8");%> 

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>文献</title>
<link href="<%=path %>/css/index9.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/easy-upload.css" rel="stylesheet" type="text/css" />
<script src="<%=path %>/js/js.js"type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/subNav.css" />
<style type="text/css">
.mfont {color:#B22222;}
.nav{
	font-size: 100%;
	}
.col-md-1
{
	font-size:80%;
}
#tip
{
	color:red;
	text-align:left;
}
</style>
 <script language="JavaScript" type="text/JavaScript">

function check(){
        var title = document.getElementById("title");
        var writer = document.getElementById("writer");
        var writerword = document.getElementById("writerword");
        var article = document.getElementById("article");
 
        
        tips.style.display="block"; 
        if(title.value==null ||title.value==""||title.value.length>15){
      
            tips.innerHTML="题目错误";
            title.focus();
            setTimeout("codefans()",3000);
            return;
        }
        if(writer.value==null || writer.value==""||writer.value.length>15){
   
            tips.innerHTML="作者错误";
            writer.focus();
            setTimeout("codefans()",2000);
            return;
        }
   		  if(writerword.value==null || writerword.value==""||writerword.value.length>50){
   
            tips.innerHTML="错误";
           	writerword.focus();
            setTimeout("codefans()",2000);
            return;
        } 
        if(article.value==null || article.value==""||article.value.length>50){
   
            tips.innerHTML="不能为空或者字数限制";
            article.focus();
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

<body >
  <img src="<%=path %>/image/logo1.png" alt="" width="35px" style="position: fixed;left:5%;top:1%; z-index:1000;"/>
<div class="wrap">

<div class="nav">
<ul>
     <li><a href="<%=path %>/index.jsp" target="_blank">首页</a></li>
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

<div class="header">&nbsp;&nbsp;&nbsp;<a href="<%=path %>/index.jsp" target="_blank"><font color="bule">首页 </font></a>&nbsp;>&nbsp;学术&nbsp;>&nbsp;文献</div>


<div class="main1">
<div class="main-top">
<div id="main-top-section1">用户文献</div>
<div id="main-top-section2">专家文献</div>
</div>

<jsp:useBean id="literature" scope="session" class="cn.theslikeroad.dataPrepare.LiteratureData"/>
<%
	List<literatureData>list=(ArrayList)literature.GetMsg();
	int pagesize=6;
	int rows=list.size();
	int pages=(rows%pagesize==0)?(rows/pagesize):rows/pagesize+1;
	int currentpage=1;
	int pagelist;
	String curpage=request.getParameter("page");
	if(curpage==null)
	{
		currentpage=1;
	}
	else
	{
		currentpage=Integer.parseInt(curpage);
		
	}
	pagelist=(currentpage-1)*pagesize;
	int pagelimit=pagelist+pagesize;
	

 %>
  <jsp:useBean id="listeracturePage" scope="session" class="cn.theslikroad.literature.ListeracturePage"/>
 <%
	List<LiteractureData>list1=(ArrayList)listeracturePage.Getpage();
	int rows1=list1.size();
	int pages1=(rows1%pagesize==0)?(rows1/pagesize):rows1/pagesize+1;
	int currentpage1=1;
	int pagelist1;
	String curpage1=request.getParameter("page1");
	if(curpage1==null)
	{
		currentpage1=1;
	}
	else
	{
		currentpage1=Integer.parseInt(curpage1);
		
	}
	pagelist1=(currentpage1-1)*pagesize;
	int pagelimit1=pagelist1+pagesize;
	

 %>
<div id="main-bottom2" style="display:none">
<div class="line2"><hr width=90%  ></div> 

<%
	while(pagelist<pagelimit&&pagelist<rows-1)
	{
		pagelist++;
 %>
<div class="news">
<h4 class="mfont"><%=list.get(pagelist).getBookname() %></h4>
<h6 >&nbsp;&nbsp;&nbsp;主题：<%=list.get(pagelist).getTitle() %></h6>
<h5 >&nbsp;&nbsp;&nbsp;<%=list.get(pagelist).getMsg()%></h5>
<br/>
</div>
<%
	
	}
 %>

 <div class="news1">
 <div class="page">
 <div class="img-page">
  <%int i=currentpage; %>
   <%if(i>1){ %>
   <a href="/TheSlikRoad/html/literature.jsp?page=<%=currentpage-1%>&page1=<%=currentpage1 %>" rel="external nofollow"><span>上一页</span></a>
   
   <%} %>
   
    <%if(i>=5&&i>pages-5) {%>
    <%for(int j=i-3;j<i;j++)
    {%>
     <a href="/TheSlikRoad/html/literature.jsp?page=<%=j%>&page1=<%=currentpage1 %>" rel="external nofollow"  rel="external nofollow" ><span><%=j%></span></a>
    
    <%} %>
    <%} %>
   
   
  <%for(int j=i;j<=pages&&j<i+4;j++){%>
  <%if(j==i){ %>
 <a href="/TheSlikRoad/html/literature.jsp?page=<%=i%>&page1=<%=currentpage1 %>" rel="external nofollow"  class="selected"><span><%=i %></span></a>
  <%}else{ %>
   <a href="/TheSlikRoad/html/literature.jsp?page=<%=j%>&page1=<%=currentpage1 %>" rel="external nofollow"  rel="external nofollow" ><span><%=j%></span></a>
   
  <%} %>
   <%
   
   }
    %>
    <%if(i<pages) {%>
     <a href="/TheSlikRoad/html/literature.jsp?page=<%=currentpage+1%>&page1=<%=currentpage1 %>" rel="external nofollow"><span>下一页</span></a>
    <%} %>
	
	 </div>
 </div>

</div>
</div>

<div id="main-bottom1">
<div class="line1"><hr width=100%></div> 
<%
	while(pagelist1<pagelimit1&&pagelist1<list1.size())
	{
		
 %>
<div class="news">
<a href="/TheSlikRoad/Readering?titleid=<%=list1.get(pagelist1).getId() %>" class="mfont"><h4>题目:<%=list1.get(pagelist1).getTitle() %></h4></a>
<h6 >&nbsp;&nbsp;&nbsp;作者：<%=list1.get(pagelist1).getWriter() %></h6>
<h5 >&nbsp;&nbsp;&nbsp;关于：<%=list1.get(pagelist1).getArticle() %></h5>

</div>
<%	
pagelist1++;
	}
 %>
 <div class="news1">
 <div class="page">
 <div class="img-page">
  <%int t=currentpage1; %>
   <%if(t>1){ %>
   <a href="/TheSlikRoad/html/literature.jsp?page=<%=currentpage%>&page1=<%=currentpage1-1%>" rel="external nofollow"><span>上一页</span></a>
   
   <%} %>
   <%if(t>=5&&t>pages-5) {%>
  <%for(int j=i-3;j<=pages1;j++){%>
  <%if(j==t){ %>
 <a href="/TheSlikRoad/html/literature.jsp?page1=<%=t%>&page=<%=currentpage%>" rel="external nofollow" rel="external nofollow" class="selected"><span><%=t %></span></a>
  <%}else{ %>
   <a href="/TheSlikRoad/html/literature.jsp?page1=<%=j%>&page=<%=currentpage%>" rel="external nofollow"  rel="external nofollow"  ><span><%=j%></span></a>
  
   
  <%} %>
   <%
   }
    %>
  <%} %>	  
  <%for(int j=t;j<=pages1&&j<t+4;j++){%>
  <%if(j==t){ %>
 <a href="/TheSlikRoad/html/literature.jsp?page1=<%=t%>&page=<%=currentpage %>" rel="external nofollow"  class="selected"><span><%=t %></span></a>
  <%}else{ %>
   <a href="/TheSlikRoad/html/literature.jsp?page1=<%=j%>&page=<%=currentpage %>" rel="external nofollow"  rel="external nofollow" ><span><%=j%></span></a>
   
  <%} %>
   <%
   
   }
    %>
    <%if(t<pages1) {%>
     <a href="/TheSlikRoad/html/literature.jsp?page=<%=currentpage%>&page1=<%=currentpage1+1 %>" rel="external nofollow"><span>下一页</span></a>
    <%} %>
	
	 </div>
 </div>

</div>
</div>
</div>

<script src="../js/literature.js"type="text/javascript"></script>

</div>
<div class="main2">
<div ng-app="App" ng-controller="mainController" class="ng-scope">

<div class="cat_add">
	<div class="cat_add_header">
	    <div class="icon"></div>
	    <div class="title"><font size="+1">上传文档</font></div>
	</div>
	<div class="cat_add_form">
	    <form class="form-horizontal" method="post" action="/TheSlikRoad/LiteractrueMsg" id="form1" onsubmit="return check()">
	     <h6 style="" id="tips"></h6>
	        <input type="hidden" name="id" value="233" />
            <div class="form-group form-group-sm">
                <label class="control-label col-md-1" style="font-size:80%;">文章标题</label>
                <div class="col-md-3">
                    <input class="form-control input-lg" type="text" name="title" id="title"  placeholder="请输入文章标题" />
                </div>
               
                
            </div>
            <span class="glyphicon glyphicon-asterisk star"></span>
                <label class="explain">请输入15字的以内的中文字符</label>
           
            
            <div class="form-group form-group-sm">
                <label class="control-label col-md-1" style="font-size:80%;">文章作者</label>
                <div class="col-md-3">
                    <input class="form-control input-lg" type="text" name="writer" id="writer" placeholder="请输入文章作者" />
                </div>
                
                
            </div>
            <span class="glyphicon glyphicon-asterisk star"></span>
                <label class="explain" style="margin-left: 20px;">请输入15字的以内的中文字符</label>
            <div class="form-group form-group-sm">
                <label class="control-label col-md-1" style="font-size:80%;">作者寄语</label>
                <div class="col-md-3">
                    <textarea class="form-control" rows="5" name="writerword" placeholder="请输入作者寄语" style="margin-left: -15px;" id="writerword"></textarea>
                </div>
               
            </div>
             <span class="glyphicon glyphicon-asterisk star"></span>
                <label class="explain" style="margin-top: 10px;" >请输入50字的以内的中文字符</label>
            <div class="form-group form-group-sm">
                <label class="control-label col-md-1" style="font-size:80%;">文章内容</label>
                <div class="col-md-3">
                    <textarea class="form-control" rows="5" name="article" placeholder="请输入文章内容简介" style="margin-left: -15px;" id="article"></textarea>
                </div>
                
            </div>
            <span class="glyphicon glyphicon-asterisk star"></span>
                <label class="explain" style="margin-top: 10px;">请输入文章内容简介</label>
            
             <div id="easyContainer"></div>
  <script src="../js/jquery.min.js" type="text/javascript"></script>
  <script src="../js/jquery.cookie-1.4.1.min.js" type="text/javascript"></script>
  <script src="../js/easyUpload.js" type="text/javascript"></script>
  
  <script type="text/javascript">
    $('#easyContainer').easyUpload({
      allowFileTypes: '*.jpg;*.doc;*.docx;*.txt',//允许上传文件类型，格式';*.doc;*.pdf'
      allowFileSize: 100000,//允许上传文件大小(KB)
      selectText: '选择文件',//选择文件按钮文案
      multi: true,//是否允许多文件上传
      multiNum: 5,//多文件上传时允许的文件数
      showNote: true,//是否展示文件上传说明
      note: '提示：最多上传5个文件，支持格式为doc、pdf、docx、txt',//文件上传说明
      showPreview: true,//是否显示文件预览
      url: '/TheSlikRoad/Literactorcollect',//上传文件地址
      fileName: 'file',//文件filename配置参数
      timeout: 30000,//请求超时时间
      successFunc: function(res) {
        console.log('成功回调', res);
      },//上传成功回调函数
      errorFunc: function(res) {
        console.log('失败回调', res);
      },//上传失败回调函数
      deleteFunc: function(res) {
        console.log('删除回调', res);
      }//删除文件回调函数
    });
  </script>
           
        	<div class="form-group form-group-sm" style="margin-top: 30px;">
                <div class="col-md-3 col-md-offset-2">
                    <div class="btn-group">
                       <button type="submit" class="btn btn-danger btn-sm" title="上传"><i class="glyphicon glyphicon-floppy-save"></i> 上传</button>
                        <button style="margin-right: 5px;" type="button" class="btn btn-default btn-sm" onclick="history.back()" title="返回"><i class="glyphicon glyphicon-chevron-left"></i> 返回</button>
                     
                    </div>
                </div>
            </div>
	    </form>
	</div>
    
</div>
</div>


</div>
</body>
</html>

