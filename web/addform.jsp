<form action="/add-movie" method="post">

    <div class="row mt-3">
        <div class="col-12">
            <label>Name: </label>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <input type="text" class="form-control" name="movieName">
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
                <option value="1">20th Century Studios</option>
                <option value="2">Relativity Media</option>
                <option value="3">Paramount Pictures</option>
                <option value="4">Warner Bros</option>
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
                <option><%=i%></option>
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
            <input type="number" class="form-control" name="movieBudget">
        </div>
    </div>


    <div class="row mt-3">
        <div class="col-12">
            <label>boxOffice: </label>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <input type="number" class="form-control" name="movieBoxOffice">
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
                    for (double i = 0; i < 10; i=i+0.1) {
                        String formattedNum = String.format("%.1f", sum - i);
                %>
                <option><%= formattedNum %></option>
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
            <textarea class="form-control" name="movieDescription" rows="5"></textarea>
        </div>
    </div>

    <div class="row mt-3">
        <div class="col-12">
            <button class="btn btn-success">ADD MOVIE</button>
        </div>
    </div>
</form>