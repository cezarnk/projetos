<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@ include file="/header.jsp"%>

<link href="<c:url value='/resources/css/site.css'/>" rel="stylesheet" />

<link href="<c:url value='/resources/css/dataTblsboot.min.css'/>" rel="stylesheet" />


<h2>
	Lista de Pagamentos <small>Registro de todos pagamentos dos condominos </small>
</h2>
<hr>
<br>

<div class="row">
	<div class="col-md-10">
	<img src="<c:url value='/resources/img/espera.gif'/>" width="80px" style="display:none" id="aguarde" class="text-center"/>
		<table class="table table-hover table-striped table-bordered" id="tabela-pagamento">
			<thead>
				<tr>
					<th>Id</th>
					<th>Nome</th>
					<th>CPF</th>
					<th>Data Vencimento</th>
					<th>Data Pagamento</th>
					<th>Valor Total</th>
					<th width="30px"></th>
				</tr>
			</thead>
			<tbody id="tabela-pagamento">

			
			</tbody>
		</table>
	</div>
</div>

<script src="<c:url value='/resources/js/jquery.mask.min.js'/>"></script>
<script src="<c:url value='/resources/js/jquery.dataTables.min.js'/>"></script>
<script src="<c:url value='/resources/js/dataTables.bootstrap.min.js'/>"></script>

<script>

var t;

$(document).ready(function() {
	

     t = $('#tabela-pagamento').DataTable({
       destroy : true,
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
	
    carregarTabela();
});

var Objeto;

function linhaTabela(id,nome,cpf,data_vencimento,data_pagamento,valor_total) {
	
	var id_num = parseInt(id)
	
	var botao = "<button type='submit' class='btn btn-default btn-xs'"
	botao += "onclick=excluir("+id_num+") >"
	botao += "<span class='glyphicon glyphicon-remove' aria-hidden='true' style='color: #d9534f'></span> &nbsp"	
	botao += "</button>"		
	
	t.row.add([id,nome,cpf,data_vencimento,data_pagamento,valor_total,botao]).draw(false);
}

function converteData(datas){
	
	var data = datas.split("-");
	var ano = data[0];
	var mes = data[1];
	var dia = data[2];
	
	return dia+"/"+mes+"/"+ano;
}

function carregarTabela(){
var urlListaJson = "<c:url value='/pagamento/listajson'/>"
	$("#aguarde").show();
	$.ajax({
	    type: "GET",
	    url: urlListaJson,     
	    contentType : "application/json",        
	    dataType: "json",        
	    success: function(dados){
	        console.log(dados);
	        Objeto = dados;
	        
	        for (var i=0;i<dados.length;i++){
	        	var id_pagamento = dados[i][3].id
	        	var nome = dados[i][1];
	        	var cpf = dados[i][2];
	        	var data_vencimento = dados[i][3].data_vencimento;
	        	var data_pagamento = dados[i][3].data_pagamento;
	        	var valor_total = dados[i][3].valor_total;
	        	linhaTabela(id_pagamento,nome,cpf,converteData(data_vencimento),converteData(data_pagamento),valor_total);
	        }
	    },
	    error: function(erro){
	        console.log(erro);
	    },
	    complete: function(dados){
	    	$("#aguarde").hide();
	    }
	    })
}

function excluir(id) {		
	$.post("pagamento/removeConta", {'id' : id}, function() {
		 console.log("ola");
	}).always(function() {
		location.reload();
	});;
}

</script>

<c:if test="${not empty mensagem }">
<script>
	mensagemAlerta("${mensagem}","alert-success");
</script>
</c:if>

<%@ include file="/footer.jsp"%>