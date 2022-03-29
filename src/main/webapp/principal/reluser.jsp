<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
												<h4 class="sub-title">Relatório de Usuário</h4>
												<form class="form-material"
													action="<%=request.getContextPath()%>/ServletUsuarioController"
													method="get" id="formUser">

													<input type="hidden" name="acao" id="acaoRelatorioImprimirTipo"
														value="imprimirRelatorioUser">

													<div class="form-row align-items-center">
														<div class="col-sm-3 my-1">
															<label class="sr-only" for="dataInicial">Data
																Inicial</label> <input type="text" class="form-control"
																id="dataInicial" name="dataInicial"
																value="${dataInicial}">
														</div>
														<div class="col-sm-3 my-1">
															<label class="sr-only" for="dataFinal">Data Final</label>
															<input type="text" class="form-control" id="dataFinal"
																name="dataFinal" value="${dataFinal}">
														</div>
														<div class="col-auto my-1">
															<button type="button" onclick="imprimirHtml();" class="btn btn-primary">Imprimir
																Relatório</button>
															<button type="button" onclick="imprimirPdf();" class="btn btn-primary">Imprimir
																PDF</button>
														</div>
													</div>

												</form>
												<!-- Início Tabela  -->
												<div style="heigth: 300px; overflow: scroll;">
													<table class="table" id="tabelaResultadosView">
														<thead>
															<tr>
																<th scope="col">ID</th>
																<th scope="col">Nome</th>
																<th scope="col">Telefones</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${ listaUser }" var="ml">
																<tr>
																	<th><c:out value="${ ml.id }"></c:out></th>
																	<th><c:out value="${ ml.nome }"></c:out></th>
																	<th>
																	<c:forEach items="${ ml.telefones }" var="fone">
																	<span class="badge badge-secondary" style="font-size: 12px;"><c:out value="${ fone.numero } "></c:out></span>
																		</br>
																	</c:forEach>
																	</th>
																</tr>
																<tr>
																	
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
												<!-- Fim Tabela  -->
											</div>
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
		function imprimirHtml(){
			document.getElementById("acaoRelatorioImprimirTipo").value = 'imprimirRelatorioUser';
			$("#formUser").submit();
		}
		function imprimirPdf(){
			document.getElementById("acaoRelatorioImprimirTipo").value = 'imprimirRelatorioPDF';
			$("#formUser").submit();
			
		}
		$(function() {

			$("#dataInicial")
					.datepicker(
							{
								dateFormat : 'dd/mm/yy',
								dayNames : [ 'Domingo', 'Segunda', 'Terça',
										'Quarta', 'Quinta', 'Sexta', 'Sábado' ],
								dayNamesMin : [ 'D', 'S', 'T', 'Q', 'Q', 'S',
										'S', 'D' ],
								dayNamesShort : [ 'Dom', 'Seg', 'Ter', 'Qua',
										'Qui', 'Sex', 'Sáb', 'Dom' ],
								monthNames : [ 'Janeiro', 'Fevereiro', 'Março',
										'Abril', 'Maio', 'Junho', 'Julho',
										'Agosto', 'Setembro', 'Outubro',
										'Novembro', 'Dezembro' ],
								monthNamesShort : [ 'Jan', 'Fev', 'Mar', 'Abr',
										'Mai', 'Jun', 'Jul', 'Ago', 'Set',
										'Out', 'Nov', 'Dez' ],
								nextText : 'Próximo',
								prevText : 'Anterior'
							});
		});

		$(function() {

			$("#dataFinal")
					.datepicker(
							{
								dateFormat : 'dd/mm/yy',
								dayNames : [ 'Domingo', 'Segunda', 'Terça',
										'Quarta', 'Quinta', 'Sexta', 'Sábado' ],
								dayNamesMin : [ 'D', 'S', 'T', 'Q', 'Q', 'S',
										'S', 'D' ],
								dayNamesShort : [ 'Dom', 'Seg', 'Ter', 'Qua',
										'Qui', 'Sex', 'Sáb', 'Dom' ],
								monthNames : [ 'Janeiro', 'Fevereiro', 'Março',
										'Abril', 'Maio', 'Junho', 'Julho',
										'Agosto', 'Setembro', 'Outubro',
										'Novembro', 'Dezembro' ],
								monthNamesShort : [ 'Jan', 'Fev', 'Mar', 'Abr',
										'Mai', 'Jun', 'Jul', 'Ago', 'Set',
										'Out', 'Nov', 'Dez' ],
								nextText : 'Próximo',
								prevText : 'Anterior'
							});
		});
	</script>
</body>

</html>
