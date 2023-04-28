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
            <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#addMovie">
                + add Movie
            </button>

            <div class="modal fade" id="addMovie" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
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
                    <th>NAME</th>
                    <th>Studio</th>
                    <th>YEAR</th>
                    <th>BUDGET</th>
                    <th>BOX_OFFICE</th>
                    <th>STARS</th>
                    <th style="width: 10%">DETAILS</th>
                </tr>
                </thead>
                <tbody>
                <%
                    ArrayList<Movie> movies = (ArrayList<Movie>) request.getAttribute("fiilms");
                    for (Movie m : movies) {

                %>
                <tr>

                    <td><%=m.getId()%>
                    </td>

                    <td><%=m.getName()%>
                    </td>

                    <td><%=m.getStudio()%>
                    </td>

                    <td><%=m.getYear()%>
                    </td>

                    <td><%=m.getBudget()%>
                    </td>

                    <td><%=m.getBoxOffice()%>
                    </td>

                    <td><%=m.getStars()%>
                    </td>

                    <td>
                        <a href="/details?movies_id=<%=m.getId()%>" class="btn btn-sm btn-success">DETAILS</a>
<%--                        <a href="/home.html" class="btn btn-sm btn-success">DETAILS</a>--%>
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
