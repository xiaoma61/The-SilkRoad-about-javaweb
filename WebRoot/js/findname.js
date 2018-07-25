/**
 * 
 */

 var ajax;
  var flag=true;

  function hiddenSuggest()
  {	
  	
     document.getElementById('suggest').style.display="none";    
  }
  function clearSuggest(){
     document.getElementById('suggest').innerHTML="";  
  }
  function displaySuggest(){
       document.getElementById('suggest').style.display="block";
       }
       
       
  function sendRequest()
  {
   
  	 clearSuggest();
     var info = document.getElementById('title').value;
      console.log(info);
  	if(info==""){
  	hiddenSuggest();
  	return ;
  	}
  	
  	chackUsername(info);
  
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
  function chackUsername(username)
  {
  
  	console.log(username);
  	createXMLHttp();
  	ajax.open("POST","/TheSlikRoad/keywordServlet?keyword="+encodeURI(encodeURI(username))+"&type=1",true);
  	ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	ajax.onreadystatechange=hell;
  	ajax.send(null);
  }
 function hell()
  {	
  console.log(tips);
	
  	if(ajax.readyState==4)
  	{
  		
  		if(ajax.status==200)
  		{
  		
  		var tips = ajax.responseXML.getElementsByTagName("res");
  		if(tips.length!=0)
  		{
  	
  			for(var i=0;i<tips.length;i++)
  			{
  			   	
  				 var title=tips[i].firstChild.nodeValue;
  				 console.log(title);
  				 var sDiv = "<div class='out' onmouseover='mover(this);' onmouseout='mout(this);' onclick='setSuggest(this)'>"+title+"</div>";
  				 document.getElementById('suggest').innerHTML+=sDiv;
  			}
  		}
  		 displaySuggest();
  		
  	    }else
  	    {
  	    
  	     hiddenSuggest();//设置智能提示列表不可见
  	    }
  	    
  		
  	}
  
  }
  function setSuggest(para){
    document.getElementById('title').value=para.firstChild.nodeValue;
    hiddenSuggest();
    }
     function mover(para){
       para.className="over";
       }
        function mout(para){
       para.className="out";
       }
     
