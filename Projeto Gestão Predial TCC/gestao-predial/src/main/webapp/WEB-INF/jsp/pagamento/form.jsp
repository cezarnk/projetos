<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="aviso"%>

<c:import url="/WEB-INF/jsp/header.jsp"></c:import>
<link href="<c:url value='/css/bootstrap-datepicker3.min.css'/>" rel="stylesheet" />

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
	Registro de Pagamento <small>Mensalidade de aluguel</small>
</h2>
<hr>
<br>

<div class="row">
	<div class="col-md-9">

		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label>Escolha o morador que está efetuando o pagamento:</label> 
					<select class="form-control" id="morador">
						<option disabled="true" selected>Selecione</option>
					</select>
				</div>
			</div>
			<div class="col-md-1">
			<br>
			<img src="<c:url value='/img/espera.gif'/>" width="80px" style="display:none" id="aguarde"/>
			</div>
		</div>

		<form action="${linkTo[PagamentoController].adiciona(pagamento) }"
			method="POST">

		<input type="hidden" name="pagamento.chave_estrangeira" id="perfil-id" />
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="col-md-6">
								<div class="row">
									<div class="col-md-6">
									Data de Vencimento: &nbsp
									</div>
									<div class="col-md-6">
									<div class="input-group">
									<input type='text' class="caixa form-control" name="pagamento.data_vencimento" style="height: 30px" id="data-vencimento" aria-describedby="basic-addon2"/>
									<span class="glyphicon glyphicon-calendar input-group-addon" id="basic-addon2"></span>
									</div>							
									</div>
								</div><br>
								<div class="row">
								<div class="col-md-2">
								Nome: &nbsp
								</div>
								<div class="col-md-10">
								<input type='text' class="caixa" style="height: 30px" id="nome" readonly="readonly"/>
								</div>
								</div><br>
								<div class="row">
								<div class="col-md-2">
								CPF: &nbsp
								</div>
								<div class="col-md-10">
								<input type='text' class="caixa" style="height: 30px" id="cpf" readonly="readonly"/>
								</div>
								</div><br>
								<div class="row">
								<div class="col-md-6">
								Data do Pagamento: &nbsp
								</div>
								<div class="col-md-6">
								<div class="input-group">
									<input type='text' class="caixa form-control" name="pagamento.data_pagamento" style="height: 30px" id="data-pagamento" aria-describedby="basic-addon3"/>
									<span class="glyphicon glyphicon-calendar input-group-addon" id="basic-addon3"></span>
								</div>
								</div>
								</div>
							</div>
							
							
							<div class="col-md-6" id="coluna-soma">
								<div class="row">
								<div class="col-md-6">
								Valor da Mensalidade: &nbsp
								</div>
								<div class="col-md-1">
								R$
								</div>
								<div class="col-md-5">
								<input type='text' class="caixa" name="pagamento.valor" style="height: 30px" id="valor-mensalidade"/>
								</div>
								</div><br>
								
								<div class="row">
								<div class="col-md-6">
								Condomínio: &nbsp
								</div>
								<div class="col-md-1">
								R$
								</div>
								<div class="col-md-5">
								<input type='text' class="caixa" name="pagamento.condominio" style="height: 30px" id="condominio"/>
								</div>
								</div><br>
								<div class="row">
								<div class="col-md-6">
								Multa: &nbsp
								</div>
								<div class="col-md-1">
								R$
								</div>
								<div class="col-md-5">
								<input type='text' class="caixa" name="pagamento.multa" style="height: 30px" id="multa"/>
								</div>
								</div><br>
								<div class="row">
								<div class="col-md-6">
								Desconto: &nbsp
								</div>
								<div class="col-md-1">
								R$
								</div>
								<div class="col-md-5">
								<input type='text' class="caixa" name="pagamento.desconto" style="height: 30px" id="desconto"/>
								</div>
								</div>
							</div>
						</div>
					</div>


				</div>
			</div>
			
			<div class="row">
				<div class="col-md-6">
					<button id="btn-envia" type="submit" class="btn btn-primary btn-sm" style="margin-top: 12px" disabled="true">
					<span class="glyphicon glyphicon-ok" aria-hidden="true"
					style="color: #5cb85c"></span> &nbsp Registrar
					</button>
				</div>
				
				<div class="col-md-6">
				<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-12">
							<div class="row">
							<div class="col-md-6">
							Valor Total: &nbsp
							</div>
							<div class="col-md-1">
							R$
							</div>
							<div class="col-md-5">
							<input type='text' class="caixa" name="pagamento.valor_total" style="height: 30px" id="valor-total"/>
							</div>
							</div>
						</div>
						</div>
					</div>
				</div>
			</div>
				
		</form>
	</div>
</div>
												

<c:import url="/WEB-INF/jsp/footer.jsp"></c:import>

<script src="<c:url value='/js/bootstrap-datepicker.js'/>"></script>
<script src="<c:url value='/js/bootstrap-datepicker.pt-BR.min.js'/>"></script>
<script src="<c:url value='/js/jquery.mask.min.js'/>"></script>

<script>
$('#data-vencimento').datepicker({
	format: 'dd/mm/yyyy',
    language: 'pt-BR',
    orientation: 'bottom',
    startDate: '10/10/2018'
});

$('#data-pagamento').datepicker({
	format: 'dd/mm/yyyy',
    language: 'pt-BR',
    orientation: 'bottom',
    setDate: "getDate()"
});

$("#coluna-soma").on("change",function(){
	
	if($('#valor-mensalidade').val() == ""){
		var mensalidade = 0.0
	}else{
		var mensalidade = parseFloat($('#valor-mensalidade').val().replace(".","").replace(",", "."));	
	}
	if($('#condominio').val() == ""){
		var condominio = 0.0
	}else{
		var condominio = parseFloat($('#condominio').val().replace(".","").replace(",", "."));	
	}
	if($('#multa').val() == ""){
		var multa = 0.0
	}else{
		var multa = parseFloat($('#multa').val().replace(".","").replace(",", "."));	
	}
	if($('#desconto').val() == ""){
		var desconto = 0.0
	}else{
		var desconto = parseFloat($('#desconto').val().replace(".","").replace(",", "."));	
	}	
	
	var valorTotal = mensalidade+condominio+multa-desconto;
	
	var valorString = String(valorTotal)
	if(valorString.indexOf(".") != -1 ){
		var valorTotal = valorString.replace(".",",");
	}
	
	$('#valor-total').val(valorTotal);
})

var Objeto;	

$(document).ready(function(){
$('#valor-mensalidade').mask('000.000.000.000.000,00', {reverse: true});
$('#condominio').mask('000.000.000.000.000,00', {reverse: true});
$('#multa').mask('000.000.000.000.000,00', {reverse: true});
$('#desconto').mask('000.000.000.000.000,00', {reverse: true});
$('#valor-total').mask('000.000.000.000.000,00', {reverse: true});



$('#data-vencimento').datepicker('update', '10/12/2018');
$('#data-pagamento').datepicker('update', 'new Date()');
	
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
			$("#morador").append(linha);
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

$("#morador").on("change",function(){
	$("#btn-envia").attr("disabled",false)
	var idMorador = $("#morador option:selected")[0].id;
	for (var i=0;i<Objeto.list.length;i++){
		if(Objeto.list[i].id == idMorador){
			$("#nome").val(Objeto.list[i].nome);
			$("#cpf").val(Objeto.list[i].cpf);
			$("#perfil-id").val(Objeto.list[i].id)
		}
	}
})


</script>