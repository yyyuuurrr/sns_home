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
		<section class="d-flex border">
			<c:import url="/WEB-INF/jsp/include/head.jsp"/>
			<div class="contents col-9">
				<div class="d-flex justify-content-center align-items-center">
					<div class="post-layout my-5">
						<div class="d-flex">
							<img width="40" src="https://cdn-icons-png.flaticon.com/128/7179/7179733.png"><p class="ml-2">유림</p>
						</div>
											
						<textarea class="form-control mt-3" rows="7" placeholder="내용을 입력해주세요" id="contentInput"></textarea>
						<input type="file" class="mt-2">
						<div class="d-flex justify-content-end mt-4">
							<button type="button" class="btn btn-secondary" id="saveBtn">업로드</button>
						</div>
					</div>
				</div>			
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	

</body>
</html>