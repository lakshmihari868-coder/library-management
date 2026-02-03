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
import javax.servlet.ServletException;

@WebServlet("/issueBook")
public class IssueBookServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int userId = Integer.parseInt(req.getParameter("userId"));
        int bookId = Integer.parseInt(req.getParameter("bookId"));

        try {
            Connection con = DBConnection.getConnection();

            // Issue book
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO issue(user_id, book_id, issue_date, due_date) " +
                "VALUES (?, ?, CURRENT_DATE, CURRENT_DATE + INTERVAL '7 days')");
            ps.setInt(1, userId);
            ps.setInt(2, bookId);
            ps.executeUpdate();

            // Reduce quantity
            PreparedStatement ps2 = con.prepareStatement(
                "UPDATE books SET quantity = quantity - 1 WHERE book_id=?");
            ps2.setInt(1, bookId);
            ps2.executeUpdate();

            res.sendRedirect("issuedBooks.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
