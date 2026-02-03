<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.library.util.DBConnection" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Issued Books</title>
<style>
body {
    font-family: "Segoe UI", Arial, sans-serif;
    background: #f4f6f9;
    margin: 0;
    padding: 20px;
    display: flex;
    justify-content: center;
}

.container {
    width: 95%;
    max-width: 1000px;
}

h2 {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 20px;
}

.table-wrapper {
    overflow-x: auto;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    background: #fff;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 12px 15px;
    text-align: center;
    border-bottom: 1px solid #eee;
}

th {
    background-color: #34495e;
    color: #fff;
    text-transform: uppercase;
    font-size: 13px;
}

tr:hover {
    background-color: #f1f1f1;
}

input[type="submit"] {
    padding: 6px 12px;
    background-color: #27ae60;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
    transition: 0.3s;
}

input[type="submit"]:hover {
    background-color: #219150;
}

.back-link {
    text-align: center;
    margin-top: 20px;
}

.back-link a {
    display: inline-block;
    background: #2980b9;
    color: white;
    text-decoration: none;
    padding: 10px 20px;
    border-radius: 6px;
    font-weight: bold;
    transition: 0.3s;
}

.back-link a:hover {
    background: #1f6391;
}
</style>
</head>
<body>

<div class="container">
    <h2>Issued Books</h2>

    <div class="table-wrapper">
    <table>
        <tr>
            <th>Issue ID</th>
            <th>User ID</th>
            <th>Book ID</th>
            <th>Issue Date</th>
            <th>Due Date</th>
            <th>Return</th>
        </tr>

    <%
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM issue WHERE return_date IS NULL");
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
    %>
        <tr>
            <td><%= rs.getInt("issue_id") %></td>
            <td><%= rs.getInt("user_id") %></td>
            <td><%= rs.getInt("book_id") %></td>
            <td><%= rs.getDate("issue_date") %></td>
            <td><%= rs.getDate("due_date") %></td>
            <td>
                <form action="returnBook" method="post">
                    <input type="hidden" name="issueId" value="<%= rs.getInt("issue_id") %>">
                    <input type="hidden" name="bookId" value="<%= rs.getInt("book_id") %>">
                    <input type="submit" value="Return">
                </form>
            </td>
        </tr>
    <%
            }
        } catch (Exception e) {
            out.println("<tr><td colspan='6'>Error loading data</td></tr>");
            e.printStackTrace();
        }
    %>
    </table>
    </div>

    <div class="back-link">
        <a href="dashboard.jsp">⬅ Back to Dashboard</a>
    </div>
</div>

</body>
</html>
