package com.library.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.library.util.DBConnection;

@WebServlet("/updateBook")
public class UpdateBookServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession(false);
        if(session == null || session.getAttribute("user") == null) {
            resp.sendRedirect("login.html");
            return;
        }

        int id = Integer.parseInt(req.getParameter("id"));
        String title = req.getParameter("title");
        String author = req.getParameter("author");
        String publisher = req.getParameter("publisher");
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        try(Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "UPDATE books SET title=?, author=?, publisher=?, quantity=? WHERE id=?"
            );
            ps.setString(1, title);
            ps.setString(2, author);
            ps.setString(3, publisher);
            ps.setInt(4, quantity);
            ps.setInt(5, id);
            ps.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
            resp.sendRedirect("updateBook.jsp?error=server");
            return;
        }

        resp.sendRedirect("dashboard.jsp");
    }
}
