package controller;

import businesslogic.MoviesDAO;
import model.Movie;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/browse")
public class BrowseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        MoviesDAO moviesDAO = new MoviesDAO();

        List<Integer> ids = new ArrayList<>();
        List<String> titles = new ArrayList<>();
        List<String> directors = new ArrayList<>();
        List<String> urls = new ArrayList<>();
        List<String> years = new ArrayList<>();

        for (Movie m : moviesDAO.getAllMovies()) {
            ids.add(m.getId());
            titles.add(m.getTitle());
            directors.add(m.getDirector());
            urls.add(m.getURL());
            years.add(m.getYear());
        }

        request.setAttribute("ids", ids);
        request.setAttribute("titles", titles);
        request.setAttribute("directors", directors);
        request.setAttribute("urls", urls);
        request.setAttribute("years", years);
        request.getRequestDispatcher("/browse.jsp").forward(request, response);


    }
}
