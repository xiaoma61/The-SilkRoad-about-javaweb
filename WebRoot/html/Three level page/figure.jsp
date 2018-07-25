<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cn.theslikroad.LLM.UserName" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>相关人物</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/index17.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/subNav.css" />
    <script src="<%=path %>/js/js.js"type="text/javascript"></script>  


  </head>
  
  <body>
    <img src="<%=path %>/image/logo1.png" alt="" width="35px" style="position: fixed;left:5%;top:1%; z-index:1000;"/>
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
		<li><a href="<%=path%>/html/personal homepage.jsp">个人中心</a>
        <li><a href="<%=path %>/ChangeName">退出</a></li>
         <% }%>
        </ul>
	</li>
</ul>
</div>

<div class="header">&nbsp;&nbsp;&nbsp;<a href="<%=path%>/index.jsp"><font color="bule">首页</font></a>&nbsp;>&nbsp;探索&nbsp;>&nbsp;<a href="<%=path%>/html/history.jsp"><font color="bule">丝路历史</font></a>&nbsp;>&nbsp;历史人物</div>

<div class="main">

<div class="text" style="word-wrap: break-word">
<font size="+3" >相关人物</font><br /><br /><font size="+2" >
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;丝绸之路不仅为人类文明的进步做出了贡献，更造就了一批以果敢的精神、坚强的毅力，克服重重艰难险阻的丝路人物，千古为人传诵。他们之中，有张骞、班超、王玄策这样的杰出使者，有李广利、高仙芝统帅的军队，有法显、唐玄奘等伟大僧侣，有为国远嫁的细君、文成这样的公主，还有艺术家、诗人和探险家……。正因为这些人物，丝绸之路到了今天还令人向往、令人神驰。在丝路上，使者为了和平，军队为了战争，僧侣为了真理，商贾为了利益……，他们的目标也许不尽一致，但都必须经过长途跋涉的考验，才能达成目标。</font>
</div>
</div>

<div class="content">
<div class="content-top">
<div id="content-top-section1">先秦</div>
<div id="content-top-section2">两汉</div>
<div id="content-top-section3">魏晋南北朝</div>
<div id="content-top-section4">隋唐五代十国</div>
<div id="content-top-section5">宋元</div>
<div id="content-top-section6">明清</div>
</div>

<div id="content-bottom2" style="display:none">

<div class="block">
	<div class="block-one"><img src="../../image/zhangqian.jpg" width=100% height="100%"  alt=""/>
	  </div>
    <div class="block-two"><p><font size="+1"  color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;张骞（前164年―前114年），字子文，汉中郡城固（今陕西省汉中市城固县）人，中国汉代杰出的外交家、旅行家、探险家，丝绸之路的开拓者。张骞富有开拓和冒险精神，建元二年（前139年），奉汉武帝之命，由甘父做向导，率领一百多人出使西域，打通了汉朝通往西域的南北道路，即赫赫有名的丝绸之路，汉武帝以军功封其为博望侯。史学家司马迁称赞张骞出使西域为“凿空”，意思是“开通大道”。 
张骞被誉为伟大的外交家、探险家，是“丝绸之路的开拓者”、“第一个睁开眼睛看世界的中国人”、“东方的哥伦布”。他将中原文明传播至西域，又从西域诸国引进了汗血马、葡萄、苜蓿、石榴、胡麻等物种到中原，促进了东西方文明的交流。</font></p></div>
</div>
<div class="block">
	<div class="block-one"><img src="../../image/huoqu.jpg" width=100% height="100%"  alt=""/>
	  </div>
    <div class="block-two"><p><font size="+1"  color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;霍去病，霍去病和卫青发起的对匈奴的进攻性战争，改变了汉朝长期对匈奴战争的守势状态，一举打败匈奴，从而长久地保障了西汉北方长城一带，也就是在漠南地区的边境安全，此战为汉朝进击匈奴最远的一次。自此，匈奴帝国开始走向衰落。唐建中三年(公元782年)，礼仪使颜真卿向唐德宗建议，追封古代名将64人，包括“大司马冠军侯霍去病”。宋室依照唐代惯例，为古代名将设庙，72位名将中亦包括霍去病。

　　霍去病的作战方略可以说是对汉军战术观念的革新，迂回纵深，穿插包围，以最快的速度完成迂回穿插，对匈奴实行合围，从最薄弱的环节入手对其实行毁灭性打击。从此，汉朝控制了河西地区，为打通了西域道路奠定基础。</font></p></div>
</div>
<div class="block">
	<div class="block-one"><img src="../../image/banchao.jpg" width=100% height="100%"  alt=""/>
	  </canvas></div>
    <div class="block-two"><p><font size="+1" color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班超(32年—102年)，扶风郡平陵县(今陕西咸阳东北)人。东汉时期著名军事家、外交家。史学家班彪的幼子，其长兄班固、妹妹班昭也是著名史学家。班超为人有大志，不修细节，但内心孝敬恭谨，审察事理。他口齿辩给，博览群书。不甘于为官府抄写文书，投笔从戎，随窦固出击北匈奴，又奉命出使西域，在三十一年的时间里，平定了西域五十多个国家，为西域回归、促进民族融合，做出了巨大贡献。</font></p></div>
</div>
<div class="block">
	<div class="block-one"><img src="../../image/ganying.jpg" width=100% height=100%  alt=""/>
	  </canvas></div>
    <div class="block-two"><p><font size="+1" color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;甘英(生卒年不详)，字崇兰，东汉人。曾于汉和帝永元九年(97年)奉西域都护班超之命出使大秦(罗马帝国)。他率领使团一行从龟兹(今新疆库车)出发，经条支(今伊拉克境内)、安息(即波斯帕提亚王国，今伊朗境内)诸国，到达了安息西界的西海(今波斯湾)沿岸。这次出使虽未到达大秦，但增进了中国人当时对中亚各国的了解。</font></p></div>
</div>
</div>

<div id="content-bottom3" style="display:none">
<div class="line3"><hr width=100%  ></div> 

<div class="block">
	<div class="block-one"><img src="../../image/luoshi.jpg" width=100% height=100%  alt=""/>
	  </canvas></div>
    <div class="block-two"><p><font size="+1" color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;鸠摩罗什，中国佛教四大译经家之一。父籍天竺，出生于西域龟兹国(今新疆库车)。博通大乘小乘。所译经论影响很大，其中“三论”(《中论》、《十二门论》、《百论》)为三论宗主要依据；《成实论》为成实学派主要依据；《法华经》为天台宗主要依据；《阿弥陀经》为净土宗所依“三经”之一。著名弟子有道生、僧肇、道融、僧叡，人称“什门四圣”。</font></p></div>
</div>
<div class="block">
	<div class="block-one"><img src="../../image/faxian.jpg" width=100% height=100%  alt=""/>
	  </canvas></div>
    <div class="block-two"><p><font size="+1" color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;法显，公元399年，他为了弥补中国佛教经典中戒律部分的缺失，决定前往印度求取戒律经典。他从长安出发，经河西敦煌，度沙漠，越葱岭，历尽千辛万苦，最后终於到达印度。但即使在印度也不是到处都有他要寻求的戒律，於是辗转流徙印度各地，凡遇到所求佛经，就进行抄写。后来於412年从海路返回中国。法显前往印度取经时已年届六十。回国以后，把所得佛经进行翻译，共译得6部63卷。他还把自己的取经历程记录下来，这就是《佛国记》，又名《法显传》或《历游天竺国记传》。这是一部记录丝绸之路和中印之间关系的重要著作。</font></p></div>
</div>
</div>

<div id="content-bottom4" style="display:none">
<div class="line4"><hr width=100%  ></div> 

<div class="block">
	<div class="block-one"><img src="../../image/xuanzang.jpg" width=100% height=100%  alt=""/>
	  </canvas></div>
    <div class="block-two"><p><font size="+1" color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;玄奘(600年-664年)，是唐代著名高僧，法相宗创始人，佛经翻译家、旅行家。俗姓陈，名祎。洛州缑氏(今河南洛阳偃师)人。玄奘在贞观元年时，一人从长安出发，他西行五万里，历时19年，到印度取真经，历经艰辛到达印度佛教中心那烂陀寺，在贞观十九年回到长安，共带回佛舍利150粒、佛像7尊、经论657部。其后，玄奘在唐太宗的支持下在长安大慈恩寺设译经场，与弟子等人专心翻译所带回的佛典，共译出佛典75部，1355卷。译典著作有《大般若经》、《心经》、《解深密经》、《瑜伽师地论》、《成唯识论》等。</font></p></div>
</div>
<div class="block">
	<div class="block-one"><img src="../../image/wencheng.jpg" width=100% height=100%  alt=""/>
	  </canvas></div>
    <div class="block-two"><p><font size="+1" color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;文成公主（625年—680年11月1日），唐朝宗室女，汉族。汉名无记载，吐蕃尊称甲木萨（藏文：རྒྱ་མོ་བཟའ་，威利：rGya Mo bZa'。藏语中“甲”的意思是“汉”，“木”的意思是“女”，“萨”的意思为神仙）。
文成公主原本是李唐远支宗室女，唐太宗贞观十四年（640年），太宗李世民封李氏为文成公主；贞观十五年（641年）文成公主远嫁吐蕃，成为吐蕃赞普松赞干布的王后。
唐蕃自此结为姻亲之好，两百年间，凡新赞普即位，必请唐天子“册命”。文成公主知书达礼，不避艰险，远嫁吐蕃，为促进唐蕃间经济文化的交流，增进汉藏两族人民亲密、友好、合作的关系，做出了历史性的贡献。</font></p></div>
</div>
</div>

<div id="content-bottom5" style="display:none">
<div class="line5"><hr width=100%  ></div> 

<div class="block">
	<div class="block-one"><img src="../../image/make.jpg" width=100% height=100%  alt=""/>
	  </canvas></div>
    <div class="block-two"><p><font size="+1" color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;马可•波罗，13世纪来自意大利的世界著名的旅行家和商人。17岁时跟随父亲和叔叔，途经中东，历时四年多到达元朝。他在中国游历了17年，曾访问当时中国的许多古城，到过西南部的云南和东南地区。在狱中口述了大量有关中国的故事，其狱友鲁斯蒂谦写下著名的《马可•波罗行纪》记述了他在东方最富有的国家—中国的见闻，激起了欧洲人对东方的热烈向往，对以后新航路的开辟产生了巨大的影响。</font></p></div>
</div>
</div>

<div id="content-bottom6" style="display:none">
<div class="line6"><hr width=100%  ></div> 

<div class="block">
	<div class="block-one"><img src="../../image/zhenghe.jpg" width=100% height=100%  alt=""/>
	  </canvas></div>
    <div class="block-two"><p><font size="+1" color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;郑和(1371年-1433年)，回族，原姓马名和，小名三宝，又作三保，云南昆阳(今晋宁昆阳街道)宝山乡知代村人。中国明代航海家、外交家、宦官。1405到1433年，郑和七下西洋，完成了人类历史上伟大的壮举。宣德六年(1431年)，钦封郑和为三宝太监。宣德八年(1433年)四月，郑和在印度西海岸古里去世，赐葬南京牛首山。</font></p></div>
</div>
<div class="block">
	<div class="block-one"><img src="../../image/lima.jpg" width=100% height=100%  alt=""/>
	  </canvas></div>
    <div class="block-two"><p><font size="+1" color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;利玛窦，天主教耶稣会意大利籍神父、传教士、学者。1583年(明神宗万历十一年)来到中国居住。在中国颇受士大夫的敬重，尊称为“泰西儒士”。他是天主教在中国传教的开拓者之一，也是第一位阅读中国文学并对中国典籍进行钻研的西方学者。他除传播天主教教义外，还广交中国官员和社会名流，传播西方天文、数学、地理等科学技术知识。他的著述不仅对中西交流作出了重要贡献，对日本和朝鲜半岛上的国家认识西方文明也产生了重要影响。</font></p></div>
</div>
</div>

<div id="content-bottom1">
<div class="line1"><hr width=100%  ></div> 

<div class="block">
	<div class="block-one"><img src="../../image/zhoumu.jpg" width=100% height=100%  alt=""/>
	  </canvas></div>
    <div class="block-two"><p><font size="+1" color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;《穆天子传》及注本记载，周穆王曾经西巡经陇西、兰州、武威、张掖、居延海及巴丹吉林大漠，驱驰于阴山、蒙古高原、塔里木盆地，最远至葱岭、中亚一带。周穆王每到一处，就慷慨馈赠各部落酋长，带给各个部族的不但有丝绸、金银器皿、贝饰、药材、漆器，甚至还有交通工具——车辆和饲养放牧的人，由此可见这支队伍的庞大。周穆王的众多随员携带大量宝物，驾车浩浩荡荡向西，给西域诸部落带去丰富的生活用品，以及先进的交通工具和掌握先进生产技术的人。各地少数民族首领也热情地为穆王提供所需的大量马、牛、羊、猪、狗、骆驼和酒，并以当地特产——最精美的白玉回赠穆王。</font></p></div>

</div>
</div>
</div>
<script src="../../js/figure.js"type="text/javascript"></script>

<div>
  </body>
</html>
