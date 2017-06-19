<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${initParam.root }css/index-page.css">
<title>게시물 수정</title>
<style type="text/css">
	#updateForm td{
		padding: 15px;
		margin: 10px;
	}
	#updateForm{
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
<script type="text/javascript">
	function goBoardList() {
		   if(confirm("정말로 이동하시겠습니까?"))
			   location.href="${initParam.root}board.do?command=getAllBoard&&category=${param.category}";
	}

</script>
</head>
<body>
	<c:import url="../header.jsp"></c:import>
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
    <form action="${initParam.root}board.do" method="post" name="modify">
	<input type="hidden" name="command" value="modifyBoard">
	<input type="hidden" name="boardNo" value="${requestScope.bdto.BOARD_NO}">
	<input type="hidden" name="category" value="${requestScope.category}">
		 <table style="width: 500px" id="updateForm" class="table">
		   <tr>
			   	<td class="non-text">닉네임</td>
			   	<td>
			   		<input type="text"  class="form-control"  name="nickname" value="${requestScope.bdto.NICKNAME}" readonly="readonly">
			   	</td>
		   </tr>
		   <tr>
		   		<td class="non-text">제목</td>
		   		<td>
		   			<input type="text" class="form-control" name="title" value="${requestScope.bdto.TITLE}">
		   		</td>
		   </tr>
		   <tr>
		   		<td>작성날짜</td>
		   		<td>
		   			<input type="text" class="form-control" value="${requestScope.bdto.WRITEDATE }" readonly="readonly">
		   		</td>
		   </tr>
		   <tr>
		   		<td class="non-text">내용</td>
		   		<td>
		   			<textarea name="content"  class="form-control" rows="13" cols="40">${requestScope.bdto.CONTENT}</textarea>
		   		</td>
		   </tr>
		   
		   <tr>
		   	<td colspan="2" align="right">
		   <input type="submit" value="글쓰기" class="btn btn-info" alt="Submit" >
		  &nbsp;&nbsp;
		   <input type="button" value="목록" class="btn btn-info"  onclick="goBoardList()" ></td></tr>
	   </table>
    </form>
    
    
    </div>
 
   <div>
		<c:import url="../footer.jsp" />
	</div>
   
</body>
</html>

