window.onload=function(){
	function moveImg(list,index) {
        for(var i=0;i<list.length;i++){
            if(list[i].className=='opa-on'){//清除li的透明度样式
                list[i].className='';
            }
        }
        list[index].className='opa-on';
    }
    function moveIndex(list,num){//移动小圆圈
        for(var i=0;i<list.length;i++){
            if(list[i].className=='on'){//清除li的背景样式
                list[i].className='';
            }
        }
        list[num].className='on';
    }
	var imgList=document.getElementById('img').getElementsByTagName('li');
    var list=document.getElementById('index').getElementsByTagName('li');
    var index=0;
    var timer;

    for(var i=0;i<list.length;i++){//鼠标覆盖上哪个小圆圈，图片就移动到哪个小圆圈，并停止
        list[i].index=i;
        list[i].onmouseover= function () {
			console.log("%d年%d月%d日", 2014, 5, 20);
            var clickIndex=parseInt(this.index);
            index=clickIndex;
            moveImg(imgList,index);
            moveIndex(list,index);
            clearInterval(timer);//定时器停止

        };
        list[i].onmouseout= function () {//移开后继续轮播
            play();
        };

    }

    var nextMove=function(){
        index+=1;
        if(index>=4){
            index=0
        }
        moveImg(imgList,index);
        moveIndex(list,index);
    };
    var play=function(){
        timer=setInterval(function(){
            nextMove();
        },3000);
    };
    play();

}
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