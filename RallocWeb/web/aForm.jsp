<%-- 
    Document   : aForm
    Created on : Apr 9, 2017, 8:35:12 PM
    Author     : KNSI
--%>

<%@page import="java.util.Collections"%>
<%@page import="com.ralloc.model.Subject"%>
<%@page import="com.ralloc.model.Department"%>
<%@page import="com.ralloc.model.DepartmentSubject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>A form </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aform.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/materialize.min.css"/>
    <%
    
    HashMap<String, HashMap<String, String>> subjectStudents = (HashMap<String, HashMap<String, String>>) request.getAttribute("subjectStudents");
    %>
  </head>
  <body>
      <%
      
      for(String subject : subjectStudents.keySet())
      {
          
          %>
      
            <div class="a-form">
                <div class="row" style="margin-top: 10px;">
                    <div class="col s3 m3 l3">
                        <img src="${pageContext.request.contextPath}/images/BMS_LOGO_Print.png" class="right" style="height: 60px;">
                    </div>
                    <div class="col s8 m8 l8">
                        <h6 class="center" style="font-size: 12px;">B.M.S. COLLEGE OF ENGINEERING, BANGALORE - 560 019</h6>
                        <h6 class="center" style="font-size: 12px;">Attendance and Room Superintendent's Report</h6>
                        <h6 class="center short-margin" style="font-size: 12px;">B.E/B.Arch/M.B.A/M.C.A/M.Tech. ______ Semester Examination ________ <span style="float:right;margin-right:3rem;font-size:1.2vw;">(MM/YYYY)</span></h6>
                    </div>
                </div>
                <h6 style="margin-left:10%;" class="short-margin">Branch / Title of the course:<% out.print(Department.getDepartmentNameById(DepartmentSubject.getDepartmentIdByCourseCode(subject))); %> </h6>
                <h6 class="inline-header ">Subject:<% out.print(Subject.getNameByCourseCode(subject));%> </h6>
                <h6 class="inline-header inline-center">Subject Code: <% out.print(subject); %></h6>
                <h6 class="inline-header "><span>Centre:___________________________</span><span class="right">Date: _____________________ &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</span></h6>      
      
          <%
          
          HashMap<String,String> studentList = subjectStudents.get(subject);
          ArrayList<String> presentList = new ArrayList();
          ArrayList<String> absentList = new ArrayList();
          ArrayList<String> mpList = new ArrayList();
          for(String student: studentList.keySet())
          {
              
              if(studentList.get(student).equalsIgnoreCase("P"))
                presentList.add(student);
              
              else if(studentList.get(student).equalsIgnoreCase("NP"))
                absentList.add(student);
              
              else
                  mpList.add(student);
              
          }
          Collections.sort(presentList);
          Collections.sort(absentList);
              
              %>
          
                 <div class="student-present">
                    <h6 class="short-margin">Seat Number of the candidates present:</h6>
                    
                
                <%
              
              for(int i=0; i<presentList.size(); i++)
              {
                  %>
      
                   
                  <span class="usn"><% out.print(presentList.get(i)); %></span>
                    
      
                  <%
                      }
                  %>
                  <br>
                  <span class="right">Total: &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</span>
                  <br>
              </div>  
                    
                  <%
                      
                  //if(i%50 == 0)
                  //{
                      %>
                  
                        
                
                      <%
                  //}
              

              %>
                      
              <div class="student-defaulters">
                <h6 class="short-margin">Seat Number of the candidates booked under malpractice:</h6>
                    <%
                    
                        for(int i=0; i<mpList.size(); i++)
                        {
                            
                            %>
                    
                                <span class="usn"><% out.print(mpList.get(i)); %></span>
                
                            <%
                            
                        }
                    
                    %>
                <br>
                <span class="right">Total: &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</span>
                <br>
              </div>          
                    
              <div class="student-absent">
                    <h6 class="short-margin">Seat Number of the candidates absent:</h6>
                    
                    
              
              <%
              for(int i=0; i<absentList.size(); i++)
              {
                %>
                      
                <span class="usn"><% out.print(absentList.get(i)); %></span>  
                        
                <%
                    }
                %>
                <br>
                <span class="right">Total: &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</span>
                <br>
                </div>    
                <h6><span>Total number of answer books enclosed : _________________</span> <span class="right">Total number of packets : _________________ &nbsp &nbsp &nbsp &nbsp</span></h6>    
                                    
                            <table style="border: 0px solid black;" class="center">
                                <tr>
                                    <td></td>
                                    <td style="padding-top: 0px;">
                                        <h6 class="left"><span style="text-decoration: underline; font-size: 10.5px; margin-left: -5px;"> Deputy Chief Superintendent </span></h6>
                                    </td>
                                    <td style="padding-top: 0px;">
                                        <h6 class="left"><span style="text-decoration: underline; font-size: 10.5px; margin-left: -5px;"> Chief Superintendent </span></h6>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-top: 0px;">
                                        <h6 class="left" style="font-size: 11.5px; margin-left: 0.8in;">Signature with date</h6>
                                    </td>
                                    <td style="padding-top: 0px;">
                                        <h6>: _______________________</h6>
                                    </td>
                                    <td style="padding-top: 0px;">
                                        <h6>____________________</h6>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-top: 0px;">
                                        <h6 class="left" style="font-size: 11.5px; margin-left: 0.8in;">Name</h6>
                                    </td>
                                    <td style="padding-top: 0px;">
                                        <h6>: _______________________</h6>
                                    </td>
                                    <td style="padding-top: 0px;">
                                        <h6>____________________</h6>
                                    </td>
                                </tr>
                            </table>
                
                <%              
      }
      
      %>      
    </div>
  <script type="text/javascript">
    window.print();
  </script>
  </body>
</html>
