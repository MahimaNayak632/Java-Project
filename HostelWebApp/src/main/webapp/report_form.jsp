<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String type = request.getParameter("type");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report Criteria - Hostel Web App</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 100px auto;
            padding: 40px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 12px;
        }

        h2 {
            color: #333;
            text-align: center;
        }

        form {
            margin-top: 30px;
        }

        label {
            display: block;
            margin-top: 20px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        button {
            margin-top: 30px;
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #1e7e34;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #007bff;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Report Criteria</h2>
    <form action="generateReport" method="post">
        <input type="hidden" name="criteria" value="<%= type %>">

        <% if ("room".equals(type)) { %>
            <label for="roomNumber">Room Number:</label>
            <input type="text" id="roomNumber" name="roomNumber" required>
        <% } else if ("admission".equals(type)) { %>
            <label for="fromDate">From Date:</label>
            <input type="date" id="fromDate" name="fromDate" required>

            <label for="toDate">To Date:</label>
            <input type="date" id="toDate" name="toDate" required>
        <% } else if ("pending".equals(type)) { %>
        <% } %>

        <button type="submit">Generate Report</button>
    </form>

    <a class="back-link" href="reports.jsp">⬅️ Back to Reports Menu</a>
</div>
</body>
</html>
