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
            
            <div class="divider container"></div>
            <%
            ArrayList<SubjectStudentUsn> subjectList = detailedRoomMap.get(roomBean);
            for(SubjectStudentUsn subject: subjectList)
            {
                %>
                <h6 class="center" style="top: 2mm">B.M.S COLLEGE OF ENGINEERING(Autonomous Institution under VTU), BANGALORE - 560 019</h6>
                <h6 class="center">Attendance and Room Superintendent's Report</h6>
                <h6 class="center">B.E./B.Arch./M.B.A/M.C.A/M.Tech./Ph.D./M.Sc.(Res) _______ Semester Examination <% out.print(" " + request.getAttribute("Date").toString().substring(3, 10)); %></h6>
                <div class="b-form container">
                        <div class="divider"></div>
                        <h6><% out.print("Department: "+Department.getDepartmentNameById(DepartmentSubject.getDepartmentIdByCourseCode(subject.getCourseCode()))); out.print(" &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Date: " + request.getAttribute("Date")); out.print("<span class=\"right\">Time: " + request.getAttribute("Time") + " to ________</span>"); %></h6>
                        <% out.print("<h6><span> Subject: " + Subject.getNameByCourseCode(subject.getCourseCode()) + " </span> <span class=\"right\">Course Code: " + subject.getCourseCode() +" </span></h6>"); %>
                        <div class="divider"></div>
                        <br>
                        <!-- Render the following line for every student -->
                        <table style="margin-left: 12mm; width: 6.8in;">
                            <thead style="border: 1px solid black;">
                            <th style="border-right: 1px solid black; font-size: 10px; font-weight: lighter;" class="center">USN</th>
                            <th style="border-right: 1px solid black; font-size: 10px; font-weight: lighter;" class="center">Booklet/Drg. Sheet No.</th>
                            <th style="border-right: 1px solid black; font-size: 10px; font-weight: lighter;" class="center">Signature</th>
                            <th style="border-right: 1px solid black; font-size: 10px; font-weight: lighter;" class="center">Addl. Booklet/Drg./Graph Sheet No.</th>
                            <th style="border-right: 1px solid black; font-size: 10px; font-weight: lighter;" class="center">Total</th>
                            </thead>
                            <tbody>
                        <%
                            for(String usn: subject.getUsnList())
                            {
                                %>
                                <tr style="border: 1px solid black;">
                                        <%
                                            out.print("<td style=\"padding: 5px 4px; border-right: 1px solid black;\">" + usn + "</td>");
                                        %>
                                        <td style="border-right: 1px solid black;"></td>
                                        <td style="border-right: 1px solid black;"></td>
                                        <td style="border-right: 1px solid black;"></td>
                                        <td style="border-right: 1px solid black;"></td>
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