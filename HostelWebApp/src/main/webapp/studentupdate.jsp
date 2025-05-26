<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Update Student</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e9f1f7;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 480px;
            margin: 80px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: 500;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        input[type="date"]:focus {
            border-color: #007bff;
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #007bff;
            color: white;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .message {
            margin: 20px auto;
            padding: 15px;
            width: 400px;
            border-radius: 8px;
            font-weight: bold;
            text-align: center;
        }
        
        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            text-decoration: none;
            color: #007bff;
            font-size: 14px;
        }

        .back-link:hover {
            text-decoration: underline;
        }
        
        .success { 
        	color: green; 
        	background-color: #d4edda; 
        	padding: 10px; 
        	border-radius: 5px; 
        }
        
		.error {
		 color: red; 
		 background-color: #f8d7da; 
		 padding: 10px; 
		 border-radius: 5px; 
		}
		
		.warning {
		 color: #856404;
		 background-color: #fff3cd; 
		 padding: 10px; 
		 border-radius: 5px;
		}
		
    </style>
</head>
<body>

<div class="container">

    <h2>✏️ Update Student Details</h2>
    <%
    	String message = (String) request.getAttribute("message");
    	String messageType = (String) request.getAttribute("messageType");
    	if (message != null) {
	%>
    <div class="<%= messageType %>"><%= message %></div>
	<%
    	}
	%>

    <form action="updateStudent" method="post">
        <label for="studentID">Student ID (to update):</label>
        <input type="number" id="studentID" name="studentID" required min="1" />

        <label for="studentName">Student Name:</label>
        <input type="text" id="studentName" name="studentName" required />

        <label for="roomNumber">Room Number:</label>
        <input type="text" id="roomNumber" name="roomNumber" required />

        <label for="admissionDate">Admission Date:</label>
        <input type="date" id="admissionDate" name="admissionDate" required />

        <label for="feesPaid">Fees Paid:</label>
        <input type="number" id="feesPaid" name="feesPaid" step="0.01" required />

        <label for="pendingFees">Pending Fees:</label>
        <input type="number" id="pendingFees" name="pendingFees" step="0.01" required />

        <input type="submit" value="Update Student" />
    </form>

    <a class="back-link" href="index.jsp">⬅️ Back to Home</a>
</div>

</body>
</html>
