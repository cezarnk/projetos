<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="aviso"%>

<c:import url="/WEB-INF/jsp/index/header.jsp"></c:import>
<link href="<c:url value='/css/dataTblsboot.min.css'/>" rel="stylesheet" />

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
		
		<img src="<c:url value='/img/espera.gif'/>" width="80px" style="display:none" id="aguarde" class="text-center"/>
		
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




<script src="<c:url value='/js/jquery.mask.min.js'/>"></script>
<script src="<c:url value='/js/jquery.dataTables.min.js'/>"></script>
<script src="<c:url value='/js/dataTables.bootstrap.min.js'/>"></script>

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
	
	var botao = "<button type='button' class='btn btn-default btn-xs'"
	botao += " onclick=location.href='<c:url value='/demanda/remove?demanda.id="+id_demanda+"'/>'>"	
	botao += "<span class='glyphicon glyphicon-remove' aria-hidden='true' style='color: #d9534f'></span> &nbsp"		
	botao += "</button>"
	
	t.row.add([id_demanda,nome,local,assunto,cadastrado_em,telefone,botao]).draw(false);
	
}

function converteData(data){
	var dataConverte = data.substring(0,10);
	var data = dataConverte.split("-");
	var ano = data[0];
	var mes = data[1];
	var dia = data[2];
	
	return dia+"/"+mes+"/"+ano;
}

function carregarTabela(){
var urlListaJson = "${linkTo[DemandaController].listaDemandaJson()}"
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
	        	var id_demanda = dados.list[i][3].id
	        	var nome = dados.list[i][1];
	        	var telefone = dados.list[i][2];
	        	var local = dados.list[i][3].local;
	        	var cadastrado_em = dados.list[i][3].cadastrado_em;
	        	var assunto = dados.list[i][3].assunto;
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

</script>

<c:import url="/WEB-INF/jsp/footer.jsp"></c:import>