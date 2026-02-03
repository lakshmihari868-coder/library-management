<%@ page session="true" %>
<%
    // SESSION CHECK
    if(session.getAttribute("username") == null){
        response.sendRedirect("login.html");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Rent / Issue Book</title>
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
    max-width: 400px;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.2);
}

/* Title */
.card h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #2a5298;
}

/* Form elements */
label {
    font-weight: 600;
}

input[type=number], select {
    width: 100%;
    padding: 8px;
    margin-bottom: 15px;
    border-radius: 6px;
    border: 1px solid #ccc;
    font-size: 14px;
}

input[type=submit] {
    width: 100%;
    padding: 10px;
    background: #2a5298;
    color: white;
    font-size: 16px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: background 0.3s;
}

input[type=submit]:hover {
    background: #1e3c72;
}

/* Back button */
.back-btn {
    display: block;
    width: 180px;
    margin: 20px auto 0;
    text-align: center;
    background: #4CAF50;
    color: white;
    padding: 10px 0;
    text-decoration: none;
    border-radius: 6px;
    font-weight: 600;
    transition: background 0.3s;
}

.back-btn:hover {
    background: #45a049;
}
</style>
</head>
<body>

<div class="card">
    <h2>Rent / Issue Book</h2>

    <form action="issueBook" method="post">
        <label>User ID:</label>
        <input type="number" name="userId" placeholder="Enter Member ID" required><br>

        <label>Book ID:</label>
        <input type="number" name="bookId" placeholder="Enter Book ID" required><br>

        <input type="submit" value="Issue Book">
    </form>

    <a href="dashboard.jsp" class="back-btn"> Back to Dashboard</a>
</div>

</body>
</html>
