<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${initParam.root}js/jquery-1.11.3.js"></script>
<link rel="stylesheet" type="text/css" href="${initParam.root }css/index-page.css">
<link rel="stylesheet" type="text/css" href="${initParam.root }css/bootstrap.min.css">


<style type="text/css">

#writeForm td{
		padding: 15px;
		margin: 10px;
	}
#writeForm{
	margin: 20px;
	width: 650px; 
	border-bottom:2px solid gray; 
	border-top:2px solid gray; 
	border-radius:3px;

}
	.non-text{
		text-align: center;
		font-size: 14px;
		font-family: 'Nanum Gothic';
	}
	#menuTable{
	text-align: center;
	width: 200px;
	border: 0px;
	float: left;
	margin-top: 20px;
}

	#menuTable td{
		padding: 10px;
		margin: 10px;
	}

</style>
</head>
<script type="text/javascript">
	function check(){
		return "${sessionScope.mdto.nickname}" == "${requestScope.bdto.NICKNAME}";
	}

   function deleteBoard() {
	   if(!check()){
		   alert("작성자만 삭제 할 수 있습니다.");
		   return;
	   }
      if(confirm("해당 글을 삭제 하시겠습니까?")){
         location.href="board.do?command=removeBoard&&boardNo=${requestScope.bdto.BOARD_NO}&&category=${param.category}";
      }
   }//deleteBoard
   
   //board.do?command=updateView로 가도록한다. 이때 수정하고자하는 해당글의 no를 전달
   function updateBoard() {
	   if(!check()){
		   alert("작성자만 수정 할 수 있습니다.");
		   return;
	   }
      if(confirm("해당 글을 정말 수정하시겠습니까?")){
         location.href="board.do?command=modifyView&&boardNo=${requestScope.bdto.BOARD_NO}&&category=${param.category}";
      }
   }//   updateBoard
   
   var xhr;
   var content;
   
   function writeReply() {
	   if("${sessionScope.mdto.nickname}" == ""){
		   alert("로그인 후 이용해주세요.");
		   return;
	   }
	   
	   content = document.replyForm.content;
	   
	   if(content.value == "") return;
	   
	   location.href = "${initParam.root}reply.do?command=writeReply&&boardNo=${requestScope.bdto.BOARD_NO}"+
			   													   "&&category=${requestScope.category}"+
			   													   "&&currentPage=${requestScope.currentPage}"+
			   													   "&&currentGroup=${requestScope.currentGroup}"+
			   													   "&&replyCurrentPage=${requestScope.replyCurrentPage}"+
			   													   "&&replyCurrentGroup=${requestScope.replyCurrentGroup}"+
			   													   "&&content="+content.value;
	}
   
   function deleteReply(replyNo, nickname){
	  location.href="${initParam.root}reply.do?command=deleteReply&&replyNo="+replyNo+
			  													 "&&nickname="+nickname+
			  													 "&&boardNo=${requestScope.bdto.BOARD_NO}"+
			  													 "&&category=${requestScope.category}"+
			  													 "&&currentPage=${requestScope.currentPage}"+
			  													 "&&currentGroup=${requestScope.currentGroup}"+
			  													 "&&replyCurrentPage=${requestScope.replyCurrentPage}"+
			  													 "&&replyCurrentGroup=${requestScope.replyCurrentGroup}";
   }
</script>
<body>
	<c:if test="${sessionScope.mdto == null}">
		<script>
			alert("로그인후 이용 가능합니다.");
			location.href = "${initParam.root}board.do?command=getAllBoard&&category=${param.category}&&currentPage=${param.currentPage}&&currentGroup=${param.currentGroup}";
		</script>
	</c:if>

	<c:import url="../header.jsp" />
	<div class="header-banner">
    <section class="bgi banner5"><h2>Community</h2> </section></div>
   <!-- 테이블 -->
   <div class="notice">
    <div class="col-md-2">
			<table id="menuTable">
				<c:choose>
					<c:when test="${requestScope.category=='notice' }">
						<tr>
							<td><a href="${initParam.root}board.do?command=getAllBoard&&category=notice&&currentPage=1&&currentGroup=1"><b>공지사항</b></a></td>
						</tr>
						<tr>
							<td><a href="${initParam.root }board.do?command=getAllBoard&&category=free&&currentPage=1&&currentGroup=1" >자유게시판</a></td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td><a href="${initParam.root}board.do?command=getAllBoard&&category=notice&&currentPage=1&&currentGroup=1">공지사항</a></td>
						</tr>
						<tr>
							<td><a href="${initParam.root }board.do?command=getAllBoard&&category=free&&currentPage=1&&currentGroup=1" ><b>자유게시판</b></a></td>
						</tr>
					
					</c:otherwise>
				
				</c:choose>
			</table>
		</div>
    </div>
	<div align="center" class="col-md-8" style="margin: 20px;">
		   		<div class="row">
				   <table id="writeForm" class="table">
					   <tr>
					   		<td class="non-text" width="15%">글번호</td>
					   		<td colspan="2">${requestScope.bdto.BOARD_NO}</td>
					   </tr>
					   <tr>
						   	<td class="non-text">닉네임</td>
						   	<td colspan="2">
						   		<input type="text"  class="form-control"  name="nickname" value="${sessionScope.mdto.nickname}" readonly="readonly">
						   	</td>
					   </tr>
					   
					   <tr>
					   		<td class="non-text">제목</td>
					   		<td colspan="2">${requestScope.bdto.TITLE}</td>
					   </tr>
					   <tr>
					   		<td class="non-text">작성일시</td>
					   		<td>${requestScope.bdto.WRITEDATE}</td>
					   		<td align="right">조회수 &nbsp; &nbsp;${requestScope.bdto.HIT}</td>
					   </tr>
					   
					   <tr>
					   		<td class="non-text">내용</td>
					   		<td colspan="2" style="padding: 10px;" ><pre style="background: #ededed; width: 500px; height: 300px;">${requestScope.bdto.CONTENT}</pre></td>
					   	</tr>
						   	<tr align="center">
				              	<td align="center" colspan="2" style="width: 500px;">
				              	<p align="left">[ 덧글 ]</p>
				              		<form name="replyForm" action="reply.do" method="post" >
				              			<input type="hidden" id="commend" value="writeReply">
				              			<input type="text" id="content" class="form-control">
				              		</form>
				              	</td>
				              	<td align="center" style="width: 100px;">
				              	<br>
				              		<input type="button" value="덧글달기" class="btn" onclick="writeReply('${requestScope.bdto.BOARD_NO}')" align="middle">
				              	</td>
			               	</tr>
				             <tr>
				             	<td colspan="3" class="non-text">
				               		<div id="replyView"  >
				               			<table id="replyTable"  class="table" style="text-align: left; background-color:#ededed; border:1px solid lightgray; border-radius: 3px;">
					               			<c:forEach var="e" items="${requestScope.replyList}">
					               					<tr>
					               						<td width="15%">${e.nickname}&nbsp;&nbsp;:</td>
					               						<td width="40%" colspan="3" align="left">${e.content}&nbsp;&nbsp;</td>
					               						<td width="20%">${e.writedate }</td>
					               						<td width="15%">[<a href="#" onclick="deleteReply(${e.replyNo},'${e.nickname}')">&nbsp;삭제&nbsp;</a>]</td>
					               					</tr>
					               			</c:forEach>
				               			</table>
				               		</div>
				               		
				               		<!-- 페이징 -->
				               		<div align="center">
				               			<nav>
				               				<ul class="pagination pagination-sm">
												<c:if test="${requestScope.paging.prevGroup}">
													<li>
														<a href="board.do?command=getBoard&&boardNo=${requestScope.bdto.BOARD_NO}&&category=notice&&currentPage=${param.currentPage}&&currentGroup=${param.currentGroup}&&replyCurrentPage=${requestScope.paging.prevGroupPage}&&replyCurrentGroup=${requestScope.paging.currentGroup-1}">
														<span aria-hidden="true">&laquo;</span></a>
													</li>
												</c:if>
												<c:forEach begin="${requestScope.paging.startPage}" end="${requestScope.paging.endPage}" var="i">
													<c:choose>
														<c:when test="${requestScope.paging.currentPage == i}"><li class="active"><a href="#">${i}</a></li></c:when>
														<c:otherwise>
															<li>
																<a href="board.do?command=getBoard&&boardNo=${requestScope.bdto.BOARD_NO}&&category=notice&&currentPage=${param.currentPage}&&currentGroup=${param.currentGroup}&&replyCurrentPage=${i}&&replyCurrentGroup=${requestScope.paging.currentGroup}">${i}</a>&nbsp;
															</li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:if test="${requestScope.paging.nextGroup}">
													<li>
														<a href="board.do?command=getBoard&&boardNo=${requestScope.bdto.BOARD_NO}&&category=notice&&currentPage=${param.currentPage}&&currentGroup=${param.currentGroup}&&replyCurrentPage=${requestScope.paging.nextGroupPage}&&replyCurrentGroup=${requestScope.paging.currentGroup+1}">
														<span aria-hidden="true">&raquo;</span></a>
													</li>
												</c:if>
											</ul>
										</nav>
				               		</div>
				               	</td>
				               </tr>
		            		</table>
	            		<div class="col-md-3"></div>
            		</div>
            	<div>
            		 <table>
		                <tr>
						   	<td align="right" style="width: 600px;">
								   <a href="${initParam.root}board.do?command=getAllBoard&&category=${param.category}">
								   <input type="button" value="목록" class="btn btn-info" ></a>
				                  	<c:if test="${requestScope.bdto.NICKNAME==sessionScope.mdto.nickname }">
				                  		<input type="button" value="삭제" class="btn btn-info" onclick="deleteBoard()">
				                  		<input type="button" value="수정" class="btn btn-info" onclick="updateBoard()">
				                  	</c:if>
		                  	</td>
		                </tr>
					</table>
				</div>
		<br><br><br>
		</div>
		<div style="height: 50px;"></div>         
   <c:import url="../footer.jsp" />
</body>
</html>

