<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="aviso"%>

<c:import url="/WEB-INF/jsp/header.jsp"></c:import>


<h2>
	Lista de Pagamentos <small>Registro de todos pagamentos dos condominos </small>
</h2>
<hr>
<br>






<c:import url="/WEB-INF/jsp/footer.jsp"></c:import>

<c:if test="${not empty mensagem }">
<script>
	mensagemAlerta("${mensagem}","alert-success");
</script>
</c:if>