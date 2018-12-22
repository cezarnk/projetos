<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="aviso"%>

<c:import url="/WEB-INF/jsp/header.jsp"></c:import>


<h2>
	Cadastro de Usuário <small>Criação do perfil de
		usuário</small>
</h2>
<hr>
<br>



<div class="row">
	<div class="col-md-8">




		<form action="${linkTo[PerfilController].adiciona(null) }"
			method="POST">

		<c:if test="${not empty perfil.cadastrado_em}">
			<span>Atualizado em:&nbsp <span data-mask="0000/00/00 00:00:00">${perfil.cadastrado_em} </span></span><br><br>
		</c:if>

			<input type="hidden" name="perfil.id" value="${perfil.id}" />
			<div class="row">
				<div class="col-md-7">
					<div class="form-group">
						<label for="nome">Nome:</label> <input type="text"
							placeholder="Digite o nome do usuario *" name="perfil.nome"
							id="nome" class="form-control" value="${perfil.nome}" />
						<aviso:validationMessage name="perfil.nome"></aviso:validationMessage>
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
			
				<div class="col-md-4">
					<div class="form-group">
						<label for="cpf">Data de Nascimento:</label> <input type="text"
							placeholder="Digite a data de nascimento *" name="perfil.data_nascimento"
							id="data_nascimento" class="form-control" value="${perfil.data_nascimento}" />
						<aviso:validationMessage name="perfil.data_nascimento"></aviso:validationMessage>
					</div>
				</div>
			
			<div class="col-md-3">
					<div class="form-group">
						<label>Estado Civil:</label> <select class="form-control"
							id="estado_civil" value="${perfil.estado_civil}"
							name="perfil.estado_civil">
							<option disabled="true" selected>Selecione</option>
							<option>Casado</option>
							<option>Divorciado</option>
							<option>Solteiro</option>
							<option>União Estável</option>
							<option>Viúvo</option>
						</select>
						<aviso:validationMessage name="perfil.estado_civil"></aviso:validationMessage>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label>Quant. de Filhos:</label> <select class="form-control"
							id="qnt_filhos" value="${perfil.qnt_filhos}"
							name="perfil.qnt_filhos">
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
						<label>Qnt. de Moradores:</label> <select class="form-control"
							id="qnt_moradores" value="${perfil.qnt_moradores}"
							name="perfil.qnt_moradores">
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
						<label>Andar Ocupado:</label> <select class="form-control"
							id="andar_ocupado" value="${perfil.andar_ocupado}"
							name="perfil.andar_ocupado">
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
				
				<div class="col-md-5 col-md-offset-1	">	
				<label>Escolha o perfil do usuário:</label><br>
					<label class="tgl"
						style="font-size: 14px;"> <input
						type="checkbox" checked id="check-administrador" /> <span
						data-on="Síndico" data-off="Morador"></span>
					</label> <input type="hidden" id="administrador"
						name="perfil.administrador" value="true"/>
				</div>
				
			</div>

			

			<br>
			<div class="row">
			<div class="col-md-12">
			<button type="submit" class="btn btn-primary btn-sm">
				<span class="glyphicon glyphicon-ok" aria-hidden="true"
					style="color: #5cb85c"></span> &nbsp Cadastrar
			</button>

			<button onclick="location.href='${linkTo[PerfilController].lista()}'"
				type="button" class="btn btn-default btn-sm pull-right">
				<span class="glyphicon glyphicon-share-alt" aria-hidden="true"
					style="color: #d9534f"></span> &nbspVoltar
			</button>
			</div>
			</div>

		</form>



	</div>
</div>


<c:import url="/WEB-INF/jsp/footer.jsp"></c:import>

<script src="<c:url value='/js/jquery.mask.min.js'/>"></script>
<script>

	$(document).ready(function(){
	  $('#data_nascimento').mask('00/00/0000');
	  $('#telefone').mask('(00) 0000-0000');
	  $('#cpf').mask('000.000.000-00', {reverse: true});
	});

	$("#check-administrador").on('change', function(e) {
		if ($("#check-administrador").is(":checked") == true) {
			$('#administrador').val("true");
		} else {
			$('#administrador').val("false");
		}
	});
	
	$("#estado_civil").val("${perfil.estado_civil}")
	$("#qnt_filhos").val("${perfil.qnt_filhos}");
	$("#qnt_moradores").val("${perfil.qnt_moradores}")
	$("#andar_ocupado").val("${perfil.andar_ocupado}")
</script>