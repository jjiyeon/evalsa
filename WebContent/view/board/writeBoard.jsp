<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<!-- script.js 파일을 불러오는 자바스크립트 태그 -->
<script language="javascript" src="js/script.js"></script>
<!-- css파일을 불러오는 태그 -->
<link href="css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="${initParam.root }css/index-page.css">
<script type="text/javascript">
	function goBoardList() {
		   if(confirm("정말로 이동하시겠습니까?"))
			   location.href="${initParam.root}board.do?command=getAllBoard&&category=${param.category}";
	}

	function checkForm(){
		var title = document.getElementById("title").value;
		var contents = document.getElementById("contents").value;
		
		if(title == ""){
			alert("제목을 입력하세요.");
			return false;
		}else if(contents == ""){
			alert("내용을 입력하세요.");
			return false;
		}
		
		return true;
	}
</script>
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
<title>게시물 작성</title>
</head>
<body>
	<c:import url="../header.jsp" />
	<div class="header-banner">
    <section class="bgi banner5"><h2>Community</h2> </section></div>
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
    <div align="center" class="col-md-8">
	<form action="${initParam.root }board.do" method="post" name="write" onsubmit="return checkForm();">
	<input type="hidden" name="command" value="writeBoard">
	<input type="hidden" name="category" value="${param.category}">
	   <table  id="writeForm" class="table">
		   <tr>
			   	<td class="non-text">닉네임</td>
			   	<td>
			   		<input type="text"  class="form-control"  name="nickname" value="${sessionScope.mdto.nickname}" readonly="readonly">
			   	</td>
		   </tr>
		   <tr><td class="non-text">제목</td><td><input id="title" type="text" class="form-control" name="title"></td></tr>
		   <tr><td class="non-text">내용</td><td><textarea id="contents" name="content"  class="form-control" rows="13" cols="40"></textarea></td></tr>
		   
		   <tr>
		   	<td colspan="2" align="right">
		   <input type="submit" value="글쓰기" class="btn btn-info" alt="Submit" >
		  &nbsp;&nbsp;
		   <input type="button" value="목록" class="btn btn-info"  onclick="goBoardList()" ></td></tr>
	   </table>
	</form>
	</div>
	<div class="col-md-2"></div>
	<div>
		<c:import url="../footer.jsp" />
	</div>
</body>
</html>







