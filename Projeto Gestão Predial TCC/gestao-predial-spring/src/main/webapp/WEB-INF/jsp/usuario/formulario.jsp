<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@ include file="/header.jsp"%>

<h2>
	Cadastro de Usuário <small>Criação do perfil de usuário</small>
</h2>
<hr>
<br>


<div class="row">
	<div class="col-md-6">

		<div class="row">
			<div class="col-md-9">
				<div class="form-group">
					<label>Escolha o morador que está efetuando o pagamento:</label> <select
						class="form-control" id="perfil">
						<option disabled="true" selected>Selecione</option>
					</select>
				</div>
			</div>
			<div class="col-md-1">
				<br> <img src="<c:url value='/resources/img/espera.gif'/>" width="80px"
					style="display: none" id="aguarde" />
			</div>
		</div>

		<c:url var="url" value="/usuario" />
		<form:form action="${url}" method="POST" modelAttribute="Usuario">


			<input type="hidden" name="perfilId" id="perfil-id" />
			<div class="form-group">
				<label for="nome">Nome:</label> <input type="text"
					readonly="readonly" placeholder="Digite o nome do usuario *"
					name="nome" id="nome" class="form-control"
					value="${usuario.nome}" /> 
			</div>

			<div class="form-group">
				<label for="nome_guerra">Nome de Exibição <small>(máximo
						de 16 caracteres)</small>:
				</label> <input type="text" maxlength="16"
					placeholder="Digite o nome de exibição para contato *"
					name="nome_guerra" id="nome_guerra" class="form-control"
					value="${usuario.nome_guerra}" /> 
					
					<span style="color:red"><form:errors path="nome_guerra"/></span>
			</div>

			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label for="login">Login:</label> <input type="text"
							placeholder="Digite o login para o acesso *" name="login"
							id="login" class="form-control" value="${usuario.login}" /> 
							<span style="color:red"><form:errors path="login"/></span>							
					</div>
				</div>

				<div class="col-md-6">
					<div class="form-group">
						<label for="senha">Senha:</label> <input type="password"
							placeholder="Digite a senha de acesso *" name="senha"
							id="senha" class="form-control" /> 
							<span style="color:red"><form:errors path="senha"/></span>
					</div>
				</div>
			</div>

			<br>
			<button id="botao-envia" type="submit" class="btn btn-primary btn-sm"
				disabled="true">
				<span class="glyphicon glyphicon-ok" aria-hidden="true"
					style="color: #5cb85c"></span> &nbsp Cadastrar
			</button>

			<button
				onclick="location.href='<c:url value='/usuario/'/>'"
				type="button" class="btn btn-default btn-sm pull-right">
				<span class="glyphicon glyphicon-share-alt" aria-hidden="true"
					style="color: #d9534f"></span> &nbspVoltar
			</button>

		</form:form>

	</div>
</div>


<%@ include file="/footer.jsp"%>

<script>
	$(document).ready(
			function() {
				var urlListaJson = "<c:url value='/perfil/listaPerfil/'/>"
				$("#aguarde").show();
				$.ajax({
					type : "GET",
					url : urlListaJson,
					contentType : "application/json",
					dataType : "json",
					success : function(dados) {
						console.log(dados);
						Objeto = dados;
						for (var i = 0; i < dados.length; i++) {
							linha = "<option id='"+dados[i][0]+"'>"
									+ dados[i][1] + "</option>"
							$("#perfil").append(linha);
						}
					},
					error : function(erro) {
						console.log(erro);
					},
					complete : function(dados) {
						$("#aguarde").hide();
					}
				})
			})

	$("#perfil").on("change", function() {
		$("#botao-envia").attr("disabled", false)
		
		var idMorador = $("#perfil option:selected")[0].id;
		for (var i = 0; i < Objeto.length; i++) {
			if (Objeto[i][0] == idMorador) {
				$("#nome").val(Objeto[i][1]);
				$("#perfil-id").val(Objeto[i][0]) 
			}
		}
	})
</script>