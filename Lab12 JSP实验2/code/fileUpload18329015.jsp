<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ page import="java.io.*, java.util.*, org.apache.commons.io.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>

<!DOCTYPE HTML>
<html>
<head>
	<title>实现文件上传</title>
</head>

<body>
	<% request.setCharacterEncoding("utf-8"); %>
	<% 
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		String filename = "";
		String address = "http://172.18.187.251:8080/testjsp/files/";
    	if (isMultipart) { 
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List items = upload.parseRequest(request);
			String id = null;
			for (int i = 0; i < items.size(); i++) {
				FileItem fi = (FileItem) items.get(i);
				if (fi.isFormField()) {
					id = fi.getString("utf-8");
				}
				else {
					DiskFileItem dfi = (DiskFileItem) fi;
					filename = id + "_" + FilenameUtils.getName(dfi.getName());
					address += filename;
					if (!dfi.getName().trim().equals("")) {
						out.print("文件被上传到服务上的实际位置：");
						String fileName = application.getRealPath("files") + System.getProperty("file.separator") + FilenameUtils.getName(filename);
						out.print(new File(fileName).getAbsolutePath());
						dfi.write(new File(fileName));
					}
				}
			}
		}
	%>
	<br/><a href="<%=address%>"><%=filename%></a>
</body>
</html>
