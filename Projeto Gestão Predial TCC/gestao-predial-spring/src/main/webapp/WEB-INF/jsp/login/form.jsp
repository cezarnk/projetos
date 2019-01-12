<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<title>Gestão Predial</title>
<link href="<c:url value='/resources/css/bootstrap.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/css/site.css'/>" rel="stylesheet" />

<body style="background-color:#051606">
<div class="container login-container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3 login-form-1" style="background-color:#FFF;border-radius:10px">
			
			<div class="row">
			<div class="col-md-1 col-md-offset-1">
			<img class="text-center" src="<c:url value='/resources/img/logo-predio-preto.png'/>" width="60px "/>
			</div>
			
			<div class="col-md-9">
			<h3> Sistema de Gestão Predial</h3>
			</div>
			</div>

			<c:url var="url" value="/login/efetuaLogin" />
			<form:form action="${url}" method="POST" modelAttribute="Usuario">
				
				<div class="form-group">
					<label for="login">Login:</label> <input type="text" name="login"
						id="login" class="form-control" placeholder="Digite seu login *" />
				</div>


				<div class="form-group">
					<label for="senha">Senha:</label> <input type="password"
						name="senha" id="senha" class="form-control"
						placeholder="Digite sua senha *" />
				</div>

				<c:forEach var="error" items="${errors}">
    				<span style="color:red">${error.category} - ${error.message}</span><br/><br>
				</c:forEach>

				<div class="form-group">
					<input type="submit" class="btnSubmit" value="Autenticar" />
				</div>
				<div class="form-group">
					<a href="#" class="ForgetPwd">Esqueceu a senha?</a>
				</div>

			</form:form>

		</div>
	</div>
</div>

</body>