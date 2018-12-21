<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="aviso"%>

<c:import url="/WEB-INF/jsp/header.jsp"></c:import>

<style>

.caixa{
box-shadow: none;
border-style: none none solid none;
background-color: transparent; 
}

.caixa:focus{
border: 2px;
border-style: none none solid none; 
border-color: #b2b2b2; 
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
					<label>Escolha o morador que está efetuando o pagamento:</label> <select
						class="form-control" id="morador">
						<option disabled="true" selected>Selecione</option>
					</select>
				</div>
			</div>
		</div>

		<form action="${linkTo[PagamentoController].adiciona(null) }"
			method="POST">

			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="col-md-6">
								<div class="row">
									Data de Vencimento: &nbsp
									<input type='text' class="caixa" name="data_de_formalizacao" style="height: 30px" id="data-vencimento"/>
									<span class="glyphicon glyphicon-calendar"></span>
								</div><br>
								<div class="row">
								Nome: &nbsp
								<input type='text' class="caixa" name="data_de_formalizacao" style="height: 30px" id="nome"/>
								</div><br>
								<div class="row">
								CPF: &nbsp
								<input type='text' class="caixa" name="data_de_formalizacao" style="height: 30px" id="cpf"/>
								</div><br>
								<div class="row">
								Data do Pagamento: &nbsp
									<input type='text' class="caixa" name="data_de_formalizacao" style="height: 30px" id="data-pagamento"/>
									<span class="glyphicon glyphicon-calendar"></span>
								</div>
							</div>
							
							
							<div class="col-md-6">
								<div class="row">
								Valor da Mensalidade: &nbsp
								<input type='text' class="caixa" name="data_de_formalizacao" style="height: 30px" id="valor-mensalidade"/>
								</div><br>
								<div class="row">
								Condomínio: &nbsp
								<input type='text' class="caixa" name="data_de_formalizacao" style="height: 30px" id="condominio"/>
								</div><br>
								<div class="row">
								Multa: &nbsp
								<input type='text' class="caixa" name="data_de_formalizacao" style="height: 30px" id="multa"/>
								</div><br>
								<div class="row">
								Desconto: &nbsp
								<input type='text' class="caixa" name="data_de_formalizacao" style="height: 30px" id="desconto"/>
								</div>
							</div>
						</div>
					</div>


				</div>
			</div>
			
			<div class="row">
				<div class="col-md-6">
					<button type="submit" class="btn btn-primary btn-sm" style="margin-top: 12px">
					<span class="glyphicon glyphicon-ok" aria-hidden="true"
					style="color: #5cb85c"></span> &nbsp Registrar
					</button>
				</div>
				
				<div class="col-md-6">
				<div class="panel panel-default">
						<div class="panel-body">
						<div class="col-md-12">
							<div class="row">
							Valor Total: &nbsp
							<input type='text' class="caixa" name="data_de_formalizacao" style="height: 30px" id="valor-total"/>
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

<script src="<c:url value='/js/jquery.mask.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap-datepicker.js'/>"></script>
<script src="<c:url value='/js/bootstrap-datepicker.pt-BR.min.js'/>"></script>

<script>
$('#data-vencimento,#data-pagamento').datepicker({
	format: 'dd/mm/yyyy',
    language: 'pt-BR',
    orientation: "bottom"
});


</script>