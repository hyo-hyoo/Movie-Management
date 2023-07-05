<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/admin/adminTop.jsp"%>
<%@ include file="../include/admin/win.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/bom/bom.css" type="text/css">
<script src="js/jquery/2.0.0/jquery.min.js"></script>
<link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>

<script>
	function register() {
		alert("删除成功");
	}
</script>
<link
	href="https://how2j.cn/study/css/bootstrap/3.3.6/bootstrap.min.css"
	rel="stylesheet">
<script src="https://how2j.cn/study/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Film Management</title>
<style type="text/css">
/* #main22{ */
/* width:81%; */
/* } */
#Navi {
	border-radius: 0.5em;
	border: 1px solid #337ab7;
}
#addb {
	height: 690px;
}
#main22{
	position: relative;
	top: 10px;
width:100%;
}
#main22 ul {
				list-style: none;
			}
#main22 ul li {
				float: left;
				width: 160px;
				text-align: center;
				margin: 12px 10px;
				overflow: hidden;
				background:#F0F8FF;
			}
#main22 ul li a {
				text-decoration: none;
				color: black;
			}
#poster1{
margin-top:5px;
}
#fbutton1{
margin-top:5px;
margin-bottom:5px;
}
#fbutton2{
margin-bottom:5px;
}
</style>
</head>
<body>
	<div id="B">

		<div id="d11">

			<a href="#"><span id="s1" class="glyphicon glyphicon-menu-right"
				style="line-height: 20px"><font id="f6">Film Management</font></span></a>
			<button id="button1" type="button" data-toggle="modal"
				data-target="#addFilm">AddFilm</button>
		</div>
		<div id="d12">
			<div id="d121">
				<div id="d1211">
				<div id="main22">
							<ul>
								<c:forEach items="${fs}" var="f" varStatus="st">
									<li><img src="img/filmSignal/${f.fid }.jpg" height="180" width="140" id="poster1"/>
										<div>
											<a href="admin_toUpdateFilm?fid=${f.fid }" style="color:black"><button type="button" id="fbutton1">Modify</button></a>
		 									<a href="admin_deleteFilm?fid=${f.fid }" style="color:black"><button type="button" id="fbutton2">Delete</button></a>
		 								</div>
									</li>
								</c:forEach>
							</ul>
							</div>
							
				</div>
				<div align="center" id="1212">
					<%@ include file="../include/admin/adminPage.jsp"%>
				</div>
			</div>

		</div>

	</div>
	<div id="addl"></div>
	<div id="Navi">
		<ul class="nav nav-pills nav-stacked">
			<li role="presentation"><a href="admin_listUser">User Management</a></li>
			<li role="presentation" class="active"><a href="admin_listFilm">Film Management</a></li>
			<li role="presentation"><a href="admin_listStuff">Staff Management</a></li>
			<li role="presentation"><a href="admin_listCinema"><font>Cinema Management</font></a></li>
			<li role="presentation"><a href="admin_listSession">Session Management</a></li>
			<li role="presentation"><a href="admin_listOrder">Order Management</a></li>
			<li role="presentation"><a href="admin_listUserComment">Comment Management</a></li>
		</ul>
	</div>
	<div id="addb"></div>
</body>
</html>