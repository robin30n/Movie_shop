package db;

public class Movie {
    private int id;
    private String name;
    private int year;
    private int budget;
    private int boxOffice;
    private double stars;
    private String description;

    private String studio;



    public Movie() {
    }

    public Movie(int id, String name, int year, int budget, int boxOffice, double stars, String description) {
        this.id = id;
        this.name = name;
        this.year = year;
        this.budget = budget;
        this.boxOffice = boxOffice;
        this.stars = stars;
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getBudget() {
        return budget;
    }

    public void setBudget(int budget) {
        this.budget = budget;
    }

    public int getBoxOffice() {
        return boxOffice;
    }

    public void setBoxOffice(int boxOffice) {
        this.boxOffice = boxOffice;
    }

    public double getStars() {
        return stars;
    }

    public void setStars(double stars) {
        this.stars = stars;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    public Movie(int id, String name, int year, int budget, int boxOffice, double stars, String description, String studio) {
        this.id = id;
        this.name = name;
        this.year = year;
        this.budget = budget;
        this.boxOffice = boxOffice;
        this.stars = stars;
        this.description = description;
        this.studio = studio;
    }

    public String getStudio() {
        return studio;
    }

    public void setStudio(String studio) {
        this.studio = studio;
    }
}
