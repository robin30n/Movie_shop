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

@WebServlet(value = "/details")
public class DetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = -1;

        try{
            id = Integer.parseInt(req.getParameter("movies_id"));

        }catch (Exception e) {

        }


        ArrayList<Studio> studio = DBConnection.getStudios();
        req.setAttribute("studiios", studio);

        Movie movie = DBConnection.getMovie(id);
        req.setAttribute("film",movie);

        req.getRequestDispatcher("/details.jsp").forward(req,resp);


    }
}
