<%-- 
    Document   : indent
    Created on : Apr 6, 2017, 1:25:41 PM
    Author     : Mahesh
--%>

<%@page import="com.ralloc.model.Room"%>
<%@page import="com.ralloc.bean.SubjectStudentCount"%>
<%@page import="com.ralloc.bean.RoomBean"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    HashMap<RoomBean,ArrayList<String>> detailedRoomMap;
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
        detailedRoomMap = (HashMap<RoomBean,ArrayList<String>>)request.getAttribute("detailRoomMap");
        roomMap = (HashMap<RoomBean,ArrayList<SubjectStudentCount>>)request.getAttribute("roomMap");
        for(RoomBean roomBean: detailedRoomMap.keySet())
        {
            %>
                <div class="container">
                    <div class="col m6 l6 xl6">
                        <h5>Room: <%out.print(Room.getRoomNameById(roomBean.getRoomId()));%></h5>
                        <table class="centered bordered responsive-table">
                            <thead>
                                <th>Course Code</th>
                                <th>Number of Students Writing</th>
                            </thead>
                            <tbody>
                                <%
                                
                                    ArrayList<SubjectStudentCount> studentList = roomMap.get(roomBean);
                                        for(SubjectStudentCount subjects : studentList)
                                        {
                                            %>
                                                <tr><%out.print(subjects.getCourseCode());%></tr>
                                                <tr><%out.print(subjects.getNumberOfStudents());%></tr>                                
                                            <%
                                        }

                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            <%
        }
        %>
        <script> window.print(); </script>
    </body>
</html>