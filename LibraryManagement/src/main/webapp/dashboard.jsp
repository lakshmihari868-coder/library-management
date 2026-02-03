<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.html");
        return;
    }

    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Library Dashboard</title>

<style>
    body {
        margin: 0;
        font-family: "Segoe UI", Tahoma, sans-serif;
        background: linear-gradient(135deg, #e3f2fd, #f4f4f4);
    }

    .container {
        max-width: 900px;
        margin: 50px auto;
        background: #ffffff;
        border-radius: 10px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        overflow: hidden;
    }

    header {
        background: linear-gradient(135deg, #1976d2, #42a5f5);
        color: white;
        padding: 25px;
    }

    header h1 {
        margin: 0;
        font-size: 26px;
    }

    header p {
        margin: 5px 0 0;
        opacity: 0.9;
    }

    nav {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 15px;
        padding: 25px;
    }

    nav a {
        display: block;
        padding: 15px;
        text-align: center;
        text-decoration: none;
        background: #f5f7fa;
        color: #333;
        border-radius: 8px;
        font-weight: 500;
        transition: all 0.3s ease;
        box-shadow: 0 2px 6px rgba(0,0,0,0.08);
    }

    nav a:hover {
        background: #1976d2;
        color: #fff;
        transform: translateY(-2px);
    }

    .logout {
        background: #e53935 !important;
        color: white !important;
    }

    .logout:hover {
        background: #c62828 !important;
    }

    footer {
        text-align: center;
        padding: 15px;
        font-size: 14px;
        color: #777;
        background: #fafafa;
        border-top: 1px solid #eee;
    }
</style>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
   
</head>

<body>

<div class="container">
    <header>
        <h1>Library Management Dashboard</h1>
        <p>Welcome, <strong><%= username %></strong> | Role: <%= role %></p>
    </header>

    <nav>
			<a href="addBook.jsp"><i class="fa fa-book"></i> Add Book</a>
			<a href="viewBooks.jsp"><i class="fa fa-book-open"></i> View Books</a>
			<a href="addMember.jsp"><i class="fa fa-user-plus"></i> Add Member</a>
			<a href="viewMembers.jsp"><i class="fa fa-users"></i> View Members</a>
			<a href="issueBook.jsp"><i class="fa fa-exchange-alt"></i> Rent / Issue Book</a>
			<a href="issuedBooks.jsp"><i class="fa fa-file"></i> Issued Books</a>
			<a href="fines.jsp"><i class="fa fa-money-bill"></i> Fines</a>
			<a href="logout" class="logout"><i class="fa fa-sign-out-alt"></i> Logout</a>

    </nav>

    <footer>
        © 	2026 Library Management System
    </footer>
</div>

</body>
</html>
