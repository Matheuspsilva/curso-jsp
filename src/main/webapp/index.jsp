<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<title>Curso JSP</title>

<style type="text/css">
html, body {
	height: 100%;
}

body {
	display: flex;
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

.form-signin {
	width: 100%;
	max-width: 450px;
	padding: 15px;
	margin: auto;
	font-weight: 400;
}

.form-signin .form-floating:focus-within {
	z-index: 2;
}

.form-signin input[type="text"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

.msg {
	color: red;
}
</style>

</head>
<body class="text-center">
	<main class="form-signin">
		<h1 class="h3 mb-3 fw-normal">Bem vindo ao Curso JSP</h1>
		<form action="<%= request.getContextPath() %>/ServletLogin" class="needs-validation" method="post"
			novalidate>
			<input type="hidden" name="url"
				value="<%=request.getParameter("url")%>">
			<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput"
					name="login" required> <label for="floatingInput"
					class="form-label">Login</label>
				<div class="invalid-tooltip">Informe um login válido</div>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingPassword"
					name="senha" required> <label for="floatingPassword"
					class="form-label">Senha</label>
				<div class="invalid-tooltip">Informe uma senha válida</div>
			</div>
			<button class="w-100 btn btn-lg btn-primary" type="submit">Acessar</button>
		</form>
		<p class="msg">${ msg }</p>
	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
		
	</script>
	<script type="text/javascript">
		// Example starter JavaScript for disabling form submissions if there are invalid fields
		(function() {
			'use strict'

			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			var forms = document.querySelectorAll('.needs-validation')

			// Loop over them and prevent submission
			Array.prototype.slice.call(forms).forEach(function(form) {
				form.addEventListener('submit', function(event) {
					if (!form.checkValidity()) {
						event.preventDefault()
						event.stopPropagation()
					}

					form.classList.add('was-validated')
				}, false)
			})
		})()
	</script>
</body>
</html>