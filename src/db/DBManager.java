package db;

import java.util.ArrayList;

public class DBManager {
    public static ArrayList<Movie> movies = new ArrayList<>();
    private static int id = 5;

    static {
        movies.add(new Movie(1, "Avatar", 2012, 300, 2000, 8.4, "Jake, who is paraplegic, replaces his twin on the Na'vi inhabited Pandora for a corporate mission. After the natives accept him as one of their own, he must decide where his loyalties lie","20th Century Studios"));
        movies.add(new Movie(2, "Terminator", 2008, 100, 1000, 8.0, "A cyborg assassin is sent back in time to kill Sarah, a waitress, in a bid to stop her son who will wage a long war against his enemy in the future unless the course of history is altered.","Paramount Pictures"));
        movies.add(new Movie(3, "Kingsman", 2015, 80, 160, 7.5, "Kingsman is a British film franchise, consisting of action comedy films, that follow the missions of Kingsman, a fictional secret service organization","20th Century Studios"));
        movies.add(new Movie(4, "social network", 2017, 30, 120, 8.2, "Mark Zuckerberg creates a social networking site, Facebook, with his friend Eduardo's help. Though it turns out to be a successful venture, he severs ties with several people along the way","Relativity Media"));
    }

    public static ArrayList<Movie> getMovies() {
        return movies;
    }

    public static void addMovie(Movie movie) {
        movie.setId(id);
        movies.add(movie);
        id++;
    }

    public static Movie getMovie(int id) {
        return movies
                .stream()
                .filter(movie -> movie.getId() == id)
                .findFirst()
                .orElse(null);
    }
    public static void updateMovie(Movie movie) {

        for (Movie m : movies) {
            if(m.getId()==movie.getId()){
                m.setName(movie.getName());
                m.setYear(movie.getYear());
                m.setBudget(movie.getBudget());
                m.setBoxOffice(movie.getBoxOffice());
                m.setStars(movie.getStars());
                m.setStudio(movie.getStudio());
            }
        }
    }
    public static void deleteMovie(int id) {
        for (int i = 0; i < movies.size(); i++) {
            if(movies.get(i).getId()==id){
                movies.remove(i);
                break;
            }
        }
    }
}
