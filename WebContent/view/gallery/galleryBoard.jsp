<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="${initParam.root }css/index-page.css">
<style type="text/css">
	.textArea{
		text-align: center;
		position: relative;
		margin-top: 15px;
	}

	.cell{
		border-radius: 10px;
		
		width: 100%;
		height: 330px;
	
		margin: 15px;
		padding: 15px;
		position: relative;
		float: left;
		
		background-color: #ededed;
	}
	.myBack{
		border-radius: 10px;
		
		position: relative;
		overflow: hidden;
		
		width: 100%;
		height: 210px;
	}
	.hovereffect {
		border-radius: 10px;
		
		padding: 20px;
		position: relative;
		float: left;
		padding:0%;
		
		width: 100%;
		height: 100%;
	  
		overflow: hidden;
		position: relative;
		text-align: center;
		cursor: default;
	}

	.hovereffect > img {
		border-radius: 10px;
		display: block;

		-ms-transform: scale(1);
		-webkit-transform: scale(1); 
		transform: scale(1);

		-webkit-transition: all 1s ease;
		-moz-transition: all 1s ease;
		-o-transition: all 1s ease;
		-ms-transition: all 1s ease;
        transition: all 1s ease;
        
        width: 100%;
		height: 100%;
	}

	.hovereffect > img:hover {
		border-radius: 10px;
		
		-moz-transform:scale(1.5);
		-webkit-transform:scale(1.5);
		-o-transform:scale(1.5);
		transform:scale(1.5);
	} 
</style>

<script type="text/javascript" src="${initParam.root}js/jquery-1.11.3.js"></script>
<script type="text/javascript">
   $(function() {
      $("#writeGallery").click(function(){
    	  location.href = "${initParam.root}view/gallery/writeGallery.jsp";
      })
   });
   
   function deleteBtnEvent(galleryNo){
	   location.href = "${initParam.root}gallery.do?command=removeGallery&galleryNo="+galleryNo;
   }
</script>

<title>갤러리 게시판</title>
</head>

<body>
	<!-- header -->
	<div>
		<c:import url="../header.jsp" />
	</div>
	
	<div class="header-banner">
    <section class="bgi banner5"><h2>Gallery</h2> </section></div>
	
	<div class="container">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div align="right" style="height: 100px; margin-top: 30px;" id="btnDiv">
				<input type="button" value="갤러리 쓰기" id="writeGallery" class="btn btn-info">
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
	
	<div class="container-fluid" style="margin-bottom: 30px;">
	<div class="col-md-1"></div>
	
	<c:forEach var="e" items="${requestScope.glist}" varStatus="cnt">
		<c:if test="${cnt.count % 4 == 0}">
			<div class="col-md-1"></div>
			</div>
			<div class="container-fluid" style="margin-bottom: 30px;">
			<div class="col-md-1"></div>
		</c:if>
	
	  <!-- cell area -->
      <div class="cell col-md-3">
		<div class="myBack" align="center">
			<div class="hovereffect" align="center">
				<img class="img-responsive" src="${e.imagepath[0]}" alt="" data-toggle="modal" data-target="#myModal${cnt.count}">
			</div>
		</div>
		<div class="textArea">
			제목 : ${e.title}<br>
			닉네임 : ${e.nickname}<br>
			작성일 : ${e.writedate}<br>
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="myModal${cnt.count}" role="dialog">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">×</button><br>
		        <h4 class="modal-title" id="myModalLabel" align="center">${e.title}</h4>
		      </div>
		      <div class="modal-body">
		      	  <c:forEach var="path" items="${e.imagepath}">
		      	  	 <img src="${path}" width="100%" height="100%" alt=""><br><br>
		      	  </c:forEach>
		      </div>
		    </div>
		  </div>
		</div>
      </div>
      <!-- ///// cell area ///// -->
	</c:forEach>
    </div>
    
    <div align="center">
		<nav>
		<ul class="pagination">
			<c:if test="${requestScope.paging.prevGroup}">
			<li>
				<a href="gallery.do?command=getAllGalleryList&&currentPage=${requestScope.paging.prevGroupPage}&&currentGroup=${(requestScope.paging.currentGroup)-1}">
				<span aria-hidden="true">&laquo;</span></a>
			</li>
			</c:if>
			<c:forEach begin="${requestScope.paging.startPage}" end="${requestScope.paging.endPage}" var="i">
				<c:choose>
					<c:when test="${requestScope.paging.currentPage == i}"><li class="active"><a href="#">${i}</a></li></c:when>
					<c:otherwise>
						<li><a href="gallery.do?command=getAllGalleryList&&currentPage=${i}&&currentGroup=${requestScope.paging.currentGroup}">${i}</a></li>&nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${requestScope.paging.nextGroup}">
				<li>
				<a href="gallery.do?command=getAllGalleryList&&currentPage=${requestScope.paging.nextGroupPage}&&currentGroup=${(requestScope.paging.currentGroup)+1}">
				<span aria-hidden="true">&raquo;</span></a>
				</li>
			</c:if>
		</ul>
		</nav>
	</div>
    
    <!-- footer -->
	<div>
		<c:import url="../footer.jsp" />
	</div>
</body>
</html>