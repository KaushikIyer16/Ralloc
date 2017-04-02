<%-- 
    Document   : deleteData
    Created on : Apr 2, 2017, 7:19:18 PM
    Author     : Mahesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>HOME | Generate Arrangement</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/materialize.min.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
        <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
        <script src="${pageContext.request.contextPath}/js/materialize.min.js"></script>
    </head>
    <body>
        <script type="text/javascript">
            $(document).ready(function(){
                $('ul.tabs').tabs();
            });
        </script>
        <nav>
            <div class="nav-wrapper custom-nav">
                <a href="#" class="brand-logo"><img src="${pageContext.request.contextPath}/images/BMSCE_Logo.svg" class="clg-logo"></a>
                
                <ul id="nav-mobile" class="left clg-name">
                    <li><a href="#"><h5>B.M.S COLLEGE OF ENGINEERING, BANGALORE - 560 019</h5><h6>(Autonomous Institute, Affiliated to VTU)</h6></a></li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <div class="row">
                <div class="col s12">
                  <ul class="tabs delete-tabs">
                    <li class="tab col s6"><a href="#delStudent" class="active">Delete Student Data</a></li>
                    <li class="tab col s6"><a href="#delSubject">Delete Subject Data</a></li>
                    <li class="tab col s6"><a href="#delRoom">Delete Infrastructure Data</a></li>
                    <li class="tab col s6"><a href="#delDep">Delete Department Data</a></li>
                  </ul>
                </div>
            </div>
            <div class="container">
                <div id="delStudent">
                    
                </div>
            </div>
            <div class="container">
                <div id="delSubject">
                    
                </div>
            </div>
            <div class="container">
                <div id="delRoom">
                    
                </div>
            </div>
            <div class="container">
                <div id="delDep">
                    
                </div>
            </div>
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