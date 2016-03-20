<%@ page contentType="text/html; charset=UTF-8" %>
<%
	response.setHeader("Cache-Control","no-cache"); 
    response.setHeader("Cache-Control","no-store");  //和上面的参数不一样
    response.setDateHeader("Expires", -1); 
    response.setHeader("Pragma","no-cache"); 

session.removeAttribute("username"); 

out.print("<script>alert('用户即将退出，确定后退出该页面。');window.location.href='index.jsp'</script>"); 
%> 