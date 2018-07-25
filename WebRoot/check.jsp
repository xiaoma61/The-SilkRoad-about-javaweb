<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'check.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <jsp:useBean id="reg" scope="request"  class="cn.theslikroad.LLM.Register"/>
  <jsp:setProperty name="reg" property="*"/>  
  <body>
 
 <%
  if(reg.isValidate())
  {
  %>
      <jsp:forward page="index.jsp"/> 
  
   <%
  }else{
  %>
	<jsp:forward page="registe.jsp"/>

  <%} %>
  </body>
</html>
