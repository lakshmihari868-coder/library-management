<%@ page import="java.util.List" %>
<%@ page import="com.library.model.Fine" %>
<%@ page session="true" %>
<%
    if(session.getAttribute("username") == null){
        response.sendRedirect("login.html");
        return;
    }

    List<Fine> finesList = (List<Fine>) request.getAttribute("finesList");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Library Fines</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px;
        }
        table {
            width: 90%;
            margin: 0 auto 20px auto;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #34495e;
            color: white;
            text-transform: uppercase;
            font-size: 14px;
        }
        tr:hover { background-color: #f1f1f1; }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }
        .back-link a {
            text-decoration: none;
            color: white;
            background: #2980b9;
            padding: 10px 16px;
            border-radius: 5px;
        }
        .back-link a:hover { background: #1f6391; }
    </style>
</head>
<body>

<h2>Library Fines</h2>

<table>
    <tr>
        <th>Issue ID</th>
        <th>User</th>
        <th>Book</th>
        <th>Due Date</th>
        <th>Return Date</th>
        <th>Overdue Days</th>
        <th>Fine Amount</th>
    </tr>

<%
    if(finesList != null && !finesList.isEmpty()){
        for(Fine fine : finesList){
%>
<tr>
    <td><%= fine.getIssueId() %></td>
    <td><%= fine.getUsername() %></td>
    <td><%= fine.getBookTitle() %></td>
    <td><%= fine.getDueDate() %></td>
    <td><%= fine.getReturnDate() != null ? fine.getReturnDate() : "-" %></td>
    <td><%= fine.getOverdueDays() %></td>
    <td><%= fine.getFineAmount() %></td>
</tr>
<%
        }
    } else {
%>
<tr>
    <td colspan="7">No fines found.</td>
</tr>
<%
    }
%>
</table>

<div class="back-link">
    <a href="dashboard.jsp"> Back to Dashboard</a>
</div>

</body>
</html>
