	var s1=document.getElementById("main-top-section1");
	var s2=document.getElementById("main-top-section2");
	var s3=document.getElementById("main-top-section3");
	var b1=document.getElementById("main-bottom1");
	var b2=document.getElementById("main-bottom2");
	var b3=document.getElementById("main-bottom3");
	s1.onmouseover=function(){
		b1.style.display="block";
		b2.style.display="none";
		b3.style.display="none";
		};
	s2.onmouseover=function(){
		b2.style.display="block";
		b1.style.display="none";
		b3.style.display="none";
		};
	s3.onmouseover=function(){
		b3.style.display="block";
		b1.style.display="none";
		b2.style.display="none";
		};