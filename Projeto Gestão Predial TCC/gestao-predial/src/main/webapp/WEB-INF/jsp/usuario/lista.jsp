<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/header.jsp" />

<h2>
	Controle de Acesso <small>Gerenciamento de login e senha dos
		usuários do sistema</small>
</h2>
<hr>
<br>


<button class="btn btn-primary btn-sm"
	onclick="location.href='${linkTo[UsuarioController].form()}'">
	<span class="glyphicon glyphicon-plus" aria-hidden="true"
		style="color: #5cb85c"></span> &nbsp Criar Novo Usuário
</button>
<br>
<br>

<span>Lista dos usuários cadastrados:</span>
<br>
<div class="row">
	<div class="col-md-10">
		<table class="table table-hover table-striped table-bordered">
			<thead>
				<tr>
					<th>Id</th>
					<th>Nome</th>
					<th>E-mail</th>
					<th>Login</th>
					<th width="30px"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${usuarios}" var="usuario">
					<tr>
						<td>${usuario.id}</td>
						<td>${usuario.nome}</td>
						<td>${usuario.email}</td>
						<td>${usuario.login}</td>
						<td>
							<button type="button" class="btn btn-default btn-xs"
								onclick=location.href="<c:url value='/usuario/remove?usuario.id=${usuario.id}'/>">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"
									style="color: #d9534f"></span> &nbsp
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<c:if test="${not empty mensagem }">
	<script>

mensagemAlerta("${mensagem}","alert-success");

</script>
</c:if>

<c:import url="/WEB-INF/jsp/footer.jsp" />