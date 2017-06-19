$(function() {
	// 1. <p> 태그가 몇개인지 알아본다. 갯수를 alert창으로...
	//alert($('p').length);
	
	//2. 2번째 p 태그의 내용을 alert 창으로 출력
	var firstP=$('p:eq(1)');
	//alert(firstP);
	// <a>태그 클릭하면....
	$('a.more').click(function() {
		if(firstP.is(':hidden')){ //if가 true :: fristP가 안보인다면..
			firstP.slideToggle('slow');
			$(this).html('read less');
		}else{ // false :: firstP가 보인다면..
			firstP.slideToggle('slow');
			$(this).html('read more');
		}
	});//click
	
	var speech = $('div.speech');
	
	//4. speech의 기본 글자 사이즈를 알아보자
	var defaultSize = speech.css('fontSize'); //19.2px
	//alert(defaultSize);
	var num = parseInt(defaultSize, 10); //19
	//alert(num);
	
	
	//5. 각각의 버튼을 클릭할때마다 글자 크기가 점진적으로 커지거나 작아지도록
	  $('#switcher>button').click(function(){
	      switch(this.id){
	      case 'switcher-large':
	         num +=5;
	         break;
	      case 'switcher-small':
	         num -=5;
	         break;
	      default:
	         num = parseInt(defaultSize, 10);
	         break;
	      }
	      speech.animate({fontSize:num+'px'},'slow');
	   })
	
	
});