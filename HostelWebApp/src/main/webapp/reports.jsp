<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Generate Reports - Hostel Web App</title>
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
            background-color: #28a745;
            padding: 12px 20px;
            width: 80%;
            text-decoration: none;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }

        .menu a:hover {
            background-color: #1e7e34;
        }

        .back-link {
            display: block;
            margin-top: 30px;
            font-size: 16px;
            text-decoration: none;
            color: #007bff;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>📊 Generate Reports</h1>

    <div class="menu">
        <a href="report_form.jsp?type=pending">💸 Students with Pending Fees</a>
        <a href="report_form.jsp?type=room">🚪 Students in a Particular Room</a>
        <a href="report_form.jsp?type=admission">📅 Students Admitted in a Date Range</a>
    </div>

    <a class="back-link" href="index.jsp">⬅️ Back to Home</a>
</div>

</body>
</html>
