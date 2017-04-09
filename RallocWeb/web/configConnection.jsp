<%-- 
    Document   : configConnection
    Created on : Apr 9, 2017, 9:43:47 AM
    Author     : Mahesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Configuration | Configure Application</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/materialize.min.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
    </head>
    <body>
        <nav>
            <div class="nav-wrapper custom-nav">
                <a href="#" class="brand-logo"><img src="${pageContext.request.contextPath}/images/BMSCE_Logo.svg" class="clg-logo"></a>
                
                <ul id="nav-mobile" class="left clg-name">
                    <li><a href="#"><h5>B.M.S COLLEGE OF ENGINEERING, BANGALORE - 560 019</h5><h6>(Autonomous Institute, Affiliated to VTU)</h6></a></li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <h3 class="center">Change Database Connection Parameters</h3>
            <hr width="100%" style="border-top:1px solid #989896">
            <form action="${pageContext.request.contextPath}/Modify/connection" method="POST">
                <div class="row">
                    <div class="col l6 m6 s12">
                            <h5>
                                Please enter the connection string for the database
                            </h5>
                            <br>
                        </div>
                        <div class="col l6 m6 s12">
                            <input type="text" name="connectionString" id="connectionstring" required placeholder="Format: jdbc:mysql://localhost:3306/ralloc"/>
                        </div>
                </div>
                <div class="row">
                        <div class="col l6 m6 s12">
                            <h5>
                                Please enter the username
                            </h5>
                            <br>
                        </div>
                        <div class="col l6 m6 s12">
                            <input type="text" name="userName" id="username" required />
                        </div>
                </div>
                <div class="row">
                        <div class="col l6 m6 s12">
                            <h5>
                                Please enter the password
                            </h5>
                            <br>
                        </div>
                        <div class="col l6 m6 s12">
                            <input type="text" name="password" id="passcode"/>
                        </div>
                </div>
                <br>
                <br>
                <div class="row">
                    <div class="col l2 m2 s4 right">
                        <button class="btn waves-effect waves-light custom-btn" type="submit">Modify</button>
                    </div>
                </div> 
                <br>
                <br>
            </form>
        </div>
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
