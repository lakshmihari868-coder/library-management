<%@ page import="java.sql.*, com.library.util.DBConnection" %>
<%@ page session="true" %>
<%
    if(session.getAttribute("username") == null){
        response.sendRedirect("login.html");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Library Members</title>
<style>
body {
    font-family: "Segoe UI", Arial, sans-serif;
    background: linear-gradient(135deg, #1e3c72, #2a5298);
    min-height: 100vh;
    margin: 0;
    padding: 20px;
    display: flex;
    justify-content: center;
    align-items: flex-start;
}

/* Card container */
.card {
    background: #fff;
    width: 90%;
    max-width: 1000px;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.2);
    overflow-x: auto;
}

/* Title */
.card h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #2a5298;
}

/* Table styling */
table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 12px 15px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #2a5298;
    color: white;
    text-transform: uppercase;
}

tr:hover {
    background-color: #f1f1f1;
}

/* Back button */
.back-btn {
    display: block;
    width: 180px;
    margin: 20px auto 0;
    text-align: center;
    background: #2a5298;
    color: white;
    padding: 10px 0;
    text-decoration: none;
    border-radius: 6px;
    font-weight: 600;
    transition: background 0.3s;
}

.back-btn:hover {
    background: #1e3c72;
}
</style>
</head>
<body>

<div class="card">
    <h2>Library Members</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Address</th>
            <th>Join Date</th>
        </tr>

        <%
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM members ORDER BY join_date DESC");
             ResultSet rs = ps.executeQuery()) {

            while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("member_id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("phone") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getDate("join_date") %></td>
        </tr>
        <%
            }
        } catch(Exception e) {
            out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
            e.printStackTrace();
        }
        %>
    </table>

    <a href="dashboard.jsp" class="back-btn"> Back to Dashboard</a>
</div>

</body>
</html>
