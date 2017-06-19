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
		var status = "${requestScope.result}";
		if(status == "true"){
			alert("성공적으로 업로드 했습니다.");
		}else{
			alert("업로드에 실패했습니다.");
		}
		
		location.href = "gallery.do?command=getAllGalleryList";
	</script>
</body>
</html>