<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="/header.jsp"%>
<link href="<c:url value='/resources/css/site.css'/>" rel="stylesheet" />

<link
	href="<c:url value='/resources/css/dataTables.bootstrap.min.css'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/datatables.min.css'/>"
	rel="stylesheet" />


<h2>
	Lista de Usuários<small> Perfil dos ocupantes do prédio</small>
</h2>
<hr>
<br>


<div class="row">
	<div class="col-md-10">
		<table class="table table-hover table-striped table-bordered"
			id="tabela-usuario">
			<thead>
				<tr>
					<th>Id</th>
					<th>Nome</th>
					<th>CPF</th>
					<th>Data Nascimento</th>
					<th>Estado Civil</th>
					<th>Andar Ocupado</th>
					<th width="30px"></th>
					<th width="30px"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${Perfil}" var="perfil">
					<c:url var="url" value="/perfil/${perfil.id}" />
					<tr>
						<td>${perfil.id}</td>
						<td>${perfil.nome}</td>
						<td>${perfil.cpf}</td>
						<td>${perfil.data_nascimento}</td>
						<td>${perfil.estado_civil}</td>
						<td>${perfil.andar_ocupado}</td>
						<td>
							<button type="button" class="btn btn-default btn-xs"
								onclick=location.href="<c:url value='/perfil/edita?perfil.id=${perfil.id}'/>">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"
									style="color: gray"></span> &nbsp
							</button>
						</td>
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
	</div>
</div>

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


<c:if test="${not empty mensagem }">
	<script>
	mensagemAlerta("${mensagem}","alert-success");
</script>
</c:if>



<%@ include file="/footer.jsp"%>