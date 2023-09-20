<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	
	<div id="wrap">
		<header class="d-flex justify-content-center align-items-center">
			<div><h2>marondalgram</h2></div>
		</header>
		<section class="contents d-flex justify-content-center">
			<div class="input-box my-5"">
				<h4 class="text-center">회원 가입</h4>
				<input type="text" placeholder="아이디" class="form-control mt-4" id="loginIdInput">
				<input type="password" placeholder="비밀번호" class="form-control" id="passwordInput">
				<input type="password" placeholder="비밀번호 확인" class="form-control mt-3" id="passwordConfirmInput">
				<input type="text" placeholder="이름" class="form-control mt-3" id="nameInput">
				<input type="text" placeholder="이메일" class="form-control mt-3" id="emailInput">
				<button type="button" class="btn btn-secondary btn-block mt-4" id="joinBtn">가입</button>
			</div>
		</section>
		<footer class="d-flex justify-content-center align-items-center">
			<div class="text-secondary">Copyright © marondalgram 2023</div>
		</footer>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

		<script>
		$(document).ready(function() {
			
			$("#joinBtn").on("click", function() {
				let loginId = $("#loginIdInput").val();
				let password = $("#passwordInput").val();
				let passwordConfirm = $("#passwordConfirmInput").val();
				let name = $("#nameInput").val();
				let email = $("#emailInput").val();
				
				
				if(loginId == ""){
					alert("아이디를 입력하세요");
					return ;
				}
				
				if(password == ""){
					alert("비밀번호를 입력하세요");
					return ;
				}
				
				if(password != passwordConfirm){
					alert("비밀번호가 일치하지 않습니다.");
					return ;
				}
							
				if(name == ""){
					alert("이름을 입력하세요");
					return ;
				}
				
				if(email == ""){
					alert("이메일을 입력하세요");
					return ;
				}
				
				$.ajax({
					type:"post"
					, url:"/user/join"
					, data:{"loginId":loginId, "password":password, "name":name, "email":email}
					, success:function(data) {
						
						if(data.reault == "success") {
							
							location.href = "/user/login-view";
						}else {
							alert("회원가입 실패");
						}
						
					}
					, error:function() {
						
						alert("회원가입 에러!")
					}
				});
				
			});
			
	
		});
	</script>
	
	
</body>
</html>