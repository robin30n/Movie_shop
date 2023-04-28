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
    <%
        Movie movie = (Movie) request.getAttribute("film");
        if (movie != null) {
    %>
    <div class="row">
        <div class="col-6 mx-auto">

            <div class="row mt-3">
                <div class="col-12">
                    <label>Name: </label>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <input type="text" class="form-control" readonly value="<%=movie.getName()%>">
                </div>
            </div>


            <div class="row mt-3">
                <div class="col-12">
                    <label>Studio: </label>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <input type="text" class="form-control" readonly value="<%=movie.getStudio()%>">
                </div>
            </div>


            <div class="row mt-3">
                <div class="col-12">
                    <label>Year: </label>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <input type="number" class="form-control" readonly value="<%=movie.getYear()%>">
                </div>
            </div>


            <div class="row mt-3">
                <div class="col-12">
                    <label>budget: </label>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <input type="number" class="form-control" readonly value="<%=movie.getBudget()%>">
                </div>
            </div>


            <div class="row mt-3">
                <div class="col-12">
                    <label>boxOffice: </label>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <input type="number" class="form-control" readonly value="<%=movie.getBoxOffice()%>">
                </div>
            </div>


            <div class="row mt-3">
                <div class="col-12">
                    <label>stars: </label>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <input type="number" class="form-control" readonly value="<%=movie.getStars()%>">
                </div>
            </div>


            <div class="row mt-3">
                <div class="col-12">
                    <label>Description: </label>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-12">
                    <textarea class="form-control" readonly rows="10"><%=movie.getDescription()%>"</textarea>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-3">
                    <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal"
                            data-bs-target="#editMovie">
                        + Edit Movie
                    </button>

                    <div class="modal fade" id="editMovie" data-bs-backdrop="static" data-bs-keyboard="false"
                         tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">

                                <div class="modal-body">
                                    <form action="/save-movie" method="post">
                                        <input type="hidden" name="movie_id" value="<%=movie.getId()%>">

                                        <div class="row mt-3">
                                            <div class="col-12">
                                                <label>Name: </label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <input type="text" class="form-control" name="movieName"
                                                       value="<%=movie.getName()%>">
                                            </div>
                                        </div>

                                        <div class="row mt-3">
                                            <div class="col-12">
                                                <label>Studio: </label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <select class="form-select" name="movieStudio">
                                                    <option <%=("20th Century Studios".equals(movie.getStudio()) ? "selected" : "")%> >20th Century Studios</option>
                                                    <option <%=("Paramount Pictures".equals(movie.getStudio()) ? "selected" : "")%> >Paramount Pictures</option>
                                                    <option <%=("Relativity Media".equals(movie.getStudio()) ? "selected" : "")%> >Relativity Media</option>
                                                    <option <%=("Warner Bros".equals(movie.getStudio()) ? "selected" : "")%> >Warner Bros</option>
                                                </select>
                                            </div>
                                        </div>


                                        <div class="row mt-3">
                                            <div class="col-12">
                                                <label>Year: </label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <select class="form-select" name="movieYear">
                                                    <%
                                                        for (int i = 2023; i > 1980; i--) {
                                                    %>
                                                    <option <%=(i == movie.getYear() ? "selected" : "")%> ><%=i%>
                                                    </option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>


                                        <div class="row mt-3">
                                            <div class="col-12">
                                                <label>budget: </label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <input type="number" class="form-control" name="movieBudget"
                                                       value="<%=movie.getBudget()%>">
                                            </div>
                                        </div>


                                        <div class="row mt-3">
                                            <div class="col-12">
                                                <label>boxOffice: </label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <input type="number" class="form-control" name="movieBoxOffice"
                                                       value="<%=movie.getBoxOffice()%>">
                                            </div>
                                        </div>


                                        <div class="row mt-3">
                                            <div class="col-12">
                                                <label>stars: </label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <select class="form-select" name="movieStars">
                                                    <%
                                                        int sum = 10;
                                                        for (double i = 0; i < 10; i = i + 0.1) {
                                                            String formattedNum = String.format("%.1f", sum - i);
                                                    %>
                                                    <option><%= formattedNum %>
                                                    </option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                        </div>


                                        <div class="row mt-3">
                                            <div class="col-12">
                                                <label>Description: </label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <textarea class="form-control" name="movieDescription"
                                                          rows="5"><%=movie.getDescription()%></textarea>
                                            </div>
                                        </div>

                                        <div class="row mt-3">
                                            <div class="col-6">
                                                <button class="btn btn-success">UPDATE MOVIE</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>


                <div class="col-3">
                    <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal"
                            data-bs-target="#deleteMovie">
                        - Delete Movie
                    </button>

                    <div class="modal fade" id="deleteMovie" data-bs-backdrop="static" data-bs-keyboard="false"
                         tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="/delete-movie" method="post">
                                    <input type="hidden" name="delete_movie_id" value="<%=movie.getId()%>">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <h5>Are you sure?</h5>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
                                        <button type="submit" class="btn btn-danger">YES</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
    <%
        } else out.print("<h1>Movie not found</h1>");
    %>

</div>
</body>
</html>
