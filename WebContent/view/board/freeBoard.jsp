<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>

<title>자유 게시판</title>

<link rel="stylesheet" type="text/css"
	href="${initParam.root }css/index-page.css">
	
<script type="text/javascript">
	function isLogin(){
		if("${sessionScope.mdto.nickname}" != ""){
			location.href="${initParam.root}view/board/writeBoard.jsp?category=free&&currentPage=${requestScope.paging.currentPage}&&currentGroup=${requestScope.paging.currentGroup}";
		}else{
			alert("로그인이 필요합니다!");
		}
	}
</script>
<style type="text/css">
.free {
border: 1px; overflow: hidden;
}
.free div{
float: left;

}
#menuTable{
	text-align: center;
	width: 200px;
	border: 0px;
	float: left;
}

#menuTable td{
	padding: 10px;
	margin: 10px;
}

.freeTable{
	text-align: center;
	border: 2px;
	width: 650px;
	border-bottom:2px solid gray; 
	border-top:2px solid gray;  
}

.freeTable th {
	text-align: center;
}
</style>
</head>
<body>
	<c:import url="../header.jsp" />
	<div class="header-banner">
    <section class="bgi banner5"><h2>Community</h2> </section></div>
	<br>
	<div class="free">
	
		<div class="col-md-2">
				<table id="menuTable">
					<tr>
						<td><a href="${initParam.root }board.do?command=getAllBoard&&category=notice&&currentPage=1&&currentGroup=1" >공지사항</a></td>
					</tr>
					<tr>
						<td><b>자유게시판</b></td>
					</tr>
				</table>
		</div>
		
		<div class="col-md-8" >
			<input type="button" value="글쓰기" class="btn btn-info" onclick="isLogin()" style="float: right;">
			<br><br>
			<table cellpadding="2" class="table table-hover freeTable">
				 <thead style="background-color: #e2f3f2">
					<tr>
						<th width="10%">번호</th>
						<th width="40%">제목</th>
						<th width="15%">글쓴이</th>
						<th width="25%">작성날짜</th>
						<th width="10%">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bto" items="${requestScope.allList}">
						<tr>
							<td>${bto.boardNo}</td>
							<td><a href="board.do?command=getBoard&&boardNo=${bto.boardNo}&&category=free&&currentPage=${requestScope.paging.currentPage}&&currentGroup=${requestScope.paging.currentGroup}">${bto.title}</a></td>
							<td>${bto.nickname}</td>
							<td>${bto.writedate}</td>
							<td>${bto.hit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		
			<div align="center">
			<nav>
				<ul class="pagination">
					<c:if test="${requestScope.paging.prevGroup}">
					<li>
						<a href="board.do?command=getAllBoard&&category=free&&currentPage=${requestScope.paging.prevGroupPage}&&currentGroup=${(requestScope.paging.currentGroup)-1}">
						<span aria-hidden="true">&laquo;</span></a>
					</li>
					</c:if>
					<c:forEach begin="${requestScope.paging.startPage}" end="${requestScope.paging.endPage}" var="i">
						<c:choose>
							<c:when test="${requestScope.paging.currentPage == i}"><li class="active"><a href="#">${i}</a></li></c:when>
							<c:otherwise>
								<li><a href="board.do?command=getAllBoard&&category=free&&currentPage=${i}&&currentGroup=${requestScope.paging.currentGroup}">${i}</a></li>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${requestScope.paging.nextGroup}">
						<li>
						<a href="board.do?command=getAllBoard&&category=free&&currentPage=${requestScope.paging.nextGroupPage}&&currentGroup=${(requestScope.paging.currentGroup)+1}">
						<span aria-hidden="true">&raquo;</span></a>
						</li>
					</c:if>
				</ul>
				</nav>
			</div>
		
		</div>
	
	</div><!-- 큰div -->
	<div>
		<c:import url="../footer.jsp" />
	</div>
	
</body>
</html>