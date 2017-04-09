<%-- 
    Document   : viewDepartment
    Created on : Apr 4, 2017, 1:00:01 AM
    Author     : kaushiknsiyer
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ralloc.model.Department"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! 
    HashMap<Integer,String> departmentList;
%>
<%
    departmentList = Department.getDepartments();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Department Details</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/materialize.min.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
        <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
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
        <h1>Department Details</h1>
        <table>
            <tr>
                <th> Department Name</th>
                <th> Department ID to be given in the Excel File</th>
            </tr>
            <%for(Integer keys : departmentList.keySet()) {%>
                <tr>
                    <td><%= departmentList.get(keys) %></td>
                    <td><%= keys%></td>
                </tr>
            <%}%>
        </table>
        
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
