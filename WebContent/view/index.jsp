<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이발사(이탈리아를 발로 여행하는 사람들)</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!--fonts-->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,800italic,800,700italic,700,600,600italic'
	rel='stylesheet' type='text/css'>
<!--/fonts-->

<!-- css -->
<link href="${initParam.root }css/index-page.css" rel="stylesheet" type="text/css" >
<link href="${initParam.root }css/login-register.css" rel="stylesheet" type="text/css">


<!-- js -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/1.16.1/TweenMax.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="${initParam.root }js/move-top.js"></script>
<script type="text/javascript" src="${initParam.root }js/easing.js"></script>
<script src="${initParam.root }js/login-register.js" type="text/javascript"></script>

<!--날씨 관련-->
<script src="${initParam.root}js/jquery-1.11.3.js"></script>
<script src="${initParam.root }js/jquery.zweatherfeed.js" type="text/javascript"></script>
<link href="${initParam.root }css/example.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="http://mylko72.maru.net/jquerylab/inc/css/common.css" />


<!-- 날씨배너 -->
<style type="text/css">
.weather-wrap {
	position: relative;
	margin: 0 auto;
	overflow: hidden;
}

.weather-wrap ul.weather {
	position: absolute;
}

ul.bt-roll {
	width: 110px;
	margin: 0 auto;
	margin-top: 20px;
}

ul.bt-roll li {
	float: left;
	margin-right: 5px;
}

#noticeForm{
	width: 100%;
}

#noticeForm tr, th{
	padding: 10px;
	margin: 10px;
	text-align: center;
}

#noticeForm tbody>tr>td{
	padding: 10px;
}

#recentschedule li{
	font-family: 'Nanum Gothic';
}
</style>

<script type="text/javascript">
	var idConfirm = false;
	var nickConfirm = false;
	
	$(function() {
		var timer = null;
		var auto = true;

		var weather = [ 'ITXX0102', 'ITXX0103', 'ITXX0003', 'ITXX0006',
				'ITXX0010', 'ITXX0112', 'ITXX0116', 'ITXX0028', 'ITXX0031',
				'ITXX0042', 'ITXX0052', 'ITXX0055', 'ITXX0136', 'ITXX0139',
				'ITXX0067', 'ITXX0081', 'ITXX0078', 'ITXX0080', 'ITXX0085' ];
		var cnt = 1; //하나씩 증가시킬거니까
		var beforeCnt = 0;

		// append 하는 부분
		//alert(weather[cnt])
		for (var i = 0; i < weather.length; i++) {
			$("<li id='weatherArr"+i+"' style='margin: 0px 0px 0px 0px;'><div>" + i + "</div></li>").appendTo(".weatherUl").hide();
			$('#weatherArr' + i).weatherfeed([ weather[i] ]);
		}//for

		$("#weatherArr" + 0).show();
		setInterval(locaitionWeaTherFeed, 4000); //2초간격으로 넘어간다

		function locaitionWeaTherFeed() {
			if (cnt == weather.length)
				cnt = 0;

			$("#weatherArr" + beforeCnt).hide();
			$("#weatherArr" + cnt).show();

			beforeCnt = cnt;
			cnt++;
		}//locationWeaTherFeed()
		
		
		
		$("#nickname").keyup(function(){
			var nick = $("#nickname").val();
			$.ajax({
				type: "post",
				url: "${initParam.root}member.do",
				data: "command=nicknameCheck&nickname="+nick,
				
				success: function(data){
					if(data == "true" && data != ""){
						$("#nickname_confirm").html("<font color='blue'>사용 가능한 닉네임입니다.</font>");
						nickConfirm = true;
					}else{
						$("#nickname_confirm").html("<font color='red'>사용 불가능한 닉네임입니다.</font>");
						nickConfirm = false;
					}//else
				}//callback
			});//ajax
		});//nickname.keyup
		
		$("#registerEmail").keyup(function(){
			var id = $("#registerEmail").val();
			$.ajax({
				type: "post",
				url: "${initParam.root}member.do",
				data: "command=idcheck&id="+id,
				success: function(data){
					if(data == "true" && data != ""){
						$("#id_confirm").html("<font color='blue'>사용 가능한 아이디입니다.</font>");
						idConfirm = true;
					}else{
						$("#id_confirm").html("<font color='red'>사용 불가능한 아이디입니다.</font>");
						idConfirm = false;
					}//else
				}//callback
			});//ajax
		});//registerEmail.keyup
		
		$("#certificationBtn").click(function(){
			
			if(idConfirm == false){
				alert("아이디를 검사하세요.");
				return;
			}
			
			var id = $("#registerEmail").val();
			//alert(id);
			$.ajax({
				type: "post",
				url: "${initParam.root}member.do",
				data: "command=certificationId&id="+id,
				success: function(data){
					if(data == "success"){
						alert("성공적으로 이메일을 보냈습니다. 이메일에서 코드를 확인하세요.");
					}else{
						alert("이메일 인증에 실패했습니다.");
					}//else
				}//callback
			});//ajax
		});//certificationBtn.click
		
		$(".close").click(function(){
			$("#certificationText").hide();
			$("#certificationBtn").show();
		})//close.click
		
		$('#moveMypage').click(function() {
			location.href="${initParam.root}schedule.do?command=getAllSchedule";
		});//moveMypage.click
		
		/* login Modal */
		$("#evalsa").click(function(){
			location.href="${initParam.root}view/index.jsp";
		});//evalsa.click
		
		$("#login").click(function(){
			setTimeout(function(){
				$("#loginEmail").focus();
			}, 750);
		});//login.click
		
		$("#register").click(function(){
			setTimeout(function(){
				$("#registerEmail").focus();
			}, 750);
		});//register.click
		
		$('#logout').click(function() {
			location.href = "${initParam.root}member.do?command=logoutMember";
			alert("로그아웃되셨습니다");
		});//logout.click
	});//jQuery
	
	function registerSubmit(){
		var email = $("#registerEmail").val();
		var nickname = $("#nickname").val();
		var password = $("#password_signup").val();
		var rpassword = $("#password_confirmation").val();
		
		if(email == ""){
			alert("이메일을 입력하세요.");
			return false;
		}
		if(idConfirm == false){
			alert("아이디를 검사하세요.");
			return false;
		}
		if(nickname == ""){
			alert("닉네임을 입력하세요.");
			return false;
		}
		if(nickConfirm == false){
			alert("닉네임 중복을 확인하세요.");
			return false;
		}
		if(password != rpassword){
			alert(password);
			alert(rpassword);
			alert("비밀번호가 같지 않습니다.");
			return false;
		}
		
		$("#registerMember").submit();
	}
</script>


<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 900);
		});
	});
</script>
<!--/script-->
</head>
<body>
	<c:import url="header.jsp" />
	<div class="header-banner">
			<!-- Top Navigation -->
			<div class="container page-seperator">
				<section class="color bgi">
					<div class="container">
						<div class="banneer-text">
		                <h3>To him who is determined it remains only to act.</h3>
                        <h4>결심한 자에게는 실행만이 남아 있다.</h4>
		
		                  <c:choose>
		                     <c:when test="${sessionScope.mdto==null}">
		                        <button type="button" class="btn btn-warning but1" id="login"
		                     data-toggle="modal" onclick="openLoginModal();" data-complete-text="Make Schedule">Login</button>
		                     </c:when>
		                     <c:otherwise>
		                        <button type="button" class="btn btn-warning but1" id="makeSchedule" 
		                        onclick="javascript:location.href='${initParam.root}view/schedule/make_schedule.jsp'">Make Schedule</button>
		                     </c:otherwise>
		                  </c:choose>
		                  
		                  <p>유럽남부에 위치한 지중해의 푸른 물결과 아름다운 알프스의 영봉들을 품고있는 이탈리아. 찬란한 로마제국의
		                     유적을 간직한 이탈리아를 지금, 만나러 갑니다.</p>
              		</div>
					<!-- login modal -->
					      <div class="modal fade login" id="loginModal">
					         <div class="modal-dialog login animated">
					            <div class="modal-content">
					               <div class="modal-header">
					                  <button type="button" class="close" data-dismiss="modal"
					                     aria-hidden="true">&times;</button>
					                  <h4 class="modal-title">Login</h4>
					               </div>
					               <div class="modal-body">
					                  <div class="box">
					                     <div class="content">
					                        <div class="error"></div>
					                        <div class="form loginBox">
					                           <form method="post" action="${initParam.root }member.do"
					                              accept-charset="UTF-8">
					                              <input id="loginEmail" class="form-control" type="text"
					                                 placeholder="Email" name="id"> <input id="password"
					                                 class="form-control" type="password" placeholder="Password"
					                                 name="password"> <input
					                                 class="btn btn-default btn-login" type="submit"
					                                 value="loginMember" name="command">
					                           </form>
					                        </div>
					                     </div>
					                  </div>
					               </div>
					               <div class="modal-footer">
					                  <div class="forgot login-footer">
					                     <span>이메일로 <a href="javascript: showRegisterForm();">회원가입하기</a>
					                     </span>
					                  </div>
					               </div>
					            </div>
					         </div>
					      </div>
					   <!-- login 모달 -->
					   <!-- register / 내 정보 / API 정보 출력 창 -->
						
						<c:choose>
							<c:when test="${sessionScope.mdto==null }">
							<div class="banner-forms">
								<form id="registerMember" method="post"  html="{:multipart=>true}" data-remote="true" 
								action="${initParam.root }member.do" onsubmit="registerSubmit()" accept-charset="UTF-8">
									<input type="hidden" name="command" value="registerMember">
									<!-- email -->
									<input class="email" type="text" name="id" id="registerEmail"  placeholder="E-mail">
									<span id="id_confirm"></span>
									<input id="certificationBtn" type="button" value="이메일 인증" class="btn btn-info mrgn-can"><br><br>
									<input id="certificationText" class="code" type="text"  placeholder="Email Confirm Code"  
									name="certificationText"><br>
									<!-- nickname -->
									<input type="text" name="nickname" class="nickname"  id="nickname"
										placeholder="Your Nickname"><br>
		                            <div id="nickname_confirm"></div>
		                            <input id="password_signup" class="password" type="password" placeholder="Password"  name="password"><br>
		                            <input id="password_confirmation" class="password" type="password" placeholder="RePassword"   name="password_confirmation"><br>
									<button type="submit" class="btn btn-info" name="command">Submit</button>
								</form>
								</div>
							</c:when>
							<c:otherwise>
							<div class="banner-forms">
								<div align="center">
								<c:choose>
									<c:when test="${sessionScope.mdto.nickname=='administrator' }">
										${sessionScope.mdto.nickname } 님, 환영합니다! <br>
									</c:when>
									<c:otherwise>
										${sessionScope.mdto.nickname } 님, 환영합니다! <br>
										<a data-target="#layerpop" data-toggle="modal" >내 정보 수정</a>
										&nbsp;&nbsp;/&nbsp;&nbsp;
										<a href="${initParam.root }schedule.do?command=getAllSchedule">내 일정 관리</a>
									</c:otherwise>
								</c:choose>
										<p></p> 
										<input type="button" class="btn btn-info" value="Logout" id="logout">
								</div>
							</div>
								<br>
								<!-- update Form -->
								<div class="modal fade" id="layerpop">
									<div class="modal-dialog">
										<div class="modal-content">
											<!-- header -->
											<div class="modal-header">
												<!-- 닫기(x) 버튼 -->
												<button type="button" class="close" data-dismiss="modal">×</button>
												<!-- header title -->
												<h4 class="modal-title">회원 정보 수정</h4>
											</div>
											<div class="modal-body">
											<form class="form-horizontal" name="update"
												action="${initParam.root }member.do"
												onsubmit="return checkForm()">
												<input type="hidden" name="command" value="updateMember">
					
												<br><br>					
												<div class="form-group">
													<label for="Password" class="col-lg-4 control-label">패스워드</label>
													<div class="col-lg-4">
														<input type="password" class="form-control"
															placeholder="password" name="password">
													</div>
												</div>
					
												<div class="form-group">
													<label for="REPassword" class="col-lg-4 control-label">패스워드확인</label>
													<div class="col-lg-4">
														<input type="password" class="form-control"
															placeholder="repassword" name="repassword">
													</div>
												</div>
					
												<div class="form-group">
													<div class="col-lg-10 col-lg-offset-4">
														<button type="submit" class="btn btn-primary"
															onclick="checkDecision()">확인</button>
														<button type="reset" class="btn btn-default" class="close" data-dismiss="modal">취소</button>
													</div>
												</div>
											</form>
											</div>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
						</div>
						<div class="clearfix"></div>
				</section>
				<section class="col-3 ss-style-doublediagonal our-features">
					<div class="container">
						<h2>Evalsa</h2>
						<p>이탈리아를 발로 여행하는 사람들이 모이는 곳</p>
						<div class="col-md-4 column our-feat">
							<h3>나만의 이탈리아를 계획할 수 있는 일정스케쥴러-</h3>
							<p>이탈리아의 어디를 가든지 당신이 계획한 스케쥴로, 이발사에서 제공하는 정보들로 이탈리아 구석구석을
								담아보세요.</p>
						</div>
						<div class="col-md-4 column our-feat">
							<h3>이탈리아를 만난 사람들의 일정공유-</h3>
							<p>수 많은 사람들이 다녀간 문화 유적지, 저렴한 쇼핑공간, 안락한 호텔, 특별한 맛집까지- 일정을 공유하고
								나눠보세요.</p>
						</div>
						<div class="col-md-4 column our-feat">
							<h3>한 장소, 다른느낌으로 만나보는 이탈리아-</h3>
							<p>개개인이 만난 이탈리아들을 소통하며, 나누는 즐거운 공간. 궁금한점과 유용한 팁들까지, 많은 정보들을
								만나보세요.</p>
						</div>
					</div>
					<div class="clearfix"></div>
				</section>
			</div>
		</div>
		<div class="index-abt">
			<h3 align="center">최근에 이탈리아를 만난 사람들</h3><br><br>
			<div class="container" id="recentschedule">
			
			<!-- 최신 일정 4개 가지고 와서 띄우는 부분-->
			<!-- 최근에 올라온 10개의 일정만 슬라이드형식으로 뿌려지는 부분. -->
				<!-- 1.div,ul영역에서
				ajax 통신을 통해 최근 게시물을 가져와서 append한다. append한 li를 remove하고 슬라이드 효과를 준다
				한시간에 한번씩2번으로 가는것. -->
			</div>
		</div>
	
	<br>
	<div class="index-p">
		<div class="container">
			<div class="col-md-4">
				<div align="center"><font style="font-size: large; font-weight: normal;">공지사항</font></div>
				<table id="noticeForm">
					<thead>
						<tr style="border-bottom : 2px solid black;">
							<th width="20%">No</th>
							<th width="60%">Title</th>
							<th width="20%">Hit</th>
						</tr>
					</thead>
					<tbody id="noticeTbody">
					</tbody>
				</table>
			</div>
		
			<div class="col-md-4" align="center">
				<div id="weather" class="weather-wrap"  >
					<ul class="weatherUl clfix">
					</ul>
				</div>
				<!-- 환율 정보 -->
	           <div style="background-color: #71c6c1;">
		           	<font style="font-size: x-large; font-weight: normal; font-family: sans-serif;">실시간 환율 (EUR)</font><br>
		           	<span id="exchange" style="font-size: large;"></span>
	           </div>
			</div>
				<div class="col-md-4">
				<div align="center"><font style="font-size: large; font-weight: normal;">자유 게시판</font></div>
				<table id="noticeForm">
					<thead>
						<tr style="border-bottom : 2px solid black;">
							<th width="20%">No</th>
							<th width="60%">Title</th>
							<th width="20%">Hit</th>
						</tr>
					</thead>
					<tbody id="freeTbody">
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<br>
	<div id="italyInformation" align="center" class="col-md-12">
		<h3 align="center">먼저 살펴보는 이탈리아</h3>
		<div class="clearfix"></div>
	<div class="index-works">
		<div class="container">
				<div class="col">
					<div class="col2">
						<div class="col-md-4 col1">
							<figure class="effect-bubba">
								<a href="${initParam.root }touristsite.do?command=getTouristSiteByCity&&city=나폴리">
								<img class="img-responsive" src="${initParam.root }image/Napoli/napoli.jpg" alt="" />
								<figcaption>
									<h4>Napoli</h4>
									<p>나폴리</p>
								</figcaption>
								</a>
							</figure>
							<div class="clearfix"></div>
						</div>
						<div class="col-md-4 col1">
							<figure class="effect-bubba">
								<a href="${initParam.root }touristsite.do?command=getTouristSiteByCity&&city=로마">
								<img class="img-responsive" src="${initParam.root }image/Roma/roma.jpg"  alt="" />
								<figcaption>
									<h4>Roma</h4>
									<p>로마</p>
								</figcaption>
								</a>
							</figure>
							<div class="clearfix"></div>
						</div>
						<div class="col-md-4 col1">
							<figure class="effect-bubba">
								<a href="${initParam.root }touristsite.do?command=getTouristSiteByCity&&city=팔레르모">
								<img class="img-responsive" src="${initParam.root }image/Palermo/palermo.jpg" alt="" />
								<figcaption>
									<h4>Palermo</h4>
									<p>팔레르모</p>
								</figcaption>
								</a>
							</figure>
							<div class="clearfix"></div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				<br><br>
				<div class="col">
					<div class="col2">
						<div class="col-md-4 col1">
							<figure class="effect-bubba">
								<a href="${initParam.root }touristsite.do?command=getTouristSiteByCity&&city=피사">
								<img class="img-responsive" src="${initParam.root }image/Pisa/pisa.jpg" alt="" />
								<figcaption>
									<h4>Pisa</h4>
									<p>피사</p>
								</figcaption>
								</a>
							</figure>
							<div class="clearfix"></div>
						</div>
						<div class="col-md-4 col1">
							<a href="${initParam.root}touristsite.do?command=getTouristSiteByCity&&city=로마">
								<img class="img-responsive" src="${initParam.root }image/background/가운데 버튼.png"  alt="" style="width: 350px; height: 200px" />
								
								</a>
							<div class="clearfix"></div>
						</div>
						<div class="col-md-4 col1">
							<figure class="effect-bubba">
								<a href="${initParam.root }touristsite.do?command=getTouristSiteByCity&&city=밀라노">
								<img class="img-responsive" src="${initParam.root }image/Milano/milano.jpg"  alt="" />
								<figcaption>
									<h4>Milano</h4>
									<p>밀라노</p>
								</figcaption>
								</a>
							</figure>
							<div class="clearfix"></div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="col next-col">
					<div class="col2">
						<div class="col-md-4 col1">
							<figure class="effect-bubba">
								<a href="${initParam.root }touristsite.do?command=getTouristSiteByCity&&city=피렌체">
								<img class="img-responsive" src="${initParam.root }image/Florence/florence.jpg"  alt="" />
								<figcaption>
									<h4>Florence</h4>
									<p>피렌체</p>
								</figcaption>
								</a>
							</figure>
							<div class="clearfix"></div>
						</div>
						<div class="col-md-4 col1">
							<figure class="effect-bubba">
								<a href="${initParam.root }touristsite.do?command=getTouristSiteByCity&&city=베네치아">
								<img class="img-responsive" src="${initParam.root }image/Venezia/venice.jpg"  alt="" />
								<figcaption>
									<h4>Venice</h4>
									<p>베네치아</p>
								</figcaption>
								</a>
							</figure>
							<div class="clearfix"></div>
						</div>
						<div class="col-md-4 col1">
							<figure class="effect-bubba">
								<a href="${initParam.root }touristsite.do?command=getTouristSiteByCity&&city=토리노">
								<img class="img-responsive" src="${initParam.root }image/Torino/torino.jpg" alt="" />
								<figcaption>
									<h4>Torino</h4>
									<p>토리노</p>
								</figcaption>
								</a>
							</figure>
							<div class="clearfix"></div>
						</div>
						</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
		
	</div>
	
	<br><br><br>
	
	<div>
		<c:import url="footer.jsp" />
	</div>
	
	<script type="text/javascript">
		$(function(){
			getExchange();
			getRecentScheduleList();
			
			getRecentBoardList("notice");
			getRecentBoardList("free");
			
			setInterval(getExchange, 1000*60*30); 
			setInterval(getRecentScheduleList, 1000*60*60);
		});
		
		 function getExchange(){
		      $.ajax({
		    	 type: "get",
		    	 url: "http://query.yahooapis.com/v1/public/yql?q=select * from yahoo.finance.xchange where pair in ('EURKRW')&env=store://datatables.org/alltableswithkeys",
		    	 dataType: "xml",
		    	 success: function(data){
		    		 var won = $(data).find("Rate").text()*1;
		    		 $("#exchange").html(won.toFixed(2)+" KRW");
		    	 }
		      });
		}
		
		function getRecentScheduleList(){
			var recentsch = [ ];
			$.ajax({
				type:"get",
				url:"${initParam.root}schedule.do?command=getRecentSchedule",
				dataType:"json",
				success: function(data){
					$('#recentschedule').children().remove();
					var contextPath="${initParam.root}";
					var textHtml="";
					$(data.recentList).each(function(index,schedule){
						recentsch.push({
							"scheduleNo": schedule.SCHEDULE_NO,
							"title": schedule.TITLE,
							"nickname":schedule.NICKNAME,
							"theme":schedule.THEME,
							"mainImage":schedule.MAINIMAGE
						});
						textHtml += "<a href='${initParam.root}register.do?command=detailSchedule&no="+recentsch[index].scheduleNo+"'><div class='col-md-3 index-abt1'><div class='abt-img'><img src='"+recentsch[index].mainImage+"'  class='img-rounded'></div>"+
						"<h4>"+recentsch[index].title+"</h4><h5>"+ recentsch[index].theme+"</h5><p>"
						+recentsch[index].nickname+"</p></div></a>";
					});
					
					
					$('#recentschedule').append(textHtml);
					
				}
			});
		}
		
		function getRecentBoardList(category){
			$.ajax({
				type: "get",
				url: "${initParam.root}board.do?command=getRecentBoard&&category="+category,
				success: function(data){
					$(data.recentList).each(function(index, board){
						var textHtml = "<tr>" +
											"<td width='20%' align='left'>"+board.boardNo+"</td>" +
											"<td width='60%' align='left'><a href='${initParam.root}board.do?command=getBoard&&boardNo="+board.boardNo+"&&category="+category+"&&currentPage=1&&currentGroup=1'>"+board.title+"</a></td>" +
											"<td width='20%' align='left'>"+board.hit+"</td>" +
										"</tr>";
						$("#"+category+"Tbody").append(textHtml);
					});
				}
			});
		}
	</script>
</body>
</html>