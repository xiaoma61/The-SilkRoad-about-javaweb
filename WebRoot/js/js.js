window.onload=function(){
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
}
