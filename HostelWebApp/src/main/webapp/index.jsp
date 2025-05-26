<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hostel Web App</title>
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
            text-align: center;
        }

        h1 {
            color: #333;
            margin-bottom: 30px;
        }

        .menu a {
            display: block;
            margin: 12px auto;
            font-size: 18px;
            color: #ffffff;
            background-color: #007bff;
            padding: 12px 20px;
            width: 80%;
            text-decoration: none;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }

        .menu a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>🏠 Hostel Management System</h1>

    <div class="menu">
        <!-- Student related options -->
        <a href="studentadd.jsp">➕ Add New Student</a>
        <a href="displayStudents">👀 Display All Students</a>
        <a href="studentupdate.jsp">✏️ Update Student</a>
        <a href="studentdelete.jsp">❌ Delete Student</a>
        <a href="reports.jsp">📊 Generate Reports</a>
    </div>
</div>

</body>
</html>
