<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="aviso"%>

<c:import url="/WEB-INF/jsp/header.jsp"></c:import>
<link href="<c:url value='/css/site.css'/>" rel="stylesheet" />

<h2>
	Cadastro de Dados de Usuário <small>Criação do perfil de usuário</small>
</h2>
<hr>
<br>



<div class="row">
	<div class="col-md-8">


		<form action="${linkTo[PerfilController].adiciona(null) }"
			method="POST">

			<div class="row">
				<div class="col-md-7">
					<span>Escolha o perfil do usuário:</span>
					<label class="tgl" style="font-size: 14px;margin-left:10px;">						 
						<input type="checkbox" checked />
						<span data-on="Administrador" data-off="Morador"></span>
					</label>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-md-7">
					<div class="form-group">
						<label for="nome">Nome:</label> <input type="text"
							placeholder="Digite o nome do usuario *" name="perfil.nome"
							id="nome" class="form-control" value="${perfil.nome}" />
						<aviso:validationMessage name="usuario.nome"></aviso:validationMessage>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="cpf">CPF:</label> <input type="text"
							placeholder="Digite o CPF do usuario *" name="perfil.cpf"
							id="cpf" class="form-control" value="${perfil.cpf}" />
						<aviso:validationMessage name="perfil.cpf"></aviso:validationMessage>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-7">
					<div class="form-group">
						<label for="email">Email:</label> <input type="email"
							placeholder="Digite o email para contato *" name="perfil.email"
							id="email" class="form-control" value="${perfil.email}" />
						<aviso:validationMessage name="perfil.email"></aviso:validationMessage>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="telefone">Telefone:</label> <input type="text"
							placeholder="Digite o nome do telefone *" name="perfil.telefone"
							id="telefone" class="form-control" value="${perfil.telefone}" />
						<aviso:validationMessage name="perfil.telefone"></aviso:validationMessage>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-3">
					<div class="form-group">
						<label>Estado Civil:</label> 
						<select class="form-control" id="estado_civil" value="${perfil.estado_civil}" name="perfil.estado_civil">
							<option disabled="true" selected>Selecione</option>
							<option>Casado</option>
							<option>Divorciado</option>
							<option>Solteiro</option>
							<option>União Estável</option>
						</select>
						<aviso:validationMessage name="perfil.estado_civil"></aviso:validationMessage>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label>Quantidade Filhos:</label> 
						<select class="form-control" id="qnt_filhos" value="${perfil.qnt_filhos}" name="perfil.qnt_filhos">
							<option disabled="true" selected>Selecione</option>
							<option value="0">Não possui</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">Mais de 3</option>
						</select>
						<aviso:validationMessage name="perfil.qnt_filhos"></aviso:validationMessage>
					</div>
				</div>

				<div class="col-md-3">
					<div class="form-group">
						<label>Quantidade Moradores:</label> 
						<select class="form-control" id="qnt_moradores" value="${perfil.qnt_moradores}" name="perfil.moradores">							
							<option disabled="true" selected>Selecione</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">Mais de 3</option>
						</select>
						<aviso:validationMessage name="perfil.qnt_moradores"></aviso:validationMessage>
					</div>
				</div>
			
				<div class="col-md-3">
					<div class="form-group">
						<label>Andar Ocupado:</label> 
						<select class="form-control" id="andar_ocupado" value="${perfil.andar_ocupado}" name="perfil.andar_ocupado">							
							<option disabled="true" selected>Selecione</option>
							<option value="1">1º andar</option>
							<option value="2">2º andar</option>
							<option value="3">3º andar</option>
							<option value="4">4º andar</option>
							<option value="5">5º andar</option>
							<option value="6">6º andar</option>
							<option value="7">7º andar</option>
							<option value="8">8º andar</option>
							<option value="9">9º andar</option>
						</select>
						<aviso:validationMessage name="perfil.andar_ocupado"></aviso:validationMessage>
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