package servlets;

import db.DBConnection;
import db.DBManager;
import db.Movie;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/add-movie-page")
public class AddMovieServletPage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Movie> movies=  DBConnection.getMovies();
        req.setAttribute("films",movies);

        req.getRequestDispatcher("/addMovie.jsp").forward(req,resp);
    }
}
