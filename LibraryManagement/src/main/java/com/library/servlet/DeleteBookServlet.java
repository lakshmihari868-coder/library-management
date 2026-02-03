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

@WebServlet("/deleteBook")
public class DeleteBookServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // Session check
        HttpSession session = req.getSession(false);
        if(session == null || session.getAttribute("user") == null) {
            resp.sendRedirect("login.html");
            return;
        }

        try {
            int id = Integer.parseInt(req.getParameter("id"));

            try(Connection con = DBConnection.getConnection()) {
                PreparedStatement ps = con.prepareStatement(
                    "DELETE FROM books WHERE id=?"
                );
                ps.setInt(1, id);
                ps.executeUpdate();
            }

            resp.sendRedirect("dashboard.jsp");

        } catch(Exception e) {
            e.printStackTrace();
            resp.sendRedirect("deleteBook.jsp?error=server");
        }
    }
}
