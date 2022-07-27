<%@ page language="java" import="java.util.*, java.sql.*" contentType="text/html; charset=utf-8" %>
<%
	request.setCharacterEncoding("utf-8");
	String msg = "";
	int pgno = 0, pgcnt = 4;
	String param1 = request.getParameter("pgno"), param2 = request.getParameter("pgcnt");

	if (param1 != null && !param1.isEmpty()){
		pgno = Integer.parseInt(param1);
	}
	if (param2 != null && !param2.isEmpty()){
		pgcnt = Integer.parseInt(param2);
	}
		
	int pgno_Prev = Math.max(pgno - 1, 0);
	int pgno_Next = pgno + 1;

	String connectString = "jdbc:mysql://localhost:3306/teaching"
					+ "?autoReconnect=true&useUnicode=true"
					+ "&characterEncoding=UTF-8"; 
	StringBuilder table = new StringBuilder("");
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(connectString, "user", "123");
		Statement stmt = con.createStatement();
		String sql = String.format("select * from stu limit %d, %d", pgno * pgcnt, pgcnt);
		ResultSet rs = stmt.executeQuery(sql);
		table.append("<table>");
		table.append("<tr><th>id</th><th>学号</th><th>姓名</th><th>-</th></tr>");
		while (rs.next()) {
			table.append("<tr>");
			table.append("<td>" + rs.getString("id") + "</td>");
			table.append("<td>" + rs.getString("num") + "</td>");
			table.append("<td>" + rs.getString("name") + "</td>");
			table.append("<td>");
			String url1 = "updateStu18329015.jsp?pid=" + rs.getString("id");
			table.append("<a href='" + url1 + "'>修改</a> ");
			String url2 = "deleteStu18329015.jsp?pid=" + rs.getString("id");
			table.append("<a href='" + url2 + "'>删除</a></td>");
			table.append("</tr>");
		}
		table.append("</table>");
		rs.close();
		stmt.close();
		con.close();
	}
	catch (Exception e) {
		msg = e.getMessage();
	}
%>

<!DOCTYPE HTML>
<html>
<head>
	<style>
		td, th {
			border: solid 1px black;
			width: 150px;
			height: 30px;
		}
		table {
			border-collapse: collapse;
		}
		.container {
			width: 600px;
			margin: auto;
			text-align: center;
		}
	</style>
	
	<title>浏览学生名单</title>
</head>

<body>
	<div class="container">
		<h1>浏览学生名单</h1>  
		<div>
			<%=table%><br><br>
		</div>
		<div style="float: left">
			<a href="addStu18329015.jsp">新增</a>
		</div>
		<div style="float: right">
			<a href="browseStu18329015.jsp?pgno=<%=pgno_Prev%>&pgcnt=<%=pgcnt%>">上一页</a>
			<a href="browseStu18329015.jsp?pgno=<%=pgno_Next%>&pgcnt=<%=pgcnt%>">下一页</a>
		</div>
	</div>
</body>
</html>
