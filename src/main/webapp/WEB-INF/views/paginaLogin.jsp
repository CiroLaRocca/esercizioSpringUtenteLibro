<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8" />
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #e3f2fd;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background: white;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.15);
            width: 320px;
            text-align: center;
        }

        #animazione-login {
            width: 200px;
            height: 200px;
            margin: 0 auto 10px;
        }

        h2 {
            color: #1976d2;
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

        .error {
            color: #d32f2f;
            margin-top: 10px;
        }

        button {
            margin-top: 20px;
            width: 100%;
            background-color: #1976d2;
            color: white;
            border: none;
            padding: 10px;
            font-size: 1em;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0d47a1;
        }

        .link-registrazione {
            margin-top: 15px;
        }

        .link-registrazione a {
            color: #1976d2;
            text-decoration: none;
            font-weight: bold;
        }

        .link-registrazione a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <!-- Animazione -->
        <div id="animazione-login"></div>

        <h2>Login</h2>
        <form method="post" action="<c:url value='/login' />">
            <label for="username">Username</label>
            <input type="text" name="username" id="username" required autofocus />

            <label for="password">Password</label>
            <input type="password" name="password" id="password" required />

            <c:if test="${not empty errore}">
                <div class="error">${errore}</div>
            </c:if>

            <button type="submit">Accedi</button>
        </form>

        <div class="link-registrazione">
            <p>Non hai un account?  <a href="<c:url value='/paginaRegistrazione' />">Registrati QUI!</a></p>
        </div>
    </div>

    <!-- Lottie JS + Animazione -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bodymovin/5.7.4/lottie.min.js"></script>
    <script>
        lottie.loadAnimation({
            container: document.getElementById('animazione-login'),
            renderer: 'svg',
            loop: true,
            autoplay: true,
            path: 'https://assets10.lottiefiles.com/packages/lf20_jcikwtux.json' // animazione login sicuro
        });
    </script>
</body>
</html>