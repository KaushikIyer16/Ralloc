<%-- 
    Document   : indent
    Created on : Apr 6, 2017, 1:25:41 PM
    Author     : Mahesh
--%>

<%@page import="com.ralloc.bean.SubjectStudentUsn"%>
<%@page import="com.ralloc.model.Room"%>
<%@page import="com.ralloc.bean.SubjectStudentCount"%>
<%@page import="com.ralloc.bean.RoomBean"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    HashMap<RoomBean,ArrayList<SubjectStudentUsn>> detailedRoomMap;
    HashMap<RoomBean,ArrayList<SubjectStudentCount>> roomMap;
%>
<!DOCTYPE html>
<head>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/materialize.min.css" />
        <title>Indent</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%
        detailedRoomMap = (HashMap<RoomBean,ArrayList<SubjectStudentUsn>>)request.getAttribute("detailRoomMap");
        roomMap = (HashMap<RoomBean,ArrayList<SubjectStudentCount>>)request.getAttribute("roomMap");
        for(RoomBean roomBean: roomMap.keySet())
        {
            %>
                <div class="container">
                    <div class="col m6 l6 xl6">
                        <h5>Room: <%out.print(Room.getRoomNameById(roomBean.getRoomId()));%></h5>
                        <div class="row center">
                            <div class="col s3 m3 s6">
                                <h6>Course Code</h6>
                            </div>
                            <div class="col s3 m3 s6">
                                <h6>Number of students</h6>
                            </div>
                        </div>
                        <%
                            for(SubjectStudentCount paperCount: roomMap.get(roomBean))
                            {
                                %>
                        
                                    <div class="row center">
                                        <div class="col s3 m3 s6">
                                            <h6><% out.print(paperCount.getCourseCode()); %></h6>
                                        </div>
                                        <div class="col s3 m3 s6">
                                            <h6><% out.print(paperCount.getNumberOfStudents()); %></h6>
                                        </div>
                                    </div>
                                
                                <%
                            }
                        %>                        
                        <div class="divider"></div>
                    </div>
                </div>
            <%
        }
        %>
        <script> window.print(); </script>
    </body>
</html>