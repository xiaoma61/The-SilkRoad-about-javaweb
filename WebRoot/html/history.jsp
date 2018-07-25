<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cn.theslikroad.LLM.UserName" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <link rel="stylesheet" type="text/css" href="<%=path %>/css/subNav.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/index4.css" />
    <script src="<%=path %>/js/js.js"type="text/javascript"></script>
    <title>历史</title>
   

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
	<li class="person"><a href="#"><img src="<%=path %>/image/timg1.jpg.png" width="35"   /></a>
		 <ul class="subNav">
		 <jsp:useBean id="username" class="cn.theslikroad.LLM.UserName"></jsp:useBean>
		 <%if(UserName.username.equals(null)||UserName.username.equals("")){ %>
		   <li><a href="<%=path %>/html/load.jsp">登陆</a></li>
           <li><a href="<%=path %>/registe.jsp">注册</a></li>
		 <% }else{%>   
			<li><a href="<%=path %>/html/personal homepage.jsp">个人中心</a></li>
       <li><a href="<%=path %>/ChangeName">退出</a></li>
         <% }%>
        </ul>
	</li>
</ul>
</div>

<div class="header">&nbsp;&nbsp;&nbsp;<a href="../index。jsp"><font color="bule">首页</font></a>&nbsp;>&nbsp;探索&nbsp;>&nbsp;丝路历史</div>
</div>
<div class="top"><font size="+2">丝路历史</font>
<br /><font size="+1"><br />丝绸之路是中华民族走向世界的标志，它的绝、通与中华民族的兴衰息息 相关，更加关涉着西北大地兴旺萧条的命脉。 文明只有在交流之中才能更加发展。 华夏文明的发展的确也是借助了地区与地区之间的 交流。交流产生需求，也才更加刺激文明的发展。到今天，这种规律依然发挥作用。中国的 发展还是离不开与外界的交流。 特别是在开发大西部的呼声中， 远方静静躺着的 “丝绸之路” 仿佛在召唤我们。因为不论在历史上还是在当今，丝路都是中外交往永远的通道。</font></div>

<div class="content">
<div class="content-top">
<div class="content-one1">
<div class="text"><font  color="#FFFFF"><br /><br /><a href="Three level page/context.jsp" target="_blank"><font size="+2" color="#C6E2FF" style="text-decoration:underline;">历史背景</font></a>

<div id="rotate"><a href="Three level page/context.jsp" target="_blank"><img src="../png/his_white.png" width="50" height="50" /></a>
</div>
<script src="./js/revolve.js"></script>

<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
丝绸之路是古代中国通往西方国家的唯一重要通道，为人类的发展进步和社会文化的交流有着巨大贡献。最初，丝绸之路之所以得名，很大程度上是由于我国古代与外邦通商的过程中，丝绸、瓷器、茶叶等商品是最具代表性的出口物资，其中尤以丝绸的出口量大。而丝绸之路开辟时间最早可以追溯到汉代以前。真正的丝绸之路开辟时间则是在汉朝。为了和匈奴作战，汉武帝打算联合被匈奴从河西走廊一代赶走的大月氏，便派遣张骞前往西域寻找大月氏。从汉代至盛唐年间，庞大的商队沿河西走廊往来穿梭，通商贸易，这一时期，江南、巴蜀的绸缎已然凭借其高雅的工艺品质与华美的图案造型驰名中外，成为举世闻名的奢侈品，受到睦邻友邦的普遍赞誉。</font>
</div></div>
<div class="content-two1"></div>
</div>

<div class="content-mid">

<div class="content-one2">
<div class="text"><font  color="#FFFFF"><br /><br /><font size="+2">相关记载</font><br /><br />《三国志•魏志•夫余传》载：在国衣尚白，白布大袂，袍、裤，履革鞜。出国则尚缯、绣、锦、罽。<br />
《渤海国记下篇•朝贡中国》载：渤海在唐营州之东二千里，自国都忽汗州西至长安，史言八千里。而遥遣使如中国，有朝贡谢恩祈请贺正进奉端午诸名。贡道：陆行渡辽入幽州境；水行渡海入青州境。<br />
《册府元龟•卷九十九•外臣部》载：建中元年十月六日，敕诸锦罽（丝织品和毛织品）、绫罗、绣、织成细绸、丝布、牛尾、真珠、银、铜、铁、奴婢等并不得与诸蕃互市。<br />
《金史•食货志五》载：四年，以尚书省奏，复置泗、寿、蔡、唐、邓、颖、凤翔、秦、巩、洮诸场。<br />
《渤海国志》载：遣王子朝唐，十二月至长安，奏请就市交易，入寺礼拜，玄宗许之。</font>
</div>
</div>
<div class="content-two2"><div class="text"><br /><br /><a href="Three level page/figure.jsp" target="_blank"><font size="+2" color="#B22222" style="text-decoration:underline; font-weight:bold ;">历史人物</font></a>

<div id="rotate1"><a href="Three level page/figure.jsp" target="_blank"><img src="../png/his_red.png" width="50" height="50" /></a></div>
<script src="../js/revolve1.js"></script>

<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;丝绸之路不仅为人类文明的进步做出了贡献，更造就了一批以果敢的精神、坚强的毅力，克服重重艰难险阻的丝路人物，千古为人传诵。他们之中，有张骞、班超、王玄策这样的杰出使者，有李广利、高仙芝统帅的军队，有法显、唐玄奘等伟大僧侣，有为国远嫁的细君、文成这样的公主，还有艺术家、诗人和探险家……</div></div>


<div class="content-bot">
<div class="content-two3"><div class="text"><br /><br /><font size="+2">图书推荐</font><br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;《丝绸之路全史》是一部全面系统的丝绸之路通史，第一次全景式地描述了丝绸之路的形成、发展、繁荣的历史，阐明了丝绸之路在世界文化交流和发展中的重要地位与影响，广征博引、思路开阔，具有极高的学术价值。该书明晰了“一带一路”倡议与历史上丝绸之路的内在逻辑，对于今天“一带一路”倡议的贯彻落实具有重要借鉴与启示。同时，丝绸之路的历史包含了大量中华优秀传统文化。</div></div>
<div class="content-one3"><div class="text"><font  color="#FFFFFF"><br /><br /><font size="+2" color="#FFFFFF">
线路划分</font>
<div id="rotate2"><a href="#" target="_blank"><img src="../png/his_white.png" width="50" height="50" /></a></div>
<script src="./js/revolve2.js"></script>

<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
丝绸之路一般可分为三段，而每一段又都可分为北中南三条线路。东段：从长安到玉门关、阳关。（汉代开辟）中段：从玉门关、阳关以西至葱岭。（汉代开辟）
西段：从葱岭往西经过中亚、西亚直到欧洲。（唐代开辟） 东段各线路，多考虑翻越六盘山以及渡黄河的安全性与便捷性，三线均从长安出发。中段主要是西域境内的诸线路，它们随绿洲、沙漠的变化而时有变迁。三线在中途尤其是安西四镇（640年设立）多有分岔和支路。西段自葱岭以西直到欧洲的都是丝绸之路的西段，它的北中南三线分别与中段的三线相接对应。其他还有主要与南亚交流的南方丝绸之路和沿海路行进的海上丝绸之路。</font>
</div></div>
</div></div>
</div>
  </body>
</html>
