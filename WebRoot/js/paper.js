       var oBtn1 = document.getElementById('btn1');
	   var oBtn2 = document.getElementById('btn2');
        var oDiv1 = document.getElementById('paper1');
        var oDiv2 = document.getElementById('paper2');
        oBtn1.onclick = function(){
                oDiv2.style.display = 'none';
                oDiv1.style.display = 'block';
		};
         oBtn2.onclick = function(){
                oDiv1.style.display = 'none';
                oDiv2.style.display = 'block';
        };