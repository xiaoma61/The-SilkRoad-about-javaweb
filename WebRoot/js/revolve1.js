// JavaScript Document
// JavaScript Document
(function(){  
    var element = document.getElementById("rotate1");  
    var r = 0;  
    var i = 1;  
    function rotate1(){  
        r += i;  
        if( Math.abs(r) >= 5000) i*=-1  
        element.style.MozTransform = "rotate(" + r + "deg)";  
        element.style.webkitTransform ="rotate(" + r + "deg)";  
        element.style.msTransform = "rotate(" + r + "deg)";  
        element.style.OTransform = "rotate(" + r + "deg)";  
        element.style.transform = "rotate(" + r + "deg)";  
    }  
      
    var timer = setInterval(rotate1,50);  
      
    element.onmouseover = function(){  
        clearInterval(timer);  
        timer = null;  
    };  
      
    element.onmouseout = function(){  
        if(timer)return;  
        timer = setInterval(rotate1,30);  
    };  
    }());  