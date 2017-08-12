
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
                <h6 class="right" style="font-size: 20px;"><b>Form-B</b> &nbsp; &nbsp;</h6>
                <div class="row" style="margin-top: 8px;">
                    <div class="col s3 m3 l3">
                        <img src="${pageContext.request.contextPath}/images/BMS_LOGO_Print.png" class="right" style="height: 60px;">
                    </div>
                    <div class="col s6 m6 l6">
                        <h6 class="center" style="top: 1mm; font-size: 14px;"><b>BMS COLLEGE OF ENGINEERING</b></h6>
                        <h6 class="center" style="font-size: 11px;"><span style="font-size: 11px;">(AUTONOMOUS COLLEGE UNDER VTU)</span>, BANGALORE - 560 019</h6>
                        <h6 class="center" style="font-size: 16px; font-weight: bold">Attendance and Room Superintendent's Report</h6>  
                    </div>
                    <h6 class="left" style="font-size: 13px; margin-left: 50mm;">B.E./B.Arch./M.B.A/M.C.A/M.Tech. ____ Semester Examination <% String tempDate = AllocateRouteServlet.examDate; if(tempDate.equalsIgnoreCase("")) out.print("_________ (MM/YYYY)"); else out.print(" " + AllocateRouteServlet.examDate.substring(3)); %></h6>
                </div>
                <div class="b-form container">
                        <div class="divider"></div>
                        <h6 style="font-size: 12px;"><span><%String tempDept = Department.getDepartmentNameById(DepartmentSubject.getDepartmentIdByCourseCode(subject.getCourseCode())); if(tempDept.equalsIgnoreCase("")) out.print(" &nbsp&nbsp&nbsp Department: __________________"); else out.print("&nbsp&nbsp&nbsp Department: " + "<b>"+tempDept+"</b>");%></span><% out.print("<span class=\"right\"> &nbsp &nbsp &nbsp Room : " + "<b>"+ Room.getRoomNameById(roomBean.getRoomId()) +"</b>" + "</span>");%> </h6>
                        
                        <% out.print("<h6 style= \"font-size: 12px;\"><span> &nbsp&nbsp&nbsp Course: " + Subject.getNameByCourseCode(subject.getCourseCode()) + " </span> <span class=\"right\"> &nbsp &nbsp &nbsp Course Code: " + subject.getCourseCode() +" </span></h6>"); %>
                        <h6 style= "font-size: 12px;"><span><%if(!(AllocateRouteServlet.examDate == null))out.print(" &nbsp&nbsp&nbsp Date: " + AllocateRouteServlet.examDate); else out.print(" &nbsp&nbsp&nbsp Date: ____________");String tempTime = AllocateRouteServlet.examTime ;%></span><% if(!(tempTime.equalsIgnoreCase(""))) out.print("<span class=\"right\"> &nbsp Time: " + AllocateRouteServlet.examTime + " to _________ </span>"); else out.print("<span class=\"right\"> &nbsp &nbsp Time: _________ to _________</span>");%></h6>
                        
                        <div class="divider"></div>
                        <br>
                        <!-- Render the following line for every student -->
                        <table style="margin-left: 12mm; width: 6.8in;">
                            <thead style="border: 1px solid black;">
                            <th style="border-right: 1px solid black; font-size: 10px; font-weight: lighter; padding: 1px 1px 1px;" class="center">Sl. No</th>    
                            <th style="border-right: 1px solid black; font-size: 10px; font-weight: lighter; padding: 1px 1px 1px;" class="center">USN</th>
                            <th style="border-right: 1px solid black; font-size: 10px; font-weight: lighter; padding: 1px 1px 1px;" class="center">Booklet/Drg. Sheet No. / Addl. Booklet/Drg./Graph Sheet No.</th>
                            <th style="border-right: 1px solid black; font-size: 10px; font-weight: lighter; padding: 1px 1px 1px; width: 120px" class="center">Signature</th>
                            </thead>
                            <tbody>
                        <%
                            int slNo=1;
                            for(String usn: subject.getUsnList())
                            {
                                
                                %>
                                <tr style="border: 1px solid black; line-height: 1">
                                        
                                        <%
                                            out.print("<td style=\"padding: 1px 1px 1px; border-right: 1px solid black; font-size: 12px;\" class=\"center\">" + (slNo++) + "</td>");
                                            out.print("<td style=\"padding: 1px 1px 1px; border-right: 1px solid black; font-size: 12px;\">" + usn + "</td>");
                                        %>
                                        <td style="border-right: 1px solid black;"></td>
                                        <td style="border-right: 1px solid black;"></td>
                                    </tr>
                                <%
                            }
                        %>
                            </tbody>
                        </table>
                            <br>
                    <h6 style="margin-left: 5mm; font-size: 0.7rem;">USNs (absentees): ____________________________________________________________________________</h6>
                    <br>
                    <h6 style="margin-left: 5mm; font-size: 0.7rem;">USNs (candidates b/u malpractice): _______________________________________________________________</h6>
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
