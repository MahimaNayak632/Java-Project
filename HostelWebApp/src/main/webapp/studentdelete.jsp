<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Student</title>
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
            text-align: center;
        }

        h2 {
            margin-bottom: 25px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: 500;
            text-align: left;
        }

        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            transition: border-color 0.3s ease;
        }

        input[type="number"]:focus {
            border-color: #007bff;
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #d9534f; /* keep red for delete */
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
            background-color: #c9302c;
        }

        .back-link {
            display: block;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
            font-size: 14px;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        .message {
            margin: 20px 0;
            padding: 15px;
            border-radius: 8px;
            font-weight: bold;
            text-align: left;
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
    <h2>Delete Student</h2>
	
	<%
    	String message = (String) request.getAttribute("message");
    	String messageType = (String) request.getAttribute("messageType");
    	if (message != null) {
	%>
    <div class="<%= messageType %>"><%= message %></div>
	<%
    	}
	%>
	
    <form action="deleteStudent" method="post">
        <label for="studentID">Enter Student ID to Delete:</label>
        <input type="number" id="studentID" name="studentID" required min="1" />
        <input type="submit" value="Delete Student" />
    </form>
    <a class="back-link" href="index.jsp">⬅️ Back to Home</a>
</div>

</body>
</html>
