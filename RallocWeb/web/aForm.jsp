<%-- 
    Document   : aForm
    Created on : Apr 9, 2017, 8:35:12 PM
    Author     : KNSI
--%>

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
                <img src="${pageContext.request.contextPath}/images/BMS_LOGO_Print.png" style="margin-left: 95mm;">
                <h3 class="center short-margin">B.M.S. COLLEGE OF ENGINEERING (AUTONOMOUS INSTITUTION UNDER VTU) BANGALORE-19</h3>
                <h4 class="center short-margin">Attendance and Room Superintendent's Report</h4>
                <h3 class="center short-margin">B.E/B.Arch/M.B.A/M.C.A/M.Tech. ______ Semester Examination ________ <span style="float:right;margin-right:3rem;font-size:1.5vw;">(MM/YYYY)</span></h3>

                <h4 style="margin-left:10%;" class="short-margin">Branch / title of the course:<% out.print(Department.getDepartmentNameById(DepartmentSubject.getDepartmentIdByCourseCode(subject))); %> </h4>
                <br>
                <h4 class="inline-header ">Subject:<% out.print(Subject.getNameByCourseCode(subject));%> </h4>
                <h4 class="inline-header inline-center">Subject Code: <% out.print(subject); %></h4>
                <br>
                <h4 class="inline-header ">Centre:_______________________________________________</h4>
                <h4 class="inline-header inline-center">Date:</h4>
                <br>
                <div class="divider"></div>

      
      
          <%
          
          HashMap<String,String> studentList = subjectStudents.get(subject);
          ArrayList<String> presentList = new ArrayList();
          ArrayList<String> absentList = new ArrayList();
          for(String student: studentList.keySet())
          {
              
              if(studentList.get(student).equalsIgnoreCase("P"))
                presentList.add(student);
              
              else
                absentList.add(student);
              
          }
              
              %>
          
                 <div class="student-present">
                    <h4 class="inline-header short-margin">Seat Number of the candidates present:</h4>
                    
                
                <%
              
              for(int i=0; i<presentList.size(); i++)
              {
                  %>
      
                   
                  <span class="usn"><% out.print(presentList.get(i)); %></span>
                    
      
                  <%
                      }
                  %>
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
                <h4 class="inline-header short-margin">Seat Number of the candidates booked under malpractice:</h4>
                
                <br>
              </div>          
                    
              <div class="student-absent">
                    <h4 class="inline-header short-margin">Seat Number of the candidates absent:</h4>
                    
                    
              
              <%
              for(int i=0; i<absentList.size(); i++)
              {
                %>
                      
                <span class="usn"><% out.print(absentList.get(i)); %></span>  
                        
                <%
                    }
                %>
                <br>
                </div>    
                    
                <%    
              
              
          
      }
      
      %>      
    </div>
  <script type="text/javascript">
    window.print();
  </script>
  </body>
</html>
