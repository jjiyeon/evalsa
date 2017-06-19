<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	li {
		padding: 10px;
		margin: 10px;
	}
	li>img{
		width: 80px;
		height: 80px;
	}
	
	tr img{
		width: 120px;
		height: 120px;
	}
	
	tr, td{
		padding: 20px;
		margin: 20px;
	}
	
</style>

<script type="text/javascript">
	$(function() {
		$('.scheduleView1').hide();
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="col-md-1"></div>
	<div class="col-md-10">
	
	<div class="scheduleView1" align="center">
		<table style="text-align: center;">
			<tr><!-- 첫번째 줄 -->
				<td><img alt="" src="${initParam.root }image/Pisa/hotel/BB Antica Piazza dei Miracoli.jpg" class="img-circle"><br>
					   비엔비 안티카 피아짜
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Pisa/randmark/Piazza dei Miracoli.jpg" class="img-circle"><br>
					  피사의 사탑
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Pisa/food/Al Madina.jpg" class="img-circle"><br>
					  Al Madina
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Pisa/shopping/La Feltrinelli.jpg" class="img-circle"><br>
					 라파엘라
				</td>
			
			</tr>
			
		</table>
	</div>
</div>
	
	<div class="col-md-1"></div>
</body>
</html>