<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Curso JSP</title>
</head>
<body>
	<h1>Bem vindo ao curso JSP</h1>

	<form action="ServletLogin" method="post">
		<label> Nome </label> <input type="text" name="nome">
		<label> Idade </label> <input type="number" name="idade">

		<button type="submit">Enviar</button>
	</form>

</body>
</html>