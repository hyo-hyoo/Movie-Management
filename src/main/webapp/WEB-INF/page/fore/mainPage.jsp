<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@include file="../include/fore/navigator.jsp"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<meta charset="UTF-8">
<html>
	<head>
		<title>DogeMovie</title>

		<link rel="stylesheet" href="css/fore/fore.css" />

		<style>
			a:hover {
				text-decoration: none;
			}
		</style> 
	</head>
	<body>
       
		<div class="banner" align="center">
			<div class="slider single-item slider-banner">
				<img src="img/mainpage.jpg"/>
			</div>

		</div>
			
		<div class="container" id="app" class="page-home/index">
			<div class="content">	
				<div class="aside">
					<div class="ranking-box-wrapper">
						<div class="panel">
							<div class="panel-header">
								<span class="panel-title">
									<span class="textcolor_red">
										<h2>票房排行</h2>
									</span>
								</span>
							</div>
							<div class="panel-content">
								<ul class="ranking-wrapper ranking-box">
								<c:forEach items="${films_fboxoffice }" var="film" varStatus="st">
								<c:choose>
								<c:when test="${st.count == 1}"> 
									<li class="ranking-item ranking-top ranking-index-1">
										<a href="filmDetail?fid=${film.fid }" target="_blank" >
											<div class="ranking-top-left">
												<i class="ranking-top-icon"></i>
												<img class="ranking-img  default-img"
													src="img/filmSignal/${film.fid}.jpg"
													alt="${film.fname_cn }" />
											</div>
											<div class="ranking-top-right">
												<div class="ranking-top-right-main">
													<span class="ranking-top-moive-name">${film.fname_cn }</span>
													<p class="ranking-top-wish">
													<fmt:formatNumber value="${film.fboxoffice }" var="boxoffice" pattern="0.00"/>
														<span class="stonefont">${boxoffice }</span>万
													</p>
												</div>
											</div>
										</a>
									</li>
                                 </c:when>
                                 <c:otherwise>
									<li class="ranking-item ranking-index-2">
										<a href="filmDetail?fid=${film.fid }" target="_blank">
											<span class="normal-link">
												<i class="ranking-index">${st.count }</i>
												<span class="ranking-movie-name">${film.fname_cn }</span>

												<span class="ranking-num-info">
												<fmt:formatNumber value="${film.fboxoffice }" var="boxoffice" pattern="0.00"/>
													<span class="stonefont">${boxoffice }</span>万
												</span>
											</span>
										</a>
									</li>
                                </c:otherwise>
								</c:choose>
                                </c:forEach>
								</ul>
                              
							</div>
						</div>
					</div>

					<div class="most-expect-wrapper">
						<div class="panel">
							<div class="panel-header">
								<span class="panel-more">
									<a href="rankFilms?type=flikes_next" class="textcolor_orange">
										<span>查看完整榜单</span>
									</a>
									<span class="panel-arrow panel-arrow-orange"></span>
								</span>
								<span class="panel-title">
									<span class="textcolor_orange">
										<h2>最受期待</h2>
									</span>
								</span>
							</div>
							<div class="panel-content">
								<ul class="ranking-wrapper ranking-mostExpect">
								
								<c:forEach items="${films_flikes}" var="film" varStatus="st" begin="0" end="14">
								<c:choose>
								<c:when test="${st.count == 1}"> 
									<li class="ranking-item ranking-top ranking-index-1">
										<a href="filmDetail?fid=${film.fid}" target="_blank">
											<div class="ranking-top-left">
												<i class="ranking-top-icon"></i>
												<img class="ranking-img default-img"
													src="img/filmSignal/${film.fid}.jpg"
													alt="${film.fname_cn }电影海报" />
											</div>
											<div class="ranking-top-right">
												<div class="ranking-top-right-main">
													<span class="ranking-top-moive-name">${film.fname_cn }</span>

													<p class="ranking-release-time">上映时间：${film.freleasetime.substring(0,4) }</p>

													<p class="ranking-top-wish">
														<span
															class="stonefont">${film.flikes }</span>人想看
													</p>
												</div>
											</div>
										</a>
									</li>
                                </c:when>
                                
                                <c:when test="${st.count == 2}"> 
									<li class="ranking-item ranking-index-2">
										<a href="filmDetail?fid=${film.fid}" target="_blank">
											<i class="ranking-index">2</i>
											<span class="img-link"><img class="ranking-img default-img"
													src="img/filmSignal/${film.fid}.jpg"
													alt="${film.fname_cn }电影海报" /></span>
											<div class="name-link ranking-movie-name">${film.fname_cn }</div>

											<span class="ranking-num-info"><span
													class="stonefont">${film.flikes }</span>人想看</span>
										</a>
									</li>
                                </c:when>
                                
                                <c:when test="${st.count == 3}"> 
									<li class="ranking-item ranking-index-3">
										<a href="filmDetail?fid=${film.fid}" target="_blank">
											<i class="ranking-index">3</i>
											<span class="img-link"><img class="ranking-img default-img"
													src="img/filmSignal/${film.fid}.jpg"
													alt="${film.fname_cn }电影海报" /></span>
											<div class="name-link ranking-movie-name">${film.fname_cn }</div>

											<span class="ranking-num-info"><span
													class="stonefont">${film.flikes }</span>人想看</span>
										</a>
									</li>
                                </c:when>
                                
                                <c:otherwise>
									<li class="ranking-item ranking-index-4">
										<a href="filmDetail?fid=${film.fid}" target="_blank">
											<span class="normal-link">
												<i class="ranking-index">${st.count }</i>
												<span class="ranking-movie-name">${film.fname_cn }</span>

												<span class="ranking-num-info">
													<span
														class="stonefont">${film.flikes }</span>人想看
												</span>
											</span>
										</a>
									</li>
								</c:otherwise>
								
								
								</c:choose>
								</c:forEach>
								
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="main">
					<div class="movie-grid">
						<div class="panel">
							<div class="panel-header">
								<span class="panel-more">
									<a href="listFilm?showType=在映&typeId=&region=&orderType=" class="textcolor_red">
										<span>全部</span>
									</a>
									<span class="panel-arrow panel-arrow-red"></span>
								</span>
								<span class="panel-title">
									<span class="textcolor_red">
										<h2>正在热映（${total_on }部）</h2>
									</span>
								</span>
							</div>
							<div class="panel-content">
								<dl class="movie-list">
								
								<c:forEach items="${films_on }" var="film" varStatus="st" begin="0" end="7">
									<dd>
										<div class="movie-item">
											<a href="filmDetail?fid=${film.fid }" target="_blank">
												<div class="movie-poster">
													<img class="movie-poster-img"
														src="img/filmSignal/${film.fid}.jpg"
														alt="${film.fname_cn }电影海报" />
													<div class="movie-overlay movie-overlay-bg">
														<div class="movie-info">																																												
															<div class="movie-score">
															    <fmt:formatNumber value="${film.fscore }" var="score1" maxFractionDigits="0"/>
															    <fmt:formatNumber value="${film.fscore }" var="score2" maxIntegerDigits="0" pattern=".0"/>
															    <i class="integer">${score1}</i><i class="fraction">${score2}</i>
															</div>					
															<div class="movie-title movie-title-padding" title="${film.fname_cn }">
																${film.fname_cn }</div>
														</div>
													</div>
												</div>
											</a>
											<div class="movie-detail movie-detail-strong movie-sale">
												<a href="listCinemaByFilm?fid=${film.fid }" class="active" target="_blank">购票</a>
											</div>
											<div class="movie-ver"></div>
										</div>
									</dd>
								</c:forEach> 
								</dl>
							</div>
						</div>

						<div class="panel">
							<div class="panel-header">
								<span class="panel-more">
									<a href="listFilm?showType=待映&typeId=&region=&orderType=" class="textcolor_blue">
										<span>全部</span>
									</a>
									<span class="panel-arrow panel-arrow-blue"></span>
								</span>
								<span class="panel-title">
									<span class="textcolor_blue">
										<h2>即将上映（${total_next }部）</h2>
									</span>
								</span>
							</div>
							<div class="panel-content">
								<dl class="movie-list">
								<c:forEach items="${films_next }" var="film" varStatus="st">
									<dd>
										<div class="movie-item">
											<a href="filmDetail?fid=${film.fid }" target="_blank">
												<div class="movie-poster">
													<img class="movie-poster-img"
														src="img/filmSignal/${film.fid}.jpg"
														alt="${film.fname_cn }海报封面" />
													<div class="movie-overlay movie-overlay-bg">
														<div class="movie-info">
															<div class="movie-title" title="${film.fname_cn }">${film.fname_cn }</div>
														</div>
													</div>
												</div>
											</a>
											<div class="movie-detail movie-wish" ><span
													class="stonefont">${film.flikes}</span>人想看
											</div>

										</div>
										<div class="movie-detail movie-rt">${film.freleasetime }上映</div>
										</dd>
									</c:forEach>	
								</dl>


							</div>
						</div>
						<div class="panel">
							<div class="panel-header">
								<span class="panel-more">
									<a href="rankFilms?type=fscore" target="_blank" class="textcolor_red">
										<span>全部</span>
									</a>
									<span class="panel-arrow panel-arrow-red"></span>
								</span>
								<span class="panel-title">
									<span class="textcolor_red">
										<h2>Top10</h2>
									</span>
								</span>
							</div>
							<div class="panel-content">
								<dl class="movie-list">
								<c:forEach items="${films_fscore }" var="film" varStatus="st" begin="0" end="7">
									<dd>
										<div class="movie-item">
											<a href="filmDetail?fid=${film.fid }" target="_blank">
												<div class="movie-poster">
													<img class="movie-poster-img"
														src="img/filmSignal/${film.fid}.jpg"
														alt="${film.fname_cn }电影海报" />
													<div class="movie-overlay movie-overlay-bg">
														<div class="movie-info">																								
														    <div class="movie-score">
														        <fmt:formatNumber value="${film.fscore }" var="score1" maxFractionDigits="0"/>
															    <fmt:formatNumber value="${film.fscore }" var="score2" maxIntegerDigits="0" pattern=".0"/>												
															    <i class="integer">${score1}</i><i class="fraction">${score2}</i>
															</div>
															<div class="movie-title movie-title-padding" title="${film.fname_cn }">
																${film.fname_cn }</div>
														</div>
													</div>
												</div>
											</a>
											<div class="movie-detail movie-detail-strong movie-sale">
												<a href="filmDetail?fid=${film.fid}" class="active" target="_blank">购票</a>
											</div>
											<div class="movie-ver"></div>
										</div>
                                    </dd>
                                </c:forEach>    
								</dl>


							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		</div>

		</div>

		<div class="footer">
			
		</div>
	</body>
</html>
