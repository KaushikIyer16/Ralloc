<%-- 
    Document   : verifyDetails
    Created on : Apr 2, 2017, 9:54:36 AM
    Author     : Mahesh
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.ralloc.model.Subject"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify Subjects | Database of Subjects</title>
         <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/materialize.min.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
        <script src="./js/jquery.js"></script>
        
    </head>
    <body>
        <nav>
            <div class="nav-wrapper custom-nav">
                <a href="#" class="brand-logo"><img src="./images/BMSCE_Logo.svg" class="clg-logo"></a>
                <ul id="nav-mobile" class="left clg-name">
                    <li><a href="#"><h5>B.M.S COLLEGE OF ENGINEERING, BANGALORE - 560 019</h5><h6>(Autonomous Institute, Affiliated to VTU)</h6></a></li>
                </ul>
            </div>
        </nav>
        <br>
        <br>
        <div class="container">
            <h5>Following details were added</h5>
            <%
                    //Repeat the below code according to the number of entries in the bean i.e. make j equal to the number of subjects
                    ArrayList<Subject> subjectObject = (ArrayList<Subject>) request.getAttribute("subjectList");
                    out.println("<div class=\"container\">");
                    for(Subject s : subjectObject)
                        {
                            out.println("<br><h5>Subject: " + s.getCourseCode() + "</h5><br>");
                            out.println("<p>Name: " + s.getName() + "</p>");
                            out.println("<p>Institutional Elective: " + s.isIsInstituteElective() + "</p>");
                            out.println("<p>Department Elective: " + s.isIsDeptElective() + "</p>");
                            out.println("<p>Cluster Elective: " + s.isIsClusterElective() + "</p>");
                            out.println("<p>Has Dependency (1 - Yes, -1 - No): " + s.getHasDependency() + "</p>");
                        }
                    out.println("</div>");
                
            %>
            <a class="btn waves-effect waves-light right" style="background-color: #444;" href="${pageContext.request.contextPath}/home">Continue </a>
        </div>
        <footer class="custom-footer">
            <div class="footer-copyright">
                <div class="container" style="color: white; margin-top: 15px;">
            © 2017 BMSCE
            <a class="text-lighten-4 right" href="#!" style="color: white;">Developed by Department of ISE</a>
            </div>
          </div>
        </footer>
    </body>
</html>
