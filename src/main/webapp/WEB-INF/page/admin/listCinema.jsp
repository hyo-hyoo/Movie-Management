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
	function edit(this1){
		var cid=$(this1).parents("tr").find("#cid").text();
		var cname=$(this1).parents("tr").find("#cname").text();
		var clocation=$(this1).parents("tr").find("#clocation").text();
		var ctel=$(this1).parents("tr").find("#ctel").text();
		
		var a=document.getElementById("cid");
		var b=document.getElementById("cname");
		var c=document.getElementById("clocation");
		var d=document.getElementById("ctel");
		
		a.value=cid;
		b.value=cname;
		c.value=clocation;
		d.value=ctel;
	}
</script>
<link
	href="https://how2j.cn/study/css/bootstrap/3.3.6/bootstrap.min.css"
	rel="stylesheet">
<script src="https://how2j.cn/study/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Cinema Management</title>
<style type="text/css">
#Navi {
	border-radius: 0.5em;
	border: 1px solid #337ab7;
}
#d1211 {
	height: 575px;
}

#d121 {
	width: 97%;
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
				<span id="s1" class="glyphicon glyphicon-menu-right" style="line-height:20px"><font id="f6">Cinema Management</font></span>
				<span id="s4"><button type="button" data-toggle="modal" data-target="#addCinema" onclick="">AddCinema</button></span>
			</div>
			<div id="d12">
				<div id="d121">
					<div id="d1211">
						<form>
							<table class="table table-striped table-bordered table-hover  table-condensed">
			  					<thead>
			  						<tr>
									     <th style="text-align:center;">Cinema ID</th>
									     <th style="text-align:center; width: 20%;">Cinema Name</th>
									     <th style="text-align:center; width: 35%;">Address</th>
									     <th style="text-align:center; width: 15%;">Tel</th>
									     <th style="text-align:center;">Operation</th>
			     					</tr>
			  					</thead>
			  					<tbody>
									<c:forEach items="${cs}" var="c" varStatus="st">
										<tr>
											<td id="cid">${c.cid}</td>
											<td id="cname">${c.cname}</td>
											<td id="clocation">${c.clocation}</td>
											<td id="ctel">${c.ctel}</td>
											<td>
												<button type="button"  data-toggle="modal" data-target="#updateCinema" onclick="edit(this)">Modify</button>
												<a href="admin_deleteCinema?cid=${c.cid}" style="color:black"><button type="button">Delete</button></a>
												<a href="admin_listHallByCinema?cid=${c.cid}" style="color:black"><button type="button">Hall Management</button></a>
											</td>
										</tr>
									</c:forEach>
			
			  					</tbody>
							</table>
						</form>
					</div>
					<div align='center' id="1212" >
						<%@ include file="../include/admin/adminPage.jsp" %>
					</div>
				</div>
			</div>
	</div>
	<div id="addl">
	</div>
	<div id="Navi">
		<ul class="nav nav-pills nav-stacked">
		  <li role="presentation"><a href="admin_listUser">User Management</a></li>
		  <li role="presentation"><a href="admin_listFilm">Film Management</a></li>
		  <li role="presentation"><a href="admin_listStuff">Staff Management</a></li>
		  <li role="presentation" class="active"><a href="admin_listCinema"><font>Cinema Management</font></a></li>
		  <li role="presentation"><a href="admin_listSession">Session Management</a></li>
		  <li role="presentation"><a href="admin_listOrder">Order Management</a></li>
		  <li role="presentation"><a href="admin_listUserComment">Comment Management</a></li>
		</ul>
		</div>
	<div id="addb"></div>
</body>
</html>