<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Gestão Predial</title>
<link href="<c:url value='/css/bootstrap.css'/>" rel="stylesheet" />
<link href="<c:url value='/css/site.css'/>" rel="stylesheet" />
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<script src="<c:url value='/js/jquery.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/js/base.js'/>"></script>

</head>
<body>

	<nav class="navbar menu" id="cabeçalhoII">
		<div class="container-fluid"
			style="padding-top: 10px; padding-bottom: 10px">
			<div class="collapse navbar-collapse navbar-left" id="espremível">

				<div class="navbar-header menu-superior">
					<span class="link">CESUP</span> <span class="link"
						style="margin-left: 40px">Quem Somos</span> <span class="link"
						style="margin-left: 40px">Portfólio</span>
				</div>


				<ul class="nav navbar-nav containerfoto">
					<li>
						<div class="row" style="position:fixed;top:12px;right:0;z-index: 4">
							<div class="col-md-6 col-md-offset-4"
								style="margin-right: 0px; margin-top: 8px;">
								<button class="btn btn-default btn-xs pull-right"
									style="margin-top: -4px;margin-right:6px">
									<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
									Usuario logado
								</button>
							</div>

							<c:if test="${usuarioLogado.logado}">
								<div class="col-md-1">
									<button class="btn btn-danger btn-xs pull-right"
										style="margin-top: 4px;margin-right:4px"
										onclick="location.href='${linkTo[LoginController].desloga()}'">
										<span class="glyphicon glyphicon-off" aria-hidden="true"></span>
									</button>
								</div>
							</c:if>
							<c:if test="${!usuarioLogado.logado}">
								<div class="col-md-1">
									<button class="btn btn-danger btn-xs pull-right"
										style="margin-top: 2px">
										<span class="glyphicon glyphicon-off" aria-hidden="true"
											onclick="location.href='${linkTo[LoginController].form()}'"></span>
									</button>
								</div>
							</c:if>

						</div>

					</li>
				</ul>

			</div>

		</div>
	</nav>

	<!-- Modal confirmação -->
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
			<!-- Cabeça -->

			<!-- @@@@@ começa menu lateral @@@@@ -->


			<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Menu Lateral @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
			<div class="col-sm-2" id="menulateral">


				<div class="nav-side-menu">
					<div class="brand">
						<img src="<c:url value='/img/logo-predio-branco.png'/>"
							width="120px " />
						<h3>Gestão Predial</h3>
					</div>
					<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse"
						data-target="#menu-content"></i>

					<div class="menu-list">

						<ul id="menu-content" class="menu-content collapse in">
							<li><a href="${linkTo[IndexController].index()}"> <i><span
										class="glyphicon glyphicon-home" aria-hidden="true"></span></i>
									Ínicio
							</a></li>

							<li data-toggle="collapse" data-target="#products"
								class="collapsed"><a href="#"> <i><span
										class="glyphicon glyphicon-pencil" aria-hidden="true"></span></i>
									Cadastrar <span class="arrow"></span></a></li>
							<ul class="sub-menu collapse" id="products">
								<li class="active"><a href="${linkTo[PerfilController].form()}">Dados de Usuário</a></li>
								
								<li class="active"><a href="#">Pagamento de Mensalidade</a></li>
								<li class="active"><a href="#">Solicitação de
										Atendimento</a></li>

							</ul>


							<li data-toggle="collapse" data-target="#service"
								class="collapsed"><a href="#"><i><span
										class="glyphicon glyphicon-search" aria-hidden="true"></span></i>
									Consultar <span class="arrow"></span></a></li>
							<ul class="sub-menu collapse" id="service">
								<li class="active">Controle de Pagamento</li>
								<li class="active"><a href="${linkTo[PerfilController].lista()}">Lista de Usuários</a></li>
								<li class="active">Painel de Solicitações</li>
								
								

							</ul>


							<li data-toggle="collapse" data-target="#new" class="collapsed">
								<a href="#"><i><span class="glyphicon glyphicon-file"
										aria-hidden="true"></span></i> Gestão <span class="arrow"></span></a>
							</li>
							<ul class="sub-menu collapse" id="new">
								<li class="active"><a
									href="${linkTo[UsuarioController].lista()}">Controle de
										acesso</a></li>
								<li class="active">Fluxo de Caixa</li>
								
								<li class="active">Relatórios</li>
							</ul>
							<li><a href="#"><i><span
										class="glyphicon glyphicon-bullhorn" aria-hidden="true"></span></i>
									Fórum </a></li>



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