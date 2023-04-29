package db;

public class Studio {
    private int id;
    private String studio_name;
    private int studio_age;
    private String country;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStudio_name() {
        return studio_name;
    }

    public void setStudio_name(String studio_name) {
        this.studio_name = studio_name;
    }

    public int getStudio_age() {
        return studio_age;
    }

    public void setStudio_age(int studio_age) {
        this.studio_age = studio_age;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
