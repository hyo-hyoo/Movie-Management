<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>											
<!-- 修改用户 -->
<div class="modal " id="updateUser" tabindex="-1" role="dialog"
												aria-labelledby="myModalLabel">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button data-dismiss="modal" class="close" type="button">
																<span aria-hidden="true">×</span><span class="sr-only">Close</span>
															</button>
															<h4 class="modal-title">Modify User Information</h4>
														</div>
														<div class="modal-body">
															<form action="admin_updateUser">
																<center>
																	<table class="tb2">
																	<tr>
																			<td class="td2">User ID</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="uid1" name="uid"></td>
																		</tr>
																		<tr>
																			<td class="td2">User Name</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="uname1" name="uname"></td>
																		</tr>
																		<tr>
																			<td class="td2">Password</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="upassword1" name="upassword"></td>
																		</tr>
																		<tr>
																			<td class="td2">Email</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="uemail1" name="uemail"></td>
																		</tr>
																		<tr>
																			<td class="td2">Tel</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="utel1" name="utel"></td>
																		</tr>

																	</table>
																</center>
																
																<br>
																<input type = "submit" value = "Update" />
															</form>
														</div>
													</div>
													<!-- /.modal-content -->
												</div>
												<!-- /.modal-dialog -->
											</div>

<!-- 添加电影 -->
<div class="modal " id="addFilm" tabindex="-1" role="dialog"
												aria-labelledby="myModalLabel">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button data-dismiss="modal" class="close" type="button">
																<span aria-hidden="true">×</span><span class="sr-only">Close</span>
															</button>
															<h4 class="modal-title">AddFilm</h4>
														</div>
														<div class="modal-body">
															<form action="admin_addFilm">
																<center>
																	<table class="tb2">
																	<tr>
																			<td class="td2">Chinese Name</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="fname_cn" name="fname_cn"></td>
																		</tr>
																		<tr>
																			<td class="td2">English Name</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="fname_en" name="fname_en"></td>
																		</tr>
																		<tr>
																			<td class="td2">Synopsis</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="fprofile" name="fprofile"></td>
																		</tr>
																		<tr>
																			<td class="td2">Region</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="fregion" name="fregion"></td>
																		</tr>
																		<tr>
																			<td class="td2">Release Time</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="freleasetime" name="freleasetime"></td>
																		</tr>
																		<tr>
																			<td class="td2">Duration</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="flength" name="flength"></td>
																		</tr>
																		<tr>
																			<td class="td2">Status</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="fstate" name="fstate"></td>
																		</tr>

																	</table>
																</center>
																
																<br>
																<input type = "submit" value = "Submit" />
															</form>
														</div>
													</div>
													<!-- /.modal-content -->
												</div>
												<!-- /.modal-dialog -->
											</div>

<!-- 修改电影 -->
<div class="modal " id="updateFilm" tabindex="-1" role="dialog"
												aria-labelledby="myModalLabel">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button data-dismiss="modal" class="close" type="button">
																<span aria-hidden="true">×</span><span class="sr-only">Close</span>
															</button>
															<h4 class="modal-title">Modify Film Information</h4>
														</div>
														<div class="modal-body">
																<center>
																	<table class="tb2">
																	<tr>
																			<td class="td2"><a href="admin_toUpdateFilm?fid=" style="color:black"><button type="button">Modify</button></a></td>
																		</tr>
																		<tr>
																			<td class="td2">asd</script></td>
																		</tr>
																		<tr>
																			<td class="td2">Synopsis</td>
																		</tr>
																		<tr>
																			<td class="td2">Region</td>
																		</tr>
																	</table>
																</center>
														</div>
													</div>
												</div>
											</div>

<!-- 添加演职人员 -->
<div class="modal " id="addStuff" tabindex="-1" role="dialog"
												aria-labelledby="myModalLabel">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button data-dismiss="modal" class="close" type="button">
																<span aria-hidden="true">×</span><span class="sr-only">Close</span>
															</button>
															<h4 class="modal-title">添加演职人员信息</h4>
														</div>
														<div class="modal-body">
															<form action="admin_addStuff">
																<center>
																	<table class="tb2">
																		<tr>
																			<td class="td2">姓名</td>
																			<td class="td2"><input type="text"
																				class="form-control" name="stname"></td>
																		</tr>
																	</table>
																</center>
																
																<br>
																<input type = "submit" value = "添加" />
															</form>
														</div>
													</div>
													<!-- /.modal-content -->
												</div>
												<!-- /.modal-dialog -->
											</div>
											
<!-- 编辑演职人员 -->
<div class="modal " id="updateStuffImage" tabindex="-1" role="dialog"
												aria-labelledby="myModalLabel">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button data-dismiss="modal" class="close" type="button">
																<span aria-hidden="true">×</span><span class="sr-only">Close</span>
															</button>
															<h4 class="modal-title">编辑演职人员照片</h4>
														</div>
														<div class="modal-body">
															<form method="post" id="editForm" action="admin_updateStuffImage" enctype="multipart/form-data">
																<center>
																	<table class="tb2">
																		<tr>
																			<td class="td2">演职人员ID</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="stid" name="stid"  readonly unselectable="on"></td>
																		</tr>
																		<tr>
																			<td class="td2">修改图片</td>
																			<td class="td2"><input id="categoryPic" accept="image/*" type="file" name="image" /></td>
																		</tr>
																	</table>
																</center>
																
																<br>
																<input type = "submit" value = "添加" />
															</form>
														</div>
													</div>
													<!-- /.modal-content -->
												</div>
												<!-- /.modal-dialog -->
											</div>
											
<!--编辑影院 -->
<div class="modal " id="updateCinema" tabindex="-1" role="dialog"
												aria-labelledby="myModalLabel">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button data-dismiss="modal" class="close" type="button">
																<span aria-hidden="true">×</span><span class="sr-only">Close</span>
															</button>
															<h4 class="modal-title">修改影院信息</h4>
														</div>
														<div class="modal-body">
															<form action="admin_updateCinema">
																<center>
																	<table class="tb2">
																	<tr>
																			<td class="td2">影院ID</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="cid" name="cid" readonly  unselectable="on"></td>
																		</tr>
																		<tr>
																			<td class="td2">影院名</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="cname" name="cname"></td>
																		</tr>
																		<tr>
																			<td class="td2">地址</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="clocation" name="clocation"></td>
																		</tr>
																		<tr>
																			<td class="td2">电话</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="ctel" name="ctel"></td>
																		</tr>
																	</table>
																</center>
																
																<br>
																<input type = "submit" value = "更新" />
															</form>
														</div>
													</div>
													<!-- /.modal-content -->
												</div>
												<!-- /.modal-dialog -->
											</div>

<!--添加影院 -->
<div class="modal " id="addCinema" tabindex="-1" role="dialog"
												aria-labelledby="myModalLabel">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button data-dismiss="modal" class="close" type="button">
																<span aria-hidden="true">×</span><span class="sr-only">Close</span>
															</button>
															<h4 class="modal-title">添加影院</h4>
														</div>
														<div class="modal-body">
															<form action="admin_addCinema">
																<center>
																	<table class="tb2">
																		<tr>
																			<td class="td2">影院名</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="cname" name="cname"></td>
																		</tr>
																		<tr>
																			<td class="td2">地址</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="clocation" name="clocation"></td>
																		</tr>
																		<tr>
																			<td class="td2">电话</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="ctel" name="ctel"></td>
																		</tr>
																	</table>
																</center>
																
																<br>
																<input type = "submit" value = "提交" />
															</form>
														</div>
													</div>
													<!-- /.modal-content -->
												</div>
												<!-- /.modal-dialog -->
											</div>

<!--添加影厅 -->
<div class="modal " id="addHall" tabindex="-1" role="dialog"
												aria-labelledby="myModalLabel">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button data-dismiss="modal" class="close" type="button">
																<span aria-hidden="true">×</span><span class="sr-only">Close</span>
															</button>
															<h4 class="modal-title">添加影厅</h4>
														</div>
														<div class="modal-body">
															<form action="admin_addHall">
																<center>
																	<table class="tb2">
																		<tr>
																			<td class="td2">影院ID</td>
																			<td class="td2"><input type="text"
																				class="form-control" name="hcid" value="${cid }" readonly unselectable="on">
																		</tr>
																		<tr>
																			<td class="td2">影厅名</td>
																			<td class="td2"><input type="text"
																				class="form-control" name="hname"></td>
																		</tr>
																		<tr>
																			<td class="td2">容量</td>
																			<td class="td2"><input type="text"
																				class="form-control" name="hcapacity"></td>
																		</tr>
																	</table>
																</center>
																
																<br>
																<input type = "submit" value = "提交" />
															</form>
														</div>
													</div>
													<!-- /.modal-content -->
												</div>
												<!-- /.modal-dialog -->
											</div>
											
<!-- 编辑影厅 -->
<div class="modal " id="updateHall" tabindex="-1" role="dialog"
												aria-labelledby="myModalLabel">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button data-dismiss="modal" class="close" type="button">
																<span aria-hidden="true">×</span><span class="sr-only">Close</span>
															</button>
															<h4 class="modal-title">编辑影厅</h4>
														</div>
														<div class="modal-body">
															<form action="admin_updateHall">
																<center>
																	<table class="tb2">
																		<tr>
																			<td class="td2">影厅ID</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="hid" name="hid" readonly unselectable="on"></td>
																		</tr>
																		<tr>
																			<td class="td2">影院ID</td>
																			<td class="td2"><input type="text"
																				class="form-control" name="hcid" value="${cid }" readonly unselectable="on"></td>
																		</tr>
																		<tr>
																			<td class="td2">影厅名</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="hname" name="hname"></td>
																		</tr>
																		<tr>
																			<td class="td2">容量</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="hcapacity" name="hcapacity"></td>
																		</tr>
																	</table>
																</center>
																
																<br>
																<input type = "submit" value = "提交" />
															</form>
														</div>
													</div>
													<!-- /.modal-content -->
												</div>
												<!-- /.modal-dialog -->
											</div>
											
<!--显示评论内容 -->
<div class="modal " id="showUserComment" tabindex="-1" role="dialog"
												aria-labelledby="myModalLabel">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button data-dismiss="modal" class="close" type="button">
																<span aria-hidden="true">×</span><span class="sr-only">Close</span>
															</button>
															<h4 class="modal-title">评论内容</h4>
														</div>
														<div class="modal-body">
																<center>
																	<textarea cols="75" rows="8" id="uccontent" style="text-align:center;"></textarea>
																</center>
														</div>
													</div>
													<!-- /.modal-content -->
												</div>
												<!-- /.modal-dialog -->
											</div>
											
<!-- 编辑场次 -->
<div class="modal " id="updateSession" tabindex="-1" role="dialog"
												aria-labelledby="myModalLabel">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button data-dismiss="modal" class="close" type="button">
																<span aria-hidden="true">×</span><span class="sr-only">Close</span>
															</button>
															<h4 class="modal-title">编辑场次</h4>
														</div>
														<div class="modal-body">
															<form action="admin_updateSession">
																<center>
																	<table class="tb2">
																		<tr style="display:none;">
																			<td class="td2">影厅ID</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="shid" name="shid" readonly unselectable="on"></td>
																		</tr>
																		<tr>
																			<td class="td2">场次ID</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="sid" name="sid" readonly unselectable="on"></td>
																		</tr>
																		<tr>
																			<td class="td2">开始时间</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="stime" name="stime"></td>
																		</tr>
																		<tr>
																			<td class="td2">价格</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="sprice" name="sprice"></td>
																		</tr>
																	</table>
																</center>
																
																<br>
																<input type = "submit" value = "提交" />
															</form>
														</div>
													</div>
													<!-- /.modal-content -->
												</div>
												<!-- /.modal-dialog -->
											</div>

<!-- 添加场次 -->									
<div class="modal " id="addSession" tabindex="-1" role="dialog"
												aria-labelledby="myModalLabel">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button data-dismiss="modal" class="close" type="button">
																<span aria-hidden="true">×</span><span class="sr-only">Close</span>
															</button>
															<h4 class="modal-title">添加场次</h4>
														</div>
														<div class="modal-body">
															<form action="admin_addSession">
																<center>
																	<table class="tb2">
																		<tr>
																			<td class="td2">影厅ID</td>
																			<td class="td2"><input type="text"
																				class="form-control" value="${hid }" name="shid" readonly unselectable="on"></td>
																		</tr>
																		<tr>
																			<td class="td2">电影ID</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="sfid" name="sfid"></td>
																		</tr>
																		<tr>
																			<td class="td2">开始时间</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="stime" name="stime"></td>
																		</tr>
																		<tr>
																			<td class="td2">价格</td>
																			<td class="td2"><input type="text"
																				class="form-control" id="sprice" name="sprice"></td>
																		</tr>
																	</table>
																</center>
																
																<br>
																<input type = "submit" value = "提交" />
															</form>
														</div>
													</div>
													<!-- /.modal-content -->
												</div>
												<!-- /.modal-dialog -->
											</div>
</body>
</html>