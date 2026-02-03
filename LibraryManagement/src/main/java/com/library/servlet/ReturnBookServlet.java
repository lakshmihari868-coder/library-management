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
@WebServlet("/returnBook")
public class ReturnBookServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int issueId = Integer.parseInt(req.getParameter("issueId"));
        int bookId = Integer.parseInt(req.getParameter("bookId"));

        try {
            Connection con = DBConnection.getConnection();

            // 1. Update return date + fine
            PreparedStatement ps1 = con.prepareStatement(
                "UPDATE issue SET return_date = CURRENT_DATE, " +
                "fine = GREATEST(0, (CURRENT_DATE - due_date) * 10) " +
                "WHERE issue_id = ?"
            );
            ps1.setInt(1, issueId);
            ps1.executeUpdate();

            // 2. Increase book quantity
            PreparedStatement ps2 = con.prepareStatement(
                "UPDATE books SET quantity = quantity + 1 WHERE book_id = ?"
            );
            ps2.setInt(1, bookId);
            ps2.executeUpdate();

            res.sendRedirect("fine.jsp?issueId=" + issueId);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
