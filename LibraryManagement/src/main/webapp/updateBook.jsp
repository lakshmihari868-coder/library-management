<%@ page session="true" %>
<%
    if(session.getAttribute("user") == null) response.sendRedirect("login.html");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Book</title>
</head>
<body>
<h2>Update Book</h2>
<form action="updateBook" method="post">
    <label>Book ID:</label><input type="number" name="id" required><br>
    <label>Title:</label><input type="text" name="title" required><br>
    <label>Author:</label><input type="text" name="author"><br>
    <label>Publisher:</label><input type="text" name="publisher"><br>
    <label>Quantity:</label><input type="number" name="quantity"><br>
    <input type="submit" value="Update Book">
</form>
<a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>
