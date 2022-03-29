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
															<button type="button" onclick="gerarGrafico();" class="btn btn-primary">Gerar Gráfico</button>
														</div>
													</div>

												</form>
												<!-- Início Tabela  -->
													<div>
													  <canvas id="myChart"></canvas>
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
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script type="text/javascript">
	
	var myChart = new Chart( document.getElementById('myChart'));

	function gerarGrafico(){
		
		var urlAction = document.getElementById("formUser").action;
		var dataInicial = document.getElementById("dataInicial").value;
		var dataFinal = document.getElementById("dataFinal").value;
		
		$.ajax(
				{

					method : "get",
					url : urlAction,
					data : "dataInicial=" + dataInicial + "&dataFinal=" + dataFinal + "&acao=graficoSalario",
					success : function(response) {
						var json = JSON.parse(response);
						
						myChart.destroy();
						
						  const labels = json.perfis;

							  const data = {
							    labels: labels,
							    datasets: [{
							      label: 'Gráfico de média salarial',
							      backgroundColor: 'rgb(255, 99, 132)',
							      borderColor: 'rgb(255, 99, 132)',
							      data: json.salarios,
							    }]
							  };

							  const config = {
							    type: 'line',
							    data: data,
							    options: {}
							  };
							
							 myChart = new Chart(
								    document.getElementById('myChart'),
								    config
								  );
						
						
					}
				}).fail(
				function(xhr, status, errorThrown) {
					alert('Erro ao buscar dados para o gráfico: ' + xhr.responseText);
				});
		
		

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
