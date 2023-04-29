package servlets;

import db.DBConnection;
import db.Movie;
import db.Studio;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/studios")
public class StudioServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ArrayList<Movie> movies=  DBConnection.getMovies();
        req.setAttribute("fiilms",movies);

        ArrayList<Studio> studio = DBConnection.getStudios();
        req.setAttribute("studioss", studio);

        req.getRequestDispatcher("/studio.jsp").forward(req,resp);
    }
}