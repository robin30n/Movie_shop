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