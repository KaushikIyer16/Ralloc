<%-- 
    Document   : addDepartment
    Created on : Apr 1, 2017, 10:51:24 AM
    Author     : Mahesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Department | Database of Departments</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/materialize.min.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
        <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
        
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
        <br>
        <br>
        <div class="container">
            <h5>Add a new department</h5>
            <form method="POST"	action="${pageContext.request.contextPath}/Department/add">
                <h6>Please enter the following details of the new department</h6>
                <div class="row">
                    <div class="col l6 m6 s12">
                        <h5>
                            Please enter the department name
                        </h5>
                        <br>
                    </div>
                    <div class="col l6 m6 s12">
                        <input type="text" name="DepartmentName" id="name" required placeholder="TTT" />
                    </div>
                </div>
                <br>
                <br>
                <div class="row">
                    <div class="col l6 m6 s12">
                        <h5>
                            Please enter the cluster name
                        </h5>
                        <br>
                    </div>
                    <div class="col l6 m6 s12">
                        <input type="text" name="ClusterName" id="cluster" required placeholder="TTT" />
                    </div>
                </div>
                <br>
                <br>
                <div class="row">
                    <div class="col l6 m6 s12">
                        <h5>
                            Please enter the maximum intake
                        </h5>
                        <br>
                    </div>
                    <div class="col l6 m6 s12">
                        <input type="text" name="MaximumIntake" id="intake" required placeholder="n" />
                    </div>
                </div>
                <br>
                <br>
                <button class="btn  right" type="submit" style="background-color: #444;">Submit</button>
                <br>
                <br>
                <br>
            </form>
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

