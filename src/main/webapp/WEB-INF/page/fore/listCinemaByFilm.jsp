<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/fore/navigator.jsp"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<head>
	<title>${film.fname_cn }_特惠购票</title>

	<link rel="stylesheet" href="css/fore/fore.css" />
	<link rel="stylesheet" href="css/fore/listCinemaByFilm.css" />
	<script src="js/jquery/2.0.0/jquery.min.js"></script>
	<script src="js/jquery/jquery.form.js"></script>
	
		<style type="text/css">
		    .mycontainer {
		        width:1000px;
		    }
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
				         fid: '${film.fid}',
				    },
					function(result) {
				    	 if(result=="true") {
				    		 var score_mes = message['${usercomment.ucscore}'-1];
					    		$('.score-btn').addClass("active");		
					    		$('.score-btn-msg').text("${usercomment.ucscore}分，" + score_mes);					  
					    		$('.score-btn').off("click");
				    	 }
					});
	    })
	</script>
	<script>
		function addComment() {	
			var ucuid = '${user.uid}';
		    var ucfid = '${film.fid}';
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
				<div class="avatar-shadow">
					<img class="avatar"
						src="img/filmSignal/${film.fid }.jpg"
						alt="${film.fname_cn }海报封面">
					<div class="movie-ver"></div>
				</div>
			</div>
			<div class="celeInfo-right clearfix">
				<div class="movie-brief-container">
					<h1 class="name">${film.fname_cn }</h1>
					<div class="ename ellipsis">${film.fname_en }</div>
					<ul>
						<li class="ellipsis">
							<c:forEach items="${types}" var="type" varStatus="st">
					           <a class="text-link" href="listFilm?showType=在映&typeId=${type.fttid }&region=&orderType=" target="_blank"> ${type.tname }</a> 
						    </c:forEach>
						</li>
						<li class="ellipsis">
							${film.fregion }
							/ ${film.flength }分钟
						</li>
						<li class="ellipsis">${film.freleasetime }&nbsp中国大陆上映</li>
					</ul>
				</div>
				<div class="action-buyBtn">
					<div class="action clearfix">					
						<a href="#nowhere" id="wishFilm"
					       <c:if test="${islike==true }">class="wish active"</c:if>
					       <c:if test="${islike==false }">class="wish"</c:if>
					        onclick="likeFilm(${user.uid}, ${film.fid})">
						    <div>
							    <i class="icon wish-icon"></i>
							    <span class="wish-msg">
									<c:if test="${islike==true }">已想看</c:if>
									<c:if test="${islike==false }">想看</c:if>
								</span>
						    </div>
					    </a>
						<a class="score-btn " data-bid="b_rxxpcgwd">
							<div>
								<i class="icon score-btn-icon"></i>
								<span class="score-btn-msg" data-act="comment-open-click">
									评分
								</span>
							</div>
						</a>
					</div>
					<a class="btn buy" href="filmDetail?fid=${film.fid }" target="_blank">查看更多电影详情</a>
				</div>

				<div class="movie-stats-container">

					<div class="movie-index">
						<p class="movie-index-title">电影口碑</p>
						<div class="movie-index-content score normal-score">
						    <fmt:formatNumber value="${film.fscore }" var="score" pattern="0.0" maxFractionDigits="1"/>
							<span class="index-left info-num "><span class="stonefont">${score }</span></span>
						</div>
					</div>

					<div class="movie-index">
						<p class="movie-index-title">累计票房</p>
						<div class="movie-index-content box">
						    <fmt:formatNumber value="${film.fboxoffice }" var="boxoffice" pattern="0.00" maxFractionDigits="2"/>
							<span class="stonefont">${boxoffice }</span><span class="unit">万</span>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<div class="container mycontainer" id="app">
		<div class="tags-panel">
			<ul class="tags-lines">
				<li class="tags-line">
					<div class="tags-title">日期:</div>
					<ul class="tags">
						<li <c:if test="${date.equals(ldate[0])}">class="active"</c:if>>
							<a href="?fid=1&date=${ldate[0] }">
								${sdate[0] }
							</a>
						</li>
						<li <c:if test="${date.equals(ldate[1])}">class="active"</c:if> >
							<a href="?fid=1&date=${ldate[1] }">
								${sdate[1] }
							</a>
						</li>
						<li <c:if test="${date.equals(ldate[2])}">class="active"</c:if>>
							<a href="?fid=1&date=${ldate[2] }">
								${sdate[2] }
							</a>
						</li>
						<li <c:if test="${date.equals(ldate[3])}">class="active"</c:if>>
							<a href="?fid=1&date=${ldate[3] }">
								${sdate[3] }
							</a>
						</li>
						<li <c:if test="${date.equals(ldate[4])}">class="active"</c:if>>
							<a href="?fid=1&date=${ldate[4] }">
								${sdate[4] }
							</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>

		<div class="cinemas-list">
			<h2 class="cinemas-list-header">
				<span>影院列表</span>
			</h2>
            <c:forEach items="${cinemas }" var="cinema" varStatus="st">
			<div class="cinema-cell">
				<div class="cinema-info">
					<a href="selectSession?cid=${cinema.cid }&fid=${film.fid}" class="cinema-name">${cinema.cname }</a>
					<p class="cinema-address">地址：${cinema.clocation }</p>
				</div>

				<div class="buy-btn">
					<a href="selectSession?cid=${cinema.cid}&fid=${film.fid}">选座购票</a>
				</div>
			</div>
		
			</c:forEach>
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

	<div class="footer">
	</div>

</body>
</html>
