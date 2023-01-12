<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>前台首页</title>
<link
	href="${pageContext.request.contextPath}/front/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/front/assets/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/front/css/jumbotron.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/front/assets/js/ie-emulation-modes-warning.js"></script>
</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Project name</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<form class="navbar-form navbar-right">
					<div class="form-group">
						<input type="text" placeholder="用户名" class="form-control"
							id="ursename">
					</div>
					<div class="form-group">
						<input type="password" placeholder="密码" class="form-control"
							id="password">
					</div>
					<button type="button" id="sub" class="btn btn-success">登录</button>
					<a id="re"
						href="${pageContext.request.contextPath}/bootstrapTemplate/register.jsp"
						class="btn btn-success">注册</a>
				</form>
			</div>
			<!--/.navbar-collapse -->
		</div>
	</nav>
	<div class="jumbotron">
		<div class="container">
			<h1>Hello, world!</h1>
			<p>This is a template for a simple marketing or informational
				website. It includes a large callout called a jumbotron and three
				supporting pieces of content. Use it as a starting point to create
				something more unique.</p>
			<p>
				<a class="btn btn-primary btn-lg" href="#" role="button">Learn
					more &raquo;</a>
			</p>
		</div>
	</div>
	<div class="container">
		<!-- Example row of columns -->
		<div class="row" id="dateDiv">
			<h3>按照发布时间：</h3>
			<div class="col-md-4">
				<h2>Heading</h2>
				<p></p>
				<p>Donec id elit non mi porta gravida at eget metus. Fusce
					dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
					ut fermentum massa justo sit amet risus. Etiam porta sem malesuada
					magna mollis euismod. Donec sed odio dui.</p>
				<p class="details">
					<a class="btn btn-default " href="#" role="button">查看详情 &raquo;</a>
				</p>
			</div>
			<div class="col-md-4">
				<h2>Heading</h2>
				<p></p>
				<p>Donec id elit non mi porta gravida at eget metus. Fusce
					dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
					ut fermentum massa justo sit amet risus. Etiam porta sem malesuada
					magna mollis euismod. Donec sed odio dui.</p>
				<p class="details">
					<a class="btn btn-default" href="#" role="button">查看详情 &raquo;</a>
				</p>
			</div>
			<div class="col-md-4">
				<h2>Heading</h2>
				<p></p>
				<p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in,
					egestas eget quam. Vestibulum id ligula porta felis euismod semper.
					Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum
					nibh, ut fermentum massa justo sit amet risus.</p>
				<p class="details">
					<a class="btn btn-default" href="#" role="button">查看详情 &raquo;</a>
				</p>
			</div>
		</div>


		<!-- Example row of columns -->
		<div class="row" id="clickCount">
			<h3>按照点击量排行：</h3>
			<div class="col-md-4">
				<h2>Heading</h2>
				<p></p>
				<p>Donec id elit non mi porta gravida at eget metus. Fusce
					dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
					ut fermentum massa justo sit amet risus. Etiam porta sem malesuada
					magna mollis euismod. Donec sed odio dui.</p>
				<p class="details">
					<a class="btn btn-default" href="#" role="button">查看详情 &raquo;</a>
				</p>
			</div>
			<div class="col-md-4">
				<h2>Heading</h2>
				<p></p>
				<p>Donec id elit non mi porta gravida at eget metus. Fusce
					dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
					ut fermentum massa justo sit amet risus. Etiam porta sem malesuada
					magna mollis euismod. Donec sed odio dui.</p>
				<p class="details">
					<a class="btn btn-default" href="#" role="button">查看详情 &raquo;</a>
				</p>
			</div>
			<div class="col-md-4">
				<h2>Heading</h2>
				<p></p>
				<p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in,
					egestas eget quam. Vestibulum id ligula porta felis euismod semper.
					Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum
					nibh, ut fermentum massa justo sit amet risus.</p>
				<p class="details">
					<a class="btn btn-default " href="#" role="button">查看详情 &raquo;</a>
				</p>
			</div>
		</div>
		<hr>

		<footer>
			<p>&copy; 牧一</p>
		</footer>
	</div>
	<!-- /container -->
	<script
		src="${pageContext.request.contextPath}/front/js/jquery-3.2.1.js"></script>
	<script
		src="${pageContext.request.contextPath}/front/dist/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/front/assets/js/ie10-viewport-bug-workaround.js"></script>
	<script type="text/javascript">
		//入口函数
		$(function() {

			$(document)
					.on(
							"click",
							"#sub",
							function() {
								var ursename = $("#ursename").val();
								var password = $("#password").val();
								if (ursename.trim().length != 0
										&& password.trim().length != 0) {
									//ajax请求
									$
											.ajax({
												async : "true",//异步
												url : "${pageContext.request.contextPath}/AccountServlet",//请求地址
												data : {
													op : "judgeLogin",
													ursename : ursename,
													password : password
												}, //传入参数
												type : "post",//请求方式
												dataType : "json",//预期响应格式
												contenType : "application/x-www-form-urlencoded",//请求格式类型
												success : function(result,
														status, xhr) {//响应成功操作
													if (result == false) {
														alert("登录失败请重新登陆");
														$("#ursename").val("");
														$("#password").val("");
													} else {
														$("#navbar").html("");//清空div 
														$("#navbar")
																.append(
																		"<form class=\"navbar-form navbar-right\">"
																				+ "<div class=\"form-group\"><img id=\"img\" src=\"${pageContext.request.contextPath}/FileDownloadServlet?fileName="
																				+ result.facePicture
																				+ "\" style=\"width:50px; height:50px; border-radius:50%; \"/></div>"
																				+ "<div class=\"form-group\"><h3  style=\"display: inline; color: white;\" id = \"ursename\">"
																				+ result.accountName
																				+ "</h3>&emsp; </div>"
																				+ "<input type=\"button\" id=\"out\" class=\"btn btn-success\" value=\"退出登录\"/></form>")

													}
												},
												error : function(xhr, status,
														error) {
													alert("错了");
												}
											});
								} else {
									alert("请完善数据");
								}
							});
			$(document)
					.on(
							"click",
							"#out",
							function() {
								$("#navbar").html("");
								$("#navbar")
										.append(
												"<form class=\"navbar-form navbar-right\"><div class=\"form-group\">"
														+ "<input type=\"text\" placeholder=\"用户名\" class=\"form-control\" id=\"ursename\"></div>"
														+ "<div class=\"form-group\"><input type=\"password\" placeholder=\"密码\" class=\"form-control\" id=\"password\">"
														+ "</div><button type=\"button\" id =\"sub\" class=\"btn btn-success\">登录</button>"
														+ "<a href=\"${pageContext.request.contextPath}/bootstrapTemplate/register.jsp\" class=\"btn btn-success\">注册</a></form>")
							});

			//为查看详情做事件
			$(".details")
					.each(
							function(index) {
								$(this)
										.click(
												function() {
													var ursename = $(
															"#ursename").text();
													if (ursename.length == 0) {
														alert("请先登录");
													} else {
														$
																.ajax({
																	async : "true",//异步
																	url : "${pageContext.request.contextPath}/AccountServlet",//请求地址
																	data : {
																		op : "orderBy"
																	}, //传入参数
																	type : "get",//请求方式
																	dataType : "json",//预期响应格式
																	contenType : "application/x-www-form-urlencoded",//请求格式类型
																	success : function(
																			result,
																			status,
																			xhr) {//响应成功操作
																		var dateBy = result.orderByDate; //通过结果得到两个集合
																		var countBy = result.orderByclick;
																		for (let i = 0; i < dateBy.length; i++) { //同样长度一次遍历

																			if (index < 3) {
																				$(
																						"#dateDiv")
																						.children(
																								"div")
																						.children(
																								"h2")
																						.eq(
																								i)
																						.text(
																								dateBy[i].articleTitle); //日期排序的h2标题
																				$(
																						"#dateDiv")
																						.children(
																								"div")
																						.eq(
																								i)
																						.children(
																								"p")
																						.eq(
																								0)
																						.text(
																								"发布时间 "
																										+ dateBy[i].publishDate
																										+ " 点击量 "
																										+ dateBy[i].articleClickCount);
																				if (i == index) {
																					$(
																							"#dateDiv")
																							.children(
																									"div")
																							.eq(
																									index)
																							.children(
																									"p")
																							.eq(
																									1)
																							.text(
																									dateBy[i].articleContent);
																					return false;
																				}
																				$(
																						"#dateDiv")
																						.children(
																								"div")
																						.eq(
																								i)
																						.children(
																								"p")
																						.eq(
																								1)
																						.text(
																								dateBy[i].articleContent
																										.substring(
																												0,
																												50)
																										+ "....."); //文本内容调用切割方法找到当前div的子div的第i个的子类第一个p标签
																			}
																			if (index >= 3) {

																				$(
																						"#clickCount")
																						.children(
																								"div")
																						.children(
																								"h2")
																						.eq(
																								i)
																						.text(
																								countBy[i].articleTitle); //同上
																				$(
																						"#clickCount")
																						.children(
																								"div")
																						.eq(
																								i)
																						.children(
																								"p")
																						.eq(
																								0)
																						.text(
																								"发布时间 "
																										+ countBy[i].publishDate
																										+ " 点击量 "
																										+ countBy[i].articleClickCount);
																				if (i == index - 3) {
																					$(
																							"#clickCount")
																							.children(
																									"div")
																							.eq(
																									i)
																							.children(
																									"p")
																							.eq(
																									1)
																							.text(
																									countBy[i].articleContent);
																					return false;
																				}
																				$(
																						"#clickCount")
																						.children(
																								"div")
																						.eq(
																								i)
																						.children(
																								"p")
																						.eq(
																								1)
																						.text(
																								countBy[i].articleContent
																										.substring(
																												0,
																												50)
																										+ ".....");
																			}

																		}

																	},
																	error : function(
																			xhr,
																			status,
																			error) {
																		alert("错了");
																	}
																});

													}

												})
							});
			$(".details")
					.click(
							function() {
								var ursename = $("#ursename").text();
								if (ursename.length == 0) {
									alert("请先登录");
								} else {
									$
											.ajax({
												async : "true",//异步
												url : "${pageContext.request.contextPath}/AccountServlet",//请求地址
												data : {
													op : "orderBy"
												}, //传入参数
												type : "get",//请求方式
												dataType : "json",//预期响应格式
												contenType : "application/x-www-form-urlencoded",//请求格式类型
												success : function(result,
														status, xhr) {//响应成功操作
													var dateBy = result.orderByDate; //通过结果得到两个集合
													var countBy = result.orderByclick;
													for (let i = 0; i < dateBy.length; i++) { //同样长度一次遍历
														$(this).prev().text()
														$("#dateDiv")
																.children("div")
																.children("h2")
																.eq(i)
																.text(
																		dateBy[i].articleTitle); //日期排序的h2标题
														$("#dateDiv")
																.children("div")
																.eq(i)
																.children("p")
																.eq(0)
																.text(
																		"发布时间 "
																				+ dateBy[i].publishDate
																				+ " 点击量 "
																				+ dateBy[i].articleClickCount);
														$("#dateDiv")
																.children("div")
																.eq(i)
																.children("p")
																.eq(1)
																.text(
																		dateBy[i].articleContent
																				.substring(
																						0,
																						50)
																				+ "....."); //文本内容调用切割方法找到当前div的子div的第i个的子类第一个p标签

														$("#clickCount")
																.children("div")
																.children("h2")
																.eq(i)
																.text(
																		countBy[i].articleTitle); //同上
														$("#clickCount")
																.children("div")
																.eq(i)
																.children("p")
																.eq(0)
																.text(
																		"发布时间 "
																				+ countBy[i].publishDate
																				+ " 点击量 "
																				+ countBy[i].articleClickCount);
														$("#clickCount")
																.children("div")
																.eq(i)
																.children("p")
																.eq(1)
																.text(
																		countBy[i].articleContent
																				.substring(
																						0,
																						50)
																				+ ".....");
													}

												},
												error : function(xhr, status,
														error) {
													alert("错了");
												}
											});
								}
							});
			//ajax请求
			$
					.ajax({
						async : "true",//异步
						url : "${pageContext.request.contextPath}/AccountServlet",//请求地址
						data : {
							op : "orderBy"
						}, //传入参数
						type : "get",//请求方式
						dataType : "json",//预期响应格式
						contenType : "application/x-www-form-urlencoded",//请求格式类型
						success : function(result, status, xhr) {//响应成功操作
							var dateBy = result.orderByDate; //通过结果得到两个集合
							var countBy = result.orderByclick;
							for (let i = 0; i < dateBy.length; i++) { //同样长度一次遍历
								$("#dateDiv").children("div").children("h2")
										.eq(i).text(dateBy[i].articleTitle); //日期排序的h2标题
								$("#dateDiv").children("div").eq(i).children(
										"p").eq(0).text(
										"发布时间 " + dateBy[i].publishDate
												+ " 点击量 "
												+ dateBy[i].articleClickCount);
								$("#dateDiv").children("div").eq(i).children(
										"p").eq(1).text(
										dateBy[i].articleContent.substring(0,
												50)
												+ "....."); //文本内容调用切割方法找到当前div的子div的第i个的子类第一个p标签

								$("#clickCount").children("div").children("h2")
										.eq(i).text(countBy[i].articleTitle); //同上
								$("#clickCount")
										.children("div")
										.eq(i)
										.children("p")
										.eq(0)
										.text(
												"发布时间 "
														+ countBy[i].publishDate
														+ " 点击量 "
														+ countBy[i].articleClickCount);
								$("#clickCount").children("div").eq(i)
										.children("p").eq(1).text(
												countBy[i].articleContent
														.substring(0, 50)
														+ ".....");
							}

						},
						error : function(xhr, status, error) {
							alert("错了");
						}
					});
		});
	</script>
</body>
</html>

