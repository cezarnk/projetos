<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">



<title>Principal</title>
</head>
<body>

	<style>
.titulo-noticia {
	color: #013774
}
</style>



	<%@ include file="/header.jsp"%>


	<h2>Sistema de Gerenciamento Predial [vers�o: 0.0.1]</h2>
	<hr>
	<br>

	<div class="row">
		<div class="col-md-10">

			<p>� com muita satisfa��o que o recebemos em nosso condom�nio.
				Seja bem-vindo ${usuarioLogado.nome}!</p>
			<p>A solu��o de Automa��o e Gest�o Predial oferece a
				flexibilidade e conectividade que voc� precisa para planejar e
				manter sua infraestrutura.</p>
		</div>
	</div>
	<br>

	<div class="row">
		<div class="col-md-3">
			<h3 class="titulo-noticia">Not�cias</h3>
			<div class="thumbnail">
				<img src="<c:url value='/resources/img/noticia1.png'/>" width="100%"
					alt="Aluguel">
				<div class="caption">
					<h3>Seu Dinheiro!</h3>
					<p>Pre�o do aluguel tem queda real de 0,68% no 2� semestre</p>
					<small style="color: gray"> <span
						class="glyphicon glyphicon-time" aria-hidden="true"></span> &nbsp
						17 nov 2018
					</small>
				</div>
			</div>
		</div>

		<div class="col-md-3">
			<h3 class="titulo-noticia">Comunicado</h3>
			<div class="list-group">
				<a tabindex="0" class="list-group-item">
					<h4 class="list-group-item-heading">Assembleia Geral</h4>
					<p class="list-group-item-text">
						Marcado para o dia 10/01/2019. <br> Participe da assembleia,
						voc� tem voz sobre as decis�es e tamb�m evita que elas sejam
						tomadas por um pequeno grupo de moradores.
					</p>
				</a> <a tabindex="0" class="list-group-item">
					<h4 class="list-group-item-heading">Inadimpl�ncia</h4>
					<p class="list-group-item-text">O pagamento em dia das quotas
						condominiais � imprescind�vel para conseguirmos manter a boa
						qualidade de vida em nosso condom�nio e essencial para evitar
						poss�veis aumentos de taxas.</p>
				</a> <a tabindex="0" class="list-group-item">
					<h4 class="list-group-item-heading">Seguran�a</h4>
					<p class="list-group-item-text">Segundo dados da Pol�cia, 70%
						das invas�es a condom�nios ocorrem por descuido dos pr�prios
						moradores. Por isso, ressaltamos que de nada adiantam nossos
						sistemas de seguran�a sem a colabora��o de todos os moradores.</p>
				</a>
			</div>

		</div>

		<div class="col-md-3">
			<h3 class="titulo-noticia">Atendimento</h3>

			<p>Para registro de ocorr�ncia de manuten��o e/ou reclama��es,
				utilize este canal de atendimento.</p>
			<img src="<c:url value='/resources/img/manutencao1.png'/>" width="100%"
				alt="Aluguel"> <br>
			<br>
			<button type="button" class="btn btn-primary btn-sm"
				onclick="location.href='<c:url value='/demanda/form'/>'">
				<span class="glyphicon glyphicon-share-alt" style="color: #5cb85c"
					aria-hidden="true"></span> &nbsp Acessar tela de cadastro
			</button>

			<br>
			<br>
			<hr>

			<b>Regulamento Interno</b><br>
			<p>Aqui � onde est�o as regras do nosso condom�nio. � muito
				importante que voc� tome conhecimento delas para que todos em sua
				unidade saibam seus direitos e deveres a fim de manter a ordem no
				condom�nio.</p>

			<button type="button" class="btn btn-primary btn-sm"
				onclick="location.href='<c:url value='/resources/fonts/modelo_regimento_interno.doc'/>'">
				<span class="glyphicon glyphicon-save" style="color: #5cb85c"
					aria-hidden="true"></span> &nbsp Acessar arquivo
			</button>


		</div>
	</div>

	<%@ include file="/footer.jsp"%>

</body>
</html>