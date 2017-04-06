<%@page import="com.ralloc.model.Subject"%>
<%@page import="com.ralloc.model.Department"%>
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
            ArrayList<SubjectStudentCount> subjectList = roomMap.get(roomBean);
            for(SubjectStudentCount subject: subjectList)
            {
                %>
                    <div class="b-form">
                        <div class="row">
                            <div class="form-field semester">
                                <%
                                       out.print(subject.getCourseCode().charAt(4));
                                %>
                            </div>
                            <div class="form-field month">
                                <%
                                       out.print(request.getAttribute("Date").toString().charAt(3) + request.getAttribute("Date").toString().charAt(4) + request.getAttribute("Date").toString().substring(5, 8));
                                %>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-field branch">
                                <%
                                    out.print(Department.getDepartmentNameById(Integer.parseInt(subject.getDepartmentId())));
                                %>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-field subject">
                                <%
                                    out.print(Subject.getNameByCourseCode(subject.getCourseCode()));
                                %>
                            </div>
                            <div class="form-field subject-code">
                                <%
                                    out.print(subject.getCourseCode());
                                %>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-field centre"></div>
                            <div class="form-field from-usn"><!-- From USN --></div>
                            <div class="form-field to-usn"><!-- To USN --></div>
                        </div>
                        <div class="row">
                            <div class="form-field date">
                                <%
                                    out.print(request.getAttribute("Date"));
                                %>
                            </div>
                            <div class="form-field from-time">
                                <%
                                    out.print(request.getAttribute("Time"));
                                %>
                            </div>
                            <div class="form-field to-time"><!-- End time if required --></div>
                        </div>
                        <div class="row"></div>
                        <!-- Render the following line for every student -->
                        
                        <div class="row-usn"><div class="form-field usn"><!-- USN --></div></div>
                    </div>
                <%
            }
        }
        %>
        <script> window.print();</script>
    </body>
</html>