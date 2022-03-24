<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import ="model.*" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp"></jsp:include>

<body>

	<!-- Pre-loader start -->
	<jsp:include page="theme-loader.jsp"></jsp:include>
	<!-- Pre-loader end -->
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">

			<jsp:include page="navbar.jsp"></jsp:include>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<jsp:include page="navbarmainmenu.jsp"></jsp:include>
					<div class="pcoded-content">
						<!-- Page-header start -->
						<jsp:include page="pageheader.jsp"></jsp:include>
						<!-- Page-header end -->
						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">
										<div class="card">
											<div class="card-block">
												<h4 class="sub-title">Cadastro Telefone</h4>
												<!-- Início Formulário -->
												<form class="form-material"
													action="<%=request.getContextPath()%>/ServletTelefone"
													method="post" id="formTeleFone">

													<div class="form-group form-default form-static-label">
														<input type="text" name="id" id="id" class="form-control"
															readonly="readonly" value="${modelLogin.id}"> <span
															class="form-bar"></span> <label class="float-label">ID
															User: </label>
													</div>

													<div class="form-group form-default form-static-label">
														<input type="text" name="nome" id="nome"
															class="form-control" readonly="readonly"
															value="${modelLogin.nome}"> <span
															class="form-bar"></span> <label class="float-label">Nome</label>
													</div>

													<div class="form-group form-default">
														<input type="text" name="numero" id="numero"
															class="form-control" required="required""> <span
															class="form-bar"></span> <label class="float-label">Numero</label>
													</div>

													<button type="submit"
														class="btn btn-success waves-effect waves-light">Salvar
													</button>

												</form>
												<!-- Fim Formulário -->

												<span id="mensagem"> ${msg} </span>
											</div>
										</div>

										<div style="heigth: 300px; overflow: scroll;">
											<table class="table" id="tabelaResultadosView">
												<thead>
													<tr>
														<th scope="col">ID</th>
														<th scope="col">Numero</th>
														<th scope="col">Excluir</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${ modelTelefones }" var="f">
														<tr>
															<th><c:out value="${ f.id }"></c:out></th>
															<th><c:out value="${ f.numero }"></c:out></th>
															<th><a class="btn btn-primary"
																href="<%=request.getContextPath()%>/ServletTelefone?acao=excluir&id=${f.id}&userpai=${ modelLogin.id }">Excluir</a></th>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									<!-- Page-body end -->
								</div>
								<div id="styleSelector"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Required Jquery -->
	<jsp:include page="javascriptfile.jsp"></jsp:include>
	<script type="text/javascript">
	
	$('#numero').on('input', function (event) { 
	    this.value = this.value.replace(/[^0-9]/g, '');
	});
	
	</script>
</body>

</html>
