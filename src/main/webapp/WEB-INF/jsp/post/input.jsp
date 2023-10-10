<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업로드</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css_2/style.css" type="text/css">
</head>
<body>
	
	<div id="wrap">
		<section class="contents d-flex border">
			<c:import url="/WEB-INF/jsp/include/head.jsp"/>
			
			<article class="main-contents p-4 d-flex justify-content-center">
				<div class="post-layout my-5 card">
										
					<div class="card-list">
						<div>
							<div class="d-flex justify-content-between p-2">
								<h4 class="text-bold ml-3 mt-2">${userloginId }</h4>
								<i class="bi bi-three-dots"></i>
							</div>
							<div>
								<textarea class="form-control mt-3 rounded" rows="7" placeholder="내용을 입력해주세요" id="contentInput"></textarea>
								<input type="file" class="mt-2" id="fileInput">
							</div>
							<div class="d-flex justify-content-end mt-4 input-group">
								<button type="button" class="btn btn-primary" id="saveBtn">업로드</button>
							</div>

						</div>
					</div>
					
				</div>
			</article>
			
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>

	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<script>
		$(document).ready(function() {
			
			$("#saveBtn").on("click", function() {
				
				let content = $("#contentInput").val();
				let file = $("#fileInput")[0];
							
				if(content == ""){
					alert("내용을 입력하세요");
					return ;
				}
				
				// 파일에 대한 유효성 검사
				if(file.files.length == 0) {
					alert("이미지를 선택해주세요");
					return ;
				}
				
				
				let formData = new FormData();
				formData.append("content", content);
				formData.append("imagefile", file.files[0]);
				
				$.ajax({
					type:"post"
					, url:"/post/create"
					, data:formData
					, enctype:"multipart/form-data" // 파일 업로드 필수 옵션
					, processData:false // 파일 업로드 필수 옵션
					, contentType:false // 파일 업로드 필수 옵션
					, success:function(data){
						
						if(data.result == "success"){
							
							location.href="/post/post-view";
						}else {
							alert("업로드 실패")
						}
						
					}
					, error:function(){
						alert("업로드 오류")
					}
					
					
				})
						
				
			});
					
			
		});
	
	</script>


</body>
</html>