<%-- 
    Document   : indent
    Created on : Apr 6, 2017, 1:25:41 PM
    Author     : Mahesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/materialize.min.css" />
        <title>Indent</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <!-- The following div must be rendered inside loop for every Room -->
        <div class="container">
            <div class="col m6 l6 xl6">
                <h5>Room: <!-- Room name here --></h5>
                <table class="centered bordered responsive-table">
                    <thead>
                        <th>Course Code</th>
                        <th>Course Name</th>
                        <th>Number of Students Writing</th>
                    </thead>
                    <tbody>
                        <!-- Render tr for every subject written in that room -->
                    </tbody>
                </table>
            </div>
        </div>

        <script> window.print(); </script>
    </body>
</html>