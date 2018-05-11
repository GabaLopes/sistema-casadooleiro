<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap 4 CSS  -->
	<c:url value="/resources/css" var="cssPath"/>
	<link href="${cssPath}/bootstrap.min.css"  rel="stylesheet" type="text/css" />
	<c:url value="/resources/css" var="cssPath"/>
	<link href="${cssPath}/stilo.css"  rel="stylesheet" type="text/css" />	
	<c:url value="/resources/js" var="jsPath"/>
    <script src="${jsPath}/bootstrap.min.js" ></script>
    <c:url value="/resources/js" var="jsPath"/>
    <script src="${jsPath }/jquery-3.3.1.slim.min.js"></script>
    <c:url value="/resources/js" var="jsPath"/>
	<script src="${jsPath}/popper.min.js"></script>
	
<title>Atualizar - ${servico.tipo}</title>
</head>
<body>
<nav class="navbar navbar-expand-sm  navbar-dark fixed-top" style="background-color: #24244E;" >
  <a class="navbar-brand" href="/controlemembros/" style="width: 15%;"><img src="../resources/imagens/casadooleiro.png" width="100%"></a>
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link text-light" href="../carrinho/atendimento">Atendimento</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-light" href="../clinicas/cadastro">Cadastro Clinicas</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-light" href="../clientes/form">Cadastro Clientes</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-light" href="../relatorio/relatorios">Relatórios</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-light" href="../logout">Sair</a>
    </li>
  </ul>
</nav>

<div class="container" style="margin-top: 80px;">
	<form:form class="form-group" servletRelativeAction="/controlemembros/clinicas/atualizar" method="post">
		<div class="card">
		<div class="card-header" style="background-color:#24244E;"><h6 class="text-light">Atualizar Serviço Médico</h6></div>
		<div class="card-body">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"><strong>Serviço:</strong></span>
	  		</div>
	  		<input type="hidden" value="${servico.id }" name="id">
	  		<input type="text" class="form-control" value="${servico.tipo }" name="tipo">
  		</div>
  		<div class="input-group mb-3">
	  		<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"><b>Médico:</b></span>
	  		</div>
	  		<input type="text" class="form-control" value="${servico.medico }" name="medico">
  		</div>
	  	<div class="input-group mb-3">	
	  		<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"><b>Clínica:</b></span>
	  		</div>
	  		<input type="text" class="form-control" value="${servico.clinica }" name="clinica">
  		</div>
  		<div class="input-group mb-3">
	  		<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"><b>AMB:</b></span>
	  		</div>
	  		<input type="text" class="form-control" value="${servico.amb }" name="amb">
  		</div>
  		<div class="input-group mb-3">
	  		<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"><b>CH:</b></span>
	  		</div>
	  		<input type="text" class="form-control" value="${servico.ch }" name="ch">
  		</div>
  		<div class="input-group mb-3">
	  		<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"><b>Valor:</b></span>
	  		</div>
	  		<input type="text" class="form-control" value="${servico.valorOleiro }" name="valor">
  		</div>
  		<div class="input-group mb-3">
	  		<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"><b>Custo:</b></span>
	  		</div>
	  		<input type="text" class="form-control" value="${servico.valorClinica }" name="valorClinicas">
  		</div>
  		<div class="input-group mb-3">
	  		<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1"><b>Valor Particular:</b></span>
	  		</div>
	  		<input type="text" class="form-control" value="${servico.valorParticular }" name="valorPart">
  		</div>
  		<button type="submit" class="btn btn-success">Atualizar</button>
  		</div>
  		</div>
	</form:form>
</div>
</body>
</html>