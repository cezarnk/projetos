<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Gest�o Predial</title>
<link href="<c:url value='/css/bootstrap.css'/>" rel="stylesheet" />
<link href="<c:url value='/css/site.css'/>" rel="stylesheet" />
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<script src="<c:url value='/js/jquery.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/js/base.js'/>"></script>

</head>
<body>

	<nav class="navbar menu" id="cabecalhoII">
		<div class="container-fluid"
			style="padding-top: 10px; padding-bottom: 10px">
			<div class="collapse navbar-collapse navbar-left" id="esprem�vel">

				<div class="navbar-header menu-superior">
					<a href="${linkTo[IndexController].index()}"><span class="link">SISTEMA GP</span></a> 
				<!-- 	<a href="${linkTo[IndexController].telefoneuteis()}"><span class="link" style="margin-left: 40px">Telefone �teis</span></a> -->
				  	    <a href="${linkTo[IndexController].portfolio()}"><span class="link" style="margin-left: 40px">Especifica��o do Sistema</span></a> 				     							
				</div>
				
				</div>

				<div class="nav navbar-nav containerfoto pull-right">
					
					<div class="row">
							
						<div class="col-md-4">
						<button class="btn btn-default btn-xs" style="margin-top: 6px;">
							<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
							${usuarioLogado.usuario.nome_guerra}
						</button>
						</div>
				

						<c:if test="${usuarioLogado.logado}">
							<div class="col-md-1">
								<button class="btn btn-danger btn-xs"
									style="margin-top: 6px;margin-left: 40px;"
									onclick="location.href='${linkTo[LoginController].desloga()}'">
									<span class="glyphicon glyphicon-off" aria-hidden="true"></span>
								</button>
							</div>
						</c:if>
						<c:if test="${!usuarioLogado.logado}">
							<div class="col-md-1">
								<button class="btn btn-danger btn-xs"
									style="margin-top: 2px">
									<span class="glyphicon glyphicon-off" aria-hidden="true"
										onclick="location.href='${linkTo[LoginController].form()}'"></span>
								</button>
							</div>
						</c:if>

					</div>			
				</div>

			

		</div>
	</nav>

	<!-- Modal confirma��o -->
	<div class="modal fade" id="modalCadContrato" role="dialog">
		<div class="modal-dialog modal-sm">

			<!-- Modal content-->
			<div class="modal-content ">
				<div class="modal-header"
					style="background-color: #025da1; color: white;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">Confirmar</h5>
				</div>

				<div class="modal-body"></div>
			</div>
		</div>
	</div>
	<!--  Fim molde modal -->




	<div class="container-fluid">
		<div class="row responsive">
			<!-- Cabe�a -->

			<!-- @@@@@ come�a menu lateral @@@@@ -->


			<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Menu Lateral @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
			<div class="col-sm-2" id="menulateral">


				<div class="nav-side-menu">
					<div class="brand">
						<img src="<c:url value='/img/logo-predio-branco.png'/>"
							width="120px " />
						<h3>Gest�o Predial</h3>
					</div>
					<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse"
						data-target="#menu-content"></i>

					<div class="menu-list">

						<ul id="menu-content" class="menu-content collapse in">
							<li><a href="${linkTo[IndexController].index()}"> <i><span
										class="glyphicon glyphicon-home" aria-hidden="true"></span></i>
									�nicio
							</a></li>

							<li data-toggle="collapse" data-target="#products"
								class="collapsed"><a href="#"> <i><span
										class="glyphicon glyphicon-pencil" aria-hidden="true"></span></i>
									Cadastrar <span class="arrow"></span></a></li>
							<ul class="sub-menu collapse" id="products">
								<li class="active"><a href="${linkTo[PerfilController].form()}">Dados de Usu�rio</a></li>
								
								<li class="active"><a href="${linkTo[PagamentoController].form()}">Pagamento de Mensalidade</a></li>
								<li class="active"><a href="${linkTo[DemandaController].tela_cadastro()}">Solicita��o de
										Atendimento</a></li>

							</ul>


							<li data-toggle="collapse" data-target="#service"
								class="collapsed"><a href="#"><i><span
										class="glyphicon glyphicon-search" aria-hidden="true"></span></i>
									Consultar <span class="arrow"></span></a></li>
							<ul class="sub-menu collapse" id="service">
								<li class="active"><a href="${linkTo[PagamentoController].lista()}">Controle de Pagamento</a></li>
								<li class="active"><a href="${linkTo[PerfilController].lista()}">Lista de Usu�rios</a></li>
								<li class="active"><a href="${linkTo[DemandaController].lista()}">Painel de Solicita��es</a></li>
								
								

							</ul>


							<li data-toggle="collapse" data-target="#new" class="collapsed">
								<a href="#"><i><span class="glyphicon glyphicon-file"
										aria-hidden="true"></span></i> Gest�o <span class="arrow"></span></a>
							</li>
							<ul class="sub-menu collapse" id="new">
								<li class="active"><a
									href="${linkTo[UsuarioController].lista()}">Controle de
										acesso</a></li>
								
								<!-- <li class="active">Relat�rios</li> -->
							</ul>
							<!-- <li><a href="${linkTo[IndexController].telefoneuteis()}"><i><span
										class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span></i>
									Telefones �teis </a></li>-->
						</ul>
					</div>
				</div>

			</div>
			<!-- @@@@@ Termina menu lateral @@@@@ -->

			<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Corpo da pagina @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

			<div class="col-sm-10 col-lg-10" id="corpo">


				<div class="row" id="aviso" style="display: none">
					<div class="col-md-10">
						<div class="alert alert-dismissible" id="aviso_classificacao"
							role="alert">
							<span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span>
							&nbsp <span id="aviso_texto"></span>
						</div>
					</div>
				</div>