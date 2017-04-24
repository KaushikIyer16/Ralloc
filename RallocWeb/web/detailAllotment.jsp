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
<!--        <div class="row">
            <div class="col s3 m3 l3">
                <img src="/images/BMS_LOGO_Print.png" class="right">
            </div>
            <div class="col s8 m8 l8">
                <h6 class="center" style="top: 2mm">B.M.S. COLLEGE OF ENGINEERING, BANGALORE - 560 019</h6>
                <h6 class="center">Attendance and Room Superintendent's Report</h6>
                <h6 class="center">B.E./B.Arch./M.B.A/M.C.A/M.Tech. ___ Semester Examination _________</h6>
            </div>
        </div>-->
        
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
