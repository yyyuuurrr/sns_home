<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css_2/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
		<section class="contents d-flex border">
			<c:import url="/WEB-INF/jsp/include/head.jsp"/>
			
			<article class="main-contents p-4 d-flex justify-content-center">
				<div class="post-layout my-5">
					
					<!-- 카드 리스트 -->
					<div class="card-list" style="font-size:20px;">
						<c:forEach var="post" items="${postList }">
						<div class="card">
							<div class="d-flex justify-content-between p-2">
								<div class="d-flex">
									<h4 class="text-bold ml-2">${post.loginId }</h4>
								</div>
								<i class="bi bi-three-dots" data-toggle="modal" data-target="#moreModal"></i>
							</div>
							
							
							<div>
								<img width="100%" src="${post.imagePath }">
							</div>
							<div class="d-flex mt-2">
								<c:choose>
									<c:when test="${post.like }">
										<i class="bi bi-heart-fill text-danger">좋아요 ${post.likeCount }개</i>
									</c:when>
									<c:otherwise >									
										<i class="bi bi-heart like-icon" data-post-id="${post.id }"></i>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="d-flex mt-2">
								<b class="mr-2">${post.loginId }</b>
								<p>${post.content }</p>
							</div>
							<div class="text-secondary"> 댓글</div>
							
							<!-- 댓글 내용 -->
							<div class="mt-3">
								<c:forEach var="comment" items="${post.commentList }">
									<div><b class="mr-2">${comment.loginId }</b>${comment.comment }</div>
								</c:forEach>
							</div>
							<!-- 댓글 내용 -->
							
							<div class="d-flex">
								<input type="text" class="form-control" id="commentInput${post.id }">
								<button type="button" class="btn btn-primary comment-btn" data-post-id="${post.id }">게시</button>
							</div>
						</div>
						</c:forEach>
					</div>
					<!-- 카드 리스트 -->

				</div>
			</article>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
		
		
		<!-- Modal -->
		<div class="modal fade" id="moreModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">

		      <div class="modal-body text-center">
		        <h4><a href="#">삭제하기</a></h4>
		      </div>

		    </div>
		  </div>
		</div>
		
	</div>


	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<script>
		$(document).ready(function() {
			
			
			$("#moreModal").on("click", function() {
				
				let postId = $(this).data("post-id");
				
				alert()
				
				$.ajax({
					type:"delete"
					, url:"/post/delete"
					, data:{"postId":postId}
					, success:function(data){
						
						if(data.result == 1){
							 
							location.href= "/post/post-view";
						}else {
							alert("게시글 삭제 오류");
						}
						
					}
					, error:function(){
						alert("게시글 삭제 에러");
					}
					
					
				})
				
				
				
			});
			
			
			$(".comment-btn").on("click", function() {
				
				let postId = $(this).data("post-id");		
				let comment = $("#commentInput" + postId).val();
				
				
				$.ajax({
					type:"post"
					, url:"/post/comment"
					, data:{"postId":postId, "comment":comment}
					, success:function(data){
						
						if(data.result == "success"){
							
							location.reload();
						}else{
							alert("댓글 작성 실패")
						}
						
					}
					, error:function(){
						alert("댓글 에러")
					}
					
				})
				
				
			});
			
			
			$(".like-icon").on("click", function() {
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"post"
					, url:"/post/like"
					, data:{"postId":postId}
					, success:function(data){
						
						if(data.result == "success"){
							
							location.reload();
						}else{
							alert("좋아요 실패");
						}
						
					}
					, error:function(){
						alert("좋아요 에러")
					}
					
					
				});
				
				
				
			});
					
			
			
			
		});	
	
	
	</script>

</body>
</html>