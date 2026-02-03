package com.library.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.library.util.DBConnection;

@WebServlet("/viewBooks")
public class ViewBooksServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession(false);
        if(session == null || session.getAttribute("user") == null) {
            resp.sendRedirect("login.html");
            return;
        }

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM books");
            ResultSet rs = ps.executeQuery();

            resp.setContentType("text/html");
            resp.getWriter().println("<h1>Books List</h1>");
            resp.getWriter().println("<table border='1'>");
            resp.getWriter().println("<tr><th>ID</th><th>Title</th><th>Author</th><th>Publisher</th><th>Quantity</th></tr>");
            while(rs.next()) {
                resp.getWriter().println("<tr>");
                resp.getWriter().println("<td>"+rs.getInt("id")+"</td>");
                resp.getWriter().println("<td>"+rs.getString("title")+"</td>");
                resp.getWriter().println("<td>"+rs.getString("author")+"</td>");
                resp.getWriter().println("<td>"+rs.getString("publisher")+"</td>");
                resp.getWriter().println("<td>"+rs.getInt("quantity")+"</td>");
                resp.getWriter().println("</tr>");
            }
            resp.getWriter().println("</table>");
            resp.getWriter().println("<br><a href='dashboard.html'>Back to Dashboard</a>");
        } catch(Exception e) {
            e.printStackTrace();
            resp.sendRedirect("dashboard.html");
        }
    }
}
