<%-- 
    Document   : ExamSlot
    Created on : 7 Mar, 2017, 5:42:17 PM
    Author     : Sneha
--%>

<%@page import="java.util.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="./css/Main.css" />
        <title>Exam Slot</title>
    </head>
    <body
        <h1 class="college-header">B.M.S COLLEGE OF ENGINEERING, BANGALORE - 560 019</h1>
        <h4 class="affiliation">(Autonomous Institute, Affiliated to VTU)</h4>
        <h3 class="form-header">EXAM SLOT</h3>
        <p>
            <%
                String t = (String)(request.getAttribute("time"));
                String d = (String)(request.getAttribute("date"));
                String am_pm = (String)(request.getAttribute("am_pm"));
                out.print("Date : " + d);
                out.print("<br>");
                out.print("Time : " + t +" "+am_pm);
                out.print("<br>");
              %>
            <div class="container">
                <a class = "button button-block" href="/View_Ralloc/index.html">Return to Home</a>    
            </div>
    </body>
</html>

