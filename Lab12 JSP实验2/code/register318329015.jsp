<%@ page language="java" import="java.util.*" 
         contentType="text/html; charset=utf-8"%>
<%  request.setCharacterEncoding("utf-8");
    String name = "张三", explain = "我学过Web程序设计"; 
    if (request.getParameter("submit2") != null){
      response.sendRedirect("http://172.18.187.6/");
    }
    if (request.getParameter("submit1") != null) {
      name = request.getParameter("name") + "*";
      explain = request.getParameter("explain") + "*";
  }
%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>用户注册</title>
    <style> 

    </style>
  </head>  
  <body>
    <form action="register318329015.jsp" method="post">
      <input type="hidden" name="stuid" value="12345" />
      同学名：<input type="text" id="txt1" name="name" value="<%=name%>" /><br><br>
      密码：<input type="password" name="password" value="12345678" /><br><br>
      校区：南校区<input type="radio" name="campus" value="south" />
      东校区<input type="radio" name="campus" value="east" />
      北校区<input type="radio" name="campus" value="north" checked="checked"/>
      珠海校区<input type="radio" name="campus" value="zhuhai" />
      深圳校区<input type="radio" name="campus" value="shenzhen" /><br><br>
      年级：<select name="grade">
        <option value="1">大学一年级</option>
        <option value="2">大学二年级</option>
        <option value="3" selected="selected">大学三年级</option>
        <option value="4">大学四年级</option>
      </select><br><br>
      社团：舞蹈队<input type="checkbox" name="club" value="dance" />
      摄影<input type="checkbox" name="club" value="photo" checked="checked"/>
      篮球<input type="checkbox" name="club" value="basketball" checked="checked"/><br><br>
      <table>
        <tr>
          <td valign="top">说明: </td>
          <td><textarea rows="10" cols="30" name="explain"><%=explain%></textarea></td>
        </tr>
      </table>
      <br/>
      <input type="submit" name="submit1" value="保存" />
      <input type="submit" name="submit2" value="退出" /><br>
    </form>
  </body>
  </html>