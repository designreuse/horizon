<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>登录</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bootstrap-theme.min.css">
     <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.fullPage.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/welcome.css">

	<script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/jquery.fullPage.js"></script>
	<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
	<style>
		html,body {margin:0px;height:100%;}
		.section1 { background: url("<%=request.getContextPath() %>/img/background.png") no-repeat;
			background-size: cover; height: 100%; padding-top: 75px;}
		.container { padding-top: 75px;}
	</style>
</head>
<body>
<div class="section section1">
  	<div class="container">
  		<div class="row">
  			<div class="col-xs-12">
  				<div class="row">
  					<div class="col-xs-5 overview">
  						<p class="initials">小伙伴网</p>
  						<p class="zh_initials">欢迎回来</p>
  					</div>
  					<div class="col-xs-5">
  						<div class="login ui form">
  							<div class="field">
  								<input id="email" type="text" name="email" placeholder="电子邮箱">
  							</div>
  							<div class="field">
  								<input id="password" type="password" name="password" placeholder="密码">
  							</div>
  							<div class="field">
  								<button class="login_btn" id="login_btn">登录</button>
  								<button class="register_btn" id="register_btn">注册</button>
  							</div>
  						</div>
  					</div>
  				</div>
  			</div>
  		</div>
	</div>
</div>

</script>
</body>
</html>