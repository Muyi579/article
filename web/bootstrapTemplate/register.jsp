<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Login form with confirmation!</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrapTemplate/css/register.css">
</head>
<style type="text/css">
.error {
	color: RED;
	font-size: 12px;
}

.success {
	color: green;
	font-size: 12px;
}
</style>
<body>
	<div class="container">
		<div class="loginBox">
			<!-- 1 头像预览效果 -->
			<div class="userImage">
				<img src="#" id="img3" />
			</div>
			<form id="account" method="post"
				action="${pageContext.request.contextPath}/AccountServlet"
				enctype="multipart/form-data">
				<div id="prompt3">
					<input type="file" id="file" onchange="setImagePriview()"
						class="filepath" name="facepicture"
						accept="image/jpg,image/jpeg,image/png,image/gif">
					<!-- multiple="multiple",多文件上传 -->
					<input type="hidden" value="registered" name="op">
				</div>
				<div class="input-wrapper">
					<label>账号:</label> <input type="text" name="accountName"
						placeholder="请输入账号" required="required" id="accountName">
					<label id="accountNameTip"></label>
				</div>
				<div class="input-wrapper">
					<label>密码:</label> <input type="password" name="accountPwd"
						placeholder="密码" required="required">
				</div>
				<input type="submit" name="" value="注册" id="register"
					style="background: #BDCEFC; width: 325px;">
			</form>
		</div>
	</div>
</body>
<!-- 		引入外部jq -->
<script
	src="${pageContext.request.contextPath}/bootstrapTemplate/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	//入口函数
	$(function() {
		/* //文件点击上传变动事件
		$("#file").change(function(){
			var objUrl = getObjectURL(this.files[0]) ; //获取图片的路径，该路径不是图片在本地的路径
			if (objUrl) {
				$("#img3").prop("src",objUrl);//将图片路径存入src中，显示出图片
			}
		});
		//建立一個可存取到該file的url
		function getObjectURL(file) {
			var url = null ;
			if (window.createObjectURL!=undefined) { // basic
			url = window.createObjectURL(file) ;
			} else if (window.URL!=undefined) { // mozilla(firefox)
			url = window.URL.createObjectURL(file) ;
			} else if (window.webkitURL!=undefined) { // webkit or chrome
			url = window.webkitURL.createObjectURL(file) ;
			}
			return url ;
		} */
		//为账号文本框绑定失去焦点事件
		$("[name='accountName']").blur(function() {
			//取值去空格
			var accountName = $(this).val().trim();
			//如果==空串
			if (accountName == "") {
				//为下面提示调用错误类css
				$("#accountNameTip").text("用户名不能为空");
				$("#accountNameTip").addClass("error");
			} else {
				//否则做ajax
				$.ajax({
					async : "true",//同步/异步
					url : "${pageContext.request.contextPath}/AccountServlet",//请求地址
					type : "get",//请求方式
					data : {
						op : "judgeAccountName",
						account : accountName
					},//附带参数
					contentType : "application/x-www-form-urlencoded",//请求内容类型
					success : function(result, status, xhr) { //响应成功result响应结果，status响应状态，xhr
						if (result == "true") { //响应结果为true用户名已存在
							//赋值禁用按钮
							$("#accountNameTip").text("用户名已存在");
							$("#accountNameTip").addClass("error");//错误
							$("#register").prop("disable", true); //禁用按钮
							$("#register").css("background", " #999999"); //按钮变色
						} else {
							//否则清空启用
							$("#accountNameTip").text("用户名可用");
							$("#accountNameTip").addClass("success"); // 正确
							$("#register").prop("disable", false); //启用
							$("#register").css("background", "#BDCEFC"); //变色
						}
					},
					error : function(xhr, status, error) {//响应错误
						alert("错误");
					}
				});
			}
		});
	});

	// 选择文件的改变事件,生成图片预览功能
	function setImagePriview() {
		// 得到文件列表数组,获取数组中的第一个文件
		var file = document.getElementById("file").files[0];
		// 没有选择文件
		if (file == null) {
			document.getElementById("img3").src = "#";
		} else {
			// 构建一个文件渲染对象
			var reads = new FileReader();
			// FileReader.readAsDataURL 读取指定Blob或File的内容
			reads.readAsDataURL(file);
			// 获取文件数据
			reads.onload = function() {
				// 显示图片
				document.getElementById("img3").src = this.result;
			}
		}

	}
</script>

</html>