<%-- 
    Document   : finalArrangement
    Created on : Apr 6, 2017, 1:35:02 PM
    Author     : Mahesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/seatingArrangement.css" />
        <title>Final Arrangement</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <!-- The following div.arrangement must be rendered inside loop for every Room -->
        <div class="arrangement">
            <h2>Room: <!-- Room name here --></h2>

            <h3><!-- Course Code here --> <span class="subject"><!-- Course Name here --></span></h3>
            <div class="usn-list">
                <!-- Render a bunch of usns here like below-->
                <div class="usn">1bm15is001</div>
            </div>

            <h3><!-- Course Code here --> <span class="subject"><!-- Course Name here --></span></h3>
            <div class="usn-list">
                <!-- Render a bunch of usns here like below-->
                <div class="usn">1bm15is001</div>
            </div>
        </div>

        <script> window.print(); </script>
    </body>
</html>
