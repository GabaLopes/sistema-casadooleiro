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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
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
	<style media="print">
	.botao {
	display: none;
	}
	</style>
	
	
	
	
<title>Relatório Vendas - Empresa </title>
</head>
<body>
<br>
<div align="center"><img id="image-1" alt="" src="../resources/imagens/logo.png" width="15%"/>

<h4>Relátorio Vendas - ${cliente }</h4>
<p><strong><fmt:formatDate pattern="dd/MM/yyyy" value="${dataini}"/></strong> a <strong><fmt:formatDate pattern="dd/MM/yyyy" value="${datafim}"/></strong></p>
</div>

<form align="center">
<input type="button" class="botao btn btn-success" value="Imprimir Relátorio" onClick="window.print()"/>
</form>
<br>
<table class="table table-bordered">
  <thead>
    <tr>
      <th style="background-color:#C4C4C4; width:13%">Data Atendimento:</th>
      <th style="background-color:#C4C4C4;width:20%;"><strong>Titular:</strong></th>	
      <th style="background-color:#C4C4C4;width:20%"><strong>Dependente:</strong></th>
      <th style="background-color:#C4C4C4;width:15%">Tipo:</th>
      <th style="background-color:#C4C4C4;width:13%">Médico:</th>
      <th style="background-color:#C4C4C4;width:8%">Valor:</th>
       
      </tr>
    
  </thead>
  	<c:forEach items="${vendas}" varStatus="status">
  <tbody>
    <c:forEach items="${vendas[status.index].procedimento}" var="procedimento" >
     <tr>
   	  <td><fmt:formatDate pattern="dd/MM/yyyy" value="${vendas[status.index].dataCompra.time}"/></td>
      <td>${vendas[status.index].cliente}</td>
      <td>${vendas[status.index].dependente}</td>
      <td>${procedimento.tipo}</td>
      <td>${procedimento.medico}</td>
      <td><fmt:setLocale value="pt-BR" /><fmt:formatNumber value="${procedimento.valor}" type="currency"/></td>
      </tr>
	</c:forEach>

      </tbody>
       
	</c:forEach>
</table>
<div class="float-right border border-primary bg-primary rounded" style="padding-top:5px;padding-left:20px;padding-right: 20px" >
<h6>Total : <strong><fmt:setLocale value="pt-BR" /><fmt:formatNumber value="${total}" type="currency"/></strong></h6>
</div>
<div class="float-right border border-primary bg-primary rounded" style="padding-top:5px;padding-left:20px;padding-right: 20px" >
<h6>Desconto: <strong><fmt:setLocale value="pt-BR" /><fmt:formatNumber value="${desconto}" type="currency"/></strong></h6>
</div>

</body>
</html>