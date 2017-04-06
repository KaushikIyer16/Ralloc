<%@page import="com.ralloc.bean.SubjectStudentCount"%>
<%@page import="com.ralloc.bean.RoomBean"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    HashMap<RoomBean,ArrayList<String>> detailedRoomMap;
    HashMap<RoomBean,ArrayList<SubjectStudentCount>> roomMap;
%>
    <head>
        <link rel="stylesheet" type="text/css" href="./css/bform.css" />
        <title></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%
        detailedRoomMap = (HashMap<RoomBean,ArrayList<String>>)request.getAttribute("detailRoomMap");
        roomMap = (HashMap<RoomBean,ArrayList<SubjectStudentCount>>)request.getAttribute("roomMap");
        for(RoomBean roomBean: detailedRoomMap.keySet())
        {
            %>
            <div class="b-form">
            <div class="row">
                <div class="form-field semester">
                    <%
                         
                    %>
                </div>
                <div class="form-field month"><!-- Month and Year --></div>
            </div>
            <div class="row">
                <div class="form-field branch"><!-- Branch(es) --></div>
            </div>
            <div class="row">
                <div class="form-field subject"><!-- Subject Name --></div>
                <div class="form-field subject-code"><!-- Subject Code --></div>
            </div>
            <div class="row">
                <div class="form-field centre"></div>
                <div class="form-field from-usn"><!-- From USN --></div>
                <div class="form-field to-usn"><!-- To USN --></div>
            </div>
            <div class="row">
                <div class="form-field date"><!-- Date --></div>
                <div class="form-field from-time"><!-- From Time --></div>
                <div class="form-field to-time"><!-- To Time --></div>
            </div>
            <div class="row"></div>
            <!-- Render the following line for every student -->
            <div class="row-usn"><div class="form-field usn"><!-- USN --></div></div>
        </div>
            <%
        }
        %>
        <script> window.print();</script>
    </body>
</html>