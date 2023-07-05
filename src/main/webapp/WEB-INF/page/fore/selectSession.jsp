<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.SimpleDateFormat"
import = "java.util.Date" import = "java.util.Calendar"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/fore/navigator.jsp"%>
<html>
	<head>
		<title>${cinema.cname }_选择场次</title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="css/fore/fore.css" />
		<link rel="stylesheet" href="css/fore/selectSession.css" />
		<script src="js/jquery/2.0.0/jquery.min.js"></script>
	    <script src="js/jquery/jquery.form.js"></script>
		
		<style>
		    a:hover {
		        text-decoration: none;
		    }
		</style>
		
	
		<script>
			$(document).ready(function() {
			    var date_item = new Array();
			    var count = [0,0,0,0,0];
			    			    
			    for(var i=0; i<5; i++) {
			    	var cal = new Date();
			    	cal.setDate(cal.getDate()+i);
			    	date_item.push(cal);
			    	var month = cal.getMonth() + 1;
			    	var date = cal.getDate();
			    	var day = cal.getDay();	
			    	var text = "";
	                if(i==0)    text = "今天 ";
	                else if(i==1)    text = "明天 ";
	                else {
	                	switch(day) {
	                	    case 0: text = "周日 ";
	                	    break;
	                	    case 1: text = "周一 ";
	                	    break;
	                	    case 2: text = "周二 ";
	                	    break;
	                	    case 3: text = "周三 ";
	                	    break;
	                	    case 4: text = "周四 ";
	                	    break;
	                	    case 5: text = "周五 ";
	                	    break;
	                	    case 6: text = "周六 ";
	                	    break;
	                	}
	                }
	                
			    	var span = $("<span class='date-item'></span").text(text + month+"月"+date+"日");
			    	span.attr('index', i);
			    	if(i==0) {
			    		span.addClass("active");
			    		$('.plist-container').eq(i).addClass('active');
			    	}
			    	$('.show-date').append(span);  	    	
			    }
			    
			    $('.date-item').click(function(){
			    	$(this).addClass('active');
			    	$(this).siblings().removeClass('active');
			    	
					var index = $(this).attr("index");
					$('.plist-container').eq(index).addClass('active');
					$('.plist-container').eq(index).siblings().removeClass('active');	
				});
			    
			    <c:forEach items="${sessions}" var="session">
		    	    var str1 = '${session.stime.substring(0, 10)}';
		    	    var sdate1 = str1.split("-");
		    	    var str2 = '${session.stime.substring(11, 16)}';
		    	    var sdate2 = str2.split(":");
		    	    var sdate = new Date(sdate1[0], sdate1[1]-1, sdate1[2], sdate2[0], sdate2 [1]);
		    	    
		    	    for(var i=0; i<5; i++) {
		    		    if(date_item[i].getMonth()+1==sdate1[1] && date_item[i].getDate()==sdate1[2]) {
		    		    	count[i] += 1; 
		    		    	var tr;
		    		    	if(count[i]%2==0)    tr = '<tr class="even">';
		    		    	else    tr = '<tr>';
		    				var html = tr 
		    		    		+ '<td><span class="begin-time">'+str2+'</span><br />'
		    					+'<td><span class="lang">国语</span></td>'
		    					+'<td><span class="hall">${session.shid }号厅</span></td>'
		    					+'<td><span class="sell-price"><span class="stonefont">${session.sprice }</span></span></td>'							
		    					+'<td><a href="chooseSeats?sid=${session.sid }" class="buy-btn normal">选座购票</a></td>'
		    				+'</tr>';
		    		    	$('.plist-container tbody').eq(i).append(html); 
		    		    }
		    	    }
		
		    </c:forEach>
		    
		    
			});
			</script>
	</head>
	<body>
	<c:set var="current" value="<%=new java.util.Date()%>" />
	<fmt:formatDate value="${current}" var="date" pattern="yyyy-MM-dd"/>
		<div class="banner cinema-banner">
			<div class="wrapper clearfix">
				<div class="cinema-left">
					<div class="avatar-shadow">
						<img class="avatar" src="img/site/CinemaPic.jpg" alt="${cinema.cname }" />
					</div>
				</div>
				<div class="cinema-main clearfix">
					<div class="cinema-brief-container">
						<h1 class="name text-ellipsis">${cinema.cname }</h1>
						<div class="address text-ellipsis">${cinema.clocation }</div>
						<div class="telphone">电话：${cinema.ctel }</div>
					</div>
				</div>
			</div>
		</div>
 
		<div class="container" id="app" class="page-cinemas/cinema">
			<div class="crumbs-nav-container">
				<a href='mainPage'>DogeMovie</a> &gt;
				<a href='listCinemas'>影院</a> &gt; <span>${cinema.cname }</span>
			</div>
			<div class="movie-list-container">
				<div class="movie-list">
					<c:forEach items="${films}" var="film" varStatus="st">
						<c:if test="${film.fid==f.fid }">
							<div class="movie active">
								<img src="img/filmSignal/${film.fid }.jpg" alt="${film.fname_cn }" />
							</div>
						</c:if>

						<c:if test="${film.fid!=f.fid }">
							<a href="?cid=${cinema.cid}&fid=${film.fid}">
								<div class="movie">
									<img src="img/filmSignal/${film.fid }.jpg" alt="${film.fname_cn }" />
								</div>
							</a>
						</c:if>

					</c:forEach>

					<span class="pointer"></span>
				</div>

				<span class="scroll-prev scroll-btn"></span>
				<span class="scroll-next scroll-btn"></span>
			</div>

			<div class="show-list active" data-index="0">
				<div class="movie-info">
					<div>
						<h2 class="movie-name">${f.fname_cn }</h2>
						<fmt:formatNumber value="${f.fscore }" var="score" pattern="0.0"/>
						<span class="score">${score }</span>
					</div>
					<div class="movie-desc">
						<div>
							<span class="key">时长 :</span>
							<span class="value">${f.flength }分钟</span>
						</div>
					</div>
				</div>

				<div class="show-date">
					<span>观影时间 :</span>
				</div>

				<div class="plist-container">
					<table class="plist">
						<thead>
							<tr>
								<th>放映时间</th>
								<th>语言版本</th>
								<th>放映厅</th>
								<th>售价（元）</th>
								<th>选座购票</th>
							</tr>
						</thead>	
						<tbody>
						</tbody>
					</table>
				</div>
				
				<div class="plist-container">
					<table class="plist">
						<thead>
							<tr>
								<th>放映时间</th>
								<th>语言版本</th>
								<th>放映厅</th>
								<th>售价（元）</th>
								<th>选座购票</th>
							</tr>
						</thead>	
						<tbody>
						</tbody>
					</table>
				</div>
				<div class="plist-container">
					<table class="plist">
						<thead>
							<tr>
								<th>放映时间</th>
								<th>语言版本</th>
								<th>放映厅</th>
								<th>售价（元）</th>
								<th>选座购票</th>
							</tr>
						</thead>	
						<tbody>
						</tbody>
					</table>
				</div>
				<div class="plist-container">
					<table class="plist">
						<thead>
							<tr>
								<th>放映时间</th>
								<th>语言版本</th>
								<th>放映厅</th>
								<th>售价（元）</th>
								<th>选座购票</th>
							</tr>
						</thead>	
						<tbody>
						</tbody>
					</table>
				</div>
				<div class="plist-container">
					<table class="plist">
						<thead>
							<tr>
								<th>放映时间</th>
								<th>语言版本</th>
								<th>放映厅</th>
								<th>售价（元）</th>
								<th>选座购票</th>
							</tr>
						</thead>	
						<tbody>
						</tbody>
					</table>
				</div>
				
				
			</div>

			<div class="big-map-modal" style="display: none">
				<div class="close-map"></div>
				<div class="big-map"></div>
			</div>
		</div>

		<div class="footer">
		</div>

		<script crossorigin="anonymous"
			src="//s3plus.meituan.net/v1/mss_e2821d7f0cfe4ac1bf9202ecf9590e67/cdn-prod/file:5788b470/common.2ec874f3.js">
		</script>
		<script crossorigin="anonymous"
			src="//s3plus.meituan.net/v1/mss_e2821d7f0cfe4ac1bf9202ecf9590e67/cdn-prod/file:5788b470/cinemas-cinema.9c22ccaf.js">
		</script>
	</body>
</html>
