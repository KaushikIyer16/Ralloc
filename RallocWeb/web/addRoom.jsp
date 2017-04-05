<%-- 
    Document   : addRoom
    Created on : Mar 31, 2017, 9:22:00 PM
    Author     : Mahesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Room | Database of Infrastructure</title>
         <link rel="stylesheet" type="text/css" href="./css/materialize.min.css" />
        <link rel="stylesheet" type="text/css" href="./css/common.css" />
        <link rel="stylesheet" type="text/css" href="./css/font-awesome.min.css" />
        <script src="./js/jquery.js"></script>
    </head>
    <body>
        <nav>
            <div class="nav-wrapper custom-nav">
                <a href="#" class="brand-logo"><img src="./images/BMSCE_Logo.svg" class="clg-logo"></a>
                
                <ul id="nav-mobile" class="left clg-name">
                    <li><a href="#"><h5>B.M.S COLLEGE OF ENGINEERING, BANGALORE - 560 019</h5><h6>(Autonomous Institute, Affiliated to VTU)</h6></a></li>
                </ul>
            </div>
        </nav>
        <br>
        <br>
        <div class="container">
            <h5>Add rooms with their capacity and dependency</h5>
            <form method="POST"	action="${pageContext.request.contextPath}/Infrastructure/add">
                
                <div class="row">
                    <div class="col l6 m6 s12">
                        <input type="text" name="roomName" required placeholder="Room Name" />
                    </div>
                </div>
                
                <div class="row">
                    <div class="col l6 m6 s12">
                        <input type="text" name="roomCapacity" required placeholder="Room Capacity" />
                    </div>
                </div>
                <div class="row">
                    <h6>Does the room have a dependency ?</h6>
                        <div class="col l3 m3 s6 has-dependency">
                            <p>
                                <input value="yes" name="hasDep" type="radio" id="depYes"/>
                                <label for="depYes">Yes</label>
                            </p>
                        </div>
                        <div class="col l3 m3 s6">
                            <p>
                                <input name="hasDep" value="no" type="radio" id="depNo" checked />
                                <label for="depNo">No</label>
                            </p>
                        </div>
                </div>        
                <div class="row" id="buttons">
                    <div class="col s6 m4 l4">
                        <button type="submit" class="add custom-btn">Add Room</button>
                    </div>
                </div>
             </form>
                <br>
                <br>
            <a href = "${pageContext.request.contextPath}/home" class="btn  right" style="background-color: #444;">Continue</a>
        </div>
        <br/><br/><br/><br/><br/>
        <footer class="custom-footer" style="bottom: 0px; position: fixed;">
            <div class="footer-copyright">
                <div class="container" style="color: white; margin-top: 15px;">
            © 2017 BMSCE
            <a class="text-lighten-4 right" href="#!" style="color: white;">Developed by Department of ISE</a>
            </div>
          </div>
        </footer>
    </body>
<!--    <script src="./js/common.js"></script>-->
</html>
