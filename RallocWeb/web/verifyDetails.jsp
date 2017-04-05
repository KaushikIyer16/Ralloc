<%-- 
    Document   : verifyDetails
    Created on : Apr 1, 2017, 3:51:48 PM
    Author     : Mahesh
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Department | Database of Departments</title>
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
                    String subjectName = "Subject abc";
                    String[] usn = {"1bm14test", "1bm14test", "1bm14test", "1bm14test", "1bm14test", "1bm14test", "1bm14test", "1bm14test"};
                    int numberOfUsn = 8;
                    out.println("<br><h5>Subject: " + subjectName + "</h5><br>");
                    out.println("<div class=\"container\"><div class=\"row\">");
                    for(int i=0; i<numberOfUsn; i++)
                        {
                            out.println("<div class=\"col l3 s3 m3\"><p>"+ usn[i] +"</p></div>");
                            if((i+1) % 4 == 0)
                            {
                                out.println("</div><div class=\"row\">");
                            }
                        }
                    out.println("</div></div>");
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
