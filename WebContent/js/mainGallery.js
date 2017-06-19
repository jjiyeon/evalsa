var oldX;
var posX;
var ulCountX = 0;

var windowW;
var windowH;

var eventTarget;
var count = 1;
var _liClip;
var intervalLeft;
//var intervalRight;
var speed;
var speedControl = 20;

window.onload = function()
{
	//alert('??')
	windowW = document.body.clientWidth;
	windowH = 427;
	
	//alert(document.body.clientWidth)
	eventTarget = document.getElementById("a");
	_liLength =document.getElementById("a").getElementsByTagName('li').length;
	_liClip = document.getElementById("a").getElementsByTagName('li');
	SetWidth();
	speed = windowW/speedControl;
	eventTarget.style.left = -(count*windowW)+"px";
	
	autoSlilde();
}

window.onresize = function()
{
	windowW = document.body.clientWidth;
	windowH = document.body.clientHeight;
	speed = windowW/speedControl;
	SetWidth();
}

function SetWidth()
{
	eventTarget.style.width = (windowW * _liLength)+"px"
	//eventTarget.style.height = "0px"
	eventTarget.style.left = -(count*windowW)+"px";
	for(var i = 0 ; i < _liLength; i++)
	{
		_liClip[i].style.width = windowW+"px";
		_liClip[i].style.height = windowH+"px";
	}
	
}

function init()
{
	eventTarget.style.left = 0;
	speed = windowW/speedControl;
	ulCountX = 0;
	count=0;
	SetWidth();
}

function onMouseDown()
{
	oldX = event.clientX;
}

function onMouseUp()
{
	posX = event.clientX;
	mouseCheck();
}

function mouseCheck()
{
	if(oldX > posX)
	{
		if(count<_liLength-1)		
		{
			count++;
			tweenPlay();
		}else if(count==_liLength-1)
		{
			eventTarget.style.left ="0px"
			count =1;
			tweenPlay();
		}
	}else if(oldX < posX){
		if(count>1)
		{
			count--;
			tweenPlay();
		}else if(count==1)
		{
			count = 0;
			tweenPlay2();
		}
	}
}

function tweenPlay2()
{
	TweenMax.to(eventTarget,0.6,{left: -(count*windowW) , onComplete:initX});
}

function initX()
{
	count = _liLength-1;
	eventTarget.style.left = -(count*windowW)+"px"
}

function tweenPlay()
{
	console.log(count)
	TweenMax.to(eventTarget,0.6,{left: -(count*windowW)});
}

function autoSlilde()
{
	intervalLeft = setInterval("motionLeftFn()", 3000);
}

function motionLeftFn()
{
	if(count<_liLength-1)		
	{
		count++;
		tweenPlay();
	}else if(count==_liLength-1)
	{
		eventTarget.style.left ="0px"
		count =1;
		tweenPlay();
	}
}

function btn1Click()
{
	count = 1;
	tweenPlay();
	clearInterval(intervalLeft);
	intervalLeft = setInterval("motionLeftFn()", 3000);
}

function btn2Click()
{
	count = 2;
	tweenPlay()
	clearInterval(intervalLeft);
	intervalLeft = setInterval("motionLeftFn()", 3000);
}

function btn3Click()
{
	count = 3;
	tweenPlay()
	clearInterval(intervalLeft);
	intervalLeft = setInterval("motionLeftFn()", 3000);
}

function btn4Click()
{
	count = 4;
	tweenPlay()
	clearInterval(intervalLeft);
	intervalLeft = setInterval("motionLeftFn()", 3000);
}