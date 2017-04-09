<%-- 
    Document   : aForm
    Created on : Apr 9, 2017, 8:35:12 PM
    Author     : Mahesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/materialize.min.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/aform.css" />
        <title>A-Form</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h6 class="center" style="top: 2mm">B.M.S COLLEGE OF ENGINEERING, BANGALORE - 560 019</h6>
        <h6 class="center">(Autonomous Institute, Affiliated to VTU)</h6>
        <h6 class="center">Semester End Examination - B.E./B.Arch.</h6>
        <br>
        <div class="divider container"></div>
        <br>
        <div class="a-form container">
            
            <div class="row">
                <div class="col">
                    <h5><% out.print("Room Name: " + request.getAttribute("roomName")); %></h5>
                </div>
                <div class="col">
                    <h5 style="margin-left: 50mm;"><% out.print("Course Code : " + request.getAttribute("courseCode")); %></h5>
                </div>
            </div>
                
            <div class="divider"></div>
            
            <h6>Candidates Present</h6>
            
            <div style="border: 1px solid black;">
                <% for(String s : (String[])request.getAttribute("presentUsn"))
                {
                    %>
                
                        <div class="usn-list">
                            <div class="usn"><% out.print(s); %></div>
                        </div>
                    
                    <%
                }
                %>
            </div>
            
            <h6>Candidates Absent</h6>
            
            <div style="border: 1px solid black;">
                <% for(String s : (String[])request.getAttribute("absentUsn"))
                {
                    %>
                
                        <div class="usn-list">
                            <div class="usn"><% out.print(s); %></div>
                        </div>
                    
                    <%
                }
                %>
            </div>
        </div>
    </body>
    <script>window.print();</script>
</html>
