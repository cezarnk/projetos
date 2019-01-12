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


	<h2>Sistema de Gerenciamento Predial [versão: 0.0.1]</h2>
	<hr>
	<br>

	<div class="row">
		<div class="col-md-10">

			<p>É com muita satisfação que o recebemos em nosso condomínio.
				Seja bem-vindo ${usuarioLogado.nome}!</p>
			<p>A solução de Automação e Gestão Predial oferece a
				flexibilidade e conectividade que você precisa para planejar e
				manter sua infraestrutura.</p>
		</div>
	</div>
	<br>

	<div class="row">
		<div class="col-md-3">
			<h3 class="titulo-noticia">Notícias</h3>
			<div class="thumbnail">
				<img src="<c:url value='/resources/img/noticia1.png'/>" width="100%"
					alt="Aluguel">
				<div class="caption">
					<h3>Seu Dinheiro!</h3>
					<p>Preço do aluguel tem queda real de 0,68% no 2º semestre</p>
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
						você tem voz sobre as decisões e também evita que elas sejam
						tomadas por um pequeno grupo de moradores.
					</p>
				</a> <a tabindex="0" class="list-group-item">
					<h4 class="list-group-item-heading">Inadimplência</h4>
					<p class="list-group-item-text">O pagamento em dia das quotas
						condominiais é imprescindível para conseguirmos manter a boa
						qualidade de vida em nosso condomínio e essencial para evitar
						possíveis aumentos de taxas.</p>
				</a> <a tabindex="0" class="list-group-item">
					<h4 class="list-group-item-heading">Segurança</h4>
					<p class="list-group-item-text">Segundo dados da Polícia, 70%
						das invasões a condomínios ocorrem por descuido dos próprios
						moradores. Por isso, ressaltamos que de nada adiantam nossos
						sistemas de segurança sem a colaboração de todos os moradores.</p>
				</a>
			</div>

		</div>

		<div class="col-md-3">
			<h3 class="titulo-noticia">Atendimento</h3>

			<p>Para registro de ocorrência de manutenção e/ou reclamações,
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
			<p>Aqui é onde estão as regras do nosso condomínio. É muito
				importante que você tome conhecimento delas para que todos em sua
				unidade saibam seus direitos e deveres a fim de manter a ordem no
				condomínio.</p>

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