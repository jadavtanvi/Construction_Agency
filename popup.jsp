<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Popup</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            
        }
        
       .popup {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: none;
        }
        
       .popup-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
        
       .popup-content h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }
        
       .popup-content button {
            width: 100%;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        
       .popup-content button:hover {
            background-color: #3e8e41;
        }
    </style>
</head>
<body>
    <div class="popup">
        <div class="popup-content">
            <h2><%= request.getParameter("message") %></h2><br><br>
            <button type="button" onclick="window.location.href='<%= request.getParameter("redirect") %>'">OK</button>
        </div>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            document.querySelector('.popup').style.display = 'block';
        });
    </script>
</body>
</html>
 

<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <title>Popup</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .popup {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .popup-content {
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
        .popup-content h2 {
            margin: 0 0 20px;
        }
        .popup-content button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        .popup-content button:hover {
            background-color: #3e8e41;
        }
    </style>
</head>
<body>
    <div class="popup">
        <div class="popup-content">
            <h2><%= request.getParameter("message") %></h2>
            <button type="button" onclick="window.location.href='<%= request.getParameter("redirect") %>'">OK</button>
        </div>
    </div>
</body>
</html> --%>
