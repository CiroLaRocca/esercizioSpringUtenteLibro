<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Modifica Libro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="card shadow rounded-4">
                <div class="card-header bg-primary text-white text-center rounded-top-4">
                    <h3>Modifica Libro</h3>
                </div>
                <div class="card-body p-4">
                    <form action="/modificaLibro" method="post">
                        <input type="hidden" name="id" value="${libro.id}"/>

                        <div class="mb-3">
                            <label for="titolo" class="form-label">Titolo</label>
                            <input type="text" class="form-control" id="titolo" name="titolo" value="${libro.titolo}" required>
                        </div>

                        <div class="mb-3">
                            <label for="autore" class="form-label">Autore</label>
                            <input type="text" class="form-control" id="autore" name="autore" value="${libro.autore}" required>
                        </div>

                        <div class="mb-3">
                            <label for="prezzo" class="form-label">Prezzo (€)</label>
                            <input type="number" class="form-control" id="prezzo" name="prezzo" step="0.01" value="${libro.prezzo}" required>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-success btn-lg rounded-pill">Salva Modifiche</button>
                        </div>
                    </form>
                </div>
                <div class="card-footer text-center bg-light">
                    <a href="/visualizzaLibri" class="btn btn-outline-secondary btn-sm">Torna alla lista</a>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>