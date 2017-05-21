<%-- 
    Document   : testUpload
    Created on : Sep 6, 2016, 12:44:01 PM
    Author     : Rustanian
--%>

<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>File Upload</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <form method="post" action="/WebApplication3/FileUploadServlet" enctype="multipart/form-data" >
            File:
            <input type="file" name="file" id="file" /> <br/>
            Destination:
            <input type="text" value="D:\test" name="destination"/>
            </br>
            <input type="submit" value="Upload" name="upload" id="upload" />
        </form>
    </body>
</html>
