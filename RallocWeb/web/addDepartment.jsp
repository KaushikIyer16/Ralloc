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
        <title>Add Room | Database of Infrastructure</title>
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
            <h5>Add a new department</h5>
            <form method="POST"	action="GetRoom.do">
                <h6>Please click on add row to add details of a new room</h6>
                <div class="rooms">
                    <input value="0" name="no" type="hidden" />
                </div>
                <div class="row" id="buttons">
                    <div class="col s6 m4 l4">
                        <button type="button" class="add custom-btn">Add Row</button>
                    </div>
                    <div class="col s6 m4 l4">
                        <button type="button" class="delete custom-btn" disabled="true">Delete Row</button>
                    </div>
                </div>
                <br>
                <br>
                <button class="btn  right" type="submit" style="background-color: #444;">Submit</button>
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

