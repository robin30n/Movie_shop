<%@ page import="java.util.ArrayList" %>
<%@ page import="db.Movie" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="css_and_js.jsp"%>

</head>
<body class="bg-secondary" style="--bs-bg-opacity: .5">

<%@include file="navbar.jsp"%>

<div class="container mt-3">
    <div class="row">
        <div class="col-6 mx-auto">
            <%@include file="addform.jsp"%>
        </div>

    </div>

</div>
</body>
</html>
