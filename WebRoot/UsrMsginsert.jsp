<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="cn.theslikroad.LLM.Register" %>
<%@ page import="cn.theslikroad.dao.proxy.UsrMsgProxy" %>
<%@ page import="cn.theslikroad.dao.factory.DAOfactory" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%request.setCharacterEncoding("utf-8");%>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
    	Register reg=new Register();
    	reg.setUsername(request.getParameter("username"));
    	reg.setPassword(request.getParameter("password"));
    	reg.setPhone(request.getParameter("phone"));
    	reg.setE_mail(request.getParameter("e_mail"));
       
     	try{
     	if(DAOfactory.getInstance().doCreate(reg))
     	{
     	 %>	
     	 <jsp:forward page="/html/load.jsp"/>
     	 <%
     	
 
     	}
     	 else{
     	    %>
     	    <jsp:forward page="registe.jsp"/>
     	  <%
     	 }
     	
     	}catch(Exception e)
     	{
     	 e.printStackTrace();
     	}
    	
    	
     %>
  </body>
</html>
