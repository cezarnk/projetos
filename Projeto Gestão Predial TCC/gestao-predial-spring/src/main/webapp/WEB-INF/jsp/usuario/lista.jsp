<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="/header.jsp"%>

<link
	href="<c:url value='/resources/css/dataTables.bootstrap.min.css'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/datatables.min.css'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/site.css'/>" rel="stylesheet" />

<h2>
	Controle de Acesso <small>Gerenciamento de login e senha dos
		usuários do sistema</small>
</h2>
<hr>
<br>

<button class="btn btn-primary btn-sm"
	onclick="location.href='<c:url value="/usuario/form"/>'" >
	<span class="glyphicon glyphicon-plus" aria-hidden="true"
		style="color:#5cb85c"></span> &nbsp Criar Novo Usuário
</button>
<br>
<br>


<div class="row">
	<div class="col-md-9">
	<c:if test="${not empty Usuario}">
		<table class="table table-hover table-striped table-bordered" id="tabela-login">
			<thead>
				<tr>
					<th>Id</th>
					<th>Nome</th>
					<th width="150px">Nome de Exibição</th>
					<th>Login</th>
					<th width="30px"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${Usuario}" var="usuario">
				<c:url var="url" value="/usuario/${usuario.id}" />
					<tr>
						<td>${usuario.id}</td>
						<td>${usuario.nome}</td>
						<td>${usuario.nome_guerra}</td>
						<td>${usuario.login}</td>
						<td>
							<form:form action="${url}" method="DELETE">
								<button type="submit" class="btn btn-default btn-xs"
									onclick=location.href="<c:url value="/resources/img/delete.png"/>" >
									<span class="glyphicon glyphicon-remove" aria-hidden="true"
										style="color: #d9534f"></span> &nbsp
								</button>
							</form:form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</c:if>
		<c:if test="${empty Usuario}">Não há usuários cadastrados.</c:if>
	</div>
</div>

<c:if test="${not empty mensagem }">
<script>
	mensagemAlerta("${mensagem}","alert-success")
</script>
</c:if>



<script src="<c:url value='/resources/js/jquery.dataTables.min.js'/>"></script>
<script src="<c:url value='/resources/js/dataTables.bootstrap.min.js'/>"></script>

<script>


$(document).ready(function() {
    $('#tabela-usuario').DataTable({
       "paging":   false,
	   "language":{
              search: "Pesquisar",
              "info": "Visualizar _START_ até _END_ total de _TOTAL_ demandas",
              "lengthMenu": "Visualizar: _MENU_ ",
              paginate: {
					   first:      "Primeiro",
					   previous:   "Voltar",
					   next:       "Próximo",
	  				   last:       "Último"
              },
              "sLengthMenu": "Mostrar _MENU_ registros por página",
              "sZeroRecords": "Nenhum registro encontrado",
              "sInfo": "Mostrando _START_ / _END_ de _TOTAL_ registro(s)",
              "sInfoEmpty": "Mostrando 0 / 0 de 0 registros",
              "infoFiltered":   "(filtro aplicado no universo de _MAX_ demanda(s))",
  	   }

    
    });
} );

</script>


<%@ include file="/footer.jsp"%>