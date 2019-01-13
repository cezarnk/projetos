<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@ include file="/header.jsp"%>

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
	Cadastro de Atendimento <small>Registro de ocorr�ncia de manuten��o e/ou reclama��o</small>
</h2>
<hr>
<br>


<div class="row">
	<div class="col-md-8">


<c:url var="url" value="/demanda" />
		<form:form action="${url}" method="POST" modelAttribute="Demanda">

		


	 	<input type="hidden" id="id-perfil" name="perfilId" value="${usuarioLogado.perfilId}"/> 
			<div class="row">
				<div class="col-md-7">
					<div class="form-group">
						<label for="nome">Nome:</label> <input type="text" name="nome"
							id="nome" class="form-control caixa" readonly="readonly" value="${usuarioLogado.nome}" />						
					</div>
				</div>

			</div>
			
			<div class="row">
			
			
			<div class="col-md-4">
					<div class="form-group">
						<label>Assunto:</label> <select class="form-control"
							id="demanda-assunto" value="${demanda.assunto}"
							name="assunto">
							<option disabled="true" selected>Selecione</option>
							<option>Manuten��o Civil</option>
							<option>Manuten��o Hidr�ulica</option>
							<option>Manuten��o El�trica</option>
							<option>Reclama��o</option>
							<option>Sugest�o</option>
						</select>
						<span style="color:red"><form:errors path="assunto"/></span>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label>Local/Andar:</label> <select class="form-control"
							id="demanda-local" value="${demanda.local}"
							name="local">
							<option disabled="true" selected>Selecione</option>
							<option value="0">T�rreo</option>
							<option value="1">1� andar</option>
							<option value="2">2� andar</option>
							<option value="3">3� andar</option>
							<option value="4">4� andar</option>
							<option value="5">5� andar</option>
							<option value="6">6� andar</option>
							<option value="7">7� andar</option>
							<option value="8">8� andar</option>
							<option value="9">9� andar</option>
						</select>
						<span style="color:red"><form:errors path="local"/></span>
					</div>
				</div>
			
			</div>

			<div class="row">
			<div class="col-md-9">
	    		 <div class="form-group">
				  <label for="comment">Descri��o:</label>
				  <textarea name="descricao" placeholder="Descreva sua solicita��o *" id="demanda-descricao" value="${demanda.descricao}" class="form-control" style="resize: vertical" rows="5" id="comment"></textarea>
				  <span style="color:red"><form:errors path="descricao"/></span>
				</div> 
			</div>
			</div>
			
			<div class="row">
			<div class="col-md-12">
			<button type="submit" class="btn btn-primary btn-sm">
				<span class="glyphicon glyphicon-ok" aria-hidden="true"
					style="color: #5cb85c"></span> &nbsp Cadastrar
			</button>
	
			</div>
			</div>

		</form:form>
		
	</div>
</div>


<%@ include file="/footer.jsp"%>

<script src="<c:url value='/resources/js/jquery.mask.min.js'/>"></script>
<script>

$(document).ready(function(){
	var id = $("#id-perfil").val()
	var urlConsultaJson = "<c:url value='/perfil/consulta/"+id+"'/>"
	console.log(urlConsultaJson);
	
	$.ajax({
	    type: "GET",
	    url: urlConsultaJson,     
	    contentType : "application/json",        
	    dataType: "json",        
	    success: function(dados){
	        console.log(dados);
	        
	    },
	    error: function(erro){
	        console.log(erro);
	    }
    })
})
	
</script>
