package controller;

import businesslogic.MoviesDAO;
import model.Movie;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addMovie")
public class AddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String title = request.getParameter("title");
        String director = request.getParameter("director");
        String URL = request.getParameter("url");
        String year = request.getParameter("year");

        if (title.isEmpty() || director.isEmpty() || URL.isEmpty() || year.isEmpty()) {
            request.getRequestDispatcher("/empty.jsp").forward(request, response);
        } else {

            MoviesDAO moviesDAO = new MoviesDAO();
            Movie movie = new Movie(title, director, URL, year);
            moviesDAO.addMovie(movie);
            request.getRequestDispatcher("/confirmAdded.jsp").forward(request, response);
        }

    }
}
