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
<title>Insert title here</title>
<style type="text/css">
#d121 {
	width: 97%;
}

#Navi {
	border-radius: 0.5em;
	border: 1px solid #337ab7;
}
#d1211 {
	height: 575px;
}

#addb {
	height: 690px;
}

#s4{
position: absolute;
	top: 20%;
	left:80%;
}
#td3{
width:120px;
}
</style>
</head>
<body>
<div id="B">

		<div id="d11">

			<a href="#"><span id="s1" class="glyphicon glyphicon-menu-right"
				style="line-height: 20px"><font id="f6">Seats Status</font></span> </a>
		</div>
		
		<div id="d12">
			<div id="d121">
				<div id="d1211">
					<table align='center' style="margin-top:20px">
						<tbody>
							<c:forEach items="${as }" var="a" varStatus="st">
								<c:if test="${st.count % 8 == '1'}">
									<tr>
								</c:if>
								<c:if test="${st.count % 8 == '5'}">
									<td>
										&nbsp;&nbsp;&nbsp;
									</td>
									<td>
										&nbsp;&nbsp;&nbsp;
									</td>
									<td>
										&nbsp;&nbsp;&nbsp;
									</td>
								</c:if>
								<td>
								<c:if test="${a == 0}">
									<img src="img/0.png" height="30px"/>
								</c:if>
								<c:if test="${a == 1}">
									<img src="img/1.png"  height="30px"/>
								</c:if>
								<td>
								<c:if test="${st.count % 8 == '0'}">
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
						
					</table>
				</div>
			</div>
		</div>

	</div>
	<div id="addl"></div>
<div id="Navi">
	<ul class="nav nav-pills nav-stacked">
		<li role="presentation"><a href="admin_listUser">User Management</a></li>
		<li role="presentation"><a href="admin_listFilm">Film Management</a></li>
		<li role="presentation"><a href="admin_listStuff">Staff Management</a></li>
		<li role="presentation"><a href="admin_listCinema"><font>Cinema Management</font></a></li>
		<li role="presentation" class="active"><a href="admin_listSession">Session Management</a></li>
		<li role="presentation"><a href="admin_listOrder">Order Management</a></li>
		<li role="presentation"><a href="admin_listUserComment">Comment Management</a></li>
	</ul>
</div>
	<div id="addb"></div>
</body>
</html>