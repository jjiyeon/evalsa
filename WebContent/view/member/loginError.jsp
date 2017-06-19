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
		alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
		location.href = "${initParam.root}view/index.jsp";
	</script>
</body>
</html>