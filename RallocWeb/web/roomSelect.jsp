<%-- 
    Document   : roomSelect
    Created on : 7 Jun, 2017, 9:41:53 AM
    Author     : Bhargav
--%>


<%@page import="com.ralloc.model.Room"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Rooms for Allotment</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/materialize.min.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
        <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
        <script language="javascript" type="text/javascript">
           
            function deselect(){
                var x = document.getElementById("roomForm");
                if(x.elements[x.length-2].checked==false){
                    for(var i=0;i<x.length-2;i++)
                        x.elements[i].checked=true;
                }
                else
                {
                    for(var i=0;i<x.length-2;i++)
                        x.elements[i].checked=false;
                }
            }
            
            function select(roomId){
                var x = document.getElementById("roomForm");
                var ct=0;
                for(var i=0;i<x.length-2;i++){
                    if(x.elements[i].id==roomId){
                        if(x.elements[i].checked==true){
                            x.elements[x.length-2].checked=false;
                            break;
                        }
                        else
                        {
                            for(var j=0;j<x.length-2;j++){
                                if(x.elements[j].checked==false)
                                    ct++;
                            }
                            if(ct==1)
                               x.elements[x.length-2].checked=true; 
                        }
                    }
                    else
                        continue;
                }
            }
            
        </script>
    </head>
    <body>
        <nav>
            <div class="nav-wrapper custom-nav">
                <a href="${pageContext.request.contextPath}/home" class="brand-logo"><img src="${pageContext.request.contextPath}/images/BMSCE_Logo.svg" class="clg-logo"></a>
                <ul id="nav-mobile" class="left clg-name">
                    <li><a href="${pageContext.request.contextPath}/home"><h5>B.M.S COLLEGE OF ENGINEERING, BANGALORE - 560 019</h5><h6>(Autonomous Institute, Affiliated to VTU)</h6></a></li>
                </ul>
            </div>
        </nav>
        <br><br><br>
        <div class="container">
            <h5>Select Rooms for Allotment</h5><br><br><br><br>
            <form action="${pageContext.request.contextPath}/SelectRoomList" method="post" id ="roomForm">
            <%
                int i=0;
                ArrayList<Room> roomDetails = Room.getAllRoomDetails();
                int roomList[] = new int[roomDetails.size()];
                for(Room roomIt : roomDetails){
                   
            
                        roomList[i++]=roomIt.getRoomId();
                        out.print("<input type=\"checkbox\" class=\"filled-in\" id=\""+ roomIt.getRoomId() + "\" name=\""+ roomIt.getName() +"\"/>");
                        out.print("<label for=\""+roomIt.getRoomId()+"\" onclick=\"select("+roomIt.getRoomId() +")\">"+roomIt.getName()+"</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                    
                
                }
            
            out.print("<br><br><br>");
            out.print("<input type=\"checkbox\" class=\"filled-in\" id=\"all\" name=\"all\"/>");
            out.print("<label for=\"all\" onclick=\"deselect()\">Select All</label>");
            %>
            <br><br><br><br><br><br>
            <button class="btn right" type="submit" style="background-color: #444;">Submit</button>
            </form>
        </div>
    </body>
</html>
