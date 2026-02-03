package com.library.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.stream.Collectors;

import com.library.util.DBConnection;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@WebServlet("/faceLoginServlet")
public class FaceLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // Read JSON from request
        String json = req.getReader().lines().collect(Collectors.joining());
        JsonObject obj = JsonParser.parseString(json).getAsJsonObject();
        String base64Image = obj.get("image").getAsString();

        boolean match = false;
        String matchedUsername = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT username, face_data FROM users")) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String storedFace = rs.getString("face_data");
                if (storedFace != null && storedFace.equals(base64Image)) {
                    match = true;
                    matchedUsername = rs.getString("username");
                    break;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        res.setContentType("application/json");
        PrintWriter out = res.getWriter();
        JsonObject responseObj = new JsonObject();

        if (match) {
            HttpSession session = req.getSession();
            session.setAttribute("username", matchedUsername);
            responseObj.addProperty("status", "success");
        } else {
            responseObj.addProperty("status", "fail");
        }

        out.print(responseObj.toString());
        out.flush();
    }
}
