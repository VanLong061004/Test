package com.trungtamjava.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCconnection {
	public static Connection getJDBCConnection() {
		final String url = "jdbc:mysql://localhost:3306/jsp_ban_hang";
        final String user = "root";
        final String password = "";

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Create the connection
            Connection connection = DriverManager.getConnection(url, user, password);

            // Return the established connection
            return connection;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("MySQL JDBC Driver not found!");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Connection failed!");
        }
		return null;
		
	}

}
