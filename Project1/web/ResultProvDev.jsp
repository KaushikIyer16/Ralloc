<%-- 
    Document   : Result
    Created on : 24 Feb, 2017, 12:45:39 PM
    Author     : Sneha
--%>
<%@page import="java.util.*"%>
<%@page import="com.ralloc.model.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Corrections</title>
    </head>
    <body>
        <h1 align="center">Results</h1>
        <h3>Provisional Degree will be generated for student</h3>
        <p>
            <%
                Student s = (Student)(request.getAttribute("student"));
                Department d = (Department)(request.getAttribute("dept"));
                out.print("Name : " + s.getName());
                out.print("<br>");
                out.print("USN : " + s.getUsn());
                out.print("<br>");
                out.print("Department : " + d.getName());
              %>
    </body>
</html>
