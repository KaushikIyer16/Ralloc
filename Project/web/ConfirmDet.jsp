<%-- 
    Document   : message
    Created on : 8 Mar, 2017, 6:23:42 PM
    Author     : Sneha
--%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="./css/Main.css" />
        <title>Confirm Uploaded Data</title>
    </head>
    <body>
        <div class="container">
        <h1 class="college-header">B.M.S COLLEGE OF ENGINEERING, BANGALORE - 560 019</h1>
        <h4 class="affiliation">(Autonomous Institute, Affiliated to VTU)</h4>
        <h3 class="form-header">UPLOADED STUDENT LIST</h3>
        <hr width="100%" style="border-top:1px solid #989896">
        <div class="upfile">
            
             
            <%
                String t = (String)(request.getAttribute("SubCode"));
                String nam = (String)(request.getAttribute("SubName"));
                out.print("<div class='head'>" + "<br>" + "<b>" + "Subject Code : " + "</b>" + t);
                out.print("<br>" + "<b>" + "Subject Name : " + "</b>" + nam + "<br>" + "<br>" + "</div>");
                out.print("<b style='font-size:20px;'>" + "List of Students appearing for exam:" + "</b>"  + "<br>" + "<div style='margin:0% 8%'>");
                int n = 1;
                List U = (List)(request.getAttribute("list"));
                Iterator it = U.iterator();
                while(it.hasNext())
                {
                    out.print("<br>" + "<b>" + n +"</b>" + ". " + it.next());
                    n = n+1;
                }
                out.print("</div>");
            %>
        </div>
         <div class="container subj">
             <a class = "button button-block" href="./upload.jsp">Add another subject</a>
             <a class = "button button-block" href="./index.html">Return to Home</a>
         </div>
        
        </div>
    </body>
</html>