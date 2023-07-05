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

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#Navi {
	border-radius: 0.5em;
	border: 1px solid #337ab7;
}
#textarea1 {
	resize: none;
}
#addb {
	height: 1690px;
}
#picchoose {
	margin-top: 20px;
	position:relative;
}

#posterchoose {
	width: 40%;
	position:absolute;
	left:13%;
}

#allchoose {
	width: 40%;

	position:absolute;
	left:45%;
}

.td3 {
	width: 75px;
}
#button2{
margin-top:10px;
}
#addposter{
width:150px;
}
#typeman{

	margin-top: 560px;
	position:relative;
}
#typechoose{
width: 40%;
position:absolute;
	left:8%;
}
#stuffchoose{
width: 40%;
position:absolute;
left:51%;
}
#stufftext{
width:120px;
}
</style>
</head>
<body>
	<div id="B">

		<div id="d11">

			<a href="#"><span id="s1" class="glyphicon glyphicon-menu-right"
				style="line-height: 20px"><font id="f6">Film Management</font></span> </a> <span
				id="s4">
				
			</span>
		</div>
		<div id="d12">
			<div id="d121">
				<center>
					<h3>Film Information</h3>
				</center>
				<div id="d1211">
						<center>
							<div>
							<form action="admin_updateFilm">
								<table class="tb2">
								<tr>
									<td class="td2">Film ID</td>
									<td class="td2"><input type="text" class="form-control" value = "${f.fid}" disabled>
													<input type="hidden" class="form-control" name="fid" value = "${f.fid}"></td>
								</tr>
								<tr>
									<td class="td2">Chinese Name</td>
									<td class="td2"><input type="text" class="form-control" name="fname_cn" value="${f.fname_cn }"></td>
								</tr>
								<tr>
									<td class="td2">English Name</td>
									<td class="td2"><input type="text" class="form-control" name="fname_en" value="${f.fname_en }"></td>
								</tr>
								<tr>
									<td class="td2">Region</td>
									<td class="td2"><input type="text" class="form-control" name="fregion" value="${f.fregion }"></td>
								</tr>
								<tr>
									<td class="td2">Release Time</td>
									<td class="td2"><input type="text" class="form-control" name="freleasetime" value="${f.freleasetime }"></td>
								</tr>
								<tr>
									<td class="td2">Duration</td>
									<td class="td2"><input type="text" class="form-control" name="flength" value="${f.flength }"></td>
								</tr>
								<tr>
									<td class="td2">Status</td>
									<td class="td2"><input type="text" class="form-control" name="fstate" value="${f.fstate }"></td>
								</tr>
								<tr>
									<td class="td2">Synopsis</td>
									<td class="td2"><textarea rows=5 cols=50 name="fprofile">${f.fprofile }</textarea>
									</td>
								</tr>
							</table>
							

								<div align="center" id="div12111">
									<button type="submit" class="btn btn-primary" id="button2">Submit</button>
								</div>
							</form>	
							</div>
							
							
							<div id="picchoose">
								<form method="post" id="editForm" action="admin_updateFilmImageSignal" enctype="multipart/form-data">
									<div id="posterchoose">
										<table class="tb2">
											<tr>
												<td colspan="2" class="td2">Modify Poster</td>
												<input type="hidden" class="form-control" name="fid" value = "${f.fid}">
											</tr>
											<tr>
												<td class="td2">Poster</td>
												<td class="td2">Operation</td>
											</tr>
											<tr>
												<td class="td2"><img alt="" src="img/filmSignal/${f.fid}.jpg"
													height="135" width="105"></td>
												<td class="td2"><input id="categoryPic" accept="image/*" type="file" name="image" /></td>
											</tr>
										</table>
										<div align="center">
											<button type="submit" class="btn btn-primary" id="button2">Submit</button>
										</div>
									</div>
								</form>
								
								<form method="post" id="editForm" action="admin_updateFilmImageDetail" enctype="multipart/form-data">
									<div id="allchoose">
										<table class="tb2">
										<tr>
												<td class="td2 td3">AddPicture</td>
												<td class="td2 td3" colspan="2"><input id="categoryPic" accept="image/*" type="file" name="image" /></td>
												<input type="hidden" class="form-control" name="fdpfid" value = "${f.fid}">
											</tr>
											<tr>
												<td class="td2 td3">Number</td>
												<td class="td2 td3">Picture</td>
												<td class="td2 td3">Operation</td>
											</tr>
											<c:forEach items="${fdps}" var="fdp" varStatus="st">
												<tr>
													<td class="td2">${st.count }</td>
													<td class="td2"><img alt="" src="img/filmDetail/${fdp.fdppid }.jpg"
														 height="80"></td>
													<td class="td2"><a href="admin_deleteFilmImageDetial?fdppid=${fdp.fdppid }&fdpfid=${fdp.fdpfid }">Delete</a></td>
												</tr>
											</c:forEach>
										</table>
										<div align="center">
											<button type="submit" class="btn btn-primary" id="button2">Submit</button>
										</div>
									</div>
								</form>
							</div>
							<div id="typeman">
								<div id="typechoose">
									<form action="admin_addFilmType">
										<input type="hidden" class="form-control" name="ftfid" value = "${f.fid}">
										Type：<input type="text" name="fttid" >
										<button type="submit">Add</button>
									</form>
									<table class="tb2">
										<tr>
											<td class="td2" width="87px">Number</td>
											<td class="td2" width="87px">Type Name</td>
											<td class="td2" width="87px">Operation</td>
										</tr>
										<c:forEach items="${fts}" var="ft" varStatus="st">
												<tr>
													<td class="td2">${st.count }</td>
													<td class="td2">${ft.tname }</td>
													<td class="td2"><a href="admin_deleteFilmType?ftfid=${f.fid }&fttid=${ft.fttid}"><button class="btn btn-default">Delete</button></a></td>
												</tr>
											</c:forEach>
									</table>
								</div>
							<div id="stuffchoose">
							<form action="admin_addFilmMade">
								<input type="hidden" name="fmfid" value = "${f.fid}">
									<table class="tb2">	
										<tr>
											<td class="td2">Staff ID</td>
											<td class="td2"><input type="text" name="fmaid" ><td>
										</tr>
										<tr>
											<td class="td2">Position</td>
											<td class="td2"><input type="text" name="fmposition" ></td>
											
										</tr>
										<tr>
											<td class="td2">Character</td>
											<td class="td2"><input type="text" name="fmrole" /></td>
										</tr>
										<tr>
											<td class="td2" colspan="2"><button type="submit">Add</button></td>
										</tr>
									</table>
							</form>
								<table class="tb2">
										<tr>
											<td class="td2">Staff photo</td>
											<td class="td2">Position</td>
											<td class="td2">Character</td>
											<td class="td2">Operation</td>
										</tr>
										<c:forEach items="${fms}" var="fm" varStatus="st">
											<tr>
												<td class="td2"><img alt="" src="img/stuff/${fm.fmaid }.jpg" height="80"></td>
												<td class="td2">${fm.fmposition }</td>
												<td class="td2">${fm.fmrole }</td>
												<td class="td2"><a href="admin_deleteFilmMade?fmaid=${fm.fmaid }&fmfid=${fm.fmfid }"><button class="btn btn-default">Delete</button></a></td>
											</tr>
										</c:forEach>
									</table>
							</div>
							</div>
						</center>

				</div>
				<div align='center' id="1212"></div>
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
	<%-- 	<%@ include file="adminFooter.jsp"%> --%>
</body>
</html>