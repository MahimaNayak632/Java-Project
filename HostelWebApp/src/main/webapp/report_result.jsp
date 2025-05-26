<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.model.Student" %>
<%
    List<Student> reportData = (List<Student>) request.getAttribute("reportData");
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report Results</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 900px;
            margin: 50px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #28a745;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 30px;
            font-size: 16px;
            color: #007bff;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        .error {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>📋 Report Results</h2>

    <% if (error != null) { %>
        <p class="error"><%= error %></p>
    <% } else if (reportData == null || reportData.isEmpty()) { %>
        <p>No records found for the selected criteria.</p>
    <% } else { %>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Room</th>
                <th>Admission Date</th>
                <th>Fees Paid</th>
                <th>Pending Fees</th>
            </tr>
            <% for (Student s : reportData) { %>
                <tr>
                    <td><%= s.getStudentID() %></td>
                    <td><%= s.getStudentName() %></td>
                    <td><%= s.getRoomNumber() %></td>
                    <td><%= s.getAdmissionDate() %></td>
                    <td><%= s.getFeesPaid() %></td>
                    <td><%= s.getPendingFees() %></td>
                </tr>
            <% } %>
        </table>
    <% } %>

    <a class="back-link" href="reports.jsp">⬅️ Back to Reports Menu</a>
</div>
</body>
</html>
