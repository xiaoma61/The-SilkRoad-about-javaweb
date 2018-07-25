<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cn.theslikroad.tribune.UserMsg" %>
<%@ page import="cn.theslikroad.tribune.commentDBC" %>
<%@ page import="cn.theslikroad.LLM.UserName" %>
<%@ page import="cn.theslikroad.LLM.New" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%UserMsg user=(UserMsg)session.getAttribute("user"); 
 List<commentDBC> vistorlist=(List)session.getAttribute("vistorMsg"); 

 String isinfo=(String)session.getAttribute("isinfo");
 String url=(String)session.getAttribute("url");
%>
<%
int rows=vistorlist.size();
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
	tempcurrent=0;
	limitpage=t+pagesize;
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
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML Basic 1.0//EN" "http://www.w3.org/TR/xhtml-basic/xhtml-basic11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>

    
    <title>论坛</title>
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/index21.css" />
    <script src="<%=path %>/js/json2.js"type="text/javascript"></script>
	<script src="<%=path %>/js/js.js"type="text/javascript"></script>
	<script src="<%=path %>/js/zk.js"type="text/javascript"charset="uft-8"></script>
	<script src="<%=path %>/js/SendMsg.js"type="text/javascript"charset="uft-8"></script>
	<script>

var i=0;
var flag=false;
var ajax;
var cpage=0;
var pagesize=5;
var time;
var id;
var size=0;
var txs;


function changeIB(obj,titleid){
	  i++;
	  if(obj.innerText=="关注")
	  {
	      obj.innerText="已关注";
	      flag=true;
	      iscollect(titleid,flag)
	  }

	  else if(obj.innerText=="已关注")
	  {
	  	obj.innerText="关注";
	  	flag=false;
	    iscollect(titleid,flag)
	  }
	  
}
function opt(id1,id2,name){//增加点击事件
id1.value="回复 "+id2.innerText+":";
Fromname(name);
}

function Fromname(From_uid){
  	createXMLHttp();
  	ajax.open("POST","/TheSlikRoad/SetFromid?From_uid="+From_uid,true);
  	ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  	ajax.onreadystatechange=callback1;
  	ajax.send(null);
}
function refresh()
{
    createXMLHttp();
  	ajax.open("POST","/TheSlikRoad/Refreshservlet?From_uid="+From_uid,true);
  	ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  	ajax.onreadystatechange=callback1;
}
function SendMsg1(content,topic_id)
{
  //一级发送信息
	var id=document.getElementById("content");
	id.value="";
  	createXMLHttp();
  	ajax.open("POST","/TheSlikRoad/Comment?content="+content+"&topic_id="+topic_id,true);
  	ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  	ajax.onreadystatechange=callback2;
  	ajax.send(null);
  	
  	
  	
}
function SendMsg2(From_uid,to_uid,titleid,totime,to_content,content,replyid,answerid,type)
{
  //二级发送信息
   
  	var id=document.getElementById(answerid);
  	var contents=id.value;
  
    createXMLHttp();
  	ajax.open("POST","/TheSlikRoad/Childvistors?from_uid="+From_uid+"&to_uid="+to_uid+"&topic_id="+titleid+"&totime="+totime+"&to_content="+to_content+"&content="+ contents,true);
  	ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  	ajax.onreadystatechange=reply;
  /* 	ajax.onreadystatechange=callback1; */
  	ajax.send(null); 
  	
  	/*  var time=getNowFormatDate();  */
  	document.getElementById(answerid).value="";
  	/* if(type==1)
    {
    	add(From_uid,to_uid,titleid,time,to_content,replyid);
    	
    }else
    {
    	/*  var to_contents=document.getElementById(to_content);
  	     var contents=to_contents.value; */
    	/*  add1(From_uid,to_uid,titleid,time,contents,replyid); */
  /*   } */
    //更新评论数
  
    
 }
  
function callback1()
{
  	if(ajax.readyState==4&&ajax.status==200)
  	{
  	 	var check=ajax.responseText;
  	 	if(check=="false")
  	 	{
			window.location.href="<%=path %>/html/load.jsp";
  	 	}
  	}  
  	
}
function add(From_uid,to_uid,titleid,time,to_content,replyids,imgeurl,totime)
{
		
  	  
  	     var replyid=document.getElementById(replyids);
  		
  		 var to=document.createElement("div");
  		 var comments=document.createElement("div");
  		 var touser=document.createElement("div");
  	     var Fromid=document.getElementById(replyids+"id");
  	     var Fromids=Fromid.innerHTML;
  		/*  div.className="reply" */
  	
  		
  		 touser.className="touser";
  		comments.className="comments";
  		to.className="to";
  		var c_id=GenNonDuplicateID();
  		var c_id1=GenNonDuplicateID();
  		c_id1+="comments";
  		comments.id=c_id;
		comments.style.display="none";
		comments.width="80%";
		 var h3="<form action='' width='100%' style='background-color: #5a4456;'>"
		 +"<textarea name='' id='"+c_id1
		 +"' class='text'>"
		 +"</textarea><input type='button' value='提交' class='btn' onclick=\"SendMsg2('"+ Fromids+"','"+From_uid+"','"+<%=user.getTitleid()%>+"','"+totime+"','"+to_content+"','"+  c_id1+"','"+replyids+"','"+c_id1+"',"+2+")\"> </form>";
  		 var h4= "<span> <img src='<%=path %>/"+imgeurl
  		 +"' width='50px' alt='' style='position: relative;top:10px;'>"+From_uid
                       +"</span>"
                       + "<span style='margin-right: 2%;'></span>"
                       + "<span style='position: absolute;'>"
                       +to_content
					   +"</span>"
                       + "<br>"
                       + "<br>"
                       + "<span>"+time+"</span>" 
                       + "<span style='position: absolute;right: 20px;'><a onclick=\"triggers( '"+c_id+"'"+",'"+c_id1+"'"+", '"+From_uid+"')\" class='follow'>回复</a></span>";
			
         comments.innerHTML=h3;
         touser.innerHTML=h4;
     
        to.appendChild(touser);
		to.appendChild(comments);
		replyid.appendChild(to);
		
		
}
function add1(From_uid,to_uid,titleid,totime,to_content,replyid,ulid)
{
		
  	  
  	     var replyids=document.getElementById(replyid);
  	     var uli="getPage"+replyid;
  		 var ulid=document.getElementById(uli);
  		 /* var div=document.createElement("div"); */
  		 var to=document.createElement("div");
  		 var comments=document.createElement("div");
  		 var touser=document.createElement("div");
  		
  		/*  div.className="reply" */
  	
  		touser.className="touser";
  		comments.className="comments";
  		to.className="to";
  		var c_id=GenNonDuplicateID();
  		var c_id1=GenNonDuplicateID();
  		c_id1+="comments";
  		comments.id=c_id;
		comments.style.display="none";
		comments.width="80%";
		var h3="<form action='' width='100%' style='background-color: #5a4456;'>"
		 +"<textarea name='' id='"+c_id1
		 +"' class='text'>"
		 +"</textarea><input type='button' value='提交' class='btn' onclick=\"SendMsg2('"+From_uid+"','"+to_uid+"','"+<%=user.getTitleid()%>+"','"+totime+"','"+to_content+"','"+ c_id1+"','"+replyid+"','"+c_id1+"',"+2+")\"> </form>";
  		 var h4= "<span> <img src='"
  		 +"' width='50px' alt='' style='position: relative;top:10px;'>"+From_uid
                       +"</span>"
                       + "<span style='margin-right: 2%;'></span>"
                       + "<span style='position: absolute;'>"
                       +to_content
					   +"</span>"
                       + "<br>"
                       + "<br>"
                       + "<span>"+totime+"</span>" 
                       + "<span style='position: absolute;right: 20px;'><a onclick=\"triggers( '"+c_id+"'"+",'"+c_id1+"'"+", '"+From_uid+"')\" class='follow'>回复</a></span>";
			
			
         comments.innerHTML=h3;
         touser.innerHTML=h4;
         
        to.appendChild(touser);
		to.appendChild(comments);
		/* replyids.appendChild(to); */
		
	    ulid.parentNode.insertBefore(to,ulid); 
		replyids.style.display="block";
}
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
    return currentdate;
}
function callback2()
{
  	if(ajax.readyState==4&&ajax.status==200){
  	var text=ajax.responseText;
			if(text=="false")
			{
				
				 window.location.href="<%=path %>/html/load.jsp";	   
				
			}else
			{
				var mobj = JSON.parse(text);
			
				 
				 //获取div
				 
				 var div=document.getElementById("miantopic");
				 var topics=document.createElement("div");
				 var comments=document.createElement("div");	
				 var topicszz=document.createElement("topicszz");				
				 div.appendChild(topics);
				 div.appendChild(comments);				 
				 topics.className="topics";
				 comments.className="comments";
				 var c_id=GenNonDuplicateID();
				 comments.id=c_id;
				 comments.style.display="none";
				 comments.width="80%";	
				 var h1="<div class='topic_imgs' style='text-align: center;width:22%;float: left;' > <img src='<%=path %>/<%=session.getAttribute("url")%>"
				 +"' alt=''  height='50%' width='50%' ><p >"+mobj.from_uid+"</p></div>";
				 var h2="<div class='topic_imgs' style='width: 78%;float: left;background-color: #fdfffc;height:auto;text-align: center' ><br><p>"
				 +mobj.content
				 +"</p> <br> <br><span><a  class='follow' onclick='trigger(reply)'>评论()</a></span><span>"+mobj.time+"</span><span><a class='follow' onclick=\"trigger( '"+c_id+"')\">回复</a></span><br> <br> </div>";
				 
                 topics.innerHTML=h1+h2;      
                 var h3="<form action='' width='100%' style='background-color: #5a4456;'><textarea name='' id='' class='text'></textarea><input type='submit' value='提交' class='btn'> </form>";
				 comments.innerHTML=h3;
				 
				 topicszz.parentNode.insertBefore(topics, topicszz);
				 topicszz.parentNode.insertBefore(comments, topicszz);
				 

				}
				
		 	}
  	
  }
//ajax实现点击响应收藏
function sendUser(id,tosb)
{
	var ids=document.getElementById(id);
	ids.value="回复: "+tosb+"   ";
	
	
}
function GenNonDuplicateID(){
 let idStr = Date.now().toString(36)
 idStr += Math.random().toString(36).substr(3)
 return idStr
}

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
function iscollect(titleid,flag)
{
  	createXMLHttp();
  	ajax.open("POST","/TheSlikRoad/Collection?titleid="+titleid+"&flag="+flag,true);
  	ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  	ajax.onreadystatechange=callback;
  	ajax.send(null);
}
function callback()
{
  	if(ajax.readyState==4&&ajax.status==200){
  	var check=ajax.responseText;
  	 if(check=="false")
  	 {
  	
			 window.location.href="<%=path %>/html/load.jsp";
	
  	 	 
  	 }
  	}  
  	
}
 
function trigger(tx)
{
            var div=document.getElementById(tx);
        
            if(div.style.display=='block')
            {
                div.style.display='none';
            }else
            {
                div.style.display='block'
            }
}
var mytime;
var myid;
function triggersreply1(tx,time,id,sizes)//获取二级列表
{
	var replyid=document.getElementById(tx);
	 replyid.innerHTML="";
	/* if(replyid.style.display=="block")
	{
		replyid.style.display="none";
		return;
	}else
	{ */
		replyid.style.display="block" 
		
    	createXMLHttp();
    	ajax.open("POST","/TheSlikRoad/Replyservlet?time="+mytime+"&id="+myid+"&page="+cpage,true);
  		ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  		txs=tx;
  		ajax.onreadystatechange=reply;
  		ajax.send(null); 
		
	/*}  */
   
}
function triggersreply(tx,time,id,sizes)//获取二级列表
{

	mytime=time;
	myid=id;
	var replyid=document.getElementById(tx);
	 replyid.innerHTML="";
	if(replyid.style.display=="block")
	{
		replyid.style.display="none";
		return;
	}else
	{
		replyid.style.display="block"
		size=sizes;
    	createXMLHttp();
    	ajax.open("POST","/TheSlikRoad/Replyservlet?time="+time+"&id="+id+"&page="+cpage,true);
  		ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  		txs=tx;
  		ajax.onreadystatechange=reply;
  		ajax.send(null); 
		
	}
   
}
function Getpage(size,currentpage,ids)
{
	var talPage =(size%5==0)?size/5:parseInt(size/5)+1;
	var page=5;
    //获取当前页数
    var pageIndex =cpage;
    var ul = document.getElementById(ids);
    document.getElementById(ids).innerHTML="";
    var li_0 = document.createElement("li");
      var li_0 = document.createElement("li");
    li_0.innerHTML = "总共："+size+"条，共："+talPage+"页";
    ul.appendChild(li_0);
    if(talPage==1 || pageIndex == 1||pageIndex==0){//第一页首页和上一页不可操作
        var li_1 = document.createElement("li");
        li_1.setAttribute("class","pageItemDisable bt4");
        li_1.setAttribute("onclick","pageClick(this)")
        li_1.innerHTML = "首页";
        ul.appendChild(li_1);
        var li_2 = document.createElement("li");
        li_2.setAttribute("class","pageItemDisable bt4");
        li_2.setAttribute("onclick","pageClick(this)")
        li_2.innerHTML = "上一页"
        ul.appendChild(li_2);
    }else{
        var li_1 = document.createElement("li");
        li_1.setAttribute("class","pageItem bt4");
        li_1.setAttribute("onclick","pageClick(this)")
        li_1.innerHTML = "首页";
        ul.appendChild(li_1);
        var li_2 = document.createElement("li");
        li_2.setAttribute("class","pageItem bt4");
        li_2.setAttribute("onclick","pageClick(this)")
        li_2.innerHTML = "上一页"
        ul.appendChild(li_2);
    }
    //之前需要将，上一页创建出来
    if(talPage<=5){
        //总页数在0到5之间时，显示实际的页数
        for(var i=0;i<talPage;i++){
            if(i+1 == pageIndex){//循环数和当前页相等时,为当前页样式
                var li = document.createElement("li");
                li.setAttribute("class","pageItemActive");
                li.setAttribute("onclick","pageClick(this)")
                li.innerHTML = i+1;
                ul.appendChild(li);
            }else{
                var li = document.createElement("li");
                li.setAttribute("class","pageItem");
                li.setAttribute("onclick","pageClick(this)")
                li.innerHTML = i+1;
                ul.appendChild(li);
            }

        }
    }else if(talPage>5){
        //总页数大于5时，只显示五页，多出的隐藏
        //判断当前页的位置
        if(pageIndex<=3){//当前页小于等于3时，显示1-5
            for(var i=0;i<5;i++){
                if(i+1 == pageIndex){//循环数和当前页相等时,为当前页样式
                    var li = document.createElement("li");
                    li.setAttribute("class","pageItemActive");
                    li.setAttribute("onclick","pageClick(this)")
                    li.innerHTML = i+1;
                    ul.appendChild(li);
                }else{
                    var li = document.createElement("li");
                    li.setAttribute("class","pageItem");
                    li.setAttribute("onclick","pageClick(this)")
                    li.innerHTML = i+1;
                    ul.appendChild(li);
                }
            }
        }else if(pageIndex>talPage-5){//当前页为最后五页时
            for(var i=talPage-5;i<talPage;i++){
                if(i+1 == pageIndex){//循环数和当前页相等时,为当前页样式
                    var li = document.createElement("li");
                    li.setAttribute("class","pageItemActive");
                    li.setAttribute("onclick","pageClick(this)")
                    li.innerHTML = i+1;
                    ul.appendChild(li);
                }else{
                    var li = document.createElement("li");
                    li.setAttribute("class","pageItem");
                    li.setAttribute("onclick","pageClick(this)")
                    li.innerHTML = i+1;
                    ul.appendChild(li);
                }
            }
        }else{//当前页为中间时
            for(var i=pageIndex-3;i<pageIndex+2;i++){
                if(i+1 == pageIndex){//循环数和当前页相等时,为当前页样式
                    var li = document.createElement("li");
                    li.setAttribute("class","pageItemActive");
                    li.setAttribute("onclick","pageClick(this)")
                    li.innerHTML = i+1;
                    ul.appendChild(li);
                }else{
                    var li = document.createElement("li");
                    li.setAttribute("class","pageItem");
                    li.setAttribute("onclick","pageClick(this)")
                    li.innerHTML = i+1;
                    ul.appendChild(li);
                }
            }   
        }
    }
    if(pageIndex == talPage){//当前页为最大页时，下一个和尾页不可操作
        var li_3 = document.createElement("li");
        li_3.setAttribute("class","pageItemDisable bt4");
        li_3.setAttribute("onclick","pageClick(this)")
        li_3.innerHTML = "下一页"
        ul.appendChild(li_3);
        var li_4 = document.createElement("li");
        li_4.setAttribute("class","pageItemDisable bt4");
        li_4.setAttribute("onclick","pageClick(this)")
        li_4.innerHTML = "尾页"
        ul.appendChild(li_4);
    }else{
        var li_3 = document.createElement("li");
        li_3.setAttribute("class","pageItem bt4");
        li_3.setAttribute("onclick","pageClick(this)")
        li_3.innerHTML = "下一页"
        ul.appendChild(li_3);
        var li_4 = document.createElement("li");
        li_4.setAttribute("class","pageItem bt4");
        li_4.setAttribute("onclick","pageClick(this)")
        li_4.innerHTML = "尾页"
        ul.appendChild(li_4);
    }
    if(0 == talPage){//一页都没有时，将首页，上一页，下一个，尾页都置为不可操作
            $(".bt4").removeClass("pageItem");
            $(".bt4").addClass("pageItemDisable");
    }


}
function pageClick(obj){
    var talPage =(size%5==0)?size/5:parseInt(size/5)+1;
    var page=5;
    //获取当前页数
    var pageIndex =cpage;
    var text = obj.innerText;//点击标签的值
    //如果为不可操作的直接返回false
    /*  if($(obj).attr("class").indexOf("pageItemDisable")>=0){
        return false;
    }  */
   
        if("首页" == text){
        cpage=1;
        triggersreply1(txs,time,id,size);	

        }else if("上一页" == text){
      
            if(pageIndex <= 1){
                         
            }else{
            	cpage--;
                triggersreply1(txs,time,id,size);
            }
        }else if("下一页" == text){
            //如果当前页为尾页，则下一页为尾页，url跟当前url一样
            if(pageIndex == talPage){
            	
            }else{
              if(cpage==0)
              {
              	cpage=1;
              }
               cpage++;
               triggersreply1(txs,time,id,size);
            }
        }else if("尾页" == text){
            //如果当前页为尾页，则url不变
            if(pageIndex == talPage){
          
            triggersreply1(txs,time,id,size);
            	
            }else{
            	cpage=talpage-1;
                triggersreply1(txs,time,id,size);
            }
        }else{
            //点击页数时
           cpage=text;
           triggersreply1(txs,time,id,size);

        }
   
    

}

function reply(){
if(ajax.readyState==4&&ajax.status==200)
  	{
 		
  		 var replyid=document.getElementById(txs);	 
  		  	 replyid.innerHTML="";
			var text=ajax.responseText;
			if(text=="false")
			{
				 //  alert('出错了,Err：' + ajax.status);  
				   flag=false;
			}
			else
			{		
				 var mobj = JSON.parse(text);
				 var marray=mobj;
				for(var i = 0; i <mobj.length; i++){//遍历json数组时，这么写p为索引，0,1
				 var From_uid=mobj[i].from_uid;
				 var to_uid=mobj[i].to_uid;
				 var titleid=mobj[i].titleid;
				 var time=mobj[i].time;
				 var content=mobj[i].content;
				 var imgeurl=mobj[i].imgeurl;
				 var to_time=mobj[i].totime;
				 size=mobj[i].size;
				 
				add(From_uid,to_uid,titleid,time,content,txs,imgeurl,to_time);
				
			 	}
			 	if(size>0)
			 	{
			 	var ul=document.createElement("ul"); 
			 	var to=document.createElement("div");
			 	to.className="to";
			 	to.appendChild(ul);
			 	replyid.appendChild(to);
			 		ul.className="page";
  					ul.id="getPage"+txs;
  					ul.style.listStyleType="none";
  					ul.style="overflow:hidden";
					replyid.style.display="block";
					
			 	Getpage(size,cpage+1,ul.id); 
			 	var p_name=txs+'pinglun'; 
   				var pinglun=document.getElementById(p_name);

    			
   				pinglun.innerHTML="评论("+size+")"; 
		 
			 	}
			 	
			}
		}
}
function triggers(tx1,tx2,tosb)
{
     var div=document.getElementById(tx1);
     sendUser(tx2,tosb);
            
      if(div.style.display=='block')
       {
             div.style.display='none';
       }else
       {
                div.style.display='block'
       }

}

function myrefresh()
{
	if(ajax.readyState==4&&ajax.status==200)
	{
		var check=ajax.responseText;
		
	}
}
function reset()
{
	
  	createXMLHttp();
  	ajax.open("POST","/TheSlikRoad/Refreshservlet?titleid="+<%=user.getTitleid() %>,true);
  	ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  	ajax.onreadystatechange=myrefresh;
  	ajax.send(null);
}
  window.onload=function(){ 
  



  	/*   window.location.reload(); */
   /*  var url=document.location.href;
    if(url.indexOf("r=")==-1)
    {
      var t=new Date();
      window.location.href= url+"?r="+t.getTime();     
    } */
	
  //实现页面刷新
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
  function moveImg(list,index) {
        for(var i=0;i<list.length;i++){
            if(list[i].className=='opa-on'){//清除li的透明度样式
                list[i].className='';
            }
        }
        list[index].className='opa-on';
    }
    function moveIndex(list,num){//移动小圆圈
        for(var i=0;i<list.length;i++){
            if(list[i].className=='on'){//清除li的背景样式
                list[i].className='';
            }
        }
        list[num].className='on';
    }
	var imgList=document.getElementById('img').getElementsByTagName('li');
    var list=document.getElementById('index').getElementsByTagName('li');
    var index=0;
    var timer;

    for(var i=0;i<list.length;i++){//鼠标覆盖上哪个小圆圈，图片就移动到哪个小圆圈，并停止
        list[i].index=i;
        list[i].onmouseover= function () {
		
            var clickIndex=parseInt(this.index);
            index=clickIndex;
            moveImg(imgList,index);
            moveIndex(list,index);
            clearInterval(timer);//定时器停止

        };
        list[i].onmouseout= function () {//移开后继续轮播
            play();
        };

    }

    var nextMove=function(){
        index+=1;
        if(index>=4){
            index=0
        }
        moveImg(imgList,index);
        moveIndex(list,index);
    };
    var play=function(){
        timer=setInterval(function(){
            nextMove();
        },3000);
    };
    play();

}
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
        
        
        
       
 </script>
 

  </head>
  
  <body>
  <img src="<%=path %>/image/logo1.png" alt="" width="35px" style="position: fixed;left:5%;top:1%; z-index:1000;"/>
  <div class="wrap">
   
  <div class="nav">
       <ul>
   
     <li><a href="<%=path %>/index.jsp">首页</a></li>
    <li><a href="<%=path %>/html/museum.jsp"target="_blank">博物馆</a>
    <ul class="subNav">
        <li><a href="<%=path %>/html/museum.jsp" target="_blank">门票</a></li>
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
    <div class="header">&nbsp;&nbsp;&nbsp;<a href="<%=path %>/index.jsp" target="_blank"><font color="red">首页</font></a>&nbsp;>&nbsp;学术&nbsp;>&nbsp;<a href="<%=path %>/html/tribune.jsp" target="_blank"><font color="red">论坛</font></a>&nbsp;>&nbsp;帖子</div>
      <div class="main" style="background-color:#fffa8a">
        <div class="miantopic" id="miantopic">
            <div class="topic" style="border: 1px solid rgba(0, 0, 0, 0.49);" id="topic">
                <div class="topic_img" style="background-color: #ced0cd;text-align: center;" >
                    <img src="<%=path %>/<%=user.getUrl()%>" alt=""  height="50%" width="50%"/>
                    <p ><%=user.getId()%></p>
                    <p ><%=user.getTime() %></p>
                </div>
                <div class="topic_img" style="width: 78%;height: 100%;" >
                    <span>话题：<%=user.getTitle() %></span>
                    <%if(isinfo=="true"){ %>
                    <a onclick="changeIB(follow,<%=user.getTitleid()%>)" style="position: absolute;right: 10%;" class="follow" id="follow">已关注</a>
					<%}else{%>
					 <a onclick="changeIB(follow,<%=user.getTitleid()%>)" style="position: absolute;right: 10%;" class="follow" id="follow">关注</a>
					<%} %>

                    <div style="overflow: auto;width: 96%;height: 75%;background-color: #a3a3a3;position: absolute;bottom: 4%;margin-left: 1%;">
                    <p>
                     <%=user.getSuggest() %>
                    </p>
                    </div>
                </div>
            </div>
             <%
                if(vistorlist.size()>0&&vistorlist!=null)
				{%>
				<%for(int t=tempcurrent;t<vistorlist.size()&&t<limitpage;t++){
				
				%>
            <div class="topics" id="topics<%=t%>">
                <div class="topic_imgs" style="text-align: center;width:22%;float: left;" >
                    <img src="<%=path %>/<%=vistorlist.get(t).getImgurl() %>" alt=""  height="50%" width="50%" />
                    <p id="reply<%=t%>id"><%=vistorlist.get(t).getFrom_uid() %></p>

                </div>
                <div class="topic_imgs" style="width: 78%;float: left;background-color: #fdfffc;height:auto;text-align: center" >
                    <br/>
                    <p><%=vistorlist.get(t).getContent()%></p>
                    <br/>
                    <br/>
                   <span><a  id="reply<%=t%>pinglun" class="follow" onclick="triggersreply('reply<%=t%>','<%=vistorlist.get(t).getTime()%>','<%=vistorlist.get(t).getFrom_uid() %>','<%=vistorlist.get(t).getReplysize() %>')">评论(<%=vistorlist.get(t).getReplysize() %>)</a></span> 
                    <span><%=vistorlist.get(t).getTime()%></span>
                    <span><a class="follow" onclick="trigger('comments1<%=t%>')">回复</a></span>
                    <br/>
                    <br/>

                </div>
            </div>
            <div class="comments"width="80%" style="background-color: #5A191B;display: none;" id="comments1<%=t%>">
                <form action=""width="100%" style="background-color: #5a4456;">
                    <textarea name=""  class="text" id="commentss<%=t%>"></textarea>
                    <input type="button" value="提交" class="btn"  onclick="SendMsg2('<%=vistorlist.get(t).getFrom_uid()%>',null,'<%=user.getTitleid()%>','<%=vistorlist.get(t).getTime()%>','<%=vistorlist.get(t).getContent()%>',document.getElementById('commentss<%=t%>').value,'reply<%=t%>','commentss<%=t%>','1')"/>
                </form>
            </div>
           <div class="reply" style="display: none;padding-botton:1%;" id="reply<%=t%>" >
            </div>
                
                 <%} }%>
                 
             
            </div>
          
          <div  id="topicszz" style="border:none;">  
             <div class="topicall" id="topicnum">
<div class="page">
<div class="img-page">

<%if(currentpage>1){ %>
<a href="post.jsp?page=<%=currentpage-1%>" rel="external nofollow" rel="external nofollow"   ><span>上一页</span></a>
<%}%>

<%
int c=currentpage-4;
 %>
 <% if(c>0){
 while(c<currentpage){
 %>
  <a href="post.jsp?page=<%=c%>" rel="external nofollow" ><span><%=c%></span></a>
<% 
	c++;
} }else{ for(int i=1;i<=currentpage-1;i++){ %>
 <a href="post.jsp?page=<%=i%>"  rel="external nofollow"  ><span><%=i%></span></a>
<%
}}
 %>
<% 
for(int i=currentpage;i<=limit&&i<=pages;i++)
{ 
%>

 <%if(i==currentpage){ %>
 <a href="post.jsp?page=<%=currentpage%>" rel="external nofollow"  class="selected"><span><%=currentpage%></span></a>
 <%
 }else{%>
 <a href="post.jsp?page=<%=i%>"  rel="external nofollow"  ><span><%=i%></span></a>
 
 <%}} %>

<%if(currentpage+1<=pages){ %>
<a href="post.jsp?page=<%=currentpage+1%>" rel="external nofollow" rel="external nofollow"   ><span>下一页</span></a>
<%}%>

   
</div>
</div>
</div>
             
             
               </div>  
            
        <div class="comments"width="80%" style="background-color: #5A191B;" id="comments" >
          <textarea name=""  class="text" id="content"></textarea>
                <input type="text" name="topic_id" value="<%=user.getTitleid()%>" style="display:none" id="topic_id"></input>
                <input type="button" value="提交" class="follow" style="position: absolute;bottom:1%;" onclick="SendMsg1(document.getElementById('content').value,document.getElementById('topic_id').value)"/>
        </div>

    </div>
  	  <div class="mianshow">
        <div class="imgs">
         
            <nav>
                <ul id="index">
                    <li class="on"></li>
                    <li></li>
                    <li></li>
                    <li></li>

                </ul>
                <ul id="img" style="">
                   
                    <li class="opa-on"><img src="<%=path%>/image/first_bells.jpg"  width="90%" height="200px" alt="img1"/></li>
                    <li><img src="<%=path%>/image/first_desert.jpg" width="90%"  height="200px" alt="img2"/></li>
                    <li><img src="<%=path%>/image/first_silk.jpg" width="90%"  height="200px"  alt="img3"/></li>
                    <li><img src="<%=path%>/image/first_tea.jpg" width="90%"  height="200px"  alt="img4"/></li>
                </ul>
            </nav>
        </div>
        <div class=" imgs" style="margin-top: 10%;text-align: center;background-color: #5A191B;padding-top:1%; ">
            <h3>今日话题</h3>
            <hr style="background-color: white;width: 25%;margin-left: auto;margin-top: 2%;margin-right: auto;margin-bottom: 2%"/>
            <jsp:useBean id="News" scope="session" class="cn.theslikeroad.dataPrepare.NewData"/>
<%
	ArrayList list=(ArrayList)News.Getdata() ;
	if(list.size()>0)
	{
	for(int i=0;i<4;i++)
	{
		New news=(New)list.get(i);
		
		%>
		<p class="cont"><a href="<%=news.getNewsUrl()%>" target="_blank">· <%=news.getNewsTitle()%></a></p >
		<% 
		
	}
	}
	

 %>
          
        </div>
        <p style="text-align: center;position: relative;width:50%;top:5%;left:20%;"  class="btn">
         <%if(UserName.username.equals(null)||UserName.username.equals("")){ %>
		    <a href="<%=path %>/html/load.jsp" style="color: #f7ff41;margin-right: -50%; width:40%" target="_blank">我的主页</a>
		 <% }else{%>   
		<a href="<%=path %>/html/personal homepage.jsp" style="color: #f7ff41;margin-right: 15%; width:40%" target="_blank">个人中心</a>
    
         <% }%>
       
        
        </p>

    </div>

	<div class="top">
        <a href="#topic"><img src="<%=path %>/image/往上%20(1).png" alt="" width="100%"/></a>
        <a href="#comments"><img src="<%=path %>/image/添加.png" alt="" width="80%" style="margin-left:10%;"/></a>
  </div>
  </body>
</html>
