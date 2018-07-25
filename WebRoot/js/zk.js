var i=0;
function $(element){
return element = document.getElementById(element);
}
function $D(id1,id2){
var h=id1.offsetHeight;
var maxh=300;
function dmove(){
h+=5; //设置层展开的速度
if(h>=maxh){
id1.style.height='600px';
clearInterval(iIntervalId);
}else{
id1.style.display='block';
id1.style.height=h+'px';
id2.style.height=600+h+'px';
}
}
iIntervalId=setInterval(dmove,2);
}
function $D2(id1,id2){
var h=id1.offsetHeight;
var maxh=300;
function dmove(){
h-=5;//设置层收缩的速度
if(h<=0){
id1.style.display='none';
clearInterval(iIntervalId);
}else{
id1.style.height=h+'px';
id2.style.height=600+h+'px';
}
}
iIntervalId=setInterval(dmove,2);
}
function $use(id1,id2,id3){
if(id1.style.display=='block'){
$D2(id1,id2);
}
else{
$D(id1,id2);
//$last(id3,id1,id2);
}
}
  function changeIB(obj){
	  i++;
	  if(i%2==1)
      obj.value="已关注";
	  else
	  obj.value="关注";
  }
function opt(id1,id2){//增加点击事件
id1.innerHTML="回复 "+id2.innerText+":";
}