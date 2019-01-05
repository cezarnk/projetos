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
<title>Listar</title>
</head>
<body>
  <div id="wrap">
  
  	<div id="menu">
    	<%@ include file="/menu.jsp" %>
    </div>
    <div id="main">
    	<div id="body">
    
    <c:if test="${not empty contatos}">
        <table width="600px">
            <tr>
                <thead>
                    <th>Id</th>                    
                    <th>Nome</th>
                    <th>E-mail</th>
                    <th>Telefone</th>
                    <th>Atualizar</th>
                    <th>Excluir</th>
                </thead>
            </tr>
            <c:forEach items="${contatos}" var="contato">
            <c:url var="url" value="/contato/${contato.id}" />
                <tr>
                    <td>${contato.id}</td>                    
                    <td>${contato.nome}</td>
                    <td>${contato.email}</td>
                    <td>${contato.telefone}</td>
                    <td>
                        <form:form action="${url}/form" method="GET">
                            <input type="submit" alt="Atualizar Contato" src="<c:url value="/resources/img/update.png"/>" title="Atualizar Contato" type="image" value="Atualizar Contato"/>
                        </form:form>
                    </td>
                    <td>
                        <form:form action="${url}" method="DELETE">
                            <input type="submit" alt="Excluir Contato" src="<c:url value="/resources/img/delete.png"/>" title="Excluir Contato" type="image" value="Excluir Contato"/>
                        </form:form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <c:if test="${empty contatos}">Não há contatos cadastrados.</c:if>

		</div>
	</div>
  </div>

</body>
</html>
