<%-- 
    Document   : upload.jsp
    Created on : 8 Mar, 2017, 6:21:04 PM
    Author     : Sneha
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
                    </div><br>
                    <div class="row">
                        <div class="col-xs-6">
                            <label for="SubName" class="right">Subject Name</label>
                        </div>
                        <div class="col-xs-6">
                            <input type="text" name="SubName" id="name" required />
                        </div>
                    </div>
                    <br><br>
                    <h3>Upload CSV file:</h3><br>
                    <div class="upload">
                    <input type="file" name="uploadFile" required/>
                    </div>
                    <br/><br/>
                    <!---
                    <input type="submit" value="Upload"/> --->
                    <div style="float:left;padding-right:30px;padding-left:10%;padding-right:10%" class="sub>">
                    <button class="button" style="width:300px;" type="submit" value="Upload">Submit</button>
                    </div>
                </form>
            
                <div class="sub" style="float:left;">
                <a href="/View_Ralloc/index.html"><button class="button">Return to Home</button></a>
                </div>
                
        </div>
    </div>
    </body>
</html>