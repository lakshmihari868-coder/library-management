package com.library.servlet;

import com.library.model.Fine;
import com.library.util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/fines")
public class FinesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Check if user is logged in
        HttpSession session = request.getSession();
        if(session.getAttribute("username") == null) {
            response.sendRedirect("login.html");
            return;
        }

        List<Fine> finesList = new ArrayList<>();

        String query = "SELECT i.issue_id, u.username, b.title, i.due_date, i.return_date, " +
                       "CASE WHEN i.return_date IS NULL THEN CURRENT_DATE - i.due_date " +
                       "ELSE i.return_date - i.due_date END AS overdue_days " +
                       "FROM issue i " +
                       "JOIN users u ON i.user_id = u.user_id " +
                       "JOIN books b ON i.book_id = b.book_id " +
                       "WHERE (i.return_date IS NULL AND CURRENT_DATE > i.due_date) " +
                       "OR (i.return_date IS NOT NULL AND i.return_date > i.due_date)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while(rs.next()) {
                int issueId = rs.getInt("issue_id");
                String username = rs.getString("username");
                String bookTitle = rs.getString("title");
                Date dueDate = rs.getDate("due_date");
                Date returnDate = rs.getDate("return_date");
                int overdueDays = rs.getInt("overdue_days");
                double fineAmount = overdueDays * 5; // 5 ₹ per day

                Fine fine = new Fine(issueId, username, bookTitle, dueDate, returnDate, overdueDays, fineAmount);
                finesList.add(fine);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("finesList", finesList);
        request.getRequestDispatcher("fines.jsp").forward(request, response);
    }
}
