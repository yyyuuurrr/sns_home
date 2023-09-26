<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<div class="border">
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
			<section class="contents d-flex justify-content-center">
				<div class="input-box my-5">
					<h4 class="text-center">회원 가입</h4>
					<div class="d-flex  mt-3">
						<input type="text" id="loginIdInput" class="form-control" placeholder="아이디">
						<button type="button" class="btn btn-secondary btn-sm ml-2" id="isDuplicateBtn">중복확인</button>
					</div>
					<div class="text-success small d-none" id="avaliableText">사용 가능한 아이디 입니다.</div>
					<div class="text-danger small d-none" id="duplicateText">중복된 아이디 입니다.</div>
					
					<input type="password" placeholder="비밀번호" class="form-control" id="passwordInput">
					<input type="password" placeholder="비밀번호 확인" class="form-control mt-3" id="passwordConfirmInput">
					<input type="text" placeholder="이름" class="form-control mt-3" id="nameInput">
					<input type="text" placeholder="이메일" class="form-control mt-3" id="emailInput">
					<button type="button" class="btn btn-primary btn-block mt-4" id="joinBtn">가입</button>
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
			// 중복확인 체크 여부
			var isCheckDuplicate = false;
			var isDuplicate = true;
			
			$("#loginIdInput").on("click", function() {
				
				isCheckDuplicate = false;
				isDuplicate = true;
				
				$("#avaliableText").addClass("d-none");
				$("#duplicateText").addClass("d-none");
							
			});
			
			
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
				
				// 중복체크가 안된 경우
				if(!isCheckDuplicate){
					alert("아이디 중복확인");
					return ;
				}
				
				if(isDuplicate){
					alert("중복된 아이디입니다.");
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
						
						if(data.result == "success") {
							
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
			
			
			$("#isDuplicateBtn").on("click", function() {
				let id = $("#loginIdInput").val();
				
				if(id == ""){
					alert("아이디를 입력하세요");
					return ;
				}
				
						
				$.ajax({
					type:"get"
					, url:"/user/duplicate-id"
					, data:{"loginId":id}
					, success:function(data){
						
						isCheckDuplicate = true;
						
						if(data.isDuplicate){
							// 중복 되었다
							$("#duplicateText").removeClass("d-none");
							$("#avaliableText").addClass("d-none");
							
							isDuplicate = true;
							
						}else {
							// 중복되지 않았다
							$("#avaliableText").removeClass("d-none");
							$("#duplicateText").addClass("d-none");
							
							isDuplicate = false;
						}
					}
					, error:function(){
						alert("중복확인 에러");
					}
					
					
				})
				
			});		
			
	
		});
	</script>


	
</body>
</html>