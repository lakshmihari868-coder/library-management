<%@ page session="true" %>
<%
    if(session.getAttribute("user") == null) response.sendRedirect("login.html");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Book</title>
</head>
<body>
<h2>Delete Book</h2>
<form action="deleteBook" method="post">
    <label>Book ID:</label><input type="number" name="id" required><br>
    <input type="submit" value="Delete Book">
</form>
<a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>
