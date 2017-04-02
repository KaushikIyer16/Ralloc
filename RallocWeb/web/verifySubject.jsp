<%-- 
    Document   : verifyDetails
    Created on : Apr 2, 2017, 9:54:36 AM
    Author     : Mahesh
--%>

<%@page import="com.ralloc.model.Subject"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify Subjects | Database of Subjects</title>
         <link rel="stylesheet" type="text/css" href="./css/materialize.min.css" />
        <link rel="stylesheet" type="text/css" href="./css/common.css" />
        <link rel="stylesheet" type="text/css" href="./css/font-awesome.min.css" />
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
            <h5>Please verify the provided details</h5>
            <%
                for(int j=0; j<2; j++)
                {
                    //Repeat the below code according to the number of entries in the bean i.e. make j equal to the number of subjects
                    Subject subjectObject = new Subject();
                    subjectObject.setCourseCode("16IS6DCCNS");
                    subjectObject.setName("Computer Networks and Security");
                    subjectObject.setIsInstituteElective(false);
                    subjectObject.setIsDeptElective(false);
                    subjectObject.setIsClusterElective(false);
                    int numberOfSubjects = 1;
                    
                    out.println("<div class=\"container\">");
                    for(int i=0; i<numberOfSubjects; i++)
                        {
                            out.println("<br><h5>Subject: " + subjectObject.getCourseCode() + "</h5><br>");
                            out.println("<p>Name: " + subjectObject.getName() + "</p>");
                            out.println("<p>Institutional Elective: " + subjectObject.isIsInstituteElective() + "</p>");
                            out.println("<p>Department Elective: " + subjectObject.isIsDeptElective() + "</p>");
                            out.println("<p>Cluster Elective: " + subjectObject.isIsClusterElective() + "</p>");
                        }
                    out.println("</div>");
                }
                
            %>
            <button class="btn waves-effect waves-light right" style="background-color: #444;">Continue </button>
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
