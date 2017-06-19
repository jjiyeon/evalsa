<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${initParam.root }css/index-page.css">
<style type="text/css">

	#galleryWriteForm{
		padding: 10px;
		margin: 20px;
		border-radius: 6px;
		
	}
	
	#galleryDiv{
		margin: 20px;
		
	}
	#writeGallery td{
		padding: 15px;
		margin: 10px;
	}
	#writeGallery{
		margin: 20px;
		width: 650px; 
		border-bottom:2px solid gray; 
		border-top:2px solid gray; 
		border-radius:3px;
	}

</style>
<script type="text/javascript" src="${initParam.root}js/jquery-1.11.3.js"></script>
<title>갤러리 작성</title>
<script type="text/javascript">
	var fileIndex = 0;
	$(function(){
		$("#addFileBtn").click(function(){
			if(fileIndex == 8){
				alert("이미지는 최대 9개 까지 가능합니다.");
				return;
			}
			
			fileIndex++;
			$("#inputFileArea").append("File "+(fileIndex+1)+" :: <input type='file' name='files["+fileIndex+"]'><br>");
		});
	});
</script>
</head>
<body>
	<c:if test="${sessionScope.mdto==null }">
      <script type="text/javascript">
         alert("로그인이 필요합니다.");
         location.href = "${initParam.root}view/index.jsp";
      </script>
   	</c:if>
	<div>
		<c:import url="../header.jsp" />
	</div>
	<div class="header-banner">
    <section class="bgi banner5"><h2>Gallery</h2> </section></div>
    
    
    
	<div class="col-md-2"></div>
	<div class="col-md-8" align="center">
		<div id="galleryDiv">
		<form action="${initParam.root}gallery.do" method="post" enctype="multipart/form-data" id="galleryWriteForm">
			<input type="hidden" name="command" value="writeGallery">
			<input type="hidden" name="nickname" value="${sessionScope.mdto.nickname}"><p>
			
			<table class="table" id="writeGallery" >
				<tr> 
					<td>제목 :<input type="text" name="title" class="form-control">
				</tr>
				<tr>
					<td>
						게시할 사진을 선택해주세요. <b style="color: red;">(최대 9개 까지 가능합니다.)</b>
						<input type="button" id="addFileBtn" value=" + " class="btn btn-info">
					</td>
				</tr>
				<tr>
					<td>
						<div id="inputFileArea">
							File 1 :: <input type="file" name="files[0]"><br>
						</div>
					</td>
				</tr>
				<tr>
					<td><input type="submit" value="전송"  class="btn btn-info"></td>
				</tr>
			
			</table>
		</form>
		</div>
	</div>
	<div class="col-md-2"></div>
	
	<div >
		<c:import url="../footer.jsp" />
	</div>
	
</body>
</html>