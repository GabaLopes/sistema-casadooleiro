<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
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
	<link href="${cssPath}/w3.css"  rel="stylesheet" type="text/css" />
	<c:url value="/resources/js" var="jsPath"/>
	
	<c:url value="/resources/js" var="jsPath"/>
	<script src="${jsPath}/jquery.js"></script>
	<c:url value="/resources/js" var="jsPath"/>
	<script src="${jsPath}/jquery.form.js"></script>
	
<title>Marcações de Consultas</title>
</head>
<body>
<h1 align="center">Consultas Marcadas</h1>
<table class="table table-bordere">
<thead>
<tr>
	<th>Atendente</th>
	<th>Paciente</th>
	<th>Data</th>
	<th>Horário</th>
	<th>Clínica</th>
	<th>Procedimento</th>
</tr>
</thead>
<tbody>
<c:forEach items="${marcacoes}" var="marcacao" >
<tr>
 <td>${marcacao.atendente }</td>
 <td>${marcacao.paciente }</td>
 <td>${marcacao.data}</td>
 <td>${marcacao.horario }</td>
 <td>${marcacao.clinica }</td>
 <td>${marcacao.procedimentos }</td>
 <td><form:form servletRelativeAction="/controlemembros/carrinho/excluirConsulta"><input type="hidden" name="id" value="${marcacao.id}" ><button type="submit" class="btn btn-danger">Excluir</button></form:form></td>
</tr>
</c:forEach>

</tbody>
</table>

</body>
</html>