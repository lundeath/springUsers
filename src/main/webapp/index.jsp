<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Manager</title>
    <p><img style="display: block; margin-left: auto; margin-right: auto; width: 151px;"
            src="https://cdn.whatech.com/media/com_mtree/images/listings/m/10116.jpg"
            width="45" height="100" /></p>
    <style>
        form {text-align: center}
        input {
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-top: 6px;
            margin-bottom: 16px;
        }

        /* Style the submit button */
        input[type=submit] {
            background-color: #4CAF50;
            color: white;
        }


        #message_psw p {
            padding: 10px 35px;
            font-size: 18px;
        }



    </style>
</head>
<body>
<br/>
<a href="<c:redirect url="/login"/>" target="_blank">Users list</a>
<br/>
</body>
</html>