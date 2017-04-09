<%-- 
    Document   : downloadAllotment
    Created on : Apr 5, 2017, 8:19:30 PM
    Author     : Mahesh
--%>

<%@page import="com.ralloc.controller.Ralloc"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ralloc.bean.RoomBean"%>
<%@page import="com.ralloc.bean.SubjectStudentCount"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Download Arrangement</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/materialize.min.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
        <script type="text/javascript">
            function verifyDate(){
                var datePatt = /\d\d-\d\d-\d\d\d\d/;
                if(!(datePatt.test(document.getElementById("examDate").value)))
                {
                    alert("Please enter a valid date in the format DD-MM-YYYY");
                }
            }
            function verifyTime(){
                var datePatt = /\d\d:\d\d/;
                if(!(datePatt.test(document.getElementById("examTime").value)))
                {
                    alert("Please enter a valid time in the format HH:MM");
                }
            }
        </script>
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
        <div class="container">
            <h3 class="center">Download Seating Arrangement</h3>
            <hr width="100%" style="border-top:1px solid #989896">
            <div class="row">
                <div class="col l6 m6 s12" style="margin-top: 30px;">
                    <form method="POST"	action="${pageContext.request.contextPath}/Generate/show/detail" enctype="multipart/form-data" target="_blank">
                        <button type="submit" class="btn custom-btn" style="height: 150px;">
                            <span class="flow-text" style="color: white;">DOWNLOAD ALLOTMENT</span>
                        </button>
                    </form>
                </div>
                <div class="col l6 m6 s12" style="margin-top: 30px;">
                    <form method="POST" action="${pageContext.request.contextPath}/Generate/show/indent" target="_blank">
                        <button type="submit" target="_blank" class="btn custom-btn" style="height: 150px;">
                            <span class="flow-text" style="color: white;">DOWNLOAD INDENT</span>
                        </button>
                    </form>
                </div>
            </div>
            <div class="divider"></div>
            <div class="divider"></div>
            <div class="row">
                <div class="col l4 m4 s12 offset-m3 offset-l3" style="margin-top: 30px;">
                    <form method="POST" action="${pageContext.request.contextPath}/Generate/show/bform" target="_blank">

                                <div class="row">
                                        <div class="col l4 m4 s12">
                                            <h6>
                                                Date
                                            </h6>
                                            <br>
                                        </div>
                                        <div class="col l4 m4 s12">
                                            <input type="text" name="Date" id="examDate" required placeholder="dd-mm-yyyy" onblur="verifyDate()"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col l4 m4 s12">
                                            <h6>
                                                Time
                                            </h6>
                                            <br>
                                        </div>
                                        <div class="col l4 m4 s12">
                                            <input type="text" name="Time" id="examTime" required placeholder="hh:mm" onblur="verifyTime()"/>
                                        </div>
                                    </div>
                                <button type="submit" target="_blank" class="btn custom-btn" style="height: 150px;">
                                    <span class="flow-text" style="color: white;">DOWNLOAD B-FORM</span>
                                </button>
                        <br>
                        <br>
                        <br>
                        <br>
                        </div>
                    </form>
                   <br>
                   <br>
                   <br>
                </div>
            </div>
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
