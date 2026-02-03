<%@ page session="true" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.html");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add Book</title>

<style>
body {
    margin: 0;
    font-family: "Segoe UI", Arial, sans-serif;
    background: linear-gradient(135deg, #1e3c72, #2a5298);
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
}

/* CARD */
.card {
    background: #ffffff;
    width: 380px;
    padding: 25px 30px;
    border-radius: 12px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.25);
}

/* HEADER */
.card h2 {
    text-align: center;
    margin-bottom: 20px;
    color: #2a5298;
}

/* FORM */
.form-group {
    margin-bottom: 15px;
}

label {
    font-size: 14px;
    color: #444;
    display: block;
    margin-bottom: 5px;
}

input[type=text],
input[type=number] {
    width: 100%;
    padding: 10px;
    border-radius: 6px;
    border: 1px solid #ccc;
    outline: none;
    font-size: 14px;
}

input:focus {
    border-color: #2a5298;
}

/* BUTTON */
button {
    width: 100%;
    padding: 10px;
    background: #2a5298;
    color: #fff;
    border: none;
    border-radius: 6px;
    font-size: 15px;
    cursor: pointer;
    transition: background 0.3s;
}

button:hover {
    background: #1e3c72;
}

/* FOOTER */
.back {
    text-align: center;
    margin-top: 15px;
}

.back a {
    text-decoration: none;
    color: #2a5298;
    font-size: 14px;
}

.back a:hover {
    text-decoration: underline;
}
</style>

</head>
<body>

<div class="card">
    <h2> Add New Book</h2>

    <form action="addBook" method="post">

        <div class="form-group">
            <label>Book Title</label>
            <input type="text" name="title" required>
        </div>

        <div class="form-group">
            <label>Author</label>
            <input type="text" name="author" required>
        </div>

        <div class="form-group">
            <label>Publisher</label>
            <input type="text" name="publisher" required>
        </div>

        <div class="form-group">
            <label>Quantity</label>
            <input type="number" name="quantity" required min="1">
        </div>

        <button type="submit">Add Book</button>
    </form>

    <div class="back">
        <a href="dashboard.jsp"> Back to Dashboard</a>
    </div>
</div>

</body>
</html>
