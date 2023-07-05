<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/fore/navigator.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<html>
<head>
	<title>${f.fname_cn }_电影详情</title>
	<link rel="stylesheet" href="css/fore/fore.css">
	<link rel="stylesheet" href="css/fore/filmDetail.css">

	<script src="js/jquery/2.0.0/jquery.min.js"></script>
	<script src="js/jquery/jquery.form.js"></script>

	
	<link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
	<script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
	
	<style>
	   a:link {
			text-decoration: none;
		}
	</style>
	<script>
		function likeFilm(uid, fid) {
			$.post("likeFilm",
					{   uid : uid,
						fid : fid, },
					function(result) {
						if(result == "addlike") {
							$('.wish').addClass("active");
							$('.wish span').text("已想看");
						}
						else {
							$('.wish').removeClass("active");
							$('.wish span').text("想看");
						}
					});
		}
	</script>
	<script>
	    $(document).ready(function() {
	    	let message = [
				"超烂啊",
				"超烂啊",
				"比较烂",
				"比较烂",
				"一般般",
				"一般般",
				"比较好",
				"比较好",
				"棒极了",
				"完美",
			];
		    
	    	$.get("isComment",	
					{    uid: '${user.uid}',
				         fid: '${f.fid}',
				    },
					function(result) {
				    	 if(result=="true") {
				    		 var score_mes = message['${usercomment.ucscore}'-1];
					    		$('.score-btn').addClass("active");		
					    		$('.score-btn-msg').text("${usercomment.ucscore}分，" + score_mes);
					    		$('.comment-entry').text("已评论");
					    		$('.score-btn').off("click");
					    		$('.comment-entry').off("click");
				    	 }
					});
	    })
	</script>
	<script>
		function addComment() {	
			var ucuid = '${user.uid}';
		    var ucfid = '${f.fid}';
		    var uccontent = $('.submit_text').val();
		    var ucscore = $('.submit_score').attr("value");
		    
		    if(uccontent==null || uccontent=="" || uccontent=="undefined") {
		    	alert("评论内容不能为空！");
		    }
		    else {
		    	$.post("isComment",
				    	  {uid : ucuid, 
		    		       fid : ucfid, },
				    	  function(result) {
				    		  if(result=="true") {
				    			  alert("你已经评价过了哦！");
				    		  }
				    		  else {
				    			  $.post("addComment",	
				    						{    ucuid: ucuid,
				    					         ucfid: ucfid,
				    					         uccontent: uccontent,
				    					         ucscore: ucscore, },
				    						function(result) {
				    					    	 if(result=="success") {
				    					    		 $('.score-btn').addClass("active");		
				    					    		 $('.score-btn-msg').text(ucscore+"分");
				    					    	 }				
				    						});
				    		  }
				    	  });
		    }
		}
	</script>

	<script>
		$(document).ready(function(){
			$('.score-btn').click(function(){
				$('#comment-form-container').css("display", "block")
				$('.submit_btn').attr("disabled", true);
			});

			$('.comment-entry').click(function(){
				$('#comment-form-container').css("display", "block")
				$('.submit_btn').attr("disabled", true);
			});

			let message = [
				"超烂啊",
				"超烂啊",
				"比较烂",
				"比较烂",
				"一般般",
				"一般般",
				"比较好",
				"比较好",
				"棒极了",
				"完美",
			];

			$('.half-star').mouseover(function(){
				let score = parseInt($(this).attr("score"));

				$('.submit-star i').each(function(index){
					if($(this).attr("score") <= score) {
						$(this).addClass("active");
					}
					else {
						$(this).removeClass("active");
					}
				});

				$('.score-msg-container').addClass("active");
				$('.num').text(score);
				$('.score-message').text(message[score - 1]);
			});

			$('.half-star').mouseout(function(){
				let submit_score = parseInt($('.submit_score').attr("value"));

				$('.submit-star i').each(function(index){
						$(this).removeClass("active");
				});

				if(submit_score != 0) {
					$('.score-star i').each(function(index){
						if($(this).attr("score") <= submit_score) {
							$(this).addClass("active");
						}
					});

					$('.num').text(submit_score);

					$('.score-message').text(message[submit_score - 1]);
				}

				else {
					$('.score-msg-container').removeClass("active");
				}
			});

			$('.half-star').click(function(){
				let score = parseInt($(this).attr("score"));

				$('.submit-star i').each(function(index){
					if($(this).attr("score") <= score) {
						$(this).addClass("active");
					}
				});

				$('.submit_score').attr("value", score);

				$('.score-msg-container').addClass("active");
				$('.num').text(score);
				$('.score-message').text(message[score - 1]);

				$('.submit_btn').removeClass("disabled");
				$('.submit_btn').attr("disabled", false);;
			});

			$('.close').click(function(){
				$('#comment-form-container').css("display", "none")
			});
		});
	</script>
</head>

<body>

<div class="banner">
	<div class="wrapper clearfix">
		<div class="celeInfo-left">
			<!--电影海报图片-->
			<div class="avatar-shadow">
				<img class="avatar" src="img/filmSignal/${f.fid}.jpg" alt="${f.fname_cn }电影海报">
				<div class="movie-ver"></div>
			</div>
		</div>
		<div class="celeInfo-right clearfix">
			<!--电影的中文名、英文名、类型、地区、时长、上映时间-->
			<div class="movie-brief-container">
				<h1 class="name">${f.fname_cn }</h1>
				<div class="ename ellipsis">${f.fname_en }</div>
				<ul>
					<li class="ellipsis">
					    <c:forEach items="${types}" var="type" varStatus="st">
					    <a class="text-link" href="listFilm?showType=在映&typeId=${type.fttid }&region=&orderType=" target="_blank"> ${type.tname }</a> 
						</c:forEach>
					</li>
					<li class="ellipsis">${f.fregion } / ${f.flength }分钟</li>
					<li class="ellipsis">${f.freleasetime }上映</li>
				</ul>
			</div>
			<!--想看、评分、购票 -->
			<div class="action-buyBtn">
				<div class="action clearfix">
					<a href="#nowhere" id="wishFilm"
					   <c:if test="${islike==true }">class="wish active"</c:if>
					   <c:if test="${islike==false }">class="wish"</c:if>
					   onclick="likeFilm(${user.uid}, ${f.fid})">
						<div>
							<i class="icon wish-icon"></i>
							<span class="wish-msg">
									<c:if test="${islike==true }">已想看</c:if>
									<c:if test="${islike==false }">想看</c:if>
									</span>
						</div>
					</a>
					<a class="score-btn">
						<div>
							<i class="icon score-btn-icon"></i> <span class="score-btn-msg"> 评分 </span>
						</div>
					</a>
				</div>
				<a class="btn buy" href="listCinemaByFilm?fid=${f.fid }" target="_blank">特惠购票</a>
			</div>

			<div class="movie-stats-container">
				<!--评分和评分人数-->
				<div class="movie-index">
					<p class="movie-index-title">电影口碑</p>
					<div class="movie-index-content score normal-score">
					    <fmt:formatNumber value="${f.fscore }" var="score" pattern="0.0" maxFractionDigits="1"/>
					    <span class="index-left info-num "> <span class="stonefont">${score }</span></span>
					</div>
				</div>


				<!--票房-->
				<div class="movie-index">
					<p class="movie-index-title">累计票房</p>
					<div class="movie-index-content box">
					    <fmt:formatNumber value="${f.fboxoffice }" var="boxoffice" pattern="0.00" maxFractionDigits="2"/>
						<span class="stonefont">${boxoffice }</span><span class="unit">万</span>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>

<div class="container" id="app">
	<div class="main-content-container clearfix">
		<div class="main-content">
			<div class="tab-container tab-movie-info">

				<div class="crumbs-nav-container">
					<!--超链接跳转到首页和电影列表页-->
					<a href="mainPage">DogeMovie</a> &gt; <a
						href="listFilm?showType=在映&typeId=&region=&orderType=">电影</a> &gt;
					<!--电影的名字-->
					<span>${f.fname_cn }</span>
				</div>

				<div class="tab-content-container">
					<div class="tab-desc tab-content active">
						<!--剧情简介-->
						<div class="module">
							<div class="mod-title">
								<h2>剧情简介</h2>
							</div>
							<div class="mod-content">
								<span class="dra">${f.fprofile }</span>
							</div>
						</div>

						<div class="module">
							<div class="mod-title">
								<h2>演职人员</h2>
							</div>
							<div class="mod-content">
								<div class="celebrity-container clearfix">

									<!--导演-->
									<c:forEach items="${stuff}" var="s" varStatus="st" >
										<c:if test="${s.fmposition == '导演'}">
											<div class="celebrity-group">
												<div class="celebrity-type">导演</div>
												<ul class="celebrity-list clearfix">
													<li class="celebrity ">
												    <span class="portrait">
												       <img class="default-img" alt="" src="img/stuff/${s.fmaid }.jpg">
												    </span>
														<div class="info">
															<span class="name"> ${s.stname } </span>
														</div></li>
												</ul>
											</div>
										</c:if>
									</c:forEach>

									<!--演职人员-->
									<div class="celebrity-group">
										<div class="celebrity-type">演员</div>
										<ul class="celebrity-list clearfix">
											<!--一个演职人员的列表-->

											<c:forEach items="${stuff}" var="s" varStatus="st" begin="1" end="4">
												<c:if test="${s.fmposition.equals(\"演员\")}">
													<li class="celebrity actor">
												    <span class="portrait">
												        <img class="default-img" alt=""	src="img/stuff/${s.fmaid }.jpg">
												    </span>
														<div class="info">
															<span class="name"> ${s.stname } </span> <br>
															<span class="role">饰：${s.fmrole }</span>
														</div>
													</li>
												</c:if>
											</c:forEach>

										</ul>
									</div>

								</div>
							</div>
						</div>

						<!--图集-->
						<div class="module">
							<div class="mod-title">
								<h2>图集</h2>
							</div>
							<div class="mod-content">
								<div class="album clearfix">
									<!--第一张大图-->
									<c:forEach items="${stills }" var="still" varStatus="st" begin="0" end="0">
										<div class="img1">
											<img onerror=src="img/site/Loading.jpg" alt="" src="img/filmDetail/${still.fdppid}.jpg" />
										</div>
									</c:forEach>

									<!--另外四张小图-->
									<c:forEach items="${stills }" var="still" varStatus="st" begin="1" end="2">
										<div class="img2">
											<img
													onerror=src="img/site/Loading.jpg"
													class="default-img" alt="剧照图集"
													src="img/filmDetail/${still.fdppid}.jpg"/>
										</div>
									</c:forEach>


									<c:forEach items="${stills }" var="still" varStatus="st" begin="3" end="4">
										<div class="img4">
											<img onerror=src="img/site/Loading.jpg" alt="" src="img/filmDetail/${still.fdppid}.jpg"/>
										</div>
									</c:forEach>
								</div>

							</div>
						</div>

						<div class="module">
							<div class="mod-title">
								<h2>热门短评</h2>
							</div>
							<div class="mod-content">
								<div class="comment-list-container" data-hot="10">

									<ul>
										<!--一个用户评论的区域-->
										<c:forEach items="${comments}" var="comment" varStatus="st">
											<li class="comment-container ">
												<!--评论对应的电影-->
												<div class="portrait-container">
													<div class="portrait">
														<img src="img/user/${comment.ucuid}.jpg" alt=""
															 onerror=src="img/site/DefaultUserImg.png" />
													</div>

												</div>
												<div class="main">
													<!--评论头部-->
													<div class="main-header clearfix">
														<!--用户名-->
														<div class="user">
															<span class="name">${comment.uc_uname }</span>
														</div>
														<div class="time">
															<!--评论发表时间-->
															<span>${comment.uctime }</span>

															<!--该用户评分-->
															<ul class="score-star clearfix">

																<c:forEach var="i" begin="1" end="${comment.ucscore/2 }" step="1">
																	<li>
																		<i class="half-star left active"></i>
																		<i class="half-star right active"></i>
																	</li>
																</c:forEach>

																<c:if test="${comment.ucscore % 2 == 1 }">
																	<li>
																		<i class="half-star left active"></i>
																		<i class="half-star right"></i>
																	</li>
																</c:if>

																<c:forEach var="i" begin="1" end="${(10-comment.ucscore)/2 }" step="1">
																	<li>
																		<i class="half-star left"></i>
																		<i class="half-star right"></i>
																	</li>
																</c:forEach>
															</ul>

														</div>

													</div>
													<!--评论的内容-->
													<div class="comment-content">${comment.uccontent }</div>
												</div>
												<div class="body-mask"></div>
											</li>
										</c:forEach>
									</ul>
								</div>

								<button class="comment-entry">发表评论</button>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="comment-form-container" class="jBox-wrapper jBox-Modal jBox-Default" tabindex="-1"
	 style="position: fixed; display: none; opacity: 1; z-index: 10000; left: 50%; top: 50%; margin-left: -285px; margin-top: -235px;">
	<div class="jBox-container">
		<div class="jBox-content" style="width: 550px; height: 450px;">
			<form id="comment-form" method="post" onsubmit="return addComment();">
				<div class="score-msg-container">
					<div class="score"><span class="num">3</span>分</div>
					<div class="score-message">比较差</div>
					<div class="no-score">
						请点击星星评分
					</div>
				</div>
				<div class="score-star-contaienr">
					<ul class="score-star clearfix submit-star" data-score="">
						<li>
							<i class="half-star left" score="1"></i><i class="half-star right" score="2"></i>
						</li>
						<li>
							<i class="half-star left" score="3"></i><i class="half-star right" score="4"></i>
						</li>
						<li>
							<i class="half-star left" score="5"></i><i class="half-star right" score="6"></i>
						</li>
						<li>
							<i class="half-star left" score="7"></i><i class="half-star right" score="8"></i>
						</li>
						<li>
							<i class="half-star left" score="9"></i><i class="half-star right" score="10"></i>
						</li>
					</ul>

				</div>
				<div class="content-container">
					<textarea placeholder="快来说说你的看法吧" class="submit_text" name="content" cols="30" rows="10"></textarea>
					<span class="word-count-info"></span>
				</div>
				<input class="submit_score" type="hidden" name="score" value="0">
				<input class="btn disabled submit_btn" type="submit" value="提交"/>
			</form>
			<div class="close">×</div>
		</div>
	</div>
</div>
</body>
</html>
