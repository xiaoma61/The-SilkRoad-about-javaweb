<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cn.theslikroad.LLM.UserName" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/index16.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/subNav.css" />
<title>历史背景</title>
 <script src="<%=path %>/js/js.js"type="text/javascript"></script>  

  </head>
  
  <body>
    <img src="<%=path %>/image/logo1.png" alt="" width="35px" style="position: absolute;left:5%;top:1%; z-index:1000;"/>
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

<div class="header">&nbsp;&nbsp;&nbsp;<a href="<%=path%>/index.jsp"><font color="bule">首页</font></a>&nbsp;>&nbsp;探索&nbsp;>&nbsp;<a href="<%=path%>/html/history.jsp"><font color="bule">丝路历史</font></a>&nbsp;>&nbsp;历史背景</div>
<div class="top"><font size="+2" color="#900">历史背景</font><br /><font size="+1"><br />传统的丝绸之路，起自中国古代都城长安，经中亚国家、阿富汗、伊朗、伊拉克、叙利亚等而达地中海，以罗马为终点，全长6440公里。这条路被认为是连结亚欧大陆的古代东西方文明的交汇之路，而丝绸则是最具代表性的货物。数千年来，游牧民族或部落、商人、教徒、外交家、士兵和学术考察者沿着丝绸之路四处活动。<br />
随着时代发展，丝绸之路成为古代中国与西方所有政治经济文化往来通道的统称。有西汉张骞开通西域的官方通道“西北丝绸之路”；有北向蒙古高原，再西行天山北麓进入中亚的“草原丝绸之路”；有长安到成都再到印度的山道崎岖的“西南丝绸之路”；还有从广州、泉州、杭州、扬州等沿海城市出发，从南洋到阿拉伯海，甚至远达非洲东海岸的海上贸易的“海上丝绸之路”等。</font></div>

<div class="content">

	<div class="content-big">
    	<div class="content-big-1">
        	<div class="text"><font size="+1" color="#FFFFFF">
            <br /><br />
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;先秦时期，连接中国东西方交流的通道已经存在，丝绸正式西传始于西汉通西域，丝绸之路真正形成始于西汉张骞凿空。这个时期，丝绸的传播源、传播的目的地、传播的路线都非常清楚，有史可依，有据可查，所以丝绸之路真正开辟于西汉武帝时期。西汉时，阳关和玉门关以西即今新疆乃至更远的地方，称作西域。西汉初期，联络东西方的通道被匈奴所阻。汉武帝时，中原始与西域相通，开始加强对西域的经略。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 汉武帝时期，张骞率领100余人向西域进发，途中被匈奴俘获，滞留了10年，终于寻机逃脱。张骞没有达到目的，在西域待了一年多东返，途中又被匈奴扣留了一年多，元朔三年，张骞回到大汉，受到汉武帝的热情接待。此次西行前后达10余年，获得了大量西域的资料，史学家司马迁称张骞此行为“凿空”。张骞归国后，汉武帝曾遣使探求通过罗马开辟一条不经匈奴而到大夏的交通线，但是没有成功。后来汉军击败匈奴，取得了河西走廊地区，打通了西汉与西域之间的通道。霍去病在祁连山大破匈奴后，张骞建议联络西域强国乌孙，以断匈奴右臂。元狩四年（前119年），张骞再次出使西域，目的是招引乌孙回河西故地，并与西域各国联系。张骞到乌孙，未达目的，于元鼎二年（前115年）偕同乌孙使者返抵长安，被张骞派往西域其他国家的副使也陆续回国。乌孙使者见大汉人众富厚，回国归报后乌孙渐渐与大汉交往密切，其后数年，张骞通使大夏，从此，西汉与西北诸国开始联系频繁起来，丝绸之路正式开通，汉武帝以军功封其为博望侯。<br />

  </font>
            </div>
        </div>
        <div class="content-big-2">
        
        	<div class="text">
            <font size="40px" >
            <br /><br /><br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            西
            <br /><br /><br /><br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            汉</font>
            </div>
        </div>
    
    </div>
<div class="content-big">
    	<div class="content-big-1">
        	<div class="text"><font size="+1" color="#FFFFFF"><br />
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 但是，楼兰、车师等国在匈奴的策动下，经常劫掠西汉派往西域的使臣和商队。为了确保西域通道，元封三年（前108年），汉将王恢率骑兵击破楼兰，赵破奴率军击破车师。元封六年（前105年），西汉又与乌孙王和亲，联合挟制匈奴。同时为了打破匈奴对大宛的控制并取得大宛的优秀马种汗血马，汉武帝派李广利领兵数次进攻大宛，在付出沉重代价后，攻破大宛都城，使西汉在西域的声威大振，确保了西域通道的安全。通往西域的“丝绸之路”，至此畅通。<br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 汉武帝太初四年（前101年），汉武帝在轮台（今轮台县东南）和渠犁（今库尔勒县西南）设立了使者校尉，管理西域的屯田事务。这是西汉政府在西域第一次设置的官吏。此后，西汉政府就在西域建立了根据地。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 汉宣帝神爵二年（前60年），匈奴日逐王先贤掸率众投降，西汉政府取得了对匈奴战争的最终胜利，设置了西域都护府，这是中央王朝在葱岭以东，今巴尔喀什湖以南广大地区正式设置行政机构的开端。从此，今新疆地区开始隶属中央的管辖，成为中国不可分割的一部分。西汉政府在西域设置常驻官员，派士卒屯田，设校尉统领保护，使汉族同新疆少数民族交往更加密切。汉朝在西域设立西域都护府为标志，丝绸之路这条东西从西汉方交流之路开始进入繁荣时代。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 佛教第一次传入中国，也始于丝绸之路。汉哀帝元寿元年（前2年），西域大月氏使臣伊存来朝，在帝都长安向中国博士弟子景卢口授《浮屠经》 。从此佛教正式开始传入中国，史称这一佛教初传历史标志为“伊存授经” 。<br /> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;天凤三年（16年），西域诸国断绝了与新莽政权的联系，丝绸之路中断。
            </font>
            </div>
        </div>
        <div class="content-big-2">
        	<div class="text">
             <font size="40px" >
            <br /><br /><br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            西
            <br /><br /><br /><br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            汉</font>
            </div>
        </div>
    
    <div class="content-mid">
    	<div class="content-mid-1">
        	<div class="text"><font size="+1" color="#FFFFFF"><br />
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;永平十六年（73年），班超随从大将军窦固出击北匈奴，并奉命出使西域。他率吏士36人首先到了鄯善，以“不入虎穴，焉得虎子”的决心，使鄯善为之震服。之后他又说服于阗，归附中央政府。班超又重新打通隔绝58年丝绸之路，并帮助西域各国摆脱了匈奴的控制，被东汉任命为西域都护，班超在西域经营30年，加强了西域与内地的联系。 <br /> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;永元三年（91年），北道的龟兹、姑墨、温宿皆归附东汉，班超设西域都护府于龟兹它乾城，亲自坐镇北道。又命西域长史徐干屯疏勒，与北道相呼应。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;永元六年，班超发龟兹、鄯善等八国兵7万余人讨伐对抗中央的焉耆等国统治者，西域50余国皆归属中央政府。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;永元九年，班超曾派副使甘英出使大秦国（罗马帝国），一直到达条支海（今波斯湾），临大海欲渡，由于安息海商的婉言阻拦，虽未能实现，但这是首次突破安息国的阻拦，将丝绸之路从亚洲延伸到了欧洲，再次打通已经衰落的丝绸之路。 
大秦属下的蒙奇兜讷（今译为马其顿）地区遣使到东汉首都洛阳，向汉和帝进献礼物。汉和帝厚待两国使者，赐给两国紫绶金印。 <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;延熹九年（166年），古罗马大秦王安敦派使者至东汉洛阳，朝见汉桓帝。</font>
            </div>
        </div>
        <div class="content-mid-2">
        	<div class="text">
             <font size="40px" >
            <br /><br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            东
            <br /><br /><br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            汉</font>
            </div>
        </div>
    	
    
    </div>

      <div class="content-big">
   		 <div class="content-big-1">
         	<div class="text"><font size="+1" color="#FFFFFF"><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;魏晋南北朝时期，丝绸之路不断发展，主要有西北丝绸之路（又叫绿洲丝绸之路或沙漠丝绸之路）、西南丝绸之路和海上丝绸之路三条。它具有由两汉到隋唐的过渡性、海上丝绸之路进一步发展、南北两政权同时与西域频繁交往三方面的特点。
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;北魏文成帝太安元年（455年），在直接的交往断绝了很长一段时间后，波斯与统一了中国北方的北魏王朝建立了直接的联系。从这时开始，直到正光三年，《魏书》本纪记载了十个波斯使团，前五次应当是到了北魏都城平城（今山西大同），为中国带来了玻璃制品工艺，后五次到达的则是493年迁都后的洛阳。<br />
神龟元年，宋云与比丘惠生，由洛阳出发，沿“丝绸之路”西行，出使西域，拜取佛经。正光三年（522年）宋云、惠生等由天竺回到洛阳，取回大乘经典170部，丰富了中国的佛教文化。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;波斯的使者也顺着丝绸之路深入到南朝。中大通二年（530年），波斯国遣使献佛牙。五年（533年）八月，遣使献方物。大同元年（535年）四月又献方物。波斯之通使南朝，走的是西域经吐谷浑境而南下益州再顺长江而下到建康的道路。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这一时期，中西之间的交流主要体现在政治、经济、文化三方面。这种交流，在政治上，促进了东西方之间的联系与交流；在经济上，促进了双方之间经济贸易、生产技术的交流；在文化上，促进了中国佛教的兴盛和礼乐文化的发展。</font>
            
            </div>
         </div>
        <div class="content-big-2">
        	<div class="text">
             <font size="40px" >
            <br /><br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            魏
            <br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            晋
             <br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            南
            <br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            北
            <br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            朝</font>
            </div>
        </div>
    
    </div>

    <div class="content-small">
     	<div class="content-small-1">
        	<div class="text"><font size="+1" color="#FFFFFF"><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            隋代开皇九年（589年），隋王朝结束南北分裂，新兴突厥族占领了西域至里海间广大地区，今青海境吐谷浑也向河西走廊侵扰，中国和西域，西方的官方、民间交往受到不少阻碍。但隋与丝绸之路各国民族之间关系，仍愈来愈密切，西域商人多至张掖互市，炀帝曾派裴矩专管这方面工作。裴矩用厚礼吸引他们到内地，使其往来相继。《隋书·西域传》序记载：侍御史韦节，司隶从事杜行满使于西番诸国，至罽宾（今塔什干附近），得玛瑙杯，印度王含城得佛经，史国得歌舞教练，狮子皮、火鼠毛。官、民的交往又活跃起来。</font>
            </div>
        </div>
        <div class="content-small-2">
       		 <div class="text">
              <font size="40px" >
            <br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            隋
            <br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            代</font>
            </div>
        </div>    
    </div>

    <div class="content-big">
   		 <div class="content-big-1">
         	<div class="text">
            <font size="+1" color="#FFFFFF">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;丝绸之路交往的繁荣鼎盛时期，是继隋而建立的强大的唐朝。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;唐朝第二代皇帝唐太宗李世民击败了东突厥吐谷浑，臣服了漠南北。唐高宗李治又灭西突厥，设安西、北庭两都护府。大唐帝国疆域，东起朝鲜海滨，西至达昌水（阿姆河，一说底格里斯河），是当时世界第一发达强盛国家，经济文化发展水平都居世界前列，东西方通过丝绸之路，以大食帝国为桥梁，官方、民间都进行了全面友好的交往。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在丝绸之路东段，大漠南北与西域各国，修了很多支线通丝绸之路，亦称“参天可汗道”。大食、东罗马帝国也不断派使节到长安与中国相通。敦煌、阳关、玉门这些地方，成了当时“陆地上的海市”。在海道上，中国也可以船舶赴林邑，真腊，河陵、骠国，经天竺直至大食，与欧洲各国发生关系。当时广州、泉州、刘家港等地，成了最著名的对外港口。史书记载广州当时便有南海舶、昆仑舶、狮子国舶、婆罗门舶、西域舶、波斯舶等趸船性的船坞。西方各国在陆上取道中亚、西域，沿途驼马商旅不断；海路则多由大食首都巴格达出波斯湾，几乎每日都有船只远涉重洋来到东方。 <br /> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;唐代丝绸之路的畅通繁荣，也进一步促进了东西方思想文化交流，对以后相互的社会和民族意识形态发展，产生了很多积极、深远的影响，这种思想文化的交流，是与宗教密切相关的。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;佛教自西汉哀帝时期传入中国后，南北朝开始大行于中国，至隋唐时达到鼎盛。唐太宗时，高僧玄奘由丝绸之路经中亚往印度取经、讲学，历时十六年，所著《大唐西域记》一书，记载了当时印度各国的政治、社会、风土人情。他取回佛教经典657部。</font>
            </div>
         </div>
        <div class="content-big-2">
        	<div class="text">
             <font size="40px" >
            <br /><br /><br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            唐
            <br /><br /><br /><br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            代</font>
	</div>
        </div>
    
    </div>
    
       <div class="content-big">
     	<div class="content-big-1">
			<div class="text">
                        <font size="+1" color="#FFFFFF"><br />
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;后来，高僧义净又由海道去印度，又历时十六年，取回佛经400部，所著《南海寄归内法传》、《大唐西域求法高僧传》，向中国介绍了当时南亚各国的文化、生活情况。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;景教（东正教）在唐初由东罗马帝国传入了中国。西安碑林保存的《大秦景教流行中国碑》是这一史实的实物见证。唐中期自波斯传入的摩尼教（亦称袄教、拜火教），中国化后称为“明教”，深为不少劳动人民所信奉。唐宋后多次农民起义的领袖，都利用它的教义来组织贫苦农民与封建统治者战斗。中国的造纸术、盛唐时也传入了大食帝国，不久便经它传入了欧洲各国。<br />

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;唐代，东西方相互传入和移植的东西很多，医术、舞蹈、武学和一些著名动植物，都使双方增加了不少视野。汉代将西方输入的东西冠以胡字，如胡琴、胡瓜、胡萝卜等；唐代则习将它们名称冠以海字，如海棠、海石榴、海珠（波斯湾珍珠）等。据《唐会典》载，唐王朝曾与三百多个国家和地区相通使交往，每年取道丝绸之路前来长安这个世界最大都市的各国客人，数目皆以万计，定居中国的，单广州便以千计。<br /> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;唐代丝绸之路的畅通繁荣，也进一步促进了东西方思想文化交流，对以后相互的社会和民族意识形态发展，产生了很多积极、深远的影响。 <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;经过安史之乱后唐朝开始衰落，西藏吐蕃越过昆仑山北进，侵占了西域的大部;中国北方地区战火连年，丝绸、瓷器的产量不断下降，商人也唯求自保而不愿远行，丝绸之路逐步走向低谷。
</font></font>
            
            </div>        
        </div>
        <div class="content-big-2">
       		 <div class="text">
               <font size="40px" >
            <br /><br /><br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            唐
            <br /><br /><br /><br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            代</font>
            </div>
        </div>  
    </div>

       <div class="content-mid">
    <div class="content-mid-1">
         	<div class="text">
<font size="+1" color="#FFFFFF"><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;北宋实际版图大幅缩减，政府未能控制河西走廊，到了南宋时期，更无法涉足西北地区，丝绸之路衰落日益明显，而海上丝路崛起，逐渐有取代陆上丝绸之路的迹象。<br />  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;蒙元时期，蒙古发动了三次西征及南征，版图大大扩展，加之驿路的设立、欧亚交通网络的恢复，使欧亚广大地域范围内国际商队长途贩运活动再度兴盛起来。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;据史料记载，当时在漫长的东西方陆路商道上从事商队贩运贸易的，有欧洲商人、有西亚、中亚地区的商人以及中国色目商人等。欧州和中、西亚商人一般都携带大量金银、珠宝、药物、奇禽异兽、香料、竹布等商品来中国或在沿途出售，他们所购买的主要是中国的缎匹、绣彩、金锦、丝绸、茶叶、瓷器、药材等商品。元代来中国的外国商人、商队为数之众，在外国史料中多有印证。《马可·波罗游记》中几处写道：元大都外城常有“无数商人”、“大量商人”来往止息，“建有许多旅馆和招待骆驼商队的大客栈，……旅客按不同的人种，分别下榻在指定的彼此隔离的旅馆”。既为不同人种，无疑为外国客商。《通商指南》也指出，“……汗八里都城商务最盛。各国商贾辐辏于此，百货云集”。</font>
            </div>
         </div>
        <div class="content-mid-2">
        	<div class="text">
              <font size="40px" >
            <br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            宋
            <br /><br /><br /><br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            元</font>
            </div>
        </div>
    
    </div>
<div class="content-mid">
   		 <div class="content-mid-1">
         	<div class="text">
<font size="+1" color="#FFFFFF"><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 在蒙元时期丝路畅通、欧亚大陆各种层次的经济交流駸駸兴旺之际，作为东西方国际贸易枢纽或与国际贸易有密切关系的地区性，民族性商品市场和物资集散地的一批贸易中心相应形成和发展。元代中外史籍几乎都记述了元大都作为东方国际贸易中心的无可争议的地位。这里“各国商贾辐辏，百货云集”。《马可·波罗游记》曾以一章的篇幅介绍元大都国际贸易的盛况：“凡世界上最为珍奇宝贵的东西，都能在这座城市找到，……这里出售的商品数量，比其他任何地方都多”。元朝中国境内丝路重要商镇还有可失哈耳（喀什噶尔），这里的纺织品“由国内的商人运销世界各地”。河西走廊的肃州，这里附近“山上出产的一种质量非常好的大黄。别处的商人都来这里采购，然后行销世界各地”。另外还有别失八里、哈喇火州等。 <br/> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;元代丝绸之路的交往目的发生了明显变化，大多是以宗教、文化交流为使命，而不再是以商人为主导，从侧面反映了丝绸之路的衰落。</font>
            </div>
         </div>
        <div class="content-mid-2">
        	<div class="text">
                <font size="40px" >
            <br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            宋
            <br /><br /><br /><br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            元</font>
            </div>
        </div>
    
    </div>
    <div class="content-small">
     	<div class="content-small-1">
        	<div class="text">
            <font size="+1" color="#FFFFFF"><br /><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 明代中期以后，政府采取了闭关锁国的政策，与此同时，造船技术和航海技术不断发展，海上交通代之而起，使丝绸之路贸易全面走向衰落。</font>
            </div>
        </div>
        <div class="content-small-2">
       		 <div class="text">
                  <font size="40px" >
            <br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            明
            <br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            清</font>
            </div>
        </div>    
    </div>

    <div class="content-mid">
     	<div class="content-mid-1">
			<div class="text">
    <font size="+1" color="#FFFFFF"><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2013年9月7日，国家主席习近平在哈萨克斯坦纳扎尔巴耶夫大学发表题为《弘扬人民友谊 共创美好未来》的重要演讲，盛赞中哈传统友好，全面阐述中国对中亚国家睦邻友好合作政策，倡议用创新的合作模式，共同建设“丝绸之路经济带”，将其作为一项造福沿途各国人民的大事业。 
2014年国家级媒体共举行了七次大规模的采访报道活动：<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2014年05月21日，中华人民共和国国务院新闻办公室组织“中国媒体丝路行”采访活动在丝绸之路起点西安启程。 <br />

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2014年06月08日，新华社“新丝路·新梦想”采访车队在丝绸之路起点西安启程。 <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2014年07月13日，中国人民政治协商会议“重走丝绸之路”大型采风报道活动在在丝绸之路起点西安启动。  <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2014年07月13日，光明日报、陕西卫视“丝绸之路万里行”采访团在丝绸之路起点西安出发。 <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2014年08月04日，中华人民共和国外交部“外交官重走丝绸之路”活动在丝绸之路起点西安成功举办。  <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2014年08月18日，人民网“行走新丝路”大型跨国全媒体报道在丝绸之路起点西安正式启动。  <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2014年09月12日，国家互联网信息办公室全国“网络名人丝路行”在丝绸之路起点西安启动。<br /></font>        </div>        
        </div>
        <div class="content-mid-2">
       		 <div class="text">
                  <font size="40px" >
            <br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            丝
            <br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            路
              <br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            重
            <br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            生</font>
            </div>
        </div>  
    </div>

</div>



</div>
  </body>
</html>
