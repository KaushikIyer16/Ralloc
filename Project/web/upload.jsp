<%-- 
    Document   : upload.jsp
    Created on : 8 Mar, 2017, 6:21:04 PM
    Author     : Sneha
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="./css/Main.css" />
        
        <title>File Upload</title>
    </head>
    <body>
    <div class="container">
        <h1 class="college-header">B.M.S COLLEGE OF ENGINEERING, BANGALORE - 560 019</h1>
        <h4 class="affiliation">(Autonomous Institute, Affiliated to VTU)</h4>
        <h3 class="form-header">UPLOAD CSV FILE FOR SUBJECT</h3>
        <hr width="100%" style="border-top:1px solid #989896">
        
        <div style="padding-left:10%;padding-right:10%;">
                <h3> Enter subject details: </h3>
                <form method="post" action="uploadFile" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-xs-6">
                            <label for="SubCode" class="right">Subject Code</label>
                        </div>
                        <div class="col-xs-6">
                            <input type="text" name="SubCode" id="name" required/>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-xs-6">
                            <label for="SubName" class="right">Subject Name</label>
                        </div>
                        <div class="col-xs-6">
                            <input type="text" name="SubName" id="name" required />
                        </div>
                    </div>
                    <br><br>
                    <div class="row">
                        <div class="col-xs-6">
                            <label for="Depend" class="right">Dependency Exists</label>
                        </div>
                        <div class="col-xs-6">
                            <input type="checkbox" name="Depend" value="Exist" id="name"/>
                        </div>
                    </div>
                    <div>
                        <div class="col-xs-6">
                            <label for="DepCode" class="right">Dependency Code</label>
                        </div>
                        <div class="col-xs-6">
                            <input type="text" name="DepCode" id="name"/>
                        </div>
                    </div>
                    <br>
                    
                    <br><br>
                    <h3>Upload CSV file:</h3><br>
                    <div class="upload">
                    <input type="file" name="uploadFile" required/>
                    </div>
                    <br/><br/>
                    -
                    <input type="submit" value="Upload"/> -
                    <div style="float:left;padding-right:30px;padding-left:10%;padding-right:10%" class="sub>">
                    <button class="button" style="width:300px;" type="submit" value="Upload">Submit</button>
                    </div>
                </form>
            
                <div class="sub" style="float:left;">
                <a href="./index.html"><button class="button">Return to Home</button></a>
                </div>
                
        </div>
    </div>
    </body>
</html>-->
<html>
    <head>
        <title>Subject Details | Upload CSV File</title>
        <link rel="stylesheet" type="text/css" href="./css/materialize.min.css" />
        <link rel="stylesheet" type="text/css" href="./css/Main.css" />
        <link rel="stylesheet" type="text/css" href="./css/font-awesome.min.css" />
    </head>
    <body>
        <nav>
            <div class="nav-wrapper custom-nav">
                <a href="#" class="brand-logo"><img src="./images/BMSCE_Logo.svg" style="height: 80px; margin-top: 10px;"></a>
                
                <ul id="nav-mobile" class="left" style="margin-left: 100px;">
                    <li><a href="#"><h5>B.M.S COLLEGE OF ENGINEERING, BANGALORE - 560 019</h5><h6>(Autonomous Institute, Affiliated to VTU)</h6></a></li>
                </ul>
                <ul class="right" style="margin-right: 30px;">
                    <li><a href="#"><i class="fa fa-info-circle" aria-hidden="true"></i> Help</a></li>
                    <li><a href="#"><i class="fa fa-arrow-right" aria-hidden="true"></i> About</a></li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <h3>Please choose the CSV file for uploading the subject details</h3>
            <form method="post" action="uploadFile" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col l6 m6 s12">
                            <input type="text" name="SubCode" id="name" required placeholder="Subject Code" />
                        </div>
                        <div class="col l6 m6 s12">
                            <input type="text" name="SubName" id="name" required placeholder="Subject Name" />
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col l6 m6 s12">
                            <p>
                                <input type="checkbox" id="test5" name="Depend" value="Exist"/>
                                <label for="test5">Dependency Exists</label>
                            </p>
                        </div>
                        <div class="col l6 m6 s12">
                            <input type="text" name="DepCode" id="name" placeholder="Dependency Code"/>
                        </div>
                    </div>
                    <br>
                    <br>
                    <h3>Upload CSV file:</h3>
                    <br>
                    <div class="file-field input-field">
                        <div class="btn custom-btn">
                          <span>CSV File</span>
                          <input type="file" name="uploadFile">
                        </div>
                        <div class="file-path-wrapper">
                          <input class="file-path validate" type="text">
                        </div>
                    </div>
                    <br/>
                    <br/>
                    <div class="row">
                        <div class="col s12 l6 m6">
                            <button class="btn custom-btn" style="width:250px;" type="submit" value="Upload">Submit</button>
                        </div>
                        <div class="col s12 l6 m6">
                            <button class="btn custom-btn" style="width:250px;"  value="Upload">Back to Home</button>
                        </div>
                    </div>
                </form>
            <div style="margin-bottom: 80px;"></div>
        </div>
        <footer style="bottom: 0; background-color: #444; bottom: 0px; position: fixed; width: 100%;">
            <div class="footer-copyright">
                <div class="container" style="color: white;">
            © 2017 BMSCE
            <a class="text-lighten-4 right" href="#!" style="color: white;">Developed by Department of ISE</a>
            </div>
          </div>
        </footer>
    </body>  
</html>
