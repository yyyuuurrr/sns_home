<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
		<div class="border">
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
			<section class="contents d-flex justify-content-center">
				<div class="input-box my-5">
					<h4 class="text-center">회원 가입</h4>
					<form id="loginForm">
						<input type="text" placeholder="아이디" class="form-control mt-4" id="loginIdInput">
						<input type="password" placeholder="비밀번호" class="form-control" id="passwordInput">
						<button type="submit" class="btn btn-primary btn-block mt-4" id="loginBtn">로그인</button>
					</form>
					<p class="text-center mt-3">회원이 아니신가요? <a href="/user/join.jsp">회원가입</a></p>
				</div>
			</section>
			<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
		</div>
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<script>
		$(document).ready(function() {
			
			//$("#loginBtn").on("click", function() {
			$("#loginForm").on("submit", function(e) {
				
				// form 태그가 가진 페이지 이동 기능을 막자
				e.preventDefault();
				
				let loginId = $("#loginIdInput").val();
				let password = $("#passwordInput").val();
				
				if(loginId == ""){
					alert("아이디를 입력하세요");
					return ;
				}
				
				if(password == ""){
					alert("비밀번호를 입력하세요");
					return ;
				}
				
				
				$.ajax({
					type:"post"
					, url:"/user/login"
					, data:{"loginId":loginId, "password":password}
					, success:function(data){
						
						
						if(data.result == "success"){
							
							location.href="/post/input-view";
						}else {
							alert("아이디 및 비밀번호를 확인하세요");
						}
						
					}
					, error:function(){
						alert("로그인 에러!")
					}
					
					
				})
				
						
			});
			
		});
	
	</script>
		

</body>
</html>