<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8" />
    <title>Menu Utente</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #f3e5f5, #ede7f6);
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .user-container {
            background: white;
            padding: 40px 50px;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 500px;
        }

        .user-container img {
            width: 120px;
            margin-bottom: 20px;
        }

        h1 {
            color: #8e24aa;
            margin-bottom: 30px;
        }

        nav a {
            display: block;
            background-color: #8e24aa;
            color: white;
            text-decoration: none;
            padding: 12px;
            margin: 10px 0;
            border-radius: 8px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        nav a:hover {
            background-color: #6a1b9a;
            transform: scale(1.03);
        }

        .logout {
            margin-top: 30px;
        }

        .logout a {
            color: #d32f2f;
            font-weight: bold;
            text-decoration: none;
        }

        .logout a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="user-container">
        <img src="https://lottie.host/3b28483e-6f00-44d6-b6b7-5bd7bcdbf4df/4yFYrD33cU.gif" alt="User Icon">
        <h1>Area Utente</h1>
        <nav>
            
            <a href="<c:url value='/visualizzaLibri' />">I miei libri</a>
            <a href="<c:url value='/ricercaLibri' />">Ricerca</a>
        </nav>
        <div class="logout">
            <a href="<c:url value='/logout' />">Logout</a>
        </div>
    </div>
</body>
</html>