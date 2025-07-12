<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8" />
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f0f4ff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .admin-container {
            background: white;
            padding: 40px 50px;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 500px;
        }

        .admin-container img {
            width: 120px;
            margin-bottom: 20px;
        }

        h1 {
            color: #3f51b5;
            margin-bottom: 30px;
        }

        .nav-links a {
            display: block;
            background: #3f51b5;
            color: white;
            text-decoration: none;
            padding: 12px;
            margin: 10px 0;
            border-radius: 8px;
            font-weight: bold;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .nav-links a:hover {
            background: #303f9f;
            transform: scale(1.03);
        }

        .logout a {
            display: inline-block;
            margin-top: 30px;
            color: #d32f2f;
            text-decoration: none;
            font-weight: bold;
        }

        .logout a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="admin-container">
        <img src="https://lottie.host/f1d5f300-bfaa-4f61-9235-b59d80db5f5f/ZKDWu6nvUS.gif" alt="Admin Icon">
        <h1>Area Amministratore</h1>
        <div class="nav-links">
            <a href="<c:url value='/visualizzaLibri' />">Gestione Libri</a>
            <a href="<c:url value='/creaLibro' />">Creazione Libro</a>
            <a href="<c:url value='/ricercaLibri' />">Ricerca</a>
        </div>
        <div class="logout">
            <a href="<c:url value='/logout' />">Logout</a>
        </div>
    </div>
</body>
</html>