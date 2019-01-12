<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@ include file="/header.jsp"%>

<link href="<c:url value='/resources/css/dataTblsboot.min.css'/>" rel="stylesheet" />

<style>

.caixa{
box-shadow: none;
border-style: none none solid none;
background-color: transparent; 
border-color: #b2b2b2; 
width: 100%
}

.caixa:focus{
border: 2px;
border-style: none none solid none; 
border-color: #013774; 
box-shadow: none;
background-color: transparent; 
}

.caixa:disabled{
background-color: #f2f2f2;    
}
</style>

<h2>
	Lista de Solicitações <small>Registro de ocorrência de manutenção e/ou reclamação</small>
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
					<th>Local</th>
					<th>Assunto</th>
					<th>Cadastrado em</th>
					<th>Telefone</th>
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
})

var Objeto;

function linhaTabela(id_demanda,nome,local,assunto,cadastrado_em,telefone) {
	
	var id_num = parseInt(id_demanda)
	
	var botao = "<button type='submit' class='btn btn-default btn-xs'"
		botao += "onclick=excluirDemanda("+id_num+") >"
		botao += "<span class='glyphicon glyphicon-remove' aria-hidden='true' style='color: #d9534f'></span> &nbsp"	
		botao += "</button>"
	
	t.row.add([id_demanda,nome,local,assunto,cadastrado_em,telefone,botao]).draw(false);
	
}

function converteData(datas){
	
	var data = datas.split("-");
	var ano = data[0];
	var mes = data[1];
	var dia = data[2];
	
	return dia+"/"+mes+"/"+ano;
}

function carregarTabela(){
var urlListaJson = "<c:url value='/demanda/listaDemandas/'/>"
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
	        	var id_demanda = dados[i][3].id
	        	var nome = dados[i][1];
	        	var telefone = dados[i][2];
	        	var local = dados[i][3].local;
	        	var cadastrado_em = dados[i][3].cadastrado_em;
	        	var assunto = dados[i][3].assunto;
	        	linhaTabela(id_demanda,nome,local,assunto,converteData(cadastrado_em),telefone);
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

function excluirDemanda(id) {		
	$.post("demanda/removeDemanda", {'id' : id}, function() {
		 console.log("ola");
	})
	.fail(function(response) {
		console.log("Erro:");
		console.log(response);
	})
	.always(function() {
		location.reload();
	});
	
}


</script>


<%@ include file="/footer.jsp"%>