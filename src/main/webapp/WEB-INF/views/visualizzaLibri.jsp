<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Visualizza Libri</title>
<style>
body {
	font-family: 'Segoe UI', sans-serif;
	background: #f1f8e9;
	padding: 40px;
}

.container {
	max-width: 900px;
	margin: auto;
	background: white;
	padding: 30px;
	border-radius: 16px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}

h1 {
	color: #558b2f;
	text-align: center;
}

form {
	margin-bottom: 20px;
	text-align: center;
}

input[type="text"] {
	padding: 10px;
	width: 60%;
	border: 1px solid #ccc;
	border-radius: 8px;
	margin-right: 10px;
}

button {
	padding: 10px 16px;
	background-color: #689f38;
	color: white;
	border: none;
	border-radius: 8px;
	cursor: pointer;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 10px;
}

th, td {
	padding: 12px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #c5e1a5;
}

.back {
	text-align: center;
	margin-top: 20px;
}

.back a {
	color: #33691e;
	text-decoration: none;
	font-weight: bold;
}

.back a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="container">
		<h1>📚 Elenco Libri</h1>

		<c:if test="${not empty errore}">
			<div
				style="color: red; text-align: center; font-weight: bold; margin-bottom: 10px;">
				${errore}</div>
		</c:if>

		<c:if test="${not empty messaggio}">
			<div
				style="color: #ff9800; text-align: center; font-weight: bold; margin-bottom: 10px;">
				${messaggio}</div>
		</c:if>

		<table>
			<thead>
				<tr>
					<th>Titolo</th>
					<th>Autore</th>
					<th>Prezzo (€)</th>
					<c:if
						test="${fn:toLowerCase(sessionScope.utente.ruolo.nome) eq 'r_admin' or fn:toLowerCase(sessionScope.utente.ruolo.nome) eq 'admin'}">
						<th>Elimina</th>
					</c:if>
					<c:if
						test="${fn:toLowerCase(sessionScope.utente.ruolo.nome) eq 'r_admin' or fn:toLowerCase(sessionScope.utente.ruolo.nome) eq 'admin'}">
						<th>Modifica</th>
					</c:if>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty libri}">
						<c:forEach var="libro" items="${libri}">
							<tr>
								<td>${libro.titolo}</td>
								<td>${libro.autore}</td>
								<td>${libro.prezzo}</td>
								<td><c:if
										test="${fn:toLowerCase(sessionScope.utente.ruolo.nome) eq 'r_admin' or fn:toLowerCase(sessionScope.utente.ruolo.nome) eq 'admin'}">
										<form action="${pageContext.request.contextPath}/eliminaLibro"
											method="post" style="margin: 0;">
											<input type="hidden" name="id" value="${libro.id}" />
											<button type="submit"
												onclick="return confirm('Sei sicuro di voler eliminare questo libro?');">Elimina</button>
										</form>
									</c:if></td>
								<c:if
									test="${fn:toLowerCase(sessionScope.utente.ruolo.nome) eq 'r_admin' or fn:toLowerCase(sessionScope.utente.ruolo.nome) eq 'admin'}">
									<td><a
										href="${pageContext.request.contextPath}/modificaLibro?id=${libro.id}">
											<button type="button">Modifica</button>
									</a></td>
								</c:if>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4">Nessun libro trovato.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>

		<div class="back">
			<c:choose>
				<c:when
					test="${not empty sessionScope.utente and (fn:toLowerCase(sessionScope.utente.ruolo.nome) eq 'r_admin' or fn:toLowerCase(sessionScope.utente.ruolo.nome) eq 'admin')}">
					<a href="${pageContext.request.contextPath}/menuAdmin">⬅ Torna
						al menu</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/menuUtente">⬅ Torna
						al menu</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>