<%@page import="com.ralloc.view.UploadFileServlet"%>
<%@page import="com.ralloc.model.DepartmentSubject"%>
<%@page import="com.ralloc.bean.SubjectStudentUsn"%>
<%@page import="com.ralloc.model.Subject"%>
<%@page import="com.ralloc.model.Department"%>
<%@page import="com.ralloc.bean.SubjectStudentCount"%>
<%@page import="com.ralloc.bean.RoomBean"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    HashMap<RoomBean,ArrayList<SubjectStudentUsn>> detailedRoomMap;
    HashMap<RoomBean,ArrayList<SubjectStudentCount>> roomMap;
%>
    <head>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bform.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/materialize.min.css" />
        <title></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%
        detailedRoomMap = (HashMap<RoomBean,ArrayList<SubjectStudentUsn>>)request.getAttribute("detailRoomMap");
        roomMap = (HashMap<RoomBean,ArrayList<SubjectStudentCount>>)request.getAttribute("roomMap");
        for(RoomBean roomBean: detailedRoomMap.keySet())
        {
            %>
        
            <h6 class="center" style="top: 2mm">B.M.S COLLEGE OF ENGINEERING, BANGALORE - 560 019</h6>
            <h6 class="center">(Autonomous Institute, Affiliated to VTU)</h6>
            <h6 class="center">Semester End Examination - B.E./B.Arch.</h6>
            <br>
            <div class="divider container"></div>
            <%
            ArrayList<SubjectStudentUsn> subjectList = detailedRoomMap.get(roomBean);
            for(SubjectStudentUsn subject: subjectList)
            {
                %>
                <div class="b-form container">
                        <div class="row">
                            <div class="form-field semester">
                                <%
                                       out.print("<h5>Semester : " + subject.getCourseCode().charAt(4) + "</h5>");
                                %>
                            </div>
                            <div class="form-field month">
                                <%
                                       out.print("<h5>Month and year: " + request.getAttribute("Date").toString().substring(3, 10) + "</h5>");
                                %>
                            </div>
                        </div>
                        <div class="divider"></div>
                        <div class="row">
                            <div class="form-field branch">
                                <%
                                    out.print("<h5> Department: "+Department.getDepartmentNameById(DepartmentSubject.getDepartmentIdByCourseCode(subject.getCourseCode())) + "</h5>");
                                %>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-field subject">
                                <%
                                    out.print("<h6> Subject: " + Subject.getNameByCourseCode(subject.getCourseCode()) + "</h6>");
                                %>
                            </div>
                            <div class="form-field subject-code">
                                <%
                                    out.print("<h6> Course Code: " + subject.getCourseCode() + "</h6>");
                                %>
                            </div>
                            <div class="form-field date">
                                <%
                                    out.print("<h6> Date: " + request.getAttribute("Date") + "</h6>");
                                %>
                            </div>
                            <div class="form-field from-time">
                                <%
                                    out.print("<h6>Start Time: " + request.getAttribute("Time") + "</h6>");
                                %>
                            </div>
                        </div>
                        <div class="divider"></div>
                        <div class="row"></div>
                        <!-- Render the following line for every student -->
                        <table style="margin-left: 18mm; width: 6.5in;">
                            <tbody>
                        <%
                            for(String usn: subject.getUsnList())
                            {
                                %>
                                <tr style="border: 1px solid black;">
                                        <%
                                            out.print("<td style=\"padding: 8px 5px;\">" + usn + "</td>");
                                        %>
                                    </tr>
                                <%
                            }
                        %>
                            </tbody>
                        </table>
                    </div>
                <%
            }
        }
        %>
        <script> window.print();</script>
    </body>
</html>