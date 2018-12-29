<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/index/header.jsp"></c:import>

<style>
.titulo-noticia {
	color: #013774;
}
</style>

<h2>Especificação do Sistema
<small>Ferramentas utilizados no desenvolvimento</small></h2>
<hr>


<div class="row">
<div class="col-md-12">
<h3 class="titulo-noticia">Infra</h3>
</div>

<div class="col-md-3">
<div class="panel panel-default">
  <div class="panel-heading">Sistema Operacional</div>
  <div class="panel-body">
    <img src="<c:url value='/img/debian.png'/>" width="100%"  alt="Debian">
  </div>
   <div class="panel-footer">Linux Debian 3.16.51 (8 jessie)</div>
</div>
</div>

<div class="col-md-3">
<div class="panel panel-default">
  <div class="panel-heading">Servidor</div>
  <div class="panel-body">
    <br>
    <img src="<c:url value='/img/apache_tomcat.png'/>" width="100%"  alt="Tomcat">
    <br>
  </div>
   <div class="panel-footer">Apache Tomcat 7.0.90</div>
</div>
</div>

<div class="col-md-3">
<div class="panel panel-default">
  <div class="panel-heading">Banco de Dados</div>
  <div class="panel-body">
    <img src="<c:url value='/img/mysql.png'/>" width="100%" height="110px" alt="MySQL">
  </div>
   <div class="panel-footer">MySql 5.5.62-0</div>
</div>
</div>


</div>


<div class="row">
<div class="col-md-12">
<h3 class="titulo-noticia">BackEnd</h3>
</div>

<div class="col-md-3">
<div class="panel panel-default">
  <div class="panel-heading">Linguagem de Programação</div>
  <div class="panel-body">
    <img src="<c:url value='/img/java.png'/>" width="100%" height="110px" alt="JAVA">
  </div>
   <div class="panel-footer">Java OpenJDK 1.8.0</div>
</div>
</div>

<div class="col-md-3">
<div class="panel panel-default">
  <div class="panel-heading">Framework DAO</div>
  <div class="panel-body">
    <img src="<c:url value='/img/hibernate.png'/>" width="100%" height="110px" alt="Hibernate">
  </div>
   <div class="panel-footer">Hibernate 5.3.7</div>
</div>
</div>

<div class="col-md-3">
<div class="panel panel-default">
  <div class="panel-heading">Framework MVC</div>
  <div class="panel-body">
    <img src="<c:url value='/img/vraptor.png'/>" width="100%" height="110px" alt="VRaptor">
  </div>
   <div class="panel-footer">VRaptor 4</div>
</div>
</div>

</div>


<div class="row">
<div class="col-md-12">
<h3 class="titulo-noticia">FrontEnd</h3>
</div>

<div class="col-md-3">
<div class="panel panel-default">
  <div class="panel-heading">Framework Javascript</div>
  <div class="panel-body">
    <img src="<c:url value='/img/jquery1.png'/>" width="100%" height="70px" alt="JQuery">
  </div>
   <div class="panel-footer">JQuery 1.12-4</div>
</div>
</div>

<div class="col-md-3">
<div class="panel panel-default">
  <div class="panel-heading">Framework CSS</div>
  <div class="panel-body">
    <img src="<c:url value='/img/bootstrap1.png'/>" width="100%" height="70px" alt="MySQL">
  </div>
   <div class="panel-footer">Bootstrap 3.3.7</div>
</div>
</div>

</div>

<c:import url="/WEB-INF/jsp/footer.jsp"></c:import>