<%@ page import="java.sql.*, com.library.util.DBConnection" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>View Books</title>

<style>
body {
    margin: 0;
    font-family: "Segoe UI", Arial, sans-serif;
    background: linear-gradient(135deg, #1e3c72, #2a5298);
    min-height: 100vh;
    padding: 40px;
}

/* PAGE TITLE */
h2 {
    text-align: center;
    color: #fff;
    margin-bottom: 30px;
}

/* CARD */
.card {
    background: #ffffff;
    max-width: 1000px;
    margin: auto;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 12px 30px rgba(0,0,0,0.25);
}

/* TABLE */
table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 12px 15px;
    text-align: center;
}

th {
    background: #2a5298;
    color: white;
    font-size: 15px;
}

td {
    border-bottom: 1px solid #ddd;
    font-size: 14px;
}

tr:hover td {
    background: #f4f7ff;
}

/* BUTTON */
.back-btn {
    display: inline-block;
    margin-top: 20px;
    padding: 10px 18px;
    background: #2a5298;
    color: white;
    text-decoration: none;
    border-radius: 6px;
    font-size: 14px;
    transition: background 0.3s;
}

.back-btn:hover {
    background: #1e3c72;
}

/* RESPONSIVE */
@media (max-width: 768px) {
    body {
        padding: 20px;
    }
    table {
        font-size: 12px;
    }
}
</style>

</head>
<body>

<h2> Books List</h2>

<div class="card">
<table>
<tr>
    <th>ID</th>
    <th>Title</th>
    <th>Author</th>
    <th>Quantity</th>
    <th>Publisher</th>
</tr>

<%
try (Connection con = DBConnection.getConnection()) {
    PreparedStatement ps = con.prepareStatement("SELECT * FROM books");
    ResultSet rs = ps.executeQuery();
    while (rs.next()) {
%>
<tr>
    <td><%= rs.getInt("book_id") %></td>
    <td><%= rs.getString("title") %></td>
    <td><%= rs.getString("author") %></td>
    <td><%= rs.getInt("quantity") %></td>
    <td><%= rs.getString("publisher") %></td>
</tr>
<%
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>

</table>

<div style="text-align:center;">
    <a href="dashboard.jsp" class="back-btn"> Back to Dashboard</a>
</div>
</div>

</body>
</html>
