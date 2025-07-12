<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crea Libro</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #f3e5f5, #ede7f6);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background: white;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }

        h1 {
            color: #6a1b9a;
            text-align: center;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            color: #4a148c;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #8e24aa;
            border: none;
            border-radius: 8px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #6a1b9a;
        }

        .back {
            text-align: center;
            margin-top: 20px;
        }

        .back a {
            color: #6a1b9a;
            text-decoration: none;
        }

        .back a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h1>Crea un nuovo libro</h1>
    <form action="${pageContext.request.contextPath}/creaLibro" method="post">
        <label for="titolo">Titolo</label>
        <input type="text" name="titolo" required>

        <label for="autore">Autore</label>
        <input type="text" name="autore" required>

        <label for="prezzo">Prezzo</label>
        <input type="number" name="prezzo" step="0.01" required>

        <button type="submit">Salva Libro</button>
    </form>

    <div class="back">
        <a href="${pageContext.request.contextPath}/menuAdmin">⬅ Torna al menu</a>
    </div>
</div>
</body>
</html>