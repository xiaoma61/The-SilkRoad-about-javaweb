    

	var a=0;
	var b=0;
	var i=0;
    var c=0;
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
		  m.style.display="none";
	     }
	
         //滚动事件触发
         window.onscroll = function() {
			 
              if(getScrollTop() + getClientHeight() == getScrollHeight())
				  b=1;
             if(b==1&&a==1) {
                 var oDiv = document.createElement('div'); 
                 var zz = document.createElement('div');
                 var save = document.createElement("a");
                 var collect = document.createElement("a");
                 var share = document.createElement("a");
				 oDiv.id="content-one";
				 zz.id="zz";
				 oDiv.style.marginBottom="70px";
				 oDiv.innerHTML = "<img src='../image/route_cao.jpg' width='480' height='280'>" ;
				 content.appendChild(oDiv);
				 oDiv.appendChild(zz);
				 save.innerHTML = "<img src='../png/save.png' width='30' height='30'>";
				 save.href="../image/route_cao.jpg";
				 save.download="../image/route_cao.jpg";
				 save.addEventListener("click", function() {
					var oPop = window.open("../image/route_cao.jpg","","width=1, height=1, top=5000, left=5000"); 
                    oPop.document.execCommand("SaveAs"); 
                    oPop.close(); 	 });
				 save.style.marginLeft="97px";
				 save.style.cursor="pointer";
				 collect.innerHTML = "<img src='../png/collect.png' width='30' height='30'>" ;
				 collect.addEventListener("click", function() {
					 c++;
					 if(c%2==1)
					collect.innerHTML = "<img src='../png/collected.png' width='30' height='30'>" ;	
				    else
					collect.innerHTML = "<img src='../png/collect.png' width='30' height='30'>" ;	
				 });
				 collect.style.marginLeft="97px";
				 collect.style.cursor="pointer";
				 share.innerHTML = "<img src='../png/share.png' width='30' height='30'>" ;
				 share.addEventListener("click", function() {
					 pop(); 
				 })
				 share.style.marginLeft="97px";
				 share.style.cursor="pointer";
				 zz.appendChild(save);
				 zz.appendChild(collect);
				 zz.appendChild(share);

                            }
			 
         }

function SaveAs5(imgURL) 
{ 
var oPop = window.open(imgURL,"","width=1, height=1, top=5000, left=5000"); 
oPop.document.execCommand("SaveAs"); 
oPop.close(); 
} 

function change(id)
{
	i++;
	if(i%2==1)
 id.innerHTML = "<img src='../png/collected.png' width='30' height='30'>" ;	
	else
 id.innerHTML = "<img src='../png/collect.png' width='30' height='30'>" ;	
}
	function pop(){
        document.getElementById("p").style.display="block";
	}
    function cancel(){
       document.getElementById("p").style.display="none";
       window.location.reload();
	}		 