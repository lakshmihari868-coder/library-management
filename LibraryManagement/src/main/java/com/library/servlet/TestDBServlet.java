package com.library.servlet;

import java.io.IOException;
import java.sql.Connection;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.util.DBConnection;

@WebServlet("/testDB")
public class TestDBServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("text/html");
        try (Connection con = DBConnection.getConnection()) {
            if (con != null && !con.isClosed()) {
                resp.getWriter().println("<h2>DB Connection Successful!</h2>");
            } else {
                resp.getWriter().println("<h2>DB Connection Failed!</h2>");
            }
        } catch (Exception e) {
            e.printStackTrace(); // prints error in Eclipse console
            resp.getWriter().println("<h2>DB Connection Failed: " + e.getMessage() + "</h2>");
        }
    }
}
