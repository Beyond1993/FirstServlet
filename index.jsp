<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<meta charset="utf-8">
<script type="text/javascript" src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-ui"></script>
<link href="http://www.francescomalagrino.com/BootstrapPageGenerator/3/css/bootstrap-combined.min.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./resource/js/websocket.js"></script>
<style type="text/css">
	#console {
            border: 1px solid #CCCCCC;
            border-right-color: #999999;
            border-bottom-color: #999999;
            height: 170px;
            overflow-y: scroll;
            padding: 5px;
            width: 100%;
        }
</style>
</head>
<body>

<%	
	response.setHeader("Cache-Control","no-cache"); 
    response.setHeader("Cache-Control","no-store");  //和上面的参数不一样
    response.setDateHeader("Expires", -1); 
    response.setHeader("Pragma","no-cache"); 

   //  if(session==null || session.getAttribute("username")==null){
   //   	response.sendRedirect("login.jsp");
  	// }

    String username = (String)session.getAttribute("username");
	out.println(username);
	if(username == null){
		out.println("error");
		response.sendRedirect("login.jsp");
	}else{
		out.println("login");
		//response.sendRedirect("login.jsp");
	}	
%>

<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<ul class="nav nav-tabs">
				<li class="active">
					<a href="#">首页</a>
				</li>
				<li>
					<a href="#">资料</a>
				</li>
				<li class="disabled">
					<a href="#">信息</a>
				</li>
				<li class="dropdown pull-right">

					 <a href="#" data-toggle="dropdown" class="dropdown-toggle"><%=session.getAttribute("username")%><strong class="caret"></strong></a>
					<ul class="dropdown-menu">
						<li>
							<a href="logout.jsp">logout</a>
						</li>
						<li>
							<a href="#">设置栏目</a>
						</li>
						<li>
							<a href="#">更多设置</a>
						</li>
						<li class="divider">
						</li>
						<li>
							<a href="#">分割线</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span4">
			<img alt="140x140" src="resource/img/a.jpg" id="word"/>
			<button id="connect" onclick="connect();">Connect</button>
			<!--<form action="mywelcomeservlet" method="GET">-->
			
			<div class="btn-group">
				 <input class="btn" type="submit" value="hard"     onclick="echo(1)" id="message1"/> 
				 <input class="btn" type="submit" value="normal"   onclick="echo(2)" id="message2"/> 
				 <input class="btn" type="submit" value="easy"     onclick="echo(3)" id="message3"/> 
				 <input class="btn" type="submit" value="not know" onclick="echo(4)" id="message4"/>
			</div>
			<!--</form>-->
		</div>
		<div class="span4">
			<img alt="140x140" src="resource/img/a.jpg" />
			<div class="btn-group">
				 <button class="btn" type="button"><em class="icon-align-left"></em></button> <button class="btn" type="button"><em class="icon-align-center"></em></button> <button class="btn" type="button"><em class="icon-align-right"></em></button> <button class="btn" type="button"><em class="icon-align-justify"></em></button>
			</div>
		</div>
		<div class="span4" >
			 <div id="console"/>
			
			<p>
				<a class="btn" href="#">查看更多 »</a>
			</p>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<div class="pagination pagination-centered">
				<ul>
					<li>
						<a href="#">上一页</a>
					</li>
					<li>
						<a href="#">1</a>
					</li>
					<li>
						<a href="#">2</a>
					</li>
					<li>
						<a href="#">3</a>
					</li>
					<li>
						<a href="#">4</a>
					</li>
					<li>
						<a href="#">5</a>
					</li>
					<li>
						<a href="#">下一页</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
</body>
</html>