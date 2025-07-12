<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8" />
    <title>Registrazione</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f1f8e9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .reg-container {
            background: white;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.15);
            width: 350px;
            text-align: center;
        }

        #animazione-reg {
            width: 200px;
            height: 200px;
            margin: 0 auto 10px;
        }

        h2 {
            color: #689f38;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            text-align: left;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 8px 10px;
            margin-top: 6px;
            border: 1px solid #bbb;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .error, .message {
            margin-top: 10px;
            font-weight: bold;
        }

        .error {
            color: #d32f2f;
        }

        .message {
            color: #388e3c;
        }

        button {
            margin-top: 20px;
            width: 100%;
            background-color: #689f38;
            color: white;
            border: none;
            padding: 10px;
            font-size: 1em;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #33691e;
        }

        .link-login {
            margin-top: 15px;
        }

        .link-login a {
            color: #689f38;
            text-decoration: none;
            font-weight: bold;
        }

        .link-login a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="reg-container">
        <!-- Animazione -->
        <div id="animazione-reg"></div>

        <h2>Registrazione</h2>
        <form method="post" action="<c:url value='/registrazione' />">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" value="${utente.username}" required autofocus />

            <label for="password">Password</label>
            <input type="password" id="password" name="password" required />

            <c:if test="${not empty errore}">
                <div class="error">${errore}</div>
            </c:if>
            <c:if test="${not empty messaggio}">
                <div class="message">${messaggio}</div>
            </c:if>

            <button type="submit">Registrati</button>
        </form>

        <div class="link-login">
            <p>Hai già un account?  <a href="/paginaLogin">Accedi QUI!</a></p>
        </div>
    </div>

    <!-- Lottie Animazione -->
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        lottie.loadAnimation({
            container: document.getElementById('animazione-reg'),
            renderer: 'svg',
            loop: true,
            autoplay: true,
            path: 'https://assets1.lottiefiles.com/packages/lf20_wwb7d7f8.json'
        });
    });
</script>
</body>
</html>