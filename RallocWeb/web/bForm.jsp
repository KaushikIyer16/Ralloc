<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <head>
        <link rel="stylesheet" type="text/css" href="./css/bform.css" />
        <title></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <!-- The following div.b-form must be rendered inside loop for every B Form -->
        <div class="b-form">
            <div class="row">
                <div class="form-field semester">3</div>
                <div class="form-field month"><!-- Month and Year --></div>
            </div>
            <div class="row">
                <div class="form-field branch"><!-- Branch(es) --></div>
            </div>
            <div class="row">
                <div class="form-field subject"><!-- Subject Name --></div>
                <div class="form-field subject-code"><!-- Subject Code --></div>
            </div>
            <div class="row">
                <div class="form-field centre"></div>
                <div class="form-field from-usn"><!-- From USN --></div>
                <div class="form-field to-usn"><!-- To USN --></div>
            </div>
            <div class="row">
                <div class="form-field date"><!-- Date --></div>
                <div class="form-field from-time"><!-- From Time --></div>
                <div class="form-field to-time"><!-- To Time --></div>
            </div>
            <div class="row"></div>
            <!-- Render the following line for every student -->
            <div class="row-usn"><div class="form-field usn"><!-- USN --></div></div>
        </div>
        <script> window.print();</script>
    </body>
</html>