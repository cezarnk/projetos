<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value='/resources/css/style.css'/>" rel="stylesheet" />
<title>Cadastrar</title>

</head>
<body>
  <div id="wrap">
  
  	<div id="menu">
    	<%@ include file="/menu.jsp" %>
    </div>
    <div id="main">
    	<div id="body">
	<c:url var="url" value="/contato" />
    <form:form action="${url}" method="POST" modelAttribute="contato">    
        <div>
            <label for="nome">Nome:</label>
            <form:input cssStyle="width:250px" maxlength="30" path="nome" size="30"/>
          
        </div>
        <br/>
        <div>
            <label for="email">Email:</label>
            <form:input cssStyle="width:250px" maxlength="30" path="email" size="30"/>
            
        </div>        
        <br/>
        <div>
            <label for="telefone">Telefone:</label>
            <form:input cssStyle="width:250px" maxlength="30" path="telefone" size="20"/>
            
        </div>
        <br/>
 
        <div class="submit">
            <input id="criar" type="submit" value="Criar Contato"/>
        </div>
    </form:form>
		</div>
	</div>
  </div>

</body>
</html>
