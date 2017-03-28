<%-- 
    Document   : message
    Created on : 8 Mar, 2017, 6:23:42 PM
    Author     : Sneha
--%>
<%@page import="java.util.*"%>
<%@page import="com.ralloc.bean.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="./css/materialize.min.css" />
        <link rel="stylesheet" type="text/css" href="./css/Main.css" />
        <link rel="stylesheet" type="text/css" href="./css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="./css/Main.css" />
        <title>Confirm Uploaded Data</title>
    </head>
    <body>
        <nav>
            <div class="nav-wrapper custom-nav">
                <a href="#" class="brand-logo"><img src="./images/BMSCE_Logo.svg" style="height: 80px; margin-top: 10px;"></a>
                
                <ul id="nav-mobile" class="left" style="margin-left: 100px;">
                    <li><a href="#"><h5>B.M.S COLLEGE OF ENGINEERING, BANGALORE - 560 019</h5><h6>(Autonomous Institute, Affiliated to VTU)</h6></a></li>
                </ul>
                <ul class="right" style="margin-right: 30px;">
                    <li><a href="#"><i class="fa fa-info-circle" aria-hidden="true"></i> Help</a></li>
                    <li><a href="#"><i class="fa fa-arrow-right" aria-hidden="true"></i> About</a></li>
                </ul>
            </div>
        </nav>
        <div class="container">
        <div class="upfile">
            
             
            <%
                Subject sub = (Subject)(request.getAttribute("Subject"));
                Dependency dep = (Dependency)(request.getAttribute("Dependency"));
                
                out.print("<div class='head'>" + "<br>" + "<b>" + "Subject Code : " + "</b>" + sub.getCode());
                out.print("<br>" + "<b>" + "Subject Name : " + "</b>" + sub.getName() + "<br>" + "<br>" + "</div>");
                out.print("<b style='font-size:20px;'>" + "List of Students appearing for exam:" + "</b>"  + "<br>" + "<div style='margin:0% 8%'>");
                
                int n = 1;
                List U = (List)(request.getAttribute("list"));
                Iterator it = U.iterator();
                Student s;
                while(it.hasNext())
                {
                    s = (Student)it.next();
                    out.print("<br>" + "<b>" + n +"</b>" + ". " + s.getUSN()+" , " + s.getDept());
                    n = n+1;
                }
                out.print("</div>");
            %>
        </div>
         <div class="container subj">
             <div class="row">
                 <div class="col l4 m4 s12">
                     <a class = "button btn custom-btn" href="./upload.jsp">Add another subject</a>
                 </div>
                 <div class="col l4 m4 s12 offset-l4">
                     <a class = "button btn custom-btn" href="./index.html">Return to Home</a>
                 </div>
             </div>
         </div>     
        </div>
    </body>
</html>