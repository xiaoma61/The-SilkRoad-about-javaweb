<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cn.theslikroad.LLM.MuseumMsg" %>
<%@ page import="cn.theslikroad.LLM.UserName" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    
    <title>博物馆</title>
    
<link rel="stylesheet" type="text/css" href="<%=path %>/css/subNav.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/index11.css" />


 	<link rel="stylesheet" type="text/css" href="<%=path %>/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/zzsc.css">
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/style5.css">
    <link href="<%=path %>/css/css.css" rel="stylesheet" type="text/css" />
    <script src="<%=path %>/js/js1.js"type="text/javascript"></script>
    <script src="<%=path %>/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=NCzvoK1orlDIRTyTwIAgVsjsbSfkxdfs"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/normalize1.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/demo1.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/component1.css" />
    <script src="<%=path %>/js/modernizr-2.6.2.min.js"></script>
    <script src="<%=path %>/js/js.js"type="text/javascript"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=NCzvoK1orlDIRTyTwIAgVsjsbSfkxdfs"></script>
	<link rel="stylesheet" href="<%=path %>/css/general.css">
	<link rel="stylesheet" href="<%=path %>/css/set_1.css">
	<link rel="stylesheet" href="<%=path %>/css/set_6.css">
  </head>
  
  <body>
    <img src="<%=path %>/image/logo1.png" alt="" width="35px" style="position: fixed;left:5%;top:1%; z-index:1000;"/>
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
       <li><a href="<%=path %>/ChangeName">退出</a></li>
         <% }%>
        </ul>
	</li>
</ul>
</div>

<div class="header">&nbsp;&nbsp;&nbsp;<a href="<%=path %>/index.jsp"><font color="bule">首页 </font></a>&nbsp;>&nbsp;博物馆</div>
<jsp:useBean id="museumdata" scope="session" class="cn.theslikeroad.dataPrepare.MuseumData"/>
<% List<MuseumMsg>list=(List<MuseumMsg>)museumdata.GetMsg(); %>
<div class="main">
<div class="contain_museum_top" style="background: #6f0b02;">
    <div class="content">
        <div class="l-pic-index"></div>
        <div class="r-pic-index"></div>
        <div class="l-bg-index"></div>
        <div class="r-bg-index"></div>
        <div class="main-index">
            <p class="intro-text"  style="color: #6f0b02;font-size:20%;">
             丝绸之路博物馆将因藏有世界级的文物瑰宝而永葆生机。凝聚千年的使命，今生寄托的希冀， 丝绸之路博物馆的建造者们为此创造了一个宏伟庞大的历史画卷。
而她的艺术家、建筑家和历史学家们将继续努力营建并不断完善这个文化历史圣殿，以满足东西方文化交流、感受丝绸之路灿烂辉煌历史的崇高愿望。
丝绸之路的生命之花`将从这里开始，并开的绚烂之极，光耀千古。
            </p>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function(){

            $(".l-pic-index").animate({'left':'95px','top':'-4px'},1300);
            $(".r-pic-index").animate({'right':'-23px','top':'-5px'},1450);
            $(".l-bg-index").animate({'width':'433px','left':'73px'},1500);
            $(".r-bg-index").animate({'width':'433px','right':'-38px'},1500,function(){
                $(".main-index").fadeIn(800);
            });
        });
    </script>

    <div style="text-align:center;clear:both;">

    </div>
</div>
<%if(list!=null&&list.size()>0){ %>

<%for(int i=0;i<list.size();i++){%>



<div class="contain_museum_main">
        <div class="museum_introduce">
           <a name="top<%=i %>"> <p style="text-align:center;font-size:200%;font-family: 微软雅黑;font-weight: bold;"><%=list.get(i).getName() %></p></a>
            <br>
            <hr style="width: 10%;margin: auto;height: 2px;background-color: #ae030f;border: none;">

            <div class="introduce" >
                <p style="font-size: 120%;color: rgba(214, 3, 6, 0.93);"><%=list.get(i).getIntroduce() %></p>
            </div>
            <div class="display"style="width: 100%;height:400px;;margin-top: 2%;" >
                <div class="display_img" style="width: 55%;height:320px;float: left;margin-top: 1%;border: 1px solid #656565">
                    <div id="ifocus">
                        <div id="ifocus_pic">
                            <div id="ifocus_piclist" style="left:0; top:0;">
                                <ul>
                               
                                <%for(int t=0;t<list.get(i).getUrl().size()&&t<4;t++) {%>
                                    <li><a href="#"><img src="<%=list.get(i).getUrl().get(t) %>" alt="" /></a></li>
                                    <%-- <li><a href="#"><img src="<%=path %>/image/02.jpg" alt="" /></a></li>
                                    <li><a href="#"><img src="<%=path %>/image/03.jpg" alt="" /></a></li>
                                    <li><a href="#"><img src="<%=path %>/image/04.jpg" alt="" /></a></li> --%>
                                <%} %>
                                </ul>
                            </div>
                            <div id="ifocus_opdiv"></div>
                            <div id="ifocus_tx">
                               <ul>
                              
                                </ul> 
                            </div>
                        </div>
                        <div id="ifocus_btn">
                            <ul>
                            <%for(int t=0;t<list.get(i).getUrl().size()&&t<4;t++) {%>
                                   
                                    <%if(t>0){%>
                                     <li class="normal"><img src="<%=list.get(i).getUrl().get(t) %>" alt="" /></li>
                            
                                  <%}else{%>
                             	<li class="current"><img src="<%=list.get(i).getUrl().get(t) %>" alt="" /></li>        
                                    
                                <%}} %>
                                
                
                           
                            </ul>
                        </div>
                    </div>

                </div>

                <div class="display_img" style="width: 45%;height:350px;background-color:#ae030f;">
                    <h2 style="font-size: 200%; color: white;">购票网址</h2>
                    <br>
                    <hr style="width: 10%;margin: auto;">
                    <br>
                    <%for(int t=0;t<list.get(i).getAddress().size();t++){%>
                    <div class="set_6_btn in blue" style="position:relative;float:left;">
                    <a href="<%=list.get(i).getAddress().get(t) %>" target="_blank"><span style="color:white;font-size:160%;">网址<%=t+1 %></span></a> 
		  <div class="corners top"></div>
		  <div class="corners bottom"></div>
		</div>
                     
                  		<br>
                  		<br>
                    <% } %>
                   
                   


                </div>
            </div>
            <p style="text-align:center;font-size:200%;font-family: 微软雅黑;font-weight: bold;margin-bottom: 3%;">详情介绍</p>
            <br>
            <div class="route" style="width: 100%;height:400px;background-color:rgba(180, 3, 21, 0.76);;">

                <div class="routes" id="map<%=i %>"  style="width: 43%;height:100%;background-color:blue;float: left;">
                    <script type="text/javascript">
                        //创建和初始化地图函数：
                        function initMap(){
                            createMap();//创建地图
                            setMapEvent();//设置地图事件
                            addMapControl();//向地图添加控件
                            addMapOverlay();//向地图添加覆盖物
                        }
                        function createMap(){
                            map = new BMap.Map("map<%=i %>");
                            map.centerAndZoom(new BMap.Point(98.440241,39.780202),15);
                        }
                        function setMapEvent(){
                            map.enableScrollWheelZoom();
                            map.enableKeyboard();
                            map.enableDragging();
                            map.enableDoubleClickZoom()
                        }
                        function addClickHandler(target,window){
                            target.addEventListener("click",function(){
                                target.openInfoWindow(window);
                            });
                        }
                        function addMapOverlay(){
                            var markers = [
                                {content:"<%=list.get(i).getName() %>",title:"<%=list.get(i).getName() %>",imageOffset: {width:0,height:3},position:{lat:31.328966,lng:120.624687}},
                                {content:"<%=list.get(i).getName() %>",title:"<%=list.get(i).getName() %>",imageOffset: {width:0,height:3},position:{lat:39.777042,lng:98.440169}}
                            ];
                            for(var index = 0; index < markers.length; index++ ){
                                var point = new BMap.Point(markers[index].position.lng,markers[index].position.lat);
                                var marker = new BMap.Marker(point,{icon:new BMap.Icon("http://api.map.baidu.com/lbsapi/createmap/images/icon.png",new BMap.Size(20,25),{
                                    imageOffset: new BMap.Size(markers[index].imageOffset.width,markers[index].imageOffset.height)
                                })});
                                var label = new BMap.Label(markers[index].title,{offset: new BMap.Size(25,5)});
                                var opts = {
                                    width: 200,
                                    title: markers[index].title,
                                    enableMessage: false
                                };
                                var infoWindow = new BMap.InfoWindow(markers[index].content,opts);
                                marker.setLabel(label);
                                addClickHandler(marker,infoWindow);
                                map.addOverlay(marker);
                            };
                        }
                        //向地图添加控件
                        function addMapControl(){
                            var scaleControl = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
                            scaleControl.setUnit(BMAP_UNIT_IMPERIAL);
                            map.addControl(scaleControl);
                            var navControl = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:0});
                            map.addControl(navControl);
                            var overviewControl = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:true});
                            map.addControl(overviewControl);
                        }
                        var map;
                        initMap();
                    </script>
                </div>

                <div class="routes" style="width: 57%;height:100%;float: left;">

                <div class="comment" style="width: 90%;height:100%;float: left;position: relative;">
                    <img src="<%=list.get(i).getMainImage() %>" width="100%" height="100%" alt="">
                    <div class="comments" style="width:100%;height:100%;position: absolute;top: 0px;color: white;padding-top:10%;padding-right:10%;font-size: 150%;overflow:auto; word-wrap:break-word; word-break:break-all;background-color: rgba(0, 0, 0, 0.68);">
 						
							
							<%for(int t=0;t<list.get(i).getComments().size();t++){ %>
							 <p><%=list.get(i).getComments().get(t) %></p>
							<%} %>
                           
                       

                    </div>
                </div>
                    <div class="comment" style="width: 10%;height:100%;float: left;font-size: 150%;  line-height: 75px; writing-mode: vertical-lr; padding-top: 30%;color: rgba(247, 255, 65, 0.83);font-family: 'Adobe 楷体 Std R'">精彩点评</div>
                </div>
            </div>
        </div>

    </div>

<%} %>
<%} %>
    


    <div class="component">
 
        <button class="cn-button" id="cn-button">+</button>
        <div class="cn-wrapper" id="cn-wrapper">
            <ul>
                <li><a href="#top0">1</a></li>
                <li><a href="#top1">2</a></li>
                <li><a href="#top2">3</a></li>
                <li><a href="#top3">4</a></li>
                <li><a href="#top4">5</a></li>
                <li><a href="#top5">6</a></li>
                <li><a href="#top6">7</a></li>
                <li><a href="#top7">8</a></li>

            </ul>
        </div>
        <div id="cn-overlay" class="cn-overlay"></div>
        <!-- End Nav Structure -->
    </div>
</div><!-- /container -->
    <script src="<%=path %>/js/polyfills.js"></script>
    <script src="<%=path %>/js/demo1.js"></script>
    <div class="foot">

    </div>
</div>
  </body>
</html>
