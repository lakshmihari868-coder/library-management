package com.library.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("org.postgresql.Driver");

            con = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/library_db",
                "postgres",
                "root"
            );

        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
