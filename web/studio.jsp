<%@ page import="java.util.ArrayList" %>
<%@ page import="db.Movie" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="css_and_js.jsp" %>
</head>
<body class="bg-secondary" style="--bs-bg-opacity: .5">


<%@include file="navbar.jsp" %>

<div class="container mt-3">
    <div class="row">
        <h4 class="text-center">
            Welcome to Movie Shop
        </h4>
    </div>


    <div class="row mt-3">
        <div class="col-12">
            <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#addStudio">
                + add Studio
            </button>

            <div class="modal fade" id="addStudio" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                 aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <%@include file="addform.jsp" %>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-12">
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>STUDIO NAME</th>
                    <th>CREATED YEAR</th>
                    <th>COUNTRY</th>
                    <th style="width: 10%">DETAILS</th>
                </tr>
                </thead>
                <tbody>
                <%
                    ArrayList<Studio> stud = (ArrayList<Studio>) request.getAttribute("studioss");
                    for (Studio s : stud) {

                %>
                <tr>

                    <td><%=s.getId()%>
                    </td>

                    <td><%=s.getStudio_name()%>
                    </td>

                    <td><%=s.getStudio_age()%>
                    </td>

                    <td><%=s.getCountry()%>
                    </td>

                    <td>
                        <a href="/details?studios_id=<%=s.getId()%>" class="btn btn-sm btn-success">DETAILS</a>
                    </td>

                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>

</div>
</body>
</html>
