<%-- 
    Document   : addRoom
    Created on : Mar 31, 2017, 9:22:00 PM
    Author     : Mahesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Seating Arrangement | Slot</title>
        <script href="./js/jquery.js"></script>
        <link rel="stylesheet" type="text/css" href="./css/materialize.min.css" />
        <link rel="stylesheet" type="text/css" href="./css/common.css" />
        <link rel="stylesheet" type="text/css" href="./css/font-awesome.min.css" />
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
            <form method="POST"	action="${pageContext.request.contextPath}/Allocate/add" enctype="multipart/form-data">
                <br>
                <br>
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
                <div class="row">
                    <div class="col l2 m2 s4 right">
                        <button class="btn waves-effect waves-light custom-btn" type="submit">Submit</button>
                    </div>
                </div> 	
                <br>
	    </form>
            <br>
            <span>${errorMessage}</span>
        </div>
        <footer class="custom-footer" style="bottom: 0; position: fixed;">
            <div class="footer-copyright">
                <div class="container" style="color: white; margin-top: 15px;">
            © 2017 BMSCE
            <a class="text-lighten-4 right" href="#!" style="color: white;">Developed by Department of ISE</a>
            </div>
          </div>
        </footer>
    </body>
</html>
