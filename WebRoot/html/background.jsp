<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cn.theslikroad.LLM.BgImage" %>
<%@ page import="cn.theslikroad.LLM.UserName" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="bgImage" class="cn.theslikroad.background.BackgroundImage"/>
<%
	List<BgImage>bgimage=bgImage.GetImage();
	int t=0;
	int s=9;
	
 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>壁纸</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/index8.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/subNav.css" />
<script src="<%=path %>/js/js.js"type="text/javascript"></script>
<script src="<%=path %>/js/json2.js"type="text/javascript"></script>


<script>
var ajax;
var url1;
var flag=true;
var a=0;
var b=0;
var i=0;
var c=0;
var d=8;
var html;
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
function PageImage(page)
{	
	
	createXMLHttp();
	ajax.open("POST","/TheSlikRoad/BgImage?page="+page,true);//创建servlet接收数据
	ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	ajax.onreadystatechange=hell;//改变在hell函数中
  	ajax.send(null);
	
}

function hell()
{

	if(ajax.readyState==4)
  	{
 
  		if(ajax.status==200)
  		{
  		  		 
			var text=ajax.responseText;
			if(text=="false")
			{
				 //  alert('出错了,Err：' + ajax.status);  
				   flag=false;
			}
			else
			{
				 
		
			
				 var mobj = JSON.parse(text);
				 console.info(mobj);
				 var marray=mobj;
				for(var i = 0; i <mobj.length; i++){//遍历json数组时，这么写p为索引，0,1
				 var url=mobj[i].url;
				 loadmore(url);
				}
				d+=10; 
		 	}
	}
}

		function loadmore(url)
		{
		
		 var oDiv = document.createElement('div'); 
				 var oDiv = document.createElement('div'); 
                 var zz = document.createElement('div');
                 var save = document.createElement("a");
                 var collect = document.createElement("a");
                 var share = document.createElement("a");
                 var collect1 = document.createElement('div');
                 var collect2 = document.createElement('div');
                 
                 
				 oDiv.id="content-one";
				 zz.id="zz";
				 oDiv.style.marginBottom="70px";
				 oDiv.innerHTML = "<img src='"+url+"' width='480' height='280'>" ;
				 content.appendChild(oDiv);
				 oDiv.appendChild(zz);
				 save.innerHTML = "<img src='../png/save.png' width='30' height='30'>";
				 save.href=url;
				 save.download=url;
				 save.className = 'btn';
				 save.addEventListener("click", function() {
					var oPop = window.open(url,"","width=1, height=1, top=5000, left=5000"); 
                    oPop.document.execCommand("SaveAs"); 
                    oPop.close(); 	 });
				 save.style.marginLeft="97px";
				 save.style.cursor="pointer";
				 collect1.innerHTML = "<img src='../png/collect.png' width='30' height='30'>" ;
				 collect2.innerHTML = "<img src='../png/collected.png' width='30' height='30'>" ;
				 collect.appendChild(collect1);
				 collect1.addEventListener("click", function() {
					collect.removeChild(collect1);
					collect.appendChild(collect2);
					collectImageUrl(url,"true");
					//收藏
				 });
				 collect2.addEventListener("click", function() {

					collect.removeChild(collect2);
					collect.appendChild(collect1);
					collectImageUrl(url,"false");
					//删除
				 });                                										  //增加
				 collect.className = 'btn';
				 collect.style.marginLeft="97px";
				 collect.style.cursor="pointer";
				 share.innerHTML = "<img src='../png/share.png' width='30' height='30'>" ;
				 share.addEventListener("click", function() {
				 var url1=url;
				   console.log("hell222"+url1);
					 pop(url1); 
				 })
				 share.style.marginLeft="97px";
				 share.style.cursor="pointer";
				 zz.appendChild(save);
				 zz.appendChild(collect);
				 zz.appendChild(share); 
				 }
		
		}
 
		 function getScrollTop() {
             var scrollTop = 0;
            if(document.documentElement && document.documentElement.scrollTop) {
                 scrollTop = document.documentElement.scrollTop;
             } else if(document.body) {
                 scrollTop = document.body.scrollTop;
             }
             return scrollTop;
         }
 
         //获取当前可视范围的高度 
         function getClientHeight() {
             var clientHeight = 0;
             if(document.body.clientHeight && document.documentElement.clientHeight) {
                 clientHeight = Math.min(document.body.clientHeight, document.documentElement.clientHeight);
             } else {
                 clientHeight = Math.max(document.body.clientHeight, document.documentElement.clientHeight);
             }
             return clientHeight;
         }
 
         //获取文档完整的高度 
         function getScrollHeight() {
             return Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
         }
         
         function more(){
          a=1;
          b=1;
		  m.style.display="none";
	     }
	
         //滚动事件触发
         window.onscroll = function() {
              if(getScrollTop() + getClientHeight() == getScrollHeight())
				  b=1;
             if(b==1&&a==1&&flag==true) {
          console.log("1");
             PageImage(d);             	
                  }
			 
         }

function SaveAs5(imgURL) 
{ 
var oPop = window.open(imgURL,"","width=1, height=1, top=5000, left=5000"); 
oPop.document.execCommand("SaveAs"); 
oPop.close(); 
} 
var btnArray = document.getElementsByClassName('btn');
for (var i = 0; i < btnArray.length; i++) {
     btnArray[i].onclick = (function close(j) {
         return function () {
             alert(j);
         }
     })(i);
}

	function pop(url){
	  var share=document.getElementById("bdsharebuttonbox");
	  html=document.getElementById("bdsharebuttonbox").innerHTML;
	  var html1="<a title='分享到微信' class='bds_weixin' href='#' data-cmd='weixin'></a>";
	  var html2="<a title='分享到QQ好友' class='bds_sqq' href='#' data-cmd='sqq'></a>";
	  var html3="<a title='分享到新浪微博' class='bds_tsina' href='#' data-cmd='tsina'></a>";
	  var html4="<a title='分享到QQ空间' class='bds_qzone' href='#' data-cmd='qzone'></a>";
	  var html5="<a title='分享到百度贴吧' class='bds_tieba' href='#' data-cmd='tieba'></a>";	
	  html=html1+html2+html3+html4+html5;	
		share.innerHTML =html+ "<img src='"+url+"' width='400' height='200'>" ;	
        document.getElementById("p").style.display="block";
           
       
	}
    function cancel(){
       var share=document.getElementById("bdsharebuttonbox");
       share.innerHTML="";
       document.getElementById("p").style.display="none";

	}
function collectImage(page,flag)
{

    console.log("collectImage(page,flag)    "+page);
	createXMLHttp();
	ajax.open("POST","/TheSlikRoad/BgImagecollect?id="+page+"&flag="+flag,true);//创建servlet接收数据
	ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	ajax.onreadystatechange=callback1;
  	ajax.send(null);
}
function callback1()
{
	if(ajax.readyState==4&&ajax.status==200)
	{
			
			var check=ajax.responseText;
	
			if(check=="false"){
			 window.location.href="./load.jsp"
			}
	}
}
function collectImageUrl(page,flag)
{
	
	createXMLHttp();
	ajax.open("POST","/TheSlikRoad/BgImageurlcollection?id="+page+"&flag="+flag,true);//创建servlet接收数据
	ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	ajax.onreadystatechange=callback1;
  	ajax.send(null);
}

function change1(c1,c2,page)//修改以下
{
	
	collectImage(page+1,"true");
    c1.style.display="none";
	c2.style.display="block";
	//收藏
	
}
window.onload=function(){
      //do something
      var aLi=document.getElementsByTagName('li');
for(var i=0; i<aLi.length; i++){
 aLi[i].onmouseover=function(){
            var oSubNav=this.getElementsByTagName('ul')[0];
            if(oSubNav){
            var This=oSubNav;
            clearInterval(This.time);
            This.time=setInterval(function(){
                    This.style.height=This.offsetHeight+25+"px";
                    if(This.offsetHeight>=200)
                    clearInterval(This.time);
                },30)
             }
          }
        //鼠标离开菜单，二级菜单动画收缩起来。 
 aLi[i].onmouseout=function(){
            var oSubNav=this.getElementsByTagName('ul')[0];
            if(oSubNav){
            var This=oSubNav;
            clearInterval(This.time);
            This.time=setInterval(function(){
                    This.style.height=This.offsetHeight-25+"px";
                    if(This.offsetHeight<=0)
                    clearInterval(This.time);
                },30)
             }
          }


}  
       PageImage(0);  
            
}
function change2(c1,c2,page)
{
	collectImage(page+1,"false");
    c1.style.display="block";
	c2.style.display="none";
	
	//删除
}					   //修改
</script>
<script>
	window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"32"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
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
		<li><a href="<%=path %>/html/personal homepage.jsp" target="_blank">个人中心</a></li>
       <li><a href="<%=path %>/ChangeName" target="_blank">退出</a></li>
         <% }%>
        </ul>
	</li>
</ul>
</div>
<div class="header">&nbsp;&nbsp;&nbsp;<a href="<%=path %>/index.jsp" target="_blank"><font color="bule">首页 </font></a>&nbsp;>&nbsp;文创&nbsp;>&nbsp;丝路壁纸</div>


<div class="content" id="content">

</div>
<div class="page"><div class="more" onclick="more()" id="m">加载更多</div>	</div>	


</div>

	<div class="shade" style="display:none" id="p">
	<div class="pop "  name="ShowDiv" id="p1">
	
		<div class="bdsharebuttonbox"  id="bdsharebuttonbox">
			<a title="分享到微信" class="bds_weixin" href="#" data-cmd="weixin"></a>
			<a title="分享到QQ好友" class="bds_sqq" href="#" data-cmd="sqq"></a>
			<a title="分享到新浪微博" class="bds_tsina" href="#" data-cmd="tsina"></a>
			<a title="分享到QQ空间" class="bds_qzone" href="#" data-cmd="qzone"></a>
			<a title="分享到百度贴吧" class="bds_tieba" href="#" data-cmd="tieba"></a>
		</div>

		<input type="button" onclick="cancel()"  class="Btnsty_peyton" value="取消">
</div>
</div>
</body>
</html>