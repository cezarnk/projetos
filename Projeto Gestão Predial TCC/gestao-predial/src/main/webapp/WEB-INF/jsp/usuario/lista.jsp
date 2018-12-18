<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/header.jsp" />

<link href="<c:url value='/css/dataTables.bootstrap.min.css'/>" rel="stylesheet" />
<link href="<c:url value='/css/datatables.min.css'/>" rel="stylesheet" />
<link href="<c:url value='/css/site.css'/>" rel="stylesheet" />

<h2>
	Controle de Acesso <small>Gerenciamento de login e senha dos
		usuários do sistema</small>
</h2>
<hr>
<br>



<button class="btn btn-primary btn-sm"
	onclick="location.href='${linkTo[UsuarioController].form()}'" >
	<span class="glyphicon glyphicon-plus" aria-hidden="true"
		style="color: #5cb85c"></span> &nbsp Criar Novo Usuário
</button>
<br>
<br>


<div class="row">
	<div class="col-md-10">
		<table class="table table-hover table-striped table-bordered" id="tabela-login">
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
	mensagemAlerta("${mensagem}","alert-success")
</script>
</c:if>

<c:import url="/WEB-INF/jsp/footer.jsp" />



<script src="<c:url value='/js/jquery.dataTables.min.js'/>"></script>
<script src="<c:url value='/js/dataTables.min.js'/>"></script>
<script>


$(document).ready(function() {
    $('#tabela-login').DataTable({
    	"paging":   false,
        "ordering": true,
        "info":     true,
    	
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
    
    $("#tabela-login_wrapper").css("margin-bottom","-50px")
		
	

    
} );

</script>
