<%-- 
    Document   : finalArrangement
    Created on : Apr 6, 2017, 1:35:02 PM
    Author     : Mahesh
--%>

<%@page import="com.ralloc.bean.SubjectStudentUsn"%>
<%@page import="com.ralloc.model.Room"%>
<%@page import="com.ralloc.bean.SubjectStudentCount"%>
<%@page import="com.ralloc.bean.RoomBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    HashMap<RoomBean,ArrayList<SubjectStudentUsn>> detailedRoomMap;
    HashMap<RoomBean,ArrayList<SubjectStudentCount>> roomMap;
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/seatingArrangement.css" />
        <title>Final Arrangement</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%
        
        detailedRoomMap = (HashMap<RoomBean,ArrayList<SubjectStudentUsn>>)request.getAttribute("detailRoomMap");
        roomMap = (HashMap<RoomBean,ArrayList<SubjectStudentCount>>)request.getAttribute("roomMap");
        for(RoomBean roomBean: detailedRoomMap.keySet())
        {
        %>
            <div class="arrangement">
                <h2>Room: <%out.print(Room.getRoomNameById(roomBean.getRoomId()));%></h2>
                <%
                    ArrayList<SubjectStudentCount> studentList = roomMap.get(roomBean);
                    for(SubjectStudentCount subjects : studentList)
                    {
                        %>
                            <h3><%out.print(subjects.getCourseCode());%>; </h3>
                        <%
                    }
                    %>
                        <div class="usn-list">
                          <%
                                ArrayList<SubjectStudentUsn> usnList = detailedRoomMap.get(roomBean);
                                for(SubjectStudentUsn usn : usnList)
                                    out.print("<div class=\"usn\"> " + usn.getCourseCode() + " </div>");
                          %>
                        </div>
                    <%
                %>
                
            </div>
        <%
        }
        %>        
        <script> window.print(); </script>
    </body>
</html>
