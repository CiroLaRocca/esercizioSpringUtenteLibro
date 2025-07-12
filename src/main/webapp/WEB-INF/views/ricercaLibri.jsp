<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Ricerca Libri</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS e Font Awesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #f0f2f5, #ffffff);
        }
        .search-container {
            background-color: #fff;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: auto;
        }
    </style>
</head>
<body>
<div class="container py-5">
    <div class="search-container">
        <h3 class="text-center mb-4"><i class="fas fa-book"></i> Ricerca Libri</h3>

        <form action="${pageContext.request.contextPath}/ricercaLibri" method="post">
            <div class="mb-3">
                <label for="titolo" class="form-label">Titolo</label>
                <input type="text" class="form-control" id="titolo" name="titolo" placeholder="Inserisci il titolo">
            </div>
            <div class="mb-3">
                <label for="autore" class="form-label">Autore</label>
                <input type="text" class="form-control" id="autore" name="autore" placeholder="Inserisci l'autore">
            </div>
            <div class="mb-3">
                <label for="prezzo" class="form-label">Prezzo massimo</label>
                <input type="number" step="0.01" class="form-control" id="prezzo" name="prezzo" placeholder="Es. 20.00">
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-success px-4">
                    <i class="fas fa-search"></i> Cerca
                </button>
            </div>
        </form>
    </div>
</div>
</body>
</html>