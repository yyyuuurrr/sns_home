<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
			<nav class="main-menu border">
				<div class="rogo flex-end">
					<div class="d-flex mt-5 ml-4">
						<div class="col-2 d-flex">
							<h2>marondalgram</h2>
							<img height="30" src="https://cdn-icons-png.flaticon.com/128/717/717392.png" class="ml-2">
						</div>
					</div>
					<div class="ml-4 d-flex justify-content-end">
						<div class="mr-3">${userloginId }님 <a href="/user/logout">로그아웃</a></div>
					</div>		
				</div>
				
				<div class="menu">
					<nav class="menu nav d-flex ml-3">
	                    <ul class="nav flex-column d-flex">
	                        <li class="nav-item mt-5"><a href="/post/post-view" class="nav-link main-link"><img width="40" src="https://cdn-icons-png.flaticon.com/128/1828/1828864.png"><b class="ml-3">타임라인</b></a></li>
	                        <li class="nav-item mt-5"><a href="#" class="nav-link main-link"><img width="40" src="https://cdn-icons-png.flaticon.com/128/149/149852.png"><b class="ml-3">수정</b></a></li>
	                        <li class="nav-item mt-5"><a href="/post/input-view" class="nav-link main-link"><img width="40" src="https://cdn-icons-png.flaticon.com/128/482/482889.png"><b class="ml-3">업로드</b></a></li>
	                    </ul>
					</nav>
				</div>
			</nav>