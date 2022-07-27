<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="UTF-8" 
contentType="text/html;charset=UTF-8"%>
<% 
  session.setAttribute("course", "移动Web应用设计" + " --- " + new Date());
  String id = session.getId();
%>
<!DOCTYPE  html>
<html  lang="zh-cn">
<head>
<title>Session X</title>
</head>
<body>
  <h1>Session X</h1>  
  session ID:<%=id%><br><br>
  <a href="Y18329015.jsp">Y.jsp</a><br><br>
  <a href="Z18329015.jsp">Z.jsp</a>
</body>
</html>