package com.todolist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/todo_db?useSSL=false&serverTimezone=UTC";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "amine"; // mettre ton mot de passe MySQL si tu en as un

    // Charger le driver JDBC (facultatif avec les versions récentes)
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
    }
}
