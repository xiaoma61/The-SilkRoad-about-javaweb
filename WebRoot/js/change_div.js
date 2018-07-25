	s1.onmouseover=function(){
		b1.style.display="block";
		b2.style.display="none";
		b3.style.display="none";
		b4.style.display="none";
		};
	s2.onmouseover=function(){
		b2.style.display="block";
		b1.style.display="none";
		b3.style.display="none";
		b4.style.display="none";
		};
	s3.onmouseover=function(){
		b3.style.display="block";
		b2.style.display="none";
		b1.style.display="none";
		b4.style.display="none";
		};
    s4.onmouseover=function(){
		b4.style.display="block";
		b2.style.display="none";
		b1.style.display="none";
		b3.style.display="none";
		};
function show(d){d.style.display="block";}
function disappear(d){d.style.display="none";}
  $('#s1').hover(function(){
    $(s1).addClass('s');  
	  $(s2).removeClass('s'); 
	  $(s3).removeClass('s');
	  $(s4).removeClass('s');
   })
  $('#s2').hover(function(){
    $(s2).addClass('s');  
	  $(s1).removeClass('s'); 
	  $(s3).removeClass('s'); 
	  $(s4).removeClass('s');
   })
  $('#s3').hover(function(){
    $(s3).addClass('s');  
	  $(s2).removeClass('s'); 
	  $(s1).removeClass('s');
	  $(s4).removeClass('s');
   })
   $('#s4').hover(function(){
    $(s4).addClass('s');  
	  $(s2).removeClass('s'); 
	  $(s1).removeClass('s');
	  $(s3).removeClass('s');
   })

$(window).load(function() {
	var options =
	{
		thumbBox: '.thumbBox',
		spinner: '.spinner',
		imgSrc: 'images/avatar.png'
	}
	var cropper = $('.imageBox').cropbox(options);
	$('#upload-file1').on('change', function(){
		var reader = new FileReader();
		reader.onload = function(e) {
			options.imgSrc = e.target.result;
			cropper = $(i1).cropbox(options);
		}
		reader.readAsDataURL(this.files[0]);
		this.files = [];
	})
	$('#btnCrop1').on('click', function(){
		var img = cropper.getDataURL();
		$(c1).html('');
		$(c1).append('<p>预览效果</p><img src="'+img+'" align="absmiddle" style="width:180px;margin-top:4px;border-radius:180px;box-shadow:0px 0px 12px #7E7E7E;">');
		$(c1).append('<p>实际效果</p><img src="'+img+'" align="absmiddle" style="width:104px;margin-top:4px;border-radius:96px;box-shadow:0px 0px 12px #7E7E7E;">');

	})
	$('#btnZoomIn1').on('click', function(){
		cropper.zoomIn();
	})
	$('#btnZoomOut1').on('click', function(){
		cropper.zoomOut();
	})
	$('#save1').on('click', function(){
     var dataURL =cropper.getDataURL();
	 var imageDataB64 = dataURL.substring(22);
	 var newData= imageDataB64.replace(/\+/g, "%2B");
	 send( newData);
    
	})

	//ajax传递数据
	var xmlhttp;
	function send(imageDataB64)
	{
		 if (window.XMLHttpRequest)  
		    {  
			
		        xmlhttp = new XMLHttpRequest();  
		    }  
		    // IE5 IE6 老版本浏览器  
		    else if (window.ActiveXObject)  
		    {  
		        xmlhttp = new ActiveXObject("Mricosoft.XMLHTTP");  
		    }  
		    if  (xmlhttp != null)  
		    {  //servelet位置
		        var url = "/TheSlikRoad/ImageSend";  
		        // 这里拼接下要传送的data 格式如下  
		        var data = imageDataB64;  
 
		        xmlhttp.onreadystatechange = state_Change;  
	 
		        xmlhttp.open("POST", url, true);  
		        // POST需要设置这个 GET不用  
		        xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");  
		       
		        xmlhttp.send("data="+data);  
		      
		    }
	}
	function state_Change()
	{
		if(xmlhttp.readyState==4&&xmlhttp.status==200)
		{
				var check=xmlhttp.responseText; 
				change(check);
			  
		}
	
	}
	function change(check)
	{
		document.getElementById("userImage").src="../"+check;
		document.getElementById("p1").style.display="none";
	}
	
	$('#upload-file2').on('change', function(){
		var reader = new FileReader();
		reader.onload = function(e) {
			options.imgSrc = e.target.result;
			 cropper = $(i2).cropbox(options);
		}
		reader.readAsDataURL(this.files[0]);
		this.files = [];
	})
	$('#btnCrop2').on('click', function(){
		var img = cropper.getDataURL();
		$(c2).html('');
		$(c2).append('<img src="'+img+'" align="absmiddle" style="width:1040px;height:299px;margin-top:4px;box-shadow:0px 0px 12px #7E7E7E;">');
	})
	$('#btnZoomIn2').on('click', function(){
		cropper.zoomIn();
	})
	$('#btnZoomOut2').on('click', function(){
		cropper.zoomOut();
	})
	$('#save2').on('click', function(){
		 var dataURL =cropper.getDataURL();
		 var imageDataB64 = dataURL.substring(22);
		 var newData= imageDataB64.replace(/\+/g, "%2B");
		 send1( newData);
	})
});
  
  
  var xmlhttp;
	function send1(imageDataB64)
	{
		 if (window.XMLHttpRequest)  
		    {  
			
		        xmlhttp = new XMLHttpRequest();  
		    }  
		    // IE5 IE6 老版本浏览器  
		    else if (window.ActiveXObject)  
		    {  
		        xmlhttp = new ActiveXObject("Mricosoft.XMLHTTP");  
		    }  
		    if  (xmlhttp != null)  
		    {  //servelet位置
		        var url = "/TheSlikRoad/BgImagesend";  
		        // 这里拼接下要传送的data 格式如下  
		        var data = imageDataB64;  

		        xmlhttp.onreadystatechange = state_Change1;  
	 
		        xmlhttp.open("POST", url, true);  
		        // POST需要设置这个 GET不用  
		        xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");  
		       
		        xmlhttp.send("data="+data);  
		      
		    }
	}
	function state_Change1()
	{
		if(xmlhttp.readyState==4&&xmlhttp.status==200)
		{
				var check=xmlhttp.responseText; 
				change1(check);
			  
		}
	
	}
	function change1(check)
	{
		document.getElementById("bgImage").src="../"+check;
		document.getElementById("p2").style.display="none";
	}
  
  
  
	function pop1(){
        document.getElementById("p1").style.display="block";
	}
    function cancel1(){
       document.getElementById("p1").style.display="none";
       window.location.reload();
	}
function pop2(){
        document.getElementById("p2").style.display="block";
	}
    function cancel2(){
       document.getElementById("p2").style.display="none";
       window.location.reload();
	}

function disappeare(id){ 
    id.style.display="none"; 
}