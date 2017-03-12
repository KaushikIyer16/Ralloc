<%-- 
    Document   : room1
    Created on : Mar 9, 2017, 12:27:30 AM
    Author     : deepikakv
--%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="./css/Main.css" />
        <title>Confirm Room</title>
    </head>
    <body>
        <h1 class="college-header">B.M.S COLLEGE OF ENGINEERING, BANGALORE - 560 019</h1>
        <h4 class="affiliation">(Autonomous Institute, Affiliated to VTU)</h4>
        <h3 class="form-header">CONFIRM RESPONSE FOR ROOM DETAILS</h3>
      <%
                String rid = (String)(request.getAttribute("Room_Id"));
                String rname = (String)(request.getAttribute("Room_name"));
                String cap = (String)(request.getAttribute("Capacity"));
                out.print("Room id : " + rid);
                out.print("<br>");
                out.print("Room name : " + rname);
                out.print("<br>");
                out.print("Capacity : " + cap);
              %>
              <a class = "button button-block" href="/View_Ralloc/RoomDet.html">Add another Room</a>
              <a class = "button button-block" href="/View_Ralloc/index.html">Return to Home</a>
    </body>
</html>
