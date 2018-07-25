	var s1=document.getElementById("main-top-section1");
	var s2=document.getElementById("main-top-section2");
	var b1=document.getElementById("main-bottom1");
	var b2=document.getElementById("main-bottom2");
	s1.onmouseover=function(){
		b1.style.display="block";
		b2.style.display="none";
		};
	s2.onmouseover=function(){
		b2.style.display="block";
		b1.style.display="none";
		};
   function pop(){
        document.getElementById("_pop").style.display="block";
	}
    function cancel(){
       document.getElementById("_pop").style.display="none";
	}