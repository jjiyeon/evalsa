<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript">
   $(function() {
      
   });
</script>
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		var result = "${requestScope.result}";
		if(result == "true"){
			alert("삭제했습니다.");
		}else{
			alert("잘못된 경로이거나, 댓글 작성자가 아닙니다.");
		}
		
		location.href="board.do?command=getBoard&&boardNo=${requestScope.boardNo}&&category=${requestScope.category}";
	</script>
</body>
</html>