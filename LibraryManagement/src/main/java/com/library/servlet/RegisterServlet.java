package com.library.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.util.DBConnection;

@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String faceData = req.getParameter("faceData"); // Base64 image

        // Basic validation
        if (username == null || password == null || faceData == null ||
            username.isEmpty() || password.isEmpty() || faceData.isEmpty()) {
            res.sendRedirect("register.html?error=empty");
            return;
        }

        try (Connection con = DBConnection.getConnection()) {

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users (username, password, role, face_data) VALUES (?, ?, ?, ?)"
            );

            ps.setString(1, username);
            ps.setString(2, password); // (plain text for now)
            ps.setString(3, "user");

            // IMPORTANT: store only Base64 part
            if (faceData.contains(",")) {
                faceData = faceData.split(",")[1];
            }
            ps.setString(4, faceData);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("register.html?error=server");
            return;
        }

        // Redirect to face login
        res.sendRedirect("facelogin.html");
    }
}
