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
	<input type="hidden" name="url" value="<%= request.getParameter("url") %>">
		<table>
			<tr>
				<td>
					<label> Login </label> 
					<input type="text" name="login">
				</td>
			</tr>
			<tr>
				<td>
					<label> Senha </label> 
					<input type="password" name="senha">
				</td>
			</tr>
			<tr>
				<td>
					<button type="submit">Enviar</button>
				</td>
			</tr>
		</table>
	</form>
	<h4> ${ msg } </h4>

</body>
</html>