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
         <link rel="stylesheet" type="text/css" href="./css/materialize.min.css" />
        <link rel="stylesheet" type="text/css" href="./css/common.css" />
        <link rel="stylesheet" type="text/css" href="./css/font-awesome.min.css" />
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
            <form method="POST"	action="${pageContext.request.contextPath}/Allocate/add" enctype="multipart/form-data">
                <div class="row">
                    <div class="col l6 m6 s12">
                        <h5>
                            Please enter the date of the exam slot
                        </h5>
                        <br>
                    </div>
                    <div class="col l6 m6 s12">
                        <input type="text" name="Date" id="examDate" required placeholder="dd-mm-yyyy" />
                    </div>
                </div>
                <br>
                <br>
                <div class="row">
                    <div class="col l6 m6 s12">
                        <h5>
                            Please enter the time of the exam slot
                        </h5>
                        <br>
                    </div>
                    <div class="col l6 m6 s12">
                        <input type="text" name="Time" id="examTime" required placeholder="hh:mm" />
                    </div>
                </div>
                <br>
                <br>
                <div class="row">
                    <div class="col l6 m6 s12">
                        <h5>Please upload the Excel file of students:</h5>
                    </div>
                    <div class="col l6 m6 s12">
<!--                       <div class="file-field input-field">
                           <div class="btn" style="background-color: #444;">
                          <span>File</span>
                          <input type="file" name="DataFormFile">
                        </div>
                        <div class="file-path-wrapper">
                          <input class="file-path validate" type="text" placeholder="Please upload the datasheet">
                        </div>
                      </div>-->
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
