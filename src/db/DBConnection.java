package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBConnection {
    private static Connection connection;


    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:8889/javaee_db",
                    "root",
                    "root");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<Movie> getMovies() {
        ArrayList<Movie> movieArrayList = new ArrayList<>();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT m.id, m.name, s.studio_name, m.year, m.budget, m.boxOffice, m.stars, m.description, s.studio_age, s.country\n" +
                            "FROM movies m\n" +
                            "         INNER JOIN studio s ON m.studio_id = s.id;");

            ResultSet resultSet = statement.executeQuery();


            while (resultSet.next()) {

                Studio studio = new Studio();
                studio.setStudio_name(resultSet.getString("studio_name"));
                studio.setStudio_age(resultSet.getInt("studio_age"));
                studio.setCountry(resultSet.getString("country"));

                Movie movie1 = new Movie();
                movie1.setId(resultSet.getInt("id"));
                movie1.setName(resultSet.getString("name"));
                movie1.setStudio(studio);
                movie1.setYear(resultSet.getInt("year"));
                movie1.setBudget(resultSet.getInt("budget"));
                movie1.setBoxOffice(resultSet.getInt("boxOffice"));
                movie1.setStars(resultSet.getDouble("stars"));
                movie1.setDescription(resultSet.getString("description"));
                movieArrayList.add(movie1);


            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movieArrayList;

    }

    public static void addMovie(Movie movie) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO movies(name, budget, year, boxoffice, stars, description,studio_id)\n " +
                            "VALUES (?,?,?,?,?,?,?)");

            statement.setString(1, movie.getName());
            statement.setInt(2, movie.getBudget());
            statement.setInt(3, movie.getYear());
            statement.setInt(4, movie.getBoxOffice());
            statement.setDouble(5, movie.getStars());
            statement.setString(6, movie.getDescription());
            statement.setInt(7, movie.getStudio().getId());


            statement.executeUpdate();

            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Movie getMovie(int id) {
        Movie movie1 = new Movie();

        try {
            PreparedStatement statement = connection.prepareStatement("SELECT m.id, m.name, s.studio_name, m.year, m.budget, m.boxOffice, m.stars, m.description,s.id AS studio_id, s.studio_age, s.country\n" +
                            "FROM movies m\n" +
                            "    INNER JOIN studio s ON m.studio_id = s.id WHERE m.id = ? LIMIT 1"
            );
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {


                Studio studio = new Studio();
                studio.setId(resultSet.getInt("studio_id"));
                studio.setStudio_name(resultSet.getString("studio_name"));
                studio.setStudio_age(resultSet.getInt("studio_age"));
                studio.setCountry(resultSet.getString("country"));

                movie1.setId(resultSet.getInt("id"));
                movie1.setName(resultSet.getString("name"));
                movie1.setYear(resultSet.getInt("year"));
                movie1.setBudget(resultSet.getInt("budget"));
                movie1.setBoxOffice(resultSet.getInt("boxOffice"));
                movie1.setStars(resultSet.getDouble("stars"));
                movie1.setDescription(resultSet.getString("description"));
                movie1.setStudio(studio);


            } else movie1 = null;
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movie1;

    }

    public static void deleteMovie(int id) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "DELETE FROM movies WHERE id = ?");
            statement.setInt(1, id);
            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void updateMovie(Movie movie) {

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "UPDATE movies\n" +
                            "SET name        = ?,\n" +
                            "    budget      = ?,\n" +
                            "    year        = ?,\n" +
                            "    boxOffice   = ?,\n" +
                            "    stars       = ?,\n" +
                            "    description = ?,\n" +
                            "    studio_id = ? \n" +
                            "WHERE id = ?"
            );


            statement.setString(1, movie.getName());
            statement.setInt(2, movie.getBudget());
            statement.setInt(3, movie.getYear());
            statement.setInt(4, movie.getBoxOffice());
            statement.setDouble(5, movie.getStars());
            statement.setString(6, movie.getDescription());
            statement.setInt(7, movie.getStudio().getId());
            statement.setInt(8, movie.getId());


            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static Studio getStudio(int id) {
        Studio studio = null;
        try {

            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT * FROM studio WHERE id = ?");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                studio = new Studio();
                studio.setStudio_name(resultSet.getString("studio_name"));
                studio.setStudio_age(resultSet.getInt("studio_age"));
                studio.setCountry(resultSet.getString("country"));
                studio.setId(resultSet.getInt("id"));
            }
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return studio;
    }

    public static ArrayList<Studio> getStudios() {
        ArrayList<Studio> studios = new ArrayList<>();
        try {

            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT * FROM studio");
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Studio studio = new Studio();
                studio.setStudio_name(resultSet.getString("studio_name"));
                studio.setStudio_age(resultSet.getInt("studio_age"));
                studio.setCountry(resultSet.getString("country"));
                studio.setId(resultSet.getInt("id"));

                studios.add(studio);
            }
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return studios;
    }
}
