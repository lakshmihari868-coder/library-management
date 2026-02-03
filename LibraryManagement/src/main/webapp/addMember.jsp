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
<title>Add Member</title>

<style>
body {
    margin: 0;
    font-family: "Segoe UI", Arial, sans-serif;
    background: linear-gradient(135deg, #1e3c72, #2a5298);
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
}

/* CARD */
.card {
    background: #ffffff;
    width: 420px;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.25);
}

/* TITLE */
.card h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #2a5298;
}

/* INPUTS */
label {
    font-size: 14px;
    font-weight: 600;
    color: #444;
}

input[type=text],
input[type=email],
textarea {
    width: 100%;
    padding: 10px;
    margin-top: 6px;
    margin-bottom: 15px;
    border-radius: 6px;
    border: 1px solid #ccc;
    font-size: 14px;
}

textarea {
    resize: none;
    height: 70px;
}

input:focus,
textarea:focus {
    outline: none;
    border-color: #2a5298;
}

/* BUTTONS */
button {
    width: 100%;
    padding: 11px;
    background: #2a5298;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
    transition: background 0.3s;
}

button:hover {
    background: #1e3c72;
}

.back-link {
    display: block;
    text-align: center;
    margin-top: 15px;
    text-decoration: none;
    color: #2a5298;
    font-size: 14px;
}

.back-link:hover {
    text-decoration: underline;
}
</style>

</head>
<body>

<div class="card">
    <h2> Add Library Member</h2>

    <form action="addMember" method="post">
        <label>Name</label>
        <input type="text" name="name" required>

        <label>Email</label>
        <input type="email" name="email" required>

        <label>Phone</label>
        <input type="text" name="phone" required>

        <label>Address</label>
        <textarea name="address" required></textarea>

        <button type="submit">Add Member</button>
    </form>

    <a href="dashboard.jsp" class="back-link"> Back to Dashboard</a>
</div>

</body>
</html>
