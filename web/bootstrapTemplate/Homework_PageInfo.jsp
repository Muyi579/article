<%@page import="entity.ArticleEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Matrix Admin</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrapTemplate/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrapTemplate/css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrapTemplate/css/fullcalendar.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrapTemplate/css/matrix-style.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrapTemplate/css/matrix-media.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrapTemplate/font-awesome/css/font-awesome.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrapTemplate/css/jquery.gritter.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrapTemplate/css/uniform.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrapTemplate/css/select2.css">
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
		<script >
		
		  //修改点击事件为文本框赋值
		   function update(obj){
			   //获取到当前修改按钮行的所有兄弟元素
			   var articleId  =  $(obj).parent().parent().children().eq(0).text();
			   var articleTitle =  $(obj).parent().parent().children().eq(1).text();
			   var articleContent =  $(obj).parent().parent().children().eq(2).text();
			   var authorName =  $(obj).parent().parent().children().eq(4).text();
			   /* 为模态文本框赋值通过name */
			  $("[name='articleId']").val(articleId);
			  $("[name='articleTitle']").val(articleTitle);
			  $("[name='articleContent']").val(articleContent);
			  $("[name='authorName']").val(authorName);
		   };
			   
		</script>
	</head>
<body>
			<!--Header-part-->
			<div id="header">
				<h1>
					<a href="dashboard.html">Matrix Admin</a>
				</h1>
			</div>
			<!--close-Header-part-->
		
		
			<!--top-Header-menu-->
			<div id="user-nav" class="navbar navbar-inverse">
				<ul class="nav">
					<li class="dropdown" id="profile-messages"><a title="" href="#"
						data-toggle="dropdown" data-target="#profile-messages"
						class="dropdown-toggle"><i class="icon icon-user"></i> <span
							class="text">Welcome ${sessionScope.map.adminName}</span><b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#"><i class="icon-user"></i> My Profile</a></li>
							<li class="divider"></li>
							<li><a href="#"><i class="icon-check"></i> My Tasks</a></li>
							<li class="divider"></li>
							<li><a href="${pageContext.request.contextPath}/loginUi?op=exie"><i class="icon-key"></i> 退出登录</a></li>
						</ul></li>
					<li class="dropdown" id="menu-messages"><a href="#"
						data-toggle="dropdown" data-target="#menu-messages"
						class="dropdown-toggle"><i class="icon icon-envelope"></i> <span
							class="text">Messages</span> <span class="label label-important">5</span>
							<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a class="sAdd" title="" href="#"><i class="icon-plus"></i>
									new message</a></li>
							<li class="divider"></li>
							<li><a class="sInbox" title="" href="#"><i
									class="icon-envelope"></i> inbox</a></li>
							<li class="divider"></li>
							<li><a class="sOutbox" title="" href="#"><i
									class="icon-arrow-up"></i> outbox</a></li>
							<li class="divider"></li>
							<li><a class="sTrash" title="" href="#"><i
									class="icon-trash"></i> trash</a></li>
						</ul></li>
					<li class=""><a title="" href="#"><i class="icon icon-cog"></i>
							<span class="text">Settings</span></a></li>
					<li class=""><a title="" href="${pageContext.request.contextPath}/loginUi?op=exie"><i
							class="icon icon-share-alt"></i> <span class="text">退出登录</span></a></li>
				</ul>
			</div>
			<!--close-top-Header-menu-->
			<!--start-top-serch-->
			<div id="search">
				<input type="text" placeholder="Search here..." />
				<button type="submit" class="tip-bottom" title="Search">
					<i class="icon-search icon-white"></i>
				</button>
			</div>
			<!--close-top-serch-->
			<!--sidebar-menu-->
			<div id="sidebar">
				<a href="#" class="visible-phone"><i class="icon icon-home"></i>
					Dashboard</a>
				<ul>
					<!-- 		超链接绝地路径加符加参数 -->
					<li><a
						href="${pageContext.request.contextPath}/bootstrapTemplate/Homework.jsp"><i
							class="icon icon-home" ></i> <span>文章管理</span></a></li>
					<li  class="active"><a href="${pageContext.request.contextPath}/tableServlet"><i class="icon icon-signal"></i> <span>文章管理分页</span></a></li>
					<li><a href="widgets.html"><i class="icon icon-inbox"></i> <span>Widgets</span></a>
					</li>
					<li><a href="tables.html"><i class="icon icon-th"></i> <span>Tables</span></a></li>
					<li><a href="grid.html"><i class="icon icon-fullscreen"></i>
							<span>Full width</span></a></li>
					<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
							<span>Forms</span> <span class="label label-important">3</span></a>
						<ul>
							<li><a href="form-common.html">Basic Form</a></li>
							<li><a href="form-validation.html">Form with Validation</a></li>
							<li><a href="form-wizard.html">Form with Wizard</a></li>
						</ul></li>
					<li><a href="buttons.html"><i class="icon icon-tint"></i> <span>Buttons
								&amp; icons</span></a></li>
					<li><a href="interface.html"><i class="icon icon-pencil"></i>
							<span>Eelements</span></a></li>
					<li class="submenu"><a href="#"><i class="icon icon-file"></i>
							<span>Addons</span> <span class="label label-important">5</span></a>
						<ul>
							<li><a href="index2.html">Dashboard2</a></li>
							<li><a href="gallery.html">Gallery</a></li>
							<li><a href="calendar.html">Calendar</a></li>
							<li><a href="invoice.html">Invoice</a></li>
							<li><a href="chat.html">Chat option</a></li>
						</ul></li>
					<li class="submenu"><a href="#"><i
							class="icon icon-info-sign"></i> <span>Error</span> <span
							class="label label-important">4</span></a>
						<ul>
							<li><a href="error403.html">Error 403</a></li>
							<li><a href="error404.html">Error 404</a></li>
							<li><a href="error405.html">Error 405</a></li>
							<li><a href="error500.html">Error 500</a></li>
						</ul></li>
					<li class="content"><span>Monthly Bandwidth Transfer</span>
						<div
							class="progress progress-mini progress-danger active progress-striped">
							<div style="width: 77%;" class="bar"></div>
						</div> <span class="percent">77%</span>
						<div class="stat">21419.94 / 14000 MB</div></li>
					<li class="content"><span>Disk Space Usage</span>
						<div class="progress progress-mini active progress-striped">
							<div style="width: 87%;" class="bar"></div>
						</div> <span class="percent">87%</span>
						<div class="stat">604.44 / 4000 MB</div></li>
				</ul>
			</div>
			<!--sidebar-menu-->

			<!--main-container-part-->
			<div id="content">
				<!--breadcrumbs-->
				<div id="content-header">
					<div id="breadcrumb">
						<a href="index.html" title="Go to Home" class="tip-bottom"><i
							class="icon-home"></i> Home</a>
					</div>
				</div>
				<!--End-breadcrumbs-->
		
				<!--Action boxes-->
				<div class="container-fluid ">
		
					<div class="span12">
		
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon"><i class="icon-th"></i></span>
								<h5>文章列表</h5>
							</div>
							<div class="widget-content nopadding">
								<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper"
									role="grid">
									<div class="">
										<div id="DataTables_Table_0_length" class="dataTables_length">
											<label>每页
												 <select size="1" name="DataTables_Table_0_length"
												aria-controls="DataTables_Table_0" style="width: 60px;" id = "sele"><option
														value="3">3</option>
													<option value="5">5</option>
													<option value="10">10</option>
													</select> 条
											</label>
										</div>
									</div>
									<table class="table table-bordered data-table dataTable "
										id="DataTables_Table_0">
										<thead>
											<tr role="row">
												<th class="ui-state-default" role="columnheader" tabindex="0"
													aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
													aria-sort="ascending"
													aria-label="Rendering engine: activate to sort column descending"
													style="width: 128px;"><div
														class="DataTables_sort_wrapper">
														文章编号<span
															class="DataTables_sort_icon css_right ui-icon ui-icon-triangle-1-n"></span>
													</div></th>
												<th class="ui-state-default" role="columnheader" tabindex="0"
													aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
													aria-label="Browser: activate to sort column ascending"
													style="width: 385px;"><div
														class="DataTables_sort_wrapper">
														文章标题<span
															class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
													</div></th>
												<th class="ui-state-default" role="columnheader" tabindex="0"
													aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
													aria-label="Platform(s): activate to sort column ascending"
													style="width: 349px;"><div
														class="DataTables_sort_wrapper">
														文章内容<span
															class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
													</div></th>
												<th class="ui-state-default" role="columnheader" tabindex="0"
													aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
													aria-label="Engine version: activate to sort column ascending"
													style="width: 203px;"><div
														class="DataTables_sort_wrapper">
														文章日期<span
															class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
													</div></th>
												<th class="ui-state-default" role="columnheader" tabindex="0"
													aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
													aria-label="Engine version: activate to sort column ascending"
													style="width: 128px;"><div
														class="DataTables_sort_wrapper">
														文章作者<span
															class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
													</div></th>
												<th class="ui-state-default" role="columnheader" tabindex="0"
													aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
													aria-label="Engine version: activate to sort column ascending"
													style="width: 100px;"><div
														class="DataTables_sort_wrapper">
														操作<span
															class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
													</div></th>
											</tr>
										</thead>
		
										<tbody role="alert" aria-live="polite" aria-relevant="all" id="tbody" >
										</tbody>
									</table>
									<div
										class="fg-toolbar ui-toolbar ui-widget-header ui-corner-bl ui-corner-br ui-helper-clearfix">
										<div class="dataTables_filter" id="DataTables_Table_0_filter">
											<label>文章标题: <input type="text"
												aria-controls="DataTables_Table_0" name ="like" value ="">
												<button class="btn btn-inverse btn-mini" id = "likel">搜索</button>
												</label>
										</div>
										<div
											class="dataTables_paginate fg-buttonset ui-buttonset fg-buttonset-multi ui-buttonset-multi paging_full_numbers"
											id="DataTables_Table_0_paginate">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
			
	<!-- 模态框 -->
			<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<!-- 头部标题 -->
							<h5 class="modal-title" id="exampleModalCenterTitle">修改文章信息</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    <span aria-hidden="true">&times;</span>
							</button>
						</div>
				   <div class="modal-body">
				       <!-- form表单post提交不想让外部看到信息提交到servlet层 -->
<%-- 				        action="${pageContext.request.contextPath}/tableServlet" method="post" --%>
					   <form>
						  <label for="articleId">文章编号:</label> 
						  <input type="text" readonly="readonly" class="form-control-plaintext" name ="articleId" id ="articleId">
					      <label for="articleTitle">文章标题:</label> 
						  <input type="text"class="form-control " name ="articleTitle" id ="articleTitle">
						  <label for="articleContent">文章内容:</label>
						  <textarea rows="3"  class="form-control " name ="articleContent" id ="articleContent"></textarea>
						  <label for="articleAuthorId">文章作者:</label>
					      <input type="text"class="form-control "name ="authorName" id ="authorName" readonly="readonly">
					      <!--隐藏域操作方式op的值  -->
<!-- 						  <input type="hidden" name="op" value="updateArticle"/> -->
					      <div class="modal-footer">
							 <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
							 <input type="button" class="btn btn-primary" id="but" data-dismiss="modal" value="修改">
						  </div>
				       </form>
				    </div>
					</div>
				</div>
			</div>

	<!--end-Footer-part-->

	<script
		src="${pageContext.request.contextPath}/bootstrapTemplate/js/excanvas.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/bootstrapTemplate/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/bootstrapTemplate/js/jquery.ui.custom.js"></script>
	<script
		src="${pageContext.request.contextPath}/bootstrapTemplate/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/bootstrapTemplate/js/jquery.peity.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/bootstrapTemplate/js/fullcalendar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/bootstrapTemplate/js/matrix.js"></script>
	<script
		src="${pageContext.request.contextPath}/bootstrapTemplate/js/jquery.gritter.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/bootstrapTemplate/js/matrix.interface.js"></script>
	<script
		src="${pageContext.request.contextPath}/bootstrapTemplate/js/matrix.chat.js"></script>
	<script
		src="${pageContext.request.contextPath}/bootstrapTemplate/js/jquery.validate.js"></script>
	<script
		src="${pageContext.request.contextPath}/bootstrapTemplate/js/jquery.wizard.js"></script>
	<script
		src="${pageContext.request.contextPath}/bootstrapTemplate/js/jquery.uniform.js"></script>
	<script
		src="${pageContext.request.contextPath}/bootstrapTemplate/js/matrix.popover.js"></script>


	<script type="text/javascript">
			//入口函数
			$(function(){
				//开始渲染表格
				res(1);
				
				
				$(document).on("click",".colo",function(){
				   
					var pageNum = $(this).text();
					if(pageNum != 1){
						res(pageNum);
					}
					
				});
				//上一页
				 $(document).on("click","#DataTables_Table_0_previous",function(){
					 var countPages = $("#count").text();//总页数
					var num = $("#num").text();//当前页
					 if(num <= 1){
							alert("首页没有上一页");
						} else{
							res(--num);
						}
			   });
				//下一页
				$(document).on("click","#DataTables_Table_0_next",function(){
					var countPages = $("#count").text();//总页数
					var num = $("#num").text();//当前页
					 if(num == countPages){
							alert("尾页没有下一页");
						} else{
							res(++num);
						}
			   });
				
					//为下拉框做变动事件
					$("#sele").change(function(){
						res(1);
					});
				   
				  
					   //首页
					   $(document).on("click","#DataTables_Table_0_first",function(){
						   res(1);
					   });
					   //尾页
					    $(document).on("click","#DataTables_Table_0_last",function(){
							var countPages = $("#count").text();
							res(countPages);
					   })
				   
			  		 //模糊查询
				     $("#likel").click(function(){
				    	 res(1);
				     });
				   
				   
				   $(document).on("click",".delete",function(){
					   var province = $("[name='DataTables_Table_0_length']").val();
					   var like = $("[name='like']").val();
					  
					   //弹出框是否确认删除
						if (confirm("是否删除")) {
							 var articleId = $(this).data("articleid");
							 articleId = articleId.substring(1,articleId.length-1) ;
							$.ajax({
								async:"true",//异步
			 				url:"${pageContext.request.contextPath}/PageInfoServlet",//请求地址
			 				data:{op:"deleteArticle",articleId:articleId,like:like,
			 					pageNum:$("#num").text(),pageSize:province
			 				},
			 				type:"post" ,//请求方式
			 				dataType:"json" ,//预期响应格式
						 	contenType:"application/x-www-form-urlencoded",//请求格式类型
			 			 	success:function(result,status,xhr){//响应成功操作
			 			 		res($("#num").text());
			 			 	},
			 			 	error:function(xhr,status,error){
			 			 		alert("错了");
			 			 	}
							}); 
						}
				   }) 
				   
				   
				   
				   //修改
					   //提交按钮点击事件
					   $(document).on("click","#but",function(){
						   var province = $("[name='DataTables_Table_0_length']").val();
						   var like = $("[name='like']").val();
						   //获取值
							  var articleId = $("[name='articleId']").val();
							  var articleTitle = $("[name='articleTitle']").val();
							  var articleContent = $("[name='articleContent']").val();
							 // 封装成对象
							  var article = {
									  articleId:articleId,
									  articleTitle:articleTitle,
									  articleContent:articleContent
							  }
							  $.ajax({
									async:"true",//异步
				    				url:"${pageContext.request.contextPath}/PageInfoServlet",//请求地址
				    				data:{op:"updateArticle",article:JSON.stringify(article),like:like,
					 					pageNum:$("#num").text(),pageSize:province},//把当前文本框对象值通过转换方式传入后台
				    				type:"get" ,//请求方式
				    				dataType:"json" ,//预期响应格式
				   			 		contenType:"application/x-www-form-urlencoded",//请求格式类型
				    			 	success:function(result,status,xhr){//响应成功操作
				    			 		if(result != 0){
				    			 			res($("#num").text());
				    			 		}
				    			 	},
				    			 	error:function(xhr,status,error){
				    			 		alert("错了");
				    			 	}
								});
					   })
				   
				     //请求函数
			    function res(pageNum){
					   $("#DataTables_Table_0 #tbody").html("");//清空现有表格信息
					 //获取当前下拉框值
						var province = $("[name='DataTables_Table_0_length']").val();
						 var like = $("[name='like']").val();
					   $.ajax({
							async:"true",//异步
							url:"${pageContext.request.contextPath}/PageInfoServlet",//请求地址
							data:{op:"ArticleLimit",pageSize:province,like:like,pageNum:pageNum},//把当前文本框对象值通过转换方式传入后台
							type:"get" ,//请求方式
							dataType:"json" ,//预期响应格式
						 		contenType:"application/x-www-form-urlencoded",//请求格式类型
						 	success:function(result,status,xhr){//响应成功操作
						 		var data = result.data;
						 	    for(let i = 0 ; i < data.length ;i++){
						 	    	tab(data[i]);
						 	     }
						 	   	limit(result);
						 	   	$(".colo").each(function(){
						 	   		if(pageNum == $(this).text()){
						 	   		$(this).siblings().css("background-color","white");
									 $(this).css("background-color","deepskyblue");
						 	   		}
						 	   	})
						 		
						 	},
						 	error:function(xhr,status,error){
						 		alert("错了");
						 	}
						});
				   }
			 //表格追加事件
			   function tab(article){
		            //定义标杆
				   var tb = "<tr class=\"gradeA odd\"><td class=\"sorting_1\">"+article.articleId+"</td><td>"+article.articleTitle+"</td><td style=\"display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 2;overflow: hidden;text-overflow: ellipsis;height: 30px;\">"+article.articleContent+"</td>"
				   +"<td class=\"center\">"+article.publishDate+"</td><td>"+article.authorEntity.authorName+"</td><td><a href=\"javascript:void(0)\" onclick =\"update(this)\""  
				   +"data-toggle=\"modal\" data-target=\"#updateModal\"><i class=\"icon-edit\" ></i>修改</a>&emsp;"
				   +"<a href=\"javascript:void(0)\" data-articleid=\"'"+article.articleId+"'\" class=\"delete\"><i class=\"icon-remove\"></i>删除</a></td></tr>";
				   //追加
				   $("#DataTables_Table_0 #tbody").append(tb);
				  
			   };
			   //下面追加
			   function limit(result){
				   $("#DataTables_Table_0_paginate").html("");//清空
				   $("#DataTables_Table_0_paginate").append("<span>每页"+result.pageSize+"条  共"+result.total+"条  第<span id= \"num\">"+result.pageNum+"</span>/<span id= \"count\">"+result.pages+"</span>页</span>");
		 			$("#DataTables_Table_0_paginate").append("<a tabindex=\"0\" class=\"next  ui-button\""+
							"id=\"DataTables_Table_0_first\">首页</a><a tabindex=\"0\" class=\"previous  ui-button \""+
							"id=\"DataTables_Table_0_previous\">上一页</a><span>");
		 			for(var i=1;i<result.pages+1;i++){
		 				if(i==result.pageNum){
		 					$("#DataTables_Table_0_paginate").append("<a href=\"javascript:void(0)\"  tabindex=\"0\"class=\"ui-button colo\" style=\"background:deepskyblue\">"+i+"</a>");
		 				}else{
		 					$("#DataTables_Table_0_paginate").append("<a href=\"javascript:void(0)\"  tabindex=\"0\"class=\"ui-button colo\">"+i+"</a>");
		 				}
		 			}
		 			$("#DataTables_Table_0_paginate").append("</span><a tabindex=\"0\" class=\"next  ui-button\""+
					"id=\"DataTables_Table_0_next\">下一页</a><a tabindex=\"0\" class=\"last ui-corner-tr ui-corner-br  ui-button\""+
					"id=\"DataTables_Table_0_last\">尾页</a>");
		 			
			   }
		});
		
		
		
			 
	</script>
</body>
</html>