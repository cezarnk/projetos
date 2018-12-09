<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix = "valida" %>



<form action="${linkTo[LoginController].autentica(null,null)}" method="POST">
	<valida:validationMessage name="Login_invalido"></valida:validationMessage>
	<label for="login">Login:</label>
	<input type="text" name="login" id="login" class="form-control"/>
	
	<label for="senha">Senha:</label>
	<input type="password" name="senha" id="senha" class="form-control"/>
	
	
	<input type="submit" value="Autenticar" class="btn"/>
</form>

