<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Esito Operazione</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f9fbe7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .message-box {
            background: white;
            padding: 30px 40px;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            margin: 0;
        }

        .success {
            color: #388e3c;
        }

        .error {
            color: #d32f2f;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #6a1b9a;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="message-box">
    <c:if test="${not empty messaggio}">
        <h2 class="success">✅ ${messaggio}</h2>
    </c:if>

    <c:if test="${not empty errore}">
        <h2 class="error">❌ ${errore}</h2>
    </c:if>

    <a href="/menuAdmin">⬅ Torna al menu</a>
</div>
</body>
</html>