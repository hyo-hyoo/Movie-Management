<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<html>
<head>
	<link rel="icon" href="${pageContext.request.contextPath}/img/top/favicon.ico" mce_href="${pageContext.request.contextPath}/img/top/favicon.ico" type="image/x-icon" />

	<link rel="stylesheet" type="text/css" href="css/fore/fore.css">
	<link rel="stylesheet" href="css/fore/home-index.css" >
	<link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<div class="header">
	<div class="header-inner">
		<h1><a href="mainPage" class="logo">DogeMovie</a></h1>

		<div class="nav doge_nav">
			<div><a href="mainPage">HOME</a></div>
			<div><a href="listFilm?showType=在映&typeId=&region=&orderType=">MOVIE</a></div>
			<div><a href="listCinemas">CINEMA</a></div>
			<div><a href="rankFilms?type=fscore_on">RANK</a></div>
		</div>
		<form action="searchFilm" target="_blank" class="search-form doge_serach">
			<input name="name" class="search" type="search" maxlength="32" placeholder="找电影" autocomplete="off">
			<input class="submit" type="submit" value="">
		</form>

		<div class="user-info">
			<div class="user-avatar ">
				<c:if test="${user == null}">
					<img src="img/site/DefaultUserImg.png" alt="">
				</c:if>
				<c:if test="${user != null}">
					<img src="img/user/${user.uid }.jpg" alt="">
				</c:if>
				<span class="caret"></span>
				<ul class="user-menu yes-login-menu">
					<li class="text"><a href="myorders">我的订单</a></li>
					<li class="text login-name"><a href="myprofile">基本信息</a></li>
					<li class="text"><a href="logout" class="J-logout" >退出登录</a></li>
				</ul>
			</div>
		</div>

	</div>
</div>
<div class="header-placeholder"></div>
</body>
</html>
