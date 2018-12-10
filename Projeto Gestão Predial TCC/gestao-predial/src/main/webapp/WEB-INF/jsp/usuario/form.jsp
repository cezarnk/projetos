<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir = "/WEB-INF/tags" prefix="alura" %>

<c:import url="/WEB-INF/jsp/header.jsp"></c:import>

<h2>Cadastrar Usu�rio
<small>Cria��o de login e senha para usu�ios acessarem o sistema</small>
</h2>
<hr>
<br>

<div class="row">
<div class="col-md-6">


<form action="${linkTo[UsuarioController].adiciona(null) }" method="POST">
	<div class="form-group">
	<label for="nome">Nome:</label>
	<input type="text" placeholder="Digite o nome do usuario *" name="usuario.nome" id="nome" class="form-control" value="${usuario.nome}"/>
	<alura:validationMessage name="usuario.nome"></alura:validationMessage>
	</div>
	
	<div class="form-group">
	<label for="email">Email:</label>
	<input type="email" placeholder="Digite o email para contato *" name="usuario.email" id="email" class="form-control" value="${usuario.email}"/>
	<alura:validationMessage name="usuario.email"></alura:validationMessage>
	</div>
	
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
	<label for="login">Login:</label>
	<input type="text" placeholder="Digite o login para o acesso *" name="usuario.login" id="login" class="form-control" value="${usuario.login}"/>
	<alura:validationMessage name="usuario.login"></alura:validationMessage>
	</div>
	</div>

	<div class="col-md-6">
	<div class="form-group">
	<label for="senha">Senha:</label>
	<input type="password" placeholder="Digite a senha de acesso *" name="usuario.senha" id="senha" class="form-control"/>
	<alura:validationMessage name="usuario.senha"></alura:validationMessage>
	</div>
	</div>
	</div>
	
	<br>
	<button type="submit" class="btn btn-primary btn-sm">
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