<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.model.Student" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student List</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 40px;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
        }
        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px 16px;
            text-align: center;
            border-bottom: 1px solid #ccc;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .error {
            color: red;
            text-align: center;
            margin-bottom: 20px;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 25px;
            text-decoration: none;
            font-size: 16px;
            color: #007bff;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<h2>🏫 Hostel Students List</h2>

<% String error = (String) request.getAttribute("error"); %>
<% if (error != null) { %>
    <div class="error"><%= error %></div>
<% } %>

<%
    List<Student> students = (List<Student>) request.getAttribute("students");
    if (students != null && !students.isEmpty()) {
%>
    <table>
        <thead>
            <tr>
                <th>Student ID</th>
                <th>Name</th>
                <th>Room No.</th>
                <th>Admission Date</th>
                <th>Fees Paid</th>
                <th>Pending Fees</th>
            </tr>
        </thead>
        <tbody>
        <% for (Student s : students) { %>
            <tr>
                <td><%= s.getStudentID() %></td>
                <td><%= s.getStudentName() %></td>
                <td><%= s.getRoomNumber() %></td>
                <td><%= s.getAdmissionDate() %></td>
                <td><%= s.getFeesPaid() %></td>
                <td><%= s.getPendingFees() %></td>
            </tr>
        <% } %>
        </tbody>
    </table>
<% } else { %>
    <p style="text-align:center; color:gray;">No student records found.</p>
<% } %>

<a class="back-link" href="index.jsp">⬅️ Back to Home</a>

</body>
</html>
