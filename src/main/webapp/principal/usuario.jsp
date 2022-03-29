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
												<h4 class="sub-title">Cadastro de usuário</h4>

												<form class="form-material" enctype="multipart/form-data"
													action="<%=request.getContextPath()%>/ServletUsuarioController"
													method="post" id="formUser">
													<input type="hidden" name="acao" id="acao" value="">
													<div class="form-group form-default form-static-label">
														<input type="text" name="id" id="id" class="form-control"
															readonly="readonly" value="${modelLogin.id}"> <span
															class="form-bar"></span> <label class="float-label">ID:
														</label>
													</div>
													<div class="form-group form-default input-group mb-4">
													<div class="input-group-prepend">
														<c:if test="${ modelLogin.fotouser != '' && modelLogin.fotouser != null}">
															<a href="<%=request.getContextPath()%>/ServletUsuarioController?acao=downloadFoto&id=${modelLogin.id}">
																<img alt="Image User" id="fotoembase64" src="${ modelLogin.fotouser}" width="70px">
															</a>
															
														</c:if>
														<c:if test="${ modelLogin.fotouser == '' || modelLogin.fotouser == null }">
															<img alt="Image User" id="fotoembase64" src="assets/images/avatar-1.jpg" width="70px">
																													
														</c:if>
														
													</div>
													<input onchange="visualizarImg('fotoembase64', 'filefoto')" type="file" id="filefoto" name="filefoto" accept="image/*" class="form-control-file" style="margin-top: 15px; margin-left: 5px;">
													</div>
													
													<div class="form-group form-default">
														<input type="text" name="nome" id="nome"
															class="form-control" required="required"
															value="${modelLogin.nome}"> <span
															class="form-bar"></span> <label class="float-label">Nome</label>
													</div>
													
													<div class="form-group form-default form-static-label">
														<input type="text" name="dataNascimento" id="dataNascimento"
															class="form-control" required="required"
															value="${modelLogin.dataNascimento}"> <span
															class="form-bar"></span> <label class="float-label">Data de nascimento</label>
													</div>
													
												    <div class="form-group form-default form-static-label">
														<input type="text" name="rendamensal" id="rendamensal"
															class="form-control" required="required"
															value="${modelLogin.rendaMensal}"> <span
															class="form-bar"></span> <label class="float-label">Renda Mensal:</label>
													</div>
													
													<div class="form-group form-default">
														<input type="email" name="email" id="email"
															class="form-control" required="required"
															autocomplete="off" value="${modelLogin.email}"> <span
															class="form-bar"></span> <label class="float-label">Email
														</label>
													</div>
													<div class="form-group form-default">
														<select class="form-control"
															aria-label="Default select example" name="perfil">
															<option disabled="disabled">Selecione o perfil</option>
															
															<option value="ADMIN"
															<% 
																ModelLogin modelLogin = (ModelLogin)request.getAttribute("modelLogin");
																if(modelLogin != null && modelLogin.getPerfil().equals("ADMIN")){
																	out.print(" ");
																	out.print("selected=\"selected\"");
																	out.print(" ");
																}
															
															%>>Admin</option>
															
															<option value="SECRETARIA" <%
															modelLogin = (ModelLogin)request.getAttribute("modelLogin");
															if(modelLogin != null && modelLogin.getPerfil().equals("SECRETARIA")){
																out.print(" ");
																out.print("selected=\"selected\"");
																out.print(" ");
															}
															%>>Secretária</option>
															
															<option value="AUXILIAR" <%
															modelLogin = (ModelLogin)request.getAttribute("modelLogin");
															if(modelLogin != null && modelLogin.getPerfil().equals("AUXILIAR")){
																out.print(" ");
																out.print("selected=\"selected\"");
																out.print(" ");
															}
															%>>Auxiliar</option>
														</select>
														 <span
															class="form-bar"></span> <label class="float-label">Perfil:
														</label>
													</div>
													<div class="form-group form-default">
														<input onblur="pesquisaCep();" type="text" name="cep" id="cep"
															class="form-control" required="required"
															value="${modelLogin.cep}"> <span
															class="form-bar"></span> <label class="float-label">Cep</label>
													</div>
												    <div class="form-group form-default">
														<input type="text" name="logradouro" id="logradouro"
															class="form-control" required="required"
															value="${modelLogin.logradouro}"> <span
															class="form-bar"></span> <label class="float-label">Logradouro</label>
													</div>
													<div class="form-group form-default">
														<input type="text" name="bairro" id="bairro"
															class="form-control" required="required"
															value="${modelLogin.bairro}"> <span
															class="form-bar"></span> <label class="float-label">Bairro</label>
													</div>
												    <div class="form-group form-default">
														<input type="text" name="localidade" id="localidade"
															class="form-control" required="required"
															value="${modelLogin.localidade}"> <span
															class="form-bar"></span> <label class="float-label">Localidade</label>
													</div>
													<div class="form-group form-default">
														<input type="text" name="uf" id="uf"
															class="form-control" required="required"
															value="${modelLogin.uf}"> <span
															class="form-bar"></span> <label class="float-label">UF</label>
													</div>
												    <div class="form-group form-default">
														<input type="text" name="numero" id="numero"
															class="form-control" required="required"
															value="${modelLogin.numero}"> <span
															class="form-bar"></span> <label class="float-label">Número</label>
													</div>
													<div class="form-group form-default">
														<input type="text" name="login" id="login"
															class="form-control" required="required"
															value="${modelLogin.login}"> <span
															class="form-bar"></span> <label class="float-label">Login</label>
													</div>
													<div class="form-group form-default">
														<input type="password" name="senha" id="senha"
															class="form-control" required="required"
															autocomplete="off" value="${modelLogin.senha}"> <span
															class="form-bar"></span> <label class="float-label">Password</label>
													</div>
													<div class="form-group form-default">
														  <input class="" type="radio" name="sexo" id="masculino" value="MASCULINO" <%
															modelLogin = (ModelLogin)request.getAttribute("modelLogin");
															if(modelLogin != null && modelLogin.getSexo().equals("MASCULINO")){
																out.print(" ");
																out.print("checked=\"checked\"");
																out.print(" ");
															}
															%>>
														  <label class="" for="Masculino">Masculino</label>
						
														  <input class="" type="radio" name="sexo" id="feminino" value="FEMININO" <%
															modelLogin = (ModelLogin)request.getAttribute("modelLogin");
															if(modelLogin != null && modelLogin.getSexo().equals("FEMININO")){
																out.print(" ");
																out.print("checked=\"checked\"");
																out.print(" ");
															}
															%>>
														  <label class="" for="Feminino">Feminino</label>
													</div>
													
													<button type="button"
														class="btn btn-primary waves-effect waves-light"
														onclick="limparForm();">Novo</button>
													<button type="submit"
														class="btn btn-success waves-effect waves-light">Salvar
													</button>
													<button type="button"
														class="btn btn-info waves-effect waves-light"
														onclick="criarDeleteAjax()">Excluir</button>
													<c:if test="${modelLogin.id > 0}">
														<a href="<%= request.getContextPath() %>/ServletTelefone?iduser=${modelLogin.id}" class="btn btn-primary waves-effect waves-light">Telefone</a>
													</c:if>
								
													<button type="button" class="btn btn-secondary"
														data-toggle="modal" data-target="#exampleModal">
														Pesquisar</button>
												</form>
											</div>
										</div>
									</div>

									<span id="mensagem"> ${msg} </span>

									<div style="heigth: 300px; overflow: scroll;">
										<table class="table" id="tabelaResultadosView">
											<thead>
												<tr>
													<th scope="col">ID</th>
													<th scope="col">Nome</th>
													<th scope="col">Email</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${ modelLogins }" var="ml">
													<tr>
														<th><c:out value="${ ml.id }"></c:out></th>
														<th><c:out value="${ ml.nome }"></c:out></th>
														<th><a class="btn btn-primary"
															href="<%=request.getContextPath()%>/ServletUsuarioController?acao=buscarEditar&id=${ml.id}">Ver</a></th>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									
			                    <nav aria-label="Page navigation example">
								  <ul class="pagination">
								  <%
								  	int totalPagina = (int) request.getAttribute("totalPagina");
								  
								  	for(int p = 0; p < totalPagina; p++){
								  		String url = request.getContextPath() + "/ServletUsuarioController?acao=paginar&pagina=" + (p*5);
								  		out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"" + url +"\">" + (p + 1) + "</a></li>");
								  	}
								  %>
								    
								  </ul>
								</nav>


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

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Pesquisa de
						usuário</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="Nome"
							aria-label="Nome" aria-describedby="basic-addon2" id="nomeBusca">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button"
								onclick="buscarUsuario();">Buscar</button>
						</div>
					</div>

					<div style="heigth: 300px; overflow: scroll;">
						<table class="table" id="tabelaResultados">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Nome</th>
									<th scope="col">Detalhes</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
					 <nav aria-label="Page navigation example">
					  <ul class="pagination" id="ulPaginacaoUserAjax">
					  </ul>
					</nav>
					<span id="totalResultados"></span>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Fechar</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Required Jquery -->
	<jsp:include page="javascriptfile.jsp"></jsp:include>
	<script type="text/javascript">
	
		$("#rendamensal").maskMoney({showSymbol:true, symbol:"R$ ", decimal:",", thousands:"."});
		
		const formatter = new Intl.NumberFormat('pt-br', {
			currency: 'BRL',
			minimumFractionDigits: 2,
		});
		
		$('#rendamensal').val(formatter.format($('#rendamensal').val()));
		$('#rendamensal').focus();
		
		var dataNascimento = $("#dataNascimento").val();
		
		var dateFormat = new Date(dataNascimento);
		$("#dataNascimento").val(dateFormat.toLocaleDateString('pt-BR',{ timeZone: 'UTC'}));
		
		$("#nome").focus();
		
	
		$( function() {
			  
			  $("#dataNascimento").datepicker({
				    dateFormat: 'dd/mm/yy',
				    dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
				    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
				    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
				    monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
				    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
				    nextText: 'Próximo',
				    prevText: 'Anterior'
				});
		} );
		
		$('#numero').on('input', function (event) { 
		    this.value = this.value.replace(/[^0-9]/g, '');
		});
		
		$('#cep').on('input', function (event) { 
		    this.value = this.value.replace(/[^0-9]/g, '');
		});
		
		function pesquisaCep(){
			var cep = $("#cep").val();
			
			$.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {
				
				 if (!("erro" in dados)) {
					 $("#cep").val(dados.cep);
                     $("#logradouro").val(dados.logradouro);
                     $("#bairro").val(dados.bairro);
                     $("#localidade").val(dados.localidade);
                     $("#uf").val(dados.uf);
                 } 
				
			});
		}
		function visualizarImg(fotoembase64, filefoto){
				
			var preview = document.getElementById(fotoembase64); //Campo img html
			var fileUser = document.getElementById(filefoto).files[0];
			var reader = new FileReader();
			
			reader.onloadend = function (){
				preview.src = reader.result; //Carrega a foto na tela
			};
			
			if(fileUser){
				reader.readAsDataURL(fileUser); // Preview da imagem
			}else{
				preview.src = '';
			}
			
		}
		function verEditar(id) {
			var urlAction = document.getElementById('formUser').action;
			window.location.href = urlAction + '?acao=buscarEditar&id=' + id;
		}
		function buscaUserPagAjax(url){
			   
		    
		    var urlAction = document.getElementById('formUser').action;
		    var nomeBusca = document.getElementById('nomeBusca').value;
		    
			 $.ajax({	     
			     method: "get",
			     url : urlAction,
			     data : url,
			     success: function (response, textStatus, xhr) {
				 
				 var json = JSON.parse(response);
				 
				 //console.log(json);
				 
				 
				 $('#tabelaresultados > tbody > tr').remove();
				 $("#ulPaginacaoUserAjax > li").remove();
				 
				  for(var p = 0; p < json.length; p++){
				      $('#tabelaresultados > tbody').append('<tr> <td>'+json[p].id+'</td> <td> '+json[p].nome+'</td> <td><button onclick="verEditar('+json[p].id+')" type="button" class="btn btn-info">Ver</button></td></tr>');
				  }
				  
				  document.getElementById('totalResultados').textContent = 'Resultados: ' + json.length;
				  
				    var totalPagina = xhr.getResponseHeader("totalPagina");
			
				  
				    
					  for (var p = 0; p < totalPagina; p++){
					      
				
					      
					      var url = 'nomeBusca=' + nomeBusca + '&acao=buscarUserAjaxPage&pagina='+ (p * 5);
					      
					   
					      $("#ulPaginacaoUserAjax").append('<li class="page-item"><a class="page-link" href="#" onclick="buscaUserPagAjax(\''+url+'\')">'+ (p + 1) +'</a></li>'); 
					      
					  }
				 
			     }
			     
			 }).fail(function(xhr, status, errorThrown){
			    alert('Erro ao buscar usuário por nome: ' + xhr.responseText);
			 });
		    
		}


		function buscarUsuario() {
			var nomeBusca = document.getElementById('nomeBusca').value;

			var urlAction = document.getElementById('formUser').action;

			if (nomeBusca != null && nomeBusca != '' && nomeBusca.trim() != '') {

				$
						.ajax(
								{

									method : "get",
									url : urlAction,
									data : "nomeBusca=" + nomeBusca
											+ "&acao=buscarUserAjax",
									success : function(response) {

										var json = JSON.parse(response);

										$('#tabelaResultados > tbody > tr')
												.remove();

										for (var p = 0; p < json.length; p++) {
											$('#tabelaResultados > tbody')
													.append(
															'<tr> <td>'
																	+ json[p].id
																	+ '  </td> <td>'
																	+ json[p].nome
																	+ '  </td> <td> <button class="btn btn-info waves-effect waves-light" onclick="verEditar('
																	+ json[p].id
																	+ ')" >Ver</button>  </td> </tr>');
										}
										document.getElementById('totalResultados').textContent = 'Resultados: ' + json.length;
										
									    var totalPagina = xhr.getResponseHeader("totalPagina");
										
										  
									    
										  for (var p = 0; p < totalPagina; p++){
										      
										      var url = 'nomeBusca=' + nomeBusca + '&acao=buscarUserAjaxPage&pagina='+ (p * 5);
										      
										   
										      $("#ulPaginacaoUserAjax").append('<li class="page-item"><a class="page-link" href="#" onclick="buscaUserPagAjax(\''+url+'\')">'+ (p + 1) +'</a></li>');
										      
										  }
									}
								}).fail(
								function(xhr, status, errorThrown) {
									alert('Erro ao buscar usuário por nome: '
											+ xhr.responseText);
								});

			}
		}


		function criarDeleteAjax() {
			if (confirm("Deseja realmente deletar este usuário ?")) {
				var urlAction = document.getElementById('formUser').action;
				var idUser = document.getElementById('id').value;

				$
						.ajax(
								{

									method : "get",
									url : urlAction,
									data : "id=" + idUser + "&acao=deletarajax",
									success : function(response) {
										limparForm();
										document.getElementById("mensagem").textContent = response;
									}
								}).fail(
								function(xhr, status, errorThrown) {
									alert('Erro ao deletar usuário por id: '
											+ xhr.responseText);
								});

			}
		}

		function criarDelete() {

			if (confirm("Deseja realmente deletar este usuário ?")) {
				document.getElementById("formUser").method = 'get';
				document.getElementById("acao").value = 'deletar';
				document.getElementById("formUser").submit();
			}

		}
		function limparForm() {
			var elementos = document.getElementById("formUser").elements; // Retorna os elementos html do form

			for (p = 0; p < elementos.length; p++) {
				elementos[p].value = '';
			}
		}
	</script>
</body>

</html>
