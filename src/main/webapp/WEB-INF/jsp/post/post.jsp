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
					<div class="card-list">
						<div class="card">
							<div class="d-flex justify-content-between p-2">
								<div class="d-flex">
									<i class="bi bi-person-circle"></i>
									<h4 class="text-bold ml-2">${userloginId }</h4>
								</div>
								<i class="bi bi-three-dots"></i>
							</div>
							<div>
								<img width="100%" src="https://cdn.pixabay.com/photo/2023/09/04/08/54/sea-lion-8232312_640.jpg">
							</div>
							<div class="d-flex">
								<i class="bi bi-heart"></i>
								<p class="ml-3">좋아요 3개</p>
							</div>
							<div class="d-flex">
								<b>${userloginId }</b>
								<p>물개 귀여워</p>
							</div>
							<div> 댓글</div>
							<!-- 댓글 내용 -->
							<div class="mt-3">
								<div><b>hagulu</b> 귀엽당!!</div>
							</div>
							<div class="mt-3">
								<div><b>bear</b>보러가자 물개</div>
							</div>
							<!-- 댓글 내용 -->
							<div class="d-flex">
								<input type="text" class="form-control">
								<button type="button" class="btn btn-primary">댓글</button>
							</div>
						</div>
					</div>
					<!-- 카드 리스트 -->
				</div>
			</article>
			
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>


	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	

</body>
</html>