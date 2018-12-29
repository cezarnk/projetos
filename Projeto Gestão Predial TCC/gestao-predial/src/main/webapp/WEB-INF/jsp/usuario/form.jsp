<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir = "/WEB-INF/tags" prefix="aviso" %>

<c:import url="/WEB-INF/jsp/index/header.jsp"></c:import>

<h2>Cadastro de Acesso
<small>Criação de login e senha para usuáios acessarem o sistema</small>
</h2>
<hr>
<br>

<div class="row">
<div class="col-md-6">

		<div class="row">
			<div class="col-md-9">
				<div class="form-group">
					<label>Escolha o morador que está efetuando o pagamento:</label> 
					<select class="form-control" id="perfil">
						<option disabled="true" selected>Selecione</option>
					</select>
				</div>
			</div>
			<div class="col-md-1">
			<br>
			<img src="<c:url value='/img/espera.gif'/>" width="80px" style="display:none" id="aguarde"/>
			</div>
		</div>


<form action="${linkTo[UsuarioController].adiciona(null) }" method="POST">
	
	<input type="hidden" name="usuario.chave_estrangeira" id="perfil-id" />
	<div class="form-group">
	<label for="nome">Nome:</label>
	<input type="text" readonly="readonly" placeholder="Digite o nome do usuario *" name="usuario.nome" id="nome" class="form-control" value="${usuario.nome}"/>
	<aviso:validationMessage name="usuario.nome"></aviso:validationMessage>
	</div>
	
	<div class="form-group">
	<label for="nome_guerra">Nome de Exibição <small>(máximo de 16 caracteres)</small>:</label>
	<input type="text" maxlength="16" placeholder="Digite o nome de exibição para contato *" name="usuario.nome_guerra" id="nome_guerra" class="form-control" value="${usuario.nome_guerra}"/>
	<aviso:validationMessage name="usuario.nome_guerra"></aviso:validationMessage>
	</div>
	
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
	<label for="login">Login:</label>
	<input type="text" placeholder="Digite o login para o acesso *" name="usuario.login" id="login" class="form-control" value="${usuario.login}"/>
	<aviso:validationMessage name="usuario.login"></aviso:validationMessage>
	</div>
	</div>

	<div class="col-md-6">
	<div class="form-group">
	<label for="senha">Senha:</label>
	<input type="password" placeholder="Digite a senha de acesso *" name="usuario.senha" id="senha" class="form-control"/>
	<aviso:validationMessage name="usuario.senha"></aviso:validationMessage>
	</div>
	</div>
	</div>
	
	<br>
	<button id="botao-envia" type="submit" class="btn btn-primary btn-sm" disabled="true">
	<span class="glyphicon glyphicon-ok" aria-hidden="true" style="color:#5cb85c"></span> &nbsp
	Cadastrar
	</button>
	
	<button onclick="location.href='${linkTo[UsuarioController].lista()}'" type="button" class="btn btn-default btn-sm pull-right">
	<span class="glyphicon glyphicon-share-alt" aria-hidden="true" style="color:#d9534f"></span> &nbspVoltar
	</button>
	
</form>

</div>
</div>
<c:import url="/WEB-INF/jsp/footer.jsp"></c:import>

<script>

$(document).ready(function(){
var urlListaJson = "${linkTo[PerfilController].listaJson()}"
	$("#aguarde").show();
	$.ajax({
	    type: "GET",
	    url: urlListaJson,     
	    contentType : "application/json",        
	    dataType: "json",        
	    success: function(dados){
	        console.log(dados);
	        Objeto = dados;
	        for (var i=0;i<dados.list.length;i++){
	        	linha = "<option id='"+dados.list[i].id+"'>"+dados.list[i].nome+"</option>"	
				$("#perfil").append(linha);
	        }
	    },
	    error: function(erro){
	        console.log(erro);
	    },
	    complete: function(dados){
	    	$("#aguarde").hide();
	    }
	    })
	})

	$("#perfil").on("change",function(){
		$("#botao-envia").attr("disabled",false)
		var idMorador = $("#perfil option:selected")[0].id;
		for (var i=0;i<Objeto.list.length;i++){
			if(Objeto.list[i].id == idMorador){
				$("#nome").val(Objeto.list[i].nome);
				$("#perfil-id").val(Objeto.list[i].id)
			}
		}
	})



</script>