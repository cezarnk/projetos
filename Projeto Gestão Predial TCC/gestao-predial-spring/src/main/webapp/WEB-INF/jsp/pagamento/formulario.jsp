<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@ include file="/header.jsp"%>

<link href="<c:url value='/resources/css/bootstrap-datepicker3.min.css'/>" rel="stylesheet" />

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
			<img src="<c:url value='/resources/img/espera.gif'/>" width="80px" style="display:none" id="aguarde"/>
			</div>
		</div>

		<c:url var="url" value="/pagamento" />
		<form:form action="${url}" method="POST" modelAttribute="Pagamento">

		<input type="hidden" name="perfilId" id="perfil-id" />
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
									<input type='text' class="caixa form-control" name="data_vencimento" style="height: 30px" id="data-vencimento" aria-describedby="basic-addon2"/>
									<span class="glyphicon glyphicon-calendar input-group-addon" id="basic-addon2"></span>
									</div>	
									<span style="color:red" class="error">${errors.from('pagamento.data_vencimento')}</span>						
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
									<input type='text' class="caixa form-control" name="data_pagamento" style="height: 30px" id="data-pagamento" aria-describedby="basic-addon3"/>
									<span class="glyphicon glyphicon-calendar input-group-addon" id="basic-addon3"></span>
								</div>
								<span style="color:red" class="error">${errors.from('pagamento.data_pagamento')}</span>
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
								<input type='text' class="caixa" name="valor" style="height: 30px" id="valor-mensalidade"/>
								<span style="color:red" class="error">${errors.from('pagamento.valor')}</span>
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
								<input type='text' class="caixa" name="condominio" style="height: 30px" id="condominio"/>
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
								<input type='text' class="caixa" name="multa" style="height: 30px" id="multa"/>
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
								<input type='text' class="caixa" name="desconto" style="height: 30px" id="desconto"/>
								</div>
								</div>
							</div>
						</div>
					</div>


				</div>
			</div>
			
			<div class="row">
				<div class="col-md-6">
					<button id="btn-envia" disabled="true" type="submit" class="btn btn-primary btn-sm" style="margin-top: 12px" >
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
							<input type='text' class="caixa" name="valor_total" style="height: 30px" id="valor-total"/>
							<span style="color:red" class="error">${errors.from('pagamento.valor_total')}</span>
							</div>
							</div>
						</div>
						</div>
					</div>
				</div>
			</div>
				
		</form:form>
	</div>
</div>

<%@ include file="/footer.jsp"%>

<script src="<c:url value='/resources/js/bootstrap-datepicker.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap-datepicker.pt-BR.min.js'/>"></script>
<script src="<c:url value='/resources/js/jquery.mask.min.js'/>"></script>

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
	
var urlListaJson = "<c:url value='/perfil/listaPerfil/'/>"
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
        	linha = "<option id='"+dados[i][0]+"'>"+dados[i][1]+"</option>"	
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
	for (var i=0;i<Objeto.length;i++){
		if(Objeto[i][0] == idMorador){
			$("#nome").val(Objeto[i][1]);
			$("#cpf").val(Objeto[i][2]);
			$("#perfil-id").val(Objeto[i][0])
		}
	}
})


</script>