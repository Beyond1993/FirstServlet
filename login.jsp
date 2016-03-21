<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title>Chinese Learning</title>

  <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css">

  <link rel='stylesheet' href='css/jquery-ui.css'>
<link rel='stylesheet prefetch' href='css/bootstrap.min.css'>

    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />

    <script src="js/modernizr.js"></script>

</head>

<body>
<script language="javascript"> 
　　 var checksubmitflg = false; 
　　 function checksubmit() { 
　　 if (checksubmitflg == true) { 
　　 return false; 
　　 } 
　　 checksubmitflg = true; 
　　 return true; 
　　 } 
　　 document.ondblclick = function docondblclick() { 
　　 window.event.returnvalue = false; 
　　 } 
　　 document.onclick = function doconclick() { 
　　 if (checksubmitflg) { 
　　 window.event.returnvalue = false; 
　　 } 
　　 } 
　　</script> 
<%	
	response.setHeader("Cache-Control","no-cache"); 
    response.setHeader("Cache-Control","no-store");  //和上面的参数不一样
    response.setDateHeader("Expires", -1); 
    response.setHeader("Pragma","no-cache"); 
	String username = (String)session.getAttribute("username");
	out.println(username);
	if(username == null){
		out.println("error");
		//response.sendRedirect("login.jsp");
	}else{
		out.println("login");
		response.sendRedirect("index.jsp");
	}	
%>

  <body class="login-page">
<div class="login-form">

		<div class="login-content">

			<div class="form-login-error">
				<h3>Invalid login</h3>
				<p>Enter <strong>demo</strong>/<strong>demo</strong> as login and password.</p>
			</div>

			<form action="login" method="post" onsubmit="return checksubmit();"  role="form" id="form_login">

				<div class="form-group">

					<div class="input-group">
						<div class="input-group-addon">
							<i class="fa fa-user"></i>
						</div>

						<input type="text" class="form-control" name="username" id="username" placeholder="Username" autocomplete="off" />
					</div>

				</div>

				<div class="form-group">

					<div class="input-group">
						<div class="input-group-addon">
							<i class="fa fa-key"></i>
						</div>

						<input type="password" class="form-control" name="password" id="password" placeholder="Password" autocomplete="off" />
					</div>

				</div>

				<div class="form-group">
					<button type="submit" class="btn btn-primary btn-block btn-login">
						<i class="fa fa-sign-in"></i>
						Login In
					</button>
				</div>

				<!-- Implemented in v1.1.4 -->				<div class="form-group">
					<em>- or -</em>
				</div>

				<div class="form-group">

					<button type="button" class="btn btn-default btn-lg btn-block facebook-button">
						&#160;&#160;
						<i class="fa fa-facebook"></i>
               |  Login with Facebook
					</button>

				</div>

				<!-- 

				You can also use other social network buttons
				<div class="form-group">

					<button type="button" class="btn btn-default btn-lg btn-block btn-icon icon-left twitter-button">
						Login with Twitter
						<i class="entypo-twitter"></i>
					</button>

				</div>

				<div class="form-group">

					<button type="button" class="btn btn-default btn-lg btn-block btn-icon icon-left google-button">
						Login with Google+
						<i class="entypo-gplus"></i>
					</button>

				</div> -->		
				<input type="hidden" name="clientToken" value="${sessionScope.clientToken}" /> 		
			</form>

			<div style="text-align:center;clear:both;">
<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
<script src="/follow.js" type="text/javascript"></script>
</div>

		</div>

	</div>
 </div>

  <script src='js/jquery_and_jqueryui.js'></script>

</body>

</html>