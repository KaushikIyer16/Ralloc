<%-- 
    Document   : addAform
    Created on : Apr 9, 2017, 8:21:22 PM
    Author     : Mahesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New A Form | Generate A Form</title>
         <link rel="stylesheet" type="text/css" href="./css/materialize.min.css" />
        <link rel="stylesheet" type="text/css" href="./css/common.css" />
        <link rel="stylesheet" type="text/css" href="./css/font-awesome.min.css" />
        <script src="./js/jquery.js"></script>
    </head>
    <body>
        <nav>
            <div class="nav-wrapper custom-nav">
                <a href="${pageContext.request.contextPath}/home" class="brand-logo"><img src="./images/BMSCE_Logo.svg" class="clg-logo"></a>
                
                <ul id="nav-mobile" class="left clg-name">
                    <li><a href="${pageContext.request.contextPath}/home"><h5>B.M.S. COLLEGE OF ENGINEERING, BANGALORE - 560 019</h5><h6>(Autonomous Institute, Affiliated to VTU)</h6></a></li>
                </ul>
            </div>
        </nav>
        <br>
        <br>
        <div class="container">
            <h5>Generate new A-Forms</h5>
            <form method="POST"	action="${pageContext.request.contextPath}/Aform/display" enctype="multipart/form-data">
                <div class="row">
                    <div class="col l6 m6 s12">
                        <h5>Please upload the Excel file of students:</h5>
                    </div>
                    <div class="col l6 m6 s12">
                        <input type="file" name="DataFormFile">
                    </div>
                </div>
                    <br/>
                    <br/>
                <br>
                <div class="row" id="buttons">
                    <div class="col s6 m4 l4">
                        <button type="submit" class="add custom-btn">Generate A Form</button>
                    </div>
                </div>
                <br>
             </form>
        <br>
        </div>
        <br/><br/><br/><br/><br/>
        <footer class="custom-footer" style="bottom: 0px; position: fixed;">
            <div class="footer-copyright">
                <div class="container" style="color: white; margin-top: 15px;">
            © 2017 BMSCE
            <!--<a class="text-lighten-4 right" href="#!" style="color: white;">Developed by Department of ISE</a>-->
            </div>
          </div>
        </footer>
    </body>
</html>
