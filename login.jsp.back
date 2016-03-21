<!DOCTYPE html>
<html>
<head>
	<title></title>
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

<form action="login" method="post" onsubmit="return checksubmit();"> 
   username<input type="text" name="username">
   <br>password
   <input type="password" name="password">
   <br>
   <input type="submit"  value="login">
   <input type="reset" value="cancel"/>
   <input type="hidden" name="clientToken" value="${sessionScope.clientToken}" /> 
</form>

</body>
</html>
