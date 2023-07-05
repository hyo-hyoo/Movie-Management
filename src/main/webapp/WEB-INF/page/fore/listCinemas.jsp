<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../include/fore/navigator.jsp"%>
<html>
	<head>
		<title>影院</title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="css/fore/fore" />
		
		<style type="text/css">
			div#app {
				margin-top: 40px;
				margin-bottom: 35px;
			}

			a:hover {
				text-decoration: none;
			}

			.cinemas-list {
				padding: 0 80px;
			}

			.cinemas-list {
				padding: 0 80px;
			}

			.cinemas-list .no-cinemas {
				margin-top: 40px;
				font-size: 16px;
				color: #333
			}

			.cinemas-list .cinemas-list-header {
				font-size: 18px;
				color: #333;
				border-left: 4px solid #f03d37;
				padding-left: 6px;
				line-height: 18px;
				margin: 0;
				position: relative
			}

			.cinemas-list .cinema-cell {
				display: block;
				padding: 20px 0;
				border-bottom: 1px dashed #e5e5e5
			}

			.cinemas-list .cinema-info {
				display: inline-block;
				max-width: 80%
			}

			.cinemas-list .cinema-name {
				display: inline-block;
				font-size: 16px;
				line-height: 18px;
				color: #333;
				margin-bottom: 10px
			}

			.cinemas-list .cinema-name:hover {
				color: #f03d37
			}

			.cinemas-list .cinema-address {
				font-size: 14px;
				line-height: 14px;
				color: #999
			}

			.cinemas-list .price {
				float: right;
				font-size: 12px;
				color: #999;
				height: 45px;
				line-height: 45px
			}

			.cinemas-list .price .rmb {
				margin-right: -4px
			}

			.cinemas-list .price .price-num {
				font-size: 16px;
				margin-right: -3px;
				font-weight: 700
			}

			.cinemas-list .buy-btn {
				float: right;
				width: 80px;
				height: 45px;
				line-height: 45px;
				margin-left: 36px;
				margin-right: 20px
			}

			.cinemas-list .buy-btn a {
				display: inline-block;
				width: 100%;
				height: 30px;
				color: #fff;
				background-color: #f03d37;
				font-size: 14px;
				line-height: 30px;
				border-radius: 100px;
				text-align: center;
				-webkit-box-shadow: 0 2px 10px -2px #f03d37;
				box-shadow: 0 2px 10px -2px #f03d37
			}

			.cinemas-list .buy-btn a:hover {
				background-color: #ff5e59
			}
		</style>

	</head>
	<body>

		<div class="container" id="app" class="page-cinemas/list">

			<div class="cinemas-list">
				<h2 class="cinemas-list-header">
					<span>影院列表</span>
				</h2>

				<c:forEach items="${cinemas}" var="cinema" varStatus="st">
					<div class="cinema-cell">
						<div class="cinema-info">
							<a href="selectSession?cid=${cinema.cid }" class="cinema-name">${cinema.cname }</a>
							<p class="cinema-address">地址：${cinema.clocation }</p>
						</div>

						<div class="buy-btn">
							<a href="selectSession?cid=${cinema.cid}">选座购票</a>
						</div>

					</div>
				</c:forEach>
			</div>
		</div>

		<div class="footer">
		</div>

	</body>
</html>
