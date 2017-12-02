<%-- 
    Document   : viewStats
    Created on : 2 Dec, 2017, 9:19:18 AM
    Author     : mahesh
--%>

<%@page import="com.ralloc.routes.StatisticsRouteServlet"%>
<%@page import="com.ralloc.bean.StatisticsBean"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Statistics</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/materialize.min.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
    </head>
    <body>
        <nav>
            <div class="nav-wrapper custom-nav">
                <a href="${pageContext.request.contextPath}/home" class="brand-logo"><img src="${pageContext.request.contextPath}/images/BMSCE_Logo.svg" class="clg-logo"></a>
                
                <ul id="nav-mobile" class="left clg-name">
                    <li><a href="${pageContext.request.contextPath}/home"><h5>B.M.S. COLLEGE OF ENGINEERING, BANGALORE - 560 019</h5><h6>(Autonomous Institute, Affiliated to VTU)</h6></a></li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <table style="margin-top: 10%; margin-bottom: 10%;">
            <thead style="border: 1px solid black;">
                <th style="border-right: 1px solid black; font-size: 16px; padding: 5px 5px 5px;" class="center">Sl. No</th>    
                <th style="border-right: 1px solid black; font-size: 16px; padding: 5px 5px 5px;" class="center">Course Code</th>
                <th style="border-right: 1px solid black; font-size: 16px; padding: 5px 5px 5px;" class="center">Room Name</th>
                <th style="border-right: 1px solid black; font-size: 16px; padding: 5px 5px 5px;" class="center">Students' Department</th>
                <th style="border-right: 1px solid black; font-size: 16px; padding: 5px 5px 5px;" class="center">Students Count</th>
            </thead>
            <tbody>
                <%
        
                    ArrayList<StatisticsBean> statTableList = StatisticsRouteServlet.statTableList;
                    int slNo = 1;
                    for(StatisticsBean statRow : statTableList){
                        %>
                            <tr style="border: 1px solid black; line-height: 1">
                        <%
                        out.print("<td style=\"padding: 5px 5px 5px; border-right: 1px solid black; font-size: 14px;\" class=\"center\">" + (slNo++) + "</td>");
                        out.print("<td style=\"padding: 5px 5px 5px; border-right: 1px solid black; font-size: 14px;\" class=\"center\">" + statRow.getCourseCode() + "</td>");
                        out.print("<td style=\"padding: 5px 5px 5px; border-right: 1px solid black; font-size: 14px;\" class=\"center\">" + statRow.getRoomName() + "</td>");
                        out.print("<td style=\"padding: 5px 5px 5px; border-right: 1px solid black; font-size: 14px;\" class=\"center\">" + statRow.getDepartment() + "</td>");
                        out.print("<td style=\"padding: 5px 5px 5px; border-right: 1px solid black; font-size: 14px;\" class=\"center\">" + statRow.getStudentCount() + "</td>");
                        
                        %>
                            </tr>
                        <%
                    }
                %>
            </tbody>
        </table>
        </div>
        <footer class="custom-footer" style="bottom: 0px;">
            <div class="footer-copyright">
                <div class="container" style="color: white; margin-top: 15px;">
            © 2017 BMSCE
            <!--<a class="text-lighten-4 right" href="#!" style="color: white;">Developed by Department of ISE</a>-->
            </div>
          </div>
        </footer>
    </body>
</html>
