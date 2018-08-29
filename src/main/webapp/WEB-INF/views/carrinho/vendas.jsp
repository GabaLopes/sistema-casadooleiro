<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap 4 CSS  -->
<c:url value="/resources/css" var="cssPath" />
<link href="${cssPath}/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<c:url value="/resources/css" var="cssPath" />
<link href="${cssPath}/stilo.css" rel="stylesheet" type="text/css" />
<c:url value="/resources/js" var="jsPath" />
<script src="${jsPath}/bootstrap.min.js"></script>
<c:url value="/resources/js" var="jsPath" />
<script src="${jsPath }/jquery-3.3.1.slim.min.js"></script>
<c:url value="/resources/js" var="jsPath" />
<script src="${jsPath}/popper.min.js"></script>
<link href="${cssPath}/w3.css" rel="stylesheet" type="text/css" />
<c:url value="/resources/js" var="jsPath" />
<meta charset="UTF-8">
<title>Vendas</title>
</head>
<body class="container-fluid">
	<div align="center">
		<h1>Vendas</h1>
	</div>
	<br>
	<table class="table table-bordered">
			<c:forEach items="${vendas}" varStatus="status">
		<thead>
			<tr>
				<th style="background-color: #C4C4C4; width: 13%">Data Atendimento:</th>
				<th style="background-color: #C4C4C4; width: 24%;"><strong>Titular:</strong></th>
				<th style="background-color: #C4C4C4; width: 24%"><strong>Dependente:</strong></th>
				<th style="background-color: #C4C4C4; width: 15%">Tipo:</th>
				<th style="background-color: #C4C4C4; width: 13%">Clinica:</th>
				<th style="background-color: #C4C4C4; width: 13%">Médico:</th>
				<th style="background-color: #C4C4C4; width: 8%">Valor:</th>
			</tr>

		</thead>
			<c:forEach items="${vendas[status.index].procedimento}"	var="procedimento" varStatus="stus">
				<tbody>
					<tr>
						<td><fmt:formatDate pattern="dd/MM/yyyy" value="${vendas[status.index].dataCompra.time}" /></td>
						<td>${vendas[status.index].cliente}</td>
						<td>${vendas[status.index].dependente}</td>
						<td>${procedimento.tipo}</td>
						<td>${procedimento.clinica}</td>
						<td>${procedimento.medico}</td>
						<td><fmt:setLocale value="pt-BR" /><fmt:formatNumber value="${procedimento.valor}" type="currency" /></td>
					</tr>
				</tbody>
			</c:forEach>
			<thead>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><form:form
								servletRelativeAction="/controlemembros/carrinho/excluirvenda"
								method="post">
								<input type="hidden" name="id" value="${vendas[status.index].id}">
								<button type="submit" class="btn btn-danger">Excluir</button>
							</form:form></td>
						<td><b>R$ ${vendas[status.index].total}</b></td>
					</tr>
			</thead>
		</c:forEach>
	</table>
</body>
</html>