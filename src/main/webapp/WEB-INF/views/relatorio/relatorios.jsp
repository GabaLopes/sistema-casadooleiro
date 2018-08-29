<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
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
	
<title>Relatórios</title>
</head>
<body style="background-color: #D6D6D6">
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
<div class="container-fluid" style="margin-top:80px;">
<div class="row">
<div class="col-md-4">
	<div class="card shadow p-3 mb-5 bg-white rounded">
	<div class="card-header" style="background-color:#24244E;"><h6 class="text-light">Relátorio Mensal por Clinica</h6></div>
		<div class="card-body">
		<form:form target="_blank" servletRelativeAction="/controlemembros/relatorio/relatoriomes" method="post">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1">Clinica</span>
	  		</div>
	  		<select name="clinica" class="form-control" id="exampleFormControlSelect1">
					<c:forEach items="${clinica}" varStatus="status">
						<option value="${clinica[status.index].nome}">${clinica[status.index].nome}</option>
					</c:forEach>
			</select>
  		</div>
		
		<div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1">Data Inicial</span>
	  		</div>
	  		<input type="date" class="form-control" name="dataIni">
  		</div>
  		<div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1">Data Final</span>
	  		</div>
	  		<input type="date" class="form-control" name="dataFim">
  		</div>
  		<button type="submit" class="btn btn-success">Gerar</button>
		</form:form>
	</div>
	</div>	
	<div class="card shadow p-3 mb-5 bg-white rounded">
	<div class="card-header" style="background-color:#24244E;"><h6 class="text-light">Relátorio por Cliente</h6></div>
		<div class="card-body">
		<form:form target="_blank" servletRelativeAction="/controlemembros/relatorio/relatorioporcliente" method="post">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1">Data Inicial</span>
	  		</div>
	  		<input type="date" class="form-control" name="dataIni">
  		</div>
  		<div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1">Data Final</span>
	  		</div>
	  		<input type="date" class="form-control" name="dataFim">
  		</div>
  		<div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1">Cliente</span>
	  		</div>
	  		<select class="form-control" name="cliente">
	  		<c:forEach items="${clientes}" var="cliente">
	  			<option value="${cliente.nome}">${cliente.nome}</option>
	  		</c:forEach>
	  		</select>
  		</div>
  		<button type="submit" class="btn btn-success">Gerar</button>
		</form:form>
	</div>
	</div>
	
</div>
<div class="col-md-4">
<div class="card shadow p-3 mb-5 bg-white rounded">
	<div class="card-header" style="background-color:#24244E;"><h6 class="text-light">Relátorio Geral por Mês</h6></div>
		<div class="card-body">
		<form:form target="_blank" servletRelativeAction="/controlemembros/relatorio/relatoriogeral" method="post">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1">Data Inicial</span>
	  		</div>
	  		<input type="date" class="form-control" name="dataIni">
  		</div>
  		<div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1">Data Final</span>
	  		</div>
	  		<input type="date" class="form-control" name="dataFim">
  		</div>
  		<button type="submit" class="btn btn-success">Gerar</button>
		</form:form>
	</div>
	</div>	
</div>
<div class="col-md-4">
<div class="card shadow p-3 mb-5 bg-white rounded">
	<div class="card-header" style="background-color:#24244E;"><h6 class="text-light">Relátorio por Empresa</h6></div>
		<div class="card-body">
		<form:form target="_blank" servletRelativeAction="/controlemembros/relatorio/relatorioporempresa" method="post">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1">Data Inicial</span>
	  		</div>
	  		<input type="date" class="form-control" name="dataIni">
  		</div>
  		<div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1">Data Final</span>
	  		</div>
	  		<input type="date" class="form-control" name="dataFim">
  		</div>
  		<div class="input-group mb-3">
			<div class="input-group-prepend">
	    	<span class="input-group-text" id="basic-addon1">Empresa</span>
	  		</div>
	  		<select class="form-control" name="empresa">
	  		<c:forEach items="${vendas}" var="venda">
	  			<option value="${venda.empresa}">${venda.empresa}</option>
	  		</c:forEach>
	  		</select>
  		</div>
  		<button type="submit" class="btn btn-success">Gerar</button>
		</form:form>
	</div>
	</div>
</div>
</div>
</div>
</body>
</html>