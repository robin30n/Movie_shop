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

@WebServlet(value = "/save-movie")
public class SaveMovieServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("movie_id"));
        String name = req.getParameter("movieName");
        String studio = req.getParameter("movieStudio");
        int year =Integer.parseInt(req.getParameter("movieYear"));
        int budget =Integer.parseInt(req.getParameter("movieBudget"));
        int boxOffice = Integer.parseInt(req.getParameter("movieBoxOffice"));
        double stars = Double.parseDouble(req.getParameter("movieStars").replace(',','.'));
        String description = req.getParameter("movieDescription");


        Movie movie = DBConnection.getMovie(id);
        if(movie!=null){
            movie.setId(id);
            movie.setName(name);
            movie.setStudio(studio);
            movie.setYear(year);
            movie.setBudget(budget);
            movie.setBoxOffice(boxOffice);
            movie.setStars(stars);
            movie.setDescription(description);

            DBConnection.updateMovie(movie);
            resp.sendRedirect("/details?movies_id="+id);
        }else{
            resp.sendRedirect("/home.html");
        }
    }
}
