<%-- 
    Document   : viewError
    Created on : Apr 9, 2017, 10:26:31 AM
    Author     : Mahesh
--%>

<%@page import="com.ralloc.view.InfrastructureAdditionServlet"%>
<%@page import="com.ralloc.view.DepartmentAdditionServlet"%>
<%@page import="com.ralloc.view.SubjectConfirmationServlet"%>
<%@page import="com.ralloc.view.UploadFileServlet"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ralloc.model.Department"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error | View Error Details</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/materialize.min.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
        <style>
            table,tr{
                boreder: 1px solid black;
            }
        </style>
    </head>
    <body>
        <nav>
            <div class="nav-wrapper custom-nav">
                <a href="${pageContext.request.contextPath}/home" class="brand-logo"><img src="${pageContext.request.contextPath}/images/BMSCE_Logo.svg" class="clg-logo"></a>
                
                <ul id="nav-mobile" class="left clg-name">
                    <li><a href="${pageContext.request.contextPath}/home"><h5>B.M.S COLLEGE OF ENGINEERING, BANGALORE - 560 019</h5><h6>(Autonomous Institute, Affiliated to VTU)</h6></a></li>
                </ul>
            </div>
        </nav>
        <h3 class="center">Unfortunately an error has occurred</h3>
        
        <div class="divider"></div>
                
        <h4 class="center">Error details</h4>
        <p class="center"><% out.print(UploadFileServlet.errorMessage); %></p>
        <p class="center"><% out.print(SubjectConfirmationServlet.errorMessage); %></p>
        <p class="center"><% out.print(DepartmentAdditionServlet.errorMessage); %></p>
        <p class="center"><% out.print(InfrastructureAdditionServlet.errorMessage); %></p>
        <%
        
        UploadFileServlet.errorMessage = "";
        SubjectConfirmationServlet.errorMessage = "";
        DepartmentAdditionServlet.errorMessage = "";
        InfrastructureAdditionServlet.errorMessage = "";
        
        %>
        <br>
        <br>
        <br>
        <br>
        <a class="btn custom-btn" style="margin-left: 35%; width: 30%;" href="${pageContext.request.contextPath}/home">Back to Home</a>
        <footer class="custom-footer" style="bottom: 0px; position: fixed;">
            <div class="footer-copyright">
                <div class="container" style="color: white; margin-top: 15px;">
            © 2017 BMSCE
            <a class="text-lighten-4 right" href="#!" style="color: white;">Developed by Department of ISE</a>
            </div>
          </div>
        </footer>
    </body>
</html>

