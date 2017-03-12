<%-- 
    Document   : room1
    Created on : Mar 9, 2017, 12:27:30 AM
    Author     : deepikakv
--%>
<%@page import="java.util.*"%>
<%@page import="com.ralloc.bean.*"%>

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
        <div class="upfile">
         
      <%
                int n = (int)(request.getAttribute("no"));
                List C = (List)(request.getAttribute("ClassList"));
                Iterator it = C.iterator();
                ClassRoom clas;
                int i = 1;
                while(it.hasNext())
                {
                    clas = (ClassRoom)it.next();
                    out.print("<b> " + i + "</b>");
                    out.print("<br>");
                    out.print("Room id : " +clas.getID());
                    out.print("<br>");
                    out.print("Room name : " + clas.getName());
                    out.print("<br>");
                    out.print("Capacity : " + clas.getCap());
                    out.print("<br>"+"<br>");
                    i++;
                    
                }
              %>
        </div>
         <div class="subj">
            <a class = "button button-block" href="./index.html">Return to Home</a>
        </div>
    </body>
</html>
