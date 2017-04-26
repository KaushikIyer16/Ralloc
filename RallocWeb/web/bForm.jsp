<%@page import="com.ralloc.routes.AllocateRouteServlet"%>
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
                <div class="row">
                    <div class="col s3 m3 l3">
                        <img src="${pageContext.request.contextPath}/images/BMS_LOGO_Print.png" class="right">
                    </div>
                    <div class="col s8 m8 l8">
                        <h6 class="center" style="top: 2mm">B.M.S. COLLEGE OF ENGINEERING, BANGALORE - 560 019</h6>
                        <h6 class="center">Attendance and Room Superintendent's Report</h6>
                        <h6 class="center">B.E./B.Arch./M.B.A/M.C.A/M.Tech. ___ Semester Examination <% out.print(" " + AllocateRouteServlet.examDate); %></h6>
                    </div>
                </div>
                <div class="b-form container">
                        <div class="divider"></div>
                        <h6><% out.print("Department: "+Department.getDepartmentNameById(DepartmentSubject.getDepartmentIdByCourseCode(subject.getCourseCode()))); out.print(" &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Date: " + request.getAttribute("Date")); out.print("<span class=\"right\">Time: " + AllocateRouteServlet.examTime + " to ________</span>"); %></h6>
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
                    <br>
                    <h6 style="margin-left: 5mm;">USNs (absentees): ________________________________________________________</h6>
                    <br>
                    <h6 style="margin-left: 5mm;">USNs (candidates b/u malpractice): _____________________________________________</h6>
                    <br>
                    <h6 style="font-size: 6px;"><span style="text-decoration: underline; margin-left: 16mm;">Room Superintendent / Examiner -1</span><span style="text-decoration: underline; margin-left: 20mm;">Room Superintendent / Examiner -1</span><span style="text-decoration: underline; margin-left: 20mm;">Chief / Deputy Superintendent</span></h6>
                    <br>
                    <h6><span style="margin-left: 5mm; font-size: 8px;">Signature : _________________________</span><span style="margin-left: 20mm;"> ___________________</span><span style="margin-left: 10mm;"> _____________________</span></h6>
                    <br>
                    <h6><span style="margin-left: 5mm; font-size: 12px;"> Name : _________________________</span><span style="margin-left: 20mm;"> ___________________</span><span style="margin-left: 10mm;"> _____________________</span></h6>
                    <br>
                    <h6><span style="margin-left: 5mm; font-size: 8px;">Affiliation : _________________________</span><span style="margin-left: 20mm;"> ___________________</span><span style="margin-left: 10mm;"> _____________________</span></h6>
                
                </div>
                    
                <%
            }
        }
        %>
        <script> window.print();</script>
    </body>
</html>
