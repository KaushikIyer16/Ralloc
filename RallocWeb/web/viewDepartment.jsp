<%-- 
    Document   : viewDepartment
    Created on : Apr 4, 2017, 1:00:01 AM
    Author     : kaushiknsiyer
--%>

<%@page import="com.ralloc.model.Room"%>
<%@page import="com.ralloc.model.StudentSubject"%>
<%@page import="com.ralloc.model.Subject"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ralloc.model.Department"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! 
    HashMap<Integer,String> departmentList;
    ArrayList<Subject> subjectList;
    ArrayList<StudentSubject> usnList;
    ArrayList<Room> roomList;
%>
<%
    departmentList = Department.getDepartments();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Department Details</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/materialize.min.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
        <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
        <script src="${pageContext.request.contextPath}/js/materialize.min.js"></script>
        <style>
            table,tr{
                boreder: 1px solid black;
            }
        </style>
    </head>
    <body>
        <script type="text/javascript">
            $(document).ready(function(){
                $('ul.tabs').tabs();
            });
        </script>
        <nav>
            <div class="nav-wrapper custom-nav">
                <a href="${pageContext.request.contextPath}/home" class="brand-logo"><img src="${pageContext.request.contextPath}/images/BMSCE_Logo.svg" class="clg-logo"></a>
                
                <ul id="nav-mobile" class="left clg-name">
                    <li><a href="${pageContext.request.contextPath}/home"><h5>B.M.S. COLLEGE OF ENGINEERING, BANGALORE - 560 019</h5><h6>(Autonomous Institute, Affiliated to VTU)</h6></a></li>
                </ul>
            </div>
        </nav>
        
            
            
            
            
            <!-- code starts here-->
            
            
            
            <div class="container">
            <div class="row">
                <div class="col s12">
                  <ul class="tabs delete-tabs">
                    <li class="tab col s6"><a href="#viewStudent" class="active">View Student Data</a></li>
                    <li class="tab col s6"><a href="#viewDep">View Department Data</a></li>
                    <li class="tab col s6"><a href="#viewSubject">View Course Data</a></li>
                    <li class="tab col s6"><a href="#viewRoom">View Room Data</a></li>
                    
                  </ul>
                </div>
            </div>
            <div class="container">
                <div id="viewStudent">
                    <div class="row" style="margin-top: 5%;">
                        <div class="col l12 m6 s12" style=" min-height: 150px;">
                            <h5>Course-wise Student USNs</h5>
                            <br>
                            <br>
                            
                            <%
                                subjectList=Subject.getAllDetails();
                                for(Subject subList: subjectList){
                                    usnList = StudentSubject.getStudentsByCourseCode(subList.getCourseCode());
                                    if(usnList.size()==0)
                                        continue;
                                    out.println("<h5>"+subList.getCourseCode()+ "</h5><br>");
                                    
                                    for(StudentSubject listOfUsn: usnList){
                                        out.print(listOfUsn.getUsn()+"&emsp;");
                                    }
                                    out.println("<br><br>");
                                }
                            %>
                            
                        </div>
                        
                    </div>
                </div>
            </div>
                            
            <div class="container">
                <div id="viewSubject">
                    <div class="row" style="margin-top: 5%;">
                        <h5>Course Details</h5>
        <table>
            <tr>
                <th class="center"> Course Name</th>
                <th class ="center"> Course Code</th>
            </tr>
            
            <%
                subjectList = Subject.getAllDetails();
                
                for(Subject subList : subjectList){
                    %>
            
                    <tr>
                        <td class="center"><% out.print(subList.getName()); %></td>
                        <td class="center"><% out.print(subList.getCourseCode()); %></td>
                    </tr>
                    
                    <%
                }
            %>
            
        </table>
                    </div>
                </div>
            </div>
            
            <div class="container">
                <div id="viewDep">
                    <div class="row" style="margin-top: 5%;">
                        <h5>Department Details</h5>
        <table>
            <tr>
                <th class="center"> Department Name</th>
                <th class="center"> Department ID to be given in the Excel File</th>
            </tr>
            <%for(Integer keys : departmentList.keySet()) {%>
                <tr>
                    <td class="center"><%= departmentList.get(keys) %></td>
                    <td class="center"><%= keys%></td>
                </tr>
            <%}%>
        </table>
                    </div>
                </div>
            </div>
            <div class="container">
                <div id="viewRoom">
                    <h5>Room Details</h5>
                    
                    <table>
            <tr>
                <th class="center">Room ID</th>
                <th class="center"> Room Name</th>
                <th class="center"> Capacity of the Room</th>
            </tr>
            <%
                roomList = Room.getAllRoomDetails();
                for(Room rl : roomList){
                    %>
            
                    <tr>
                        <td class="center"><% out.print(rl.getRoomId()); %></td>
                        <td class="center"><% out.print(rl.getName()); %></td>
                        <td class="center"><% out.print(rl.getCapacity()); %></td>
                    </tr>
                    
                    <%
                }
            %>
                
        </table>
                </div>
            </div>
            <br>
            <br>
            <br>
            <a class="btn custom-btn" href="${pageContext.request.contextPath}/home">Back to Home</a>
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
