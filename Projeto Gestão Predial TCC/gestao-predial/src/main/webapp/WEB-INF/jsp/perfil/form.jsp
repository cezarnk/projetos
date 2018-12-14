<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="aviso"%>

<c:import url="/WEB-INF/jsp/header.jsp"></c:import>
<link href="<c:url value='/css/site.css'/>" rel="stylesheet" />

<h2>
	Cadastrar Dados de Usuário <small>Criação do perfil do usuário</small>
</h2>
<hr>
<br>



<div class="row">
	<div class="col-md-8">


		<form action="${linkTo[UsuarioController].adiciona(null) }"
			method="POST">

			<div class="row">
				<div class="col-md-6">
					<span>Escolha o perfil do usuário:</span> <label class="tgl"
						style="font-size: 14px;"> <input type="checkbox" checked />
						<span data-on="Administrador" data-off="Morador"></span>
					</label>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-md-7">
					<div class="form-group">
						<label for="nome">Nome:</label> <input type="text"
							placeholder="Digite o nome do usuario *" name="usuario.nome"
							id="nome" class="form-control" value="${usuario.nome}" />
						<aviso:validationMessage name="usuario.nome"></aviso:validationMessage>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="nome">CPF:</label> <input type="text"
							placeholder="Digite o nome do usuario *" name="usuario.nome"
							id="nome" class="form-control" value="${usuario.nome}" />
						<aviso:validationMessage name="usuario.nome"></aviso:validationMessage>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-7">
					<div class="form-group">
						<label for="email">Email:</label> <input type="email"
							placeholder="Digite o email para contato *" name="usuario.email"
							id="email" class="form-control" value="${usuario.email}" />
						<aviso:validationMessage name="usuario.email"></aviso:validationMessage>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="nome">Telefone:</label> <input type="text"
							placeholder="Digite o nome do usuario *" name="usuario.nome"
							id="nome" class="form-control" value="${usuario.nome}" />
						<aviso:validationMessage name="usuario.nome"></aviso:validationMessage>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label>Estado Civil:</label> <select class="form-control">
							<option disabled="true" selected>Selecione</option>
							<option>Casado</option>
							<option>Divorciado</option>
							<option>Solteiro</option>
							<option>União Estável</option>
						</select>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label>Quantidade filhos:</label> <select class="form-control">
							<option disabled="true" selected>Selecione</option>
							<option>Não possui</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>Mais de 3</option>
						</select>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label>Quantidade Total de Moradores:</label> <select
							class="form-control">
							<option disabled="true" selected>Selecione</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>Mais de 3</option>
						</select>
					</div>
				</div>
			</div>



			<br>
			<button type="submit" class="btn btn-primary btn-sm">
				<span class="glyphicon glyphicon-ok" aria-hidden="true"
					style="color: #5cb85c"></span> &nbsp Cadastrar
			</button>

			<button
				onclick="location.href='${linkTo[UsuarioController].lista()}'"
				type="button" class="btn btn-default btn-sm pull-right">
				<span class="glyphicon glyphicon-share-alt" aria-hidden="true"
					style="color: #d9534f"></span> &nbspVoltar
			</button>

		</form>

	</div>
</div>


<c:import url="/WEB-INF/jsp/footer.jsp"></c:import>