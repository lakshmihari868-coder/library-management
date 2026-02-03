package com.library.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.util.DBConnection;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if(username == null || username.isEmpty() || password == null || password.isEmpty()) {
            res.sendRedirect(req.getContextPath() + "/login.html?error=empty");
            return;
        }

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE username=? AND password=?"
            );
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                // login successful
                HttpSession session = req.getSession();
                session.setAttribute("username", rs.getString("username"));
                session.setAttribute("role", rs.getString("role"));

                // Redirect to dashboard (absolute path)
                res.sendRedirect(req.getContextPath() + "/dashboard.jsp");
            } else {
                // login failed
                res.sendRedirect(req.getContextPath() + "/login.html?error=invalid");
            }

        } catch(Exception e) {
            e.printStackTrace();
            res.sendRedirect(req.getContextPath() + "/login.html?error=server");
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.sendRedirect(req.getContextPath() + "/login.html");
    }
}
