package model;

import java.util.Objects;

public class Movie {
    private int id;
    private String title;
    private String director;
    private String URL;
    private String year;

    public Movie() {

    }

    public Movie(String title, String director, String URL, String year) {
        this.title = title;
        this.director = director;
        this.URL = URL;
        this.year = year;
    }

    public Movie(int id, String title, String director, String URL, String year) {
        this.id = id;
        this.title = title;
        this.director = director;
        this.URL = URL;
        this.year = year;
    }

    @Override
    public String toString() {
        return "title='" + title + '\'' +
                ", director='" + director + '\'' +
                ", URL='" + URL + '\'' +
                ", year='" + year + '\'';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Movie movie = (Movie) o;
        return id == movie.id &&
                Objects.equals(title, movie.title) &&
                Objects.equals(director, movie.director);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, title, director);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getURL() {
        return URL;
    }

    public void setURL(String URL) {
        this.URL = URL;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }
}