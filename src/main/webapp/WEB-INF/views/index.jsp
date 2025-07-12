<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Benvenuto - Portale Utenti</title>

    <!-- Lottie player -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bodymovin/5.7.4/lottie.min.js"></script>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #e3f2fd, #f5f7fa);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            color: #2c3e50;
        }

        .container {
            background: white;
            padding: 40px 50px;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
        }

        #animazione-login {
            width: 240px;
            height: 240px;
            margin: 0 auto 30px;
        }

        h1 {
            margin-bottom: 20px;
            font-size: 2em;
            color: #1976d2;
        }

        p {
            margin-bottom: 30px;
            color: #555;
            font-size: 1.05em;
        }

        .btn {
            display: inline-block;
            padding: 12px 25px;
            margin: 10px;
            background-color: #1976d2;
            color: white;
            text-decoration: none;
            font-weight: bold;
            border-radius: 8px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn:hover {
            background-color: #0d47a1;
            transform: scale(1.05);
        }

        .footer {
            margin-top: 40px;
            font-size: 0.9em;
            color: #888;
        }

        @media (max-width: 480px) {
            .container {
                padding: 30px 20px;
                width: 90%;
            }

            h1 {
                font-size: 1.6em;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Animazione Lottie -->
        <div id="animazione-login"></div>

        <h1>Benvenuto nel Portale</h1>
        <p>Accedi al tuo profilo o registrati per iniziare a usare i servizi.</p>

        <a href="<c:url value='/login' />" class="btn">Login</a>
        <a href="<c:url value='/registrazione' />" class="btn">Registrati</a>
    </div>

    <div class="footer">
        &copy; 2025 Portale Utenti. Tutti i diritti riservati.
    </div>

    <script>
        // Caricamento animazione Lottie seria (login sicuro)
        lottie.loadAnimation({
            container: document.getElementById('animazione-login'),
            renderer: 'svg',
            loop: true,
            autoplay: true,
            path: 'https://assets10.lottiefiles.com/packages/lf20_jcikwtux.json'
        });
    </script>
</body>
</html>