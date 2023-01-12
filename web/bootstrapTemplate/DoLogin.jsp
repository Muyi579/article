<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    
	<head>
       <title>Matrix Admin</title>
       <meta charset="UTF-8" />
       <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	   <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrapTemplate/css/bootstrap.min.css" />
	   <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrapTemplate/css/bootstrap-responsive.min.css" />
       <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrapTemplate/css/matrix-login.css" />
       <link href="${pageContext.request.contextPath}/bootstrapTemplate/font-awesome/css/font-awesome.css" rel="stylesheet" />
	   <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>

	</head>
    <body>
        <div id="loginbox">            
            <form id="loginform" class="form-vertical" action="${pageContext.request.contextPath}/loginUi" method="get">
            <input type="hidden" name= "op" value="login">
				 <div class="control-group normal_text"> <h3><img src="img/logo.png" alt="Logo" /></h3></div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class="icon-user"></i></span><input type="text" placeholder="Username" name = "adminName"/>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_ly"><i class="icon-lock"></i></span><input type="password" placeholder="Password" name = "password" />
                        </div>
                    </div>
                </div>
                 <div class="control-group" style="margin-left: 50px">
                	<div class="checkbox">
				    	<label>
				      		<input type="checkbox" id="ckeck">记住密码
				   		 </label>
				   		 <input type="hidden" name= "check">
				  	</div>
				 </div>
                <div class="form-actions">
                    <span class="pull-left"><a href="#" class="flip-link btn btn-info" id="to-recover">忘记密码?</a></span>
                    <span class="pull-right"><input type="submit" id="judge" class="btn btn-success" value="登录" /></span>
                </div>
            </form>
            <form id="recoverform" action="#" class="form-vertical">
				<p class="normal_text">Enter your e-mail address below and we will send you instructions how to recover a password.</p>
				
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lo"><i class="icon-envelope"></i></span><input type="text" placeholder="E-mail address" />
                        </div>
                    </div>
               
                <div class="form-actions">
                    <span class="pull-left"><a href="#" class="flip-link btn btn-success" id="to-login">&laquo; Back to login</a></span>
                    <span class="pull-right"><a class="btn btn-info"/>Reecover</a></span>
                </div>
            </form>
        </div>
        
        <script src="${pageContext.request.contextPath}/bootstrapTemplate/js/jquery.min.js"></script>  
        <script src="${pageContext.request.contextPath}/bootstrapTemplate/js/matrix.login.js"></script> 
        <script src="${pageContext.request.contextPath}/bootstrapTemplate/js/jquery.cookie.js"></script>
        <script >
        	//获取${param.erro}是否有值，如果有就提示
         	 var message =  "${param.erro}";
         	 if(message != ""){
        	  	alert("用户名或密码错误  请重新登录");
         	 }
          
         	  //入口函数
        	  window.onload = function(){
      			//菜鸟
           	 	 function getCookie(cname){
      				    //为传进来的key值拼接上=
           		    	var name = cname + "=";
      				    //切割为数组
           		   		var ca = document.cookie.split(';');
      				    //遍历
           		   		for(var i=0; i<ca.length; i++) {
           		   			//去前后空格
           		       		var c = ca[i].trim();
           		   			//判断出现的位置
           		        	if (c.indexOf(name)==0) { 
           		        		//裁剪
           		        		return c.substring(name.length,c.length); 
           		        	}
           		    	}
      				    //否则吐出“”
           		    return "";
           			}
      		      
    		      //为用户名文本框做失去焦点事件
    		      $("[name='adminName']").blur(function(){
    		     		//失去焦点后获取文本框值
    		     		var adminName = $("[name='adminName']").val();
    		     		 //获取cookie中的name值跟password值
                     	var urse= getCookie(adminName);
    		     		
    		       			//判断密码是否为空，是否记住密码
    		       			if(urse != ""){
    		       				//如果有记住密码就把cookie中取的值存放到密码文本框
    	    		       		 $("[name='password']").val(urse);
    		       				//把记住密码选择
    	    		       		 $("#ckeck").prop("checked",true); 
    		       			} else {
    		       			//如果没有记住密码就把密码文本框设置空串
   	    		       		 $("[name='password']").val("");
   		       				//把记住密码取消
   	    		       		 $("#ckeck").prop("checked",false); 
    		       			}
    		       	});
             };
             //为提交按钮绑定点击事件
             $(document).on("click","#judge",function(){
            	 //获取复选框的状态
            	 var flag = $("#ckeck").prop("checked");
        			 //为隐藏域赋值
               		 $("[name='check']").val(flag);
             })
		</script>
    </body>

</html>
