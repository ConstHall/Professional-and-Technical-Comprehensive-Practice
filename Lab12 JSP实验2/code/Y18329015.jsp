<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="UTF-8" 
contentType="text/html;charset=UTF-8"%>
<% 
  String course = (String) session.getAttribute("course");
  String id = session.getId();
%>
<!DOCTYPE  html>
<html  lang="zh-cn">
<head>
<title>Session Y</title>
</head>
<body>
  <h1>Session Y</h1>
  session ID:<%=id%><br><br>
  course:<%=course%><br><br>
  <a href="X18329015.jsp">X.jsp</a><br><br>
  <a href="Z18329015.jsp">Z.jsp</a><br><br>
</body>
</html>