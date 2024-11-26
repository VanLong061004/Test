<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>

<%
    String url = "";
    // Lưu file tạm thời
    DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
    // Đặt thư mục lưu tạm thời
    diskFileItemFactory.setRepository(new File("D:\\Ky5\\JavaServlet\\SourceCode\\BanHangJsp\\src\\main\\webapp"));
    
    ServletFileUpload fileUpload = new ServletFileUpload(diskFileItemFactory);
    List<FileItem> fileItems = fileUpload.parseRequest(request);
    
    for (FileItem fileItem : fileItems) {
        if (!fileItem.isFormField()) {
            if (fileItem.getFieldName().equals("file")) {
                // Chuẩn hóa tên tệp để loại bỏ các ký tự không hợp lệ
                String fileName = fileItem.getName().replaceAll("\\s+", "_");  // Thay thế khoảng trắng bằng dấu gạch dưới
                File file = new File("D:\\Ky5\\JavaServlet\\SourceCode\\BanHangJsp\\src\\main\\webapp\\images\\" + fileName);
                fileItem.write(file);
                //http://localhost:8080/BanHangJsp/images/images_(1).png
                url = "/BanHangJsp/images/" + fileName;  // Tạo URL tương đối để hiển thị hình ảnh
            }
        }
    }
%>

<!-- Hiển thị hình ảnh sau khi tải lên -->
<img src="<%=url %>" alt="Uploaded Image">

</body>
</html>
