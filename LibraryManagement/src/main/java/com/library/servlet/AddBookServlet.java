package com.library.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.library.util.DBConnection;

@WebServlet("/addBook")
public class AddBookServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession(false);
        if(session == null || session.getAttribute("user") == null) {
            resp.sendRedirect("login.html");
            return;
        }

        String title = req.getParameter("title");
        String author = req.getParameter("author");
        String publisher = req.getParameter("publisher");
        String quantityStr = req.getParameter("quantity");

        if(title == null || title.isEmpty()) {
            resp.sendRedirect("addBook.html?error=empty");
            return;
        }

        int quantity = 0;
        try { quantity = Integer.parseInt(quantityStr); } catch(Exception e) {}

        try(Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO books(title, author, publisher, quantity) VALUES(?,?,?,?)"
            );
            ps.setString(1, title);
            ps.setString(2, author);
            ps.setString(3, publisher);
            ps.setInt(4, quantity);
            ps.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
            resp.sendRedirect("addBook.html?error=server");
            return;
        }

        resp.sendRedirect("dashboard.html");
    }
}
