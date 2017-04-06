<%-- 
    Document   : finalArrangement
    Created on : Apr 6, 2017, 1:35:02 PM
    Author     : Mahesh
--%>

<%@page import="com.ralloc.model.Subject"%>
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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/materialize.min.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/seatingArrangement.css" />
        <title>Final Arrangement</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="container">
        <%
        
        detailedRoomMap = (HashMap<RoomBean,ArrayList<SubjectStudentUsn>>)request.getAttribute("detailRoomMap");
        roomMap = (HashMap<RoomBean,ArrayList<SubjectStudentCount>>)request.getAttribute("roomMap");
        for(RoomBean roomBean: detailedRoomMap.keySet())
        {
        %>
            <div class="arrangement">
                <br/>
                <h4>Room: <%out.print(Room.getRoomNameById(roomBean.getRoomId()));%></h4>
                <%
                    ArrayList<SubjectStudentUsn> studentList = detailedRoomMap.get(roomBean);
                    for(SubjectStudentUsn subjects : studentList)
                    {
                        %>
                        <h6><b>Course Code: <%out.print(subjects.getCourseCode());%> </b><span class="right"><b>Subject: <%out.print(Subject.getNameByCourseCode(subjects.getCourseCode()));%></b></span></h6>
                        <%            
                            ArrayList<String> usnList = subjects.getUsnList();
                        %><div class="usn-list"><%
                            for(int i=0; i<usnList.size(); i++)
                            {
                                %><div class="usn"><% out.print(usnList.get(i).toString()); %></div><%
                            }
                            %></div><%
                    }
                %>
                <div class="divider"></div>
            </div>
        <%
        }
        %>     
        </div>
        <script> window.print(); </script>
    </body>
</html>
