<%@page import="com.ralloc.model.Room"%>
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

            <%
            ArrayList<SubjectStudentUsn> subjectList = detailedRoomMap.get(roomBean);
            for(SubjectStudentUsn subject: subjectList)
            {
                %>
                <div class="row" style="margin-top: 10px;">
                    <div class="col s3 m3 l3">
                        <img src="${pageContext.request.contextPath}/images/BMS_LOGO_Print.png" class="right" style="height: 60px;">
                    </div>
                    <div class="col s8 m8 l8">
                        <h6 class="center" style="top: 1mm; font-size: 12px;">B.M.S. COLLEGE OF ENGINEERING, BANGALORE - 560 019</h6>
                        <h6 class="center" style="font-size: 12px;">Attendance and Room Superintendent's Report</h6>
                        <h6 class="center" style="font-size: 12px;">B.E./B.Arch./M.B.A/M.C.A/M.Tech. ___ Semester Examination <% out.print(" " + AllocateRouteServlet.examDate); %></h6>
                    </div>
                </div>
                <div class="b-form container">
                        <div class="divider"></div>
                        <h6><% out.print("Department: "+Department.getDepartmentNameById(DepartmentSubject.getDepartmentIdByCourseCode(subject.getCourseCode()))); out.print(" &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Date: " + request.getAttribute("Date")); out.print("<span class=\"right\">Time: " + AllocateRouteServlet.examTime + " to ________</span>"); %></h6>
                        <% out.print("<h6><span> Subject: " + Subject.getNameByCourseCode(subject.getCourseCode()) + " </span> <span> &nbsp &nbsp &nbsp Center/Room : " + Room.getRoomNameById(roomBean.getRoomId()) + "</span> <span class=\"right\">Course Code: " + subject.getCourseCode() +" </span></h6>"); %>
                        <div class="divider"></div>
                        <br>
                        <!-- Render the following line for every student -->
                        <table style="margin-left: 12mm; width: 6.8in;">
                            <thead style="border: 1px solid black;">
                            <th style="border-right: 1px solid black; font-size: 8px; font-weight: lighter; padding: 1px 1px 1px;" class="center">USN</th>
                            <th style="border-right: 1px solid black; font-size: 8px; font-weight: lighter; padding: 1px 1px 1px;" class="center">Booklet/Drg. Sheet No.</th>
                            <th style="border-right: 1px solid black; font-size: 8px; font-weight: lighter; padding: 1px 1px 1px;" class="center">Signature</th>
                            <th style="border-right: 1px solid black; font-size: 8px; font-weight: lighter; padding: 1px 1px 1px;" class="center">Addl. Booklet/Drg./Graph Sheet No.</th>
                            <th style="border-right: 1px solid black; font-size: 8px; font-weight: lighter; padding: 1px 1px 1px;" class="center">Total</th>
                            </thead>
                            <tbody>
                        <%
                            for(String usn: subject.getUsnList())
                            {
                                %>
                                <tr style="border: 1px solid black; line-height: 1">
                                        <%
                                            out.print("<td style=\"padding: 1px 1px 1px; border-right: 1px solid black; font-size: 8px;\">" + usn + "</td>");
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
                    <h6 style="margin-left: 5mm; font-size: 0.5rem;">USNs (absentees): _________________________________________________________________</h6>
                    <br>
                    <h6 style="margin-left: 5mm; font-size: 0.5rem;">USNs (candidates b/u malpractice): __________________________________________________________</h6>
                    <br>
                    
                            <table style="border: 0px solid black;" class="center">
                                <tr>
                                    <td></td>
                                    <td style="padding-top: 0px;">
                                        <h6 class="center"><span style="text-decoration: underline; font-size: 10.5px">Room Superintendent / Examiner -1</span></h6>
                                    </td>
                                    <td style="padding-top: 0px;">
                                        <h6 class="center"><span style="text-decoration: underline; font-size: 10.5px">Examiner - II</span></h6>
                                    </td>
                                    <td style="padding-top: 0px;">
                                        <h6 class="center"><span style="text-decoration: underline; font-size: 10.5px">Chief/Deputy Superintendent</span></h6>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-top: 0px;">
                                        <h6 class="left" style="font-size: 11.5px;">Signature</h6>
                                    </td>
                                    <td style="padding-top: 0px;">
                                        <h6>:_______________________</h6>
                                    </td>
                                    <td style="padding-top: 0px;">
                                        <h6>____________________</h6>
                                    </td >
                                    <td style="padding-top: 0px;">
                                        <h6>____________________</h6>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-top: 0px;">
                                        <h6 class="left" style="font-size: 11.5px;">Name</h6>
                                    </td>
                                    <td style="padding-top: 0px;">
                                        <h6>:_______________________</h6>
                                    </td>
                                    <td>
                                        <h6>____________________</h6>
                                    </td>
                                    <td style="padding-top: 0px;">
                                        <h6>____________________</h6>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-top: 0px;">
                                        <h6 class="left" style="font-size: 11.5px;">Affiliation</h6>
                                    </td>
                                    <td style="padding-top: 0px;">
                                        <h6>:_______________________</h6>
                                    </td>
                                    <td style="padding-top: 0px;">
                                        <h6>____________________</h6>
                                    </td>
                                    <td style="padding-top: 0px;">
                                        <h6>____________________</h6>
                                    </td>
                                </tr>
                            </table>
                        </div>                   
                <%
            }
        }
        %>
        <script> window.print();</script>
    </body>
</html>
