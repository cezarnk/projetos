<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%@ include file="/header.jsp"%>

<h2>
	Cadastro de Usu�rio <small>Atualiza��o do perfil de usu�rio</small>
</h2>
<hr>
<br>



<div class="row">
	<div class="col-md-8">

 <c:url var="url" value="/perfil/${perfil.id}" />
    <form:form action="${url}" method="PUT" modelAttribute="Perfil">
		

			<c:if test="${not empty Perfil.cadastrado_em}">
				<span>Atualizado em:&nbsp <span
					data-mask="0000/00/00 00:00:00">${Perfil.cadastrado_em} </span></span>
				<br>
				<br>
			</c:if>

			<!-- <input type="hidden" name="id" value=2 />  -->
			<div class="row">
				<div class="col-md-7">
					<div class="form-group">
						<label for="nome">Nome:</label> <input type="text"
							placeholder="Digite o nome do usuario *" name="nome"
							id="nome" class="form-control" value="${Perfil.nome}" /> 
							<span style="color: red" class="error">${errors.from('perfil.nome')}</span>							
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="cpf">CPF:</label> <input type="text"
							placeholder="Digite o CPF do usuario *" name="cpf"
							id="cpf" class="form-control" value="${Perfil.cpf}" /> <span
							style="color: red" class="error">${errors.from('perfil.cpf')}</span>
					</div>
				</div>
			</div>

			<div class="row">

				<div class="col-md-4">
					<div class="form-group">
						<label for="cpf">Data de Nascimento:</label> <input type="text"
							placeholder="Digite a data de nascimento *"
							name="data_nascimento" id="data_nascimento"
							class="form-control" value="${Perfil.data_nascimento}" />
					</div>
				</div>

				<div class="col-md-3">
					<div class="form-group">
						<label>Estado Civil:</label> <select class="form-control"
							id="estado_civil" value="${Perfil.estado_civil}"
							name="estado_civil">
							<option disabled="true" selected>Selecione</option>
							<option>Casado</option>
							<option>Divorciado</option>
							<option>Solteiro</option>
							<option>Uni�o Est�vel</option>
							<option>Vi�vo</option>
						</select> <span style="color: red" class="error">${errors.from('perfil.estado_civil')}</span>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label>Quant. de Filhos:</label> <select class="form-control"
							id="qnt_filhos" value="${Perfil.qnt_filhos}"
							name="qnt_filhos">
							<option disabled="true" selected>Selecione</option>
							<option value="0">N�o possui</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">Mais de 3</option>
						</select> <span style="color: red" class="error">${errors.from('perfil.qnt_filhos')}</span>
					</div>
				</div>

			</div>



			<div class="row">
				<div class="col-md-7">
					<div class="form-group">
						<label for="email">Email:</label> <input type="email"
							placeholder="Digite o email para contato *" name="email"
							id="email" class="form-control" value="${Perfil.email}" />
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label for="telefone">Telefone:</label> <input type="text"
							placeholder="Digite o nome do telefone *" name="telefone"
							id="telefone" class="form-control" value="${Perfil.telefone}" />
						<span style="color: red" class="error">${errors.from('perfil.telefone')}</span>
					</div>
				</div>
			</div>

			<div class="row">


				<div class="col-md-3">
					<div class="form-group">
						<label>Qnt. de Moradores:</label> <select class="form-control"
							id="qnt_moradores" value="${Perfil.qnt_moradores}"
							name="qnt_moradores">
							<option disabled="true" selected>Selecione</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">Mais de 3</option>
						</select> <span style="color: red" class="error">${errors.from('perfil.qnt_moradores')}</span>
					</div>
				</div>

				<div class="col-md-3">
					<div class="form-group">
						<label>Andar Ocupado:</label> <select class="form-control"
							id="andar_ocupado" value="${Perfil.andar_ocupado}"
							name="andar_ocupado">
							<option disabled="true" selected>Selecione</option>
							<option value="1">1� andar</option>
							<option value="2">2� andar</option>
							<option value="3">3� andar</option>
							<option value="4">4� andar</option>
							<option value="5">5� andar</option>
							<option value="6">6� andar</option>
							<option value="7">7� andar</option>
							<option value="8">8� andar</option>
							<option value="9">9� andar</option>
						</select> <span style="color: red" class="error">${errors.from('perfil.andar_ocupado')}</span>
					</div>
				</div>

				<div class="col-md-5 col-md-offset-1	">
					<label>Escolha o perfil do usu�rio:</label><br> <label
						class="tgl" style="font-size: 14px;"> <input
						type="checkbox" checked id="check-administrador" /> <span
						data-on="S�ndico" data-off="Morador"></span>
					</label> <input type="hidden" id="administrador"
						name="administrador" value="true" />
				</div>

			</div>



			<br>
			<div class="row">
				<div class="col-md-12">
					<button type="submit" class="btn btn-primary btn-sm">
						<span class="glyphicon glyphicon-ok" aria-hidden="true"
							style="color: #5cb85c"></span> &nbsp Atualizar
					</button>

					<button
						type="submit" class="btn btn-default btn-sm pull-right">
						<span class="glyphicon glyphicon-share-alt" aria-hidden="true"
							style="color: #d9534f"></span> &nbspVoltar
					</button>

				</div>
			</div>
			<form:hidden path="id"/>
		</form:form>



	</div>
</div>


<%@ include file="/footer.jsp"%>


<script src="<c:url value='/resources/js/jquery.mask.min.js'/>"></script>
<script>
	$(document).ready(function() {
		$('#data_nascimento').mask('00/00/0000');
		$('#telefone').mask('(00) 0000-0000');
		$('#cpf').mask('000.000.000-00', {
			reverse : true
		});
	});

	$("#check-administrador").on('change', function(e) {
		if ($("#check-administrador").is(":checked") == true) {
			$('#administrador').val("true");
		} else {
			$('#administrador').val("false");
		}
	});

	$("#estado_civil").val("${Perfil.estado_civil}")
	$("#qnt_filhos").val("${Perfil.qnt_filhos}");
	$("#qnt_moradores").val("${Perfil.qnt_moradores}")
	$("#andar_ocupado").val("${Perfil.andar_ocupado}")
	if ("${Perfil.administrador}" == "false") {
		$("#check-administrador").prop("checked", false)
	} else {
		$("#check-administrador").prop("checked", true)
	}
</script>