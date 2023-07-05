<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../include/fore/navigator.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
		<title>榜单</title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="css/fore/rankFilms.css" />
		<link rel="stylesheet" href="css/fore/fore.css" />
		
		<style type="text/css">
		    .content {
		        margin-top: 0px;
		    }
		</style>
		
	</head>
	<body>
		<div class="subnav">
			<ul class="navbar">
				<li>
					<a href="?type=fscore_on"
					<c:if test="${type.equals(\"fscore_on\")}"> class="active"</c:if> >
					热映口碑榜</a>
				</li>
				<li>
					<a href="?type=flikes_next" 
					<c:if test="${type.equals(\"flikes_next\")}"> class="active"</c:if>>
					最受期待榜</a>
				</li>
				<li>
					<a href="?type=fboxoffice" 
					<c:if test="${type.equals(\"fboxoffice\")}"> class="active"</c:if>>
					票房榜</a>
				</li>
				<li>
					<a href="?type=fscore" 
					<c:if test="${type.equals(\"fscore\")}"> class="active"</c:if>>
					TOP10</a>
				</li>
			</ul>
		</div>


		<div class="container" id="app" class="page-board/index">

			<div class="content">
				<div class="wrapper">
					<div class="main">
						<dl class="board-wrapper">
						    <c:forEach items="${films }" var="film" varStatus="st">
							<dd>
							    <i class="board-index board-index-${st.count }">${st.count }</i>
								<a href="filmDetail?fid=${film.fid }" class="image-link">
									<img src="img/site/Loading.jpg"
										alt="" class="poster-default" />
									<img src="img/filmSignal/${film.fid }.jpg"
										alt="${film.fname_cn }" class="board-img" />
								</a>
								<div class="board-item-main">
									<div class="board-item-content">
										<div class="movie-item-info">
											<p class="name"><a href="filmDetail?fid=${film.fid }">${film.fname_cn }</a></p>
											<p class="star">
												地区： ${film.fregion }
											</p>
											<p class="releasetime">上映时间：${film.freleasetime }</p>
										</div>
										
										<c:if test="${type.equals(\"fscore_on\") || type.equals(\"fscore\")}">
										<div class="movie-item-number score-num">			
										<fmt:formatNumber value="${film.fscore }" var="score" pattern="0.0"/>				
											<p class="score"><i class="integer">${fn:substring(score, 0, 1)}.</i><i class="fraction">${fn:substring(score, 2, 3)}</i></p>
										</div>
										</c:if>
										
										<c:if test="${type.equals(\"flikes_next\")}">
										<div class="movie-item-number wish">
                                            <p class="month-wish">总想看人数：<span><span class="stonefont">${film.flikes }</span></span>人</p>                                        
                                        </div> 
                                        </c:if>
                                        
                                        <c:if test="${type.equals(\"fboxoffice\")}">
                                        <div class="movie-item-number boxoffice">
                                        <fmt:formatNumber value="${film.fboxoffice }" var="boxoffice" pattern="0.00" maxFractionDigits="2"/>
                                            <p class="realtime">总票房：<span><span class="stonefont">${boxoffice }</span></span>万</p>
                                        </div>
                                        </c:if>
                                        
									</div>
								</div>
							</dd>
						    </c:forEach>
						    
						</dl>

					</div>
				</div>
			</div>

		</div>

		<div class="footer">
			
		</div>

		
	</body>
</html>
