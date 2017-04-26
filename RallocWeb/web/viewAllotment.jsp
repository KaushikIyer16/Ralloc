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
    </head>
    <body>
        <nav>
            <div class="nav-wrapper custom-nav">
                <a href="${pageContext.request.contextPath}/home" class="brand-logo"><img src="${pageContext.request.contextPath}/images/BMSCE_Logo.svg" class="clg-logo"></a>
                
                <ul id="nav-mobile" class="left clg-name">
                    <li><a href="${pageContext.request.contextPath}/home"><h5>B.M.S. COLLEGE OF ENGINEERING, BANGALORE - 560 019</h5><h6>(Autonomous Institute, Affiliated to VTU)</h6></a></li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <h3 class="center">DOWNLOAD SEATING ARRANGEMENT</h3>
            <hr width="100%" style="border-top:1px solid #989896">
            <div class="row">
                <div class="col s4 m4 l4">
                    <h4 class="center">ARRANGEMENT</h4>
                    <br>
                    <br>
                    <div class="row">
                        <div class="col l6 m6 s6">
                            <form method="POST"	action="${pageContext.request.contextPath}/Generate/show/detail" enctype="multipart/form-data" target="_blank">
                                <button type="submit" class="btn transparent" style="height: 80px; width: 100%;">
                                    <span style="color: black;"><i class="fa fa-download" aria-hidden="true"></i><br>PDF</span>
                                </button>
                            </form>
                        </div>
                        <div class="col l6 m6 s6">
                            <form method="POST"	action="${pageContext.request.contextPath}/Download/allotmentDocument" enctype="multipart/form-data" target="_blank">
                                <input type="hidden" name="pathName"/>
                                <button type="submit" class="btn transparent" style="height: 80px; width: 100%;">
                                    <span style="color: black;"><i class="fa fa-download" aria-hidden="true"></i><br>DOCX</span>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col s4 m4 l4">
                    <h4 class="center">INDENT</h4>
                    <br>
                    <br>
                    <div class="row">
                        <div class="col l6 m6 s6">
                            <form method="POST"	action="${pageContext.request.contextPath}/Generate/show/indent" enctype="multipart/form-data" target="_blank">
                                <button type="submit" class="btn transparent" style="height: 80px; width: 100%;">
                                    <span style="color: black;"><i class="fa fa-download" aria-hidden="true"></i><br>PDF</span>
                                </button>
                            </form>
                        </div>
                        <div class="col l6 m6 s6">
                            <form method="POST"	action="${pageContext.request.contextPath}/Download/indentDocument" enctype="multipart/form-data" target="_blank">
                                <button type="submit" class="btn transparent" style="height: 80px;  width: 100%;">
                                    <span style="color: black;"><i class="fa fa-download" aria-hidden="true"></i><br>DOCX</span>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col s4 m4 l4">
                    <h4 class="center">B-FORM</h4>
                    <br>
                    <br>
                    <div class="row">
                        <div class="col l6 m6 s6">
                            <form method="POST"	action="${pageContext.request.contextPath}/Generate/show/bform" enctype="multipart/form-data" target="_blank">
                                <button type="submit" class="btn transparent" style="height: 80px;  width: 100%;">
                                    <span style="color: black;"><i class="fa fa-download" aria-hidden="true"></i><br>PDF</span>
                                </button>
                            </form>
                        </div>
                        <div class="col l6 m6 s6">
                            <form method="POST"	action="${pageContext.request.contextPath}/Download/bFormDocument" enctype="multipart/form-data" target="_blank">
                                <input type="hidden" name="pathName"/>
                                <button type="submit" class="btn transparent" style="height: 80px; width: 100%;">
                                    <span style="color: black;"><i class="fa fa-download" aria-hidden="true"></i><br>DOCX</span>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
