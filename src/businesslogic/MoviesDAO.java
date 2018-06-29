package businesslogic;

import model.Movie;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MoviesDAO {

    private static final String URL = "jdbc:mysql://localhost:3306/moviesdatabase?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASS = "magda123";
    private Connection connection;

    public MoviesDAO() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USER, PASS);
        } catch (ClassNotFoundException e) {
            System.out.println("No driver found");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Could not establish connection");
            e.printStackTrace();
        }
    }

    public void addMovie(Movie movie) {
        final String sql = "insert into movies(title, director, URL, year) values(?, ?, ?,?)";
        try {
            PreparedStatement prepStmt = connection.prepareStatement(sql);
            prepStmt.setString(1, movie.getTitle());
            prepStmt.setString(2, movie.getDirector());
            prepStmt.setString(3, movie.getURL());
            prepStmt.setString(4, movie.getYear());
            prepStmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Could not save record");
            e.printStackTrace();
        }

    }

    public List<Movie> getAllMovies() {
        List<Movie> movieList = new ArrayList<>();

        final String sql = "select * from movies";
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                Movie movie = new Movie();
                movie.setId(resultSet.getInt("id"));
                movie.setTitle(resultSet.getString("title"));
                movie.setDirector(resultSet.getString("director"));
                movie.setURL(resultSet.getString("URL"));
                movie.setYear(resultSet.getString("year"));
                movieList.add(movie);
            }

        } catch (SQLException var10) {
            System.out.println("Nie można wczytać zawartości bazy");
        }

        return movieList;
    }

    public void close(){
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
