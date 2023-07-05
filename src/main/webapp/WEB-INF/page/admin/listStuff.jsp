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
		var stid=$(this1).parents("tr").find("#stid").text();
		
		var a=document.getElementById("stid");
		
		a.value=stid;
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
<span id="s1" class="glyphicon glyphicon-menu-right" style="line-height:20px"><font id="f6">Staff Management</font></span>
<span id="s4"><button type="button"  data-toggle="modal" data-target="#addStuff" onclick="edit(this)">AddStaff</button></span>
</div>
<div id="d12">
<div id="d121">
<div id="d1211">
<form>
<table class="table table-striped table-bordered table-hover  table-condensed">
  <thead>
  <tr>
     <th style="text-align:center; width: 33%;">Staff ID</th>
     <th style="text-align:center; width: 33%;">Name</th>
     <th style="text-align:center;">Operation</th>
     </tr>
  </thead>
  <tbody>
 <c:forEach items="${sts}" var="s" varStatus="st">
	<tr>
		<td id="stid">${s.stid}</td>
		<td>${s.stname}</td>
		<td>
		<button type="button"  data-toggle="modal" data-target="#updateStuffImage" onclick="edit(this)">Edit photo</button>
		<a href="admin_deleteStuff?stid=${s.stid}" style="color:black"><input type=button value="Delete" ></a>
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
        <li role="presentation" class="active"><a href="admin_listStuff">Staff Management</a></li>
        <li role="presentation"><a href="admin_listCinema"><font>Cinema Management</font></a></li>
        <li role="presentation"><a href="admin_listSession">Session Management</a></li>
        <li role="presentation"><a href="admin_listOrder">Order Management</a></li>
        <li role="presentation"><a href="admin_listUserComment">Comment Management</a></li>
    </ul>
</div>
<div id="addb"></div>
</body>
</html>