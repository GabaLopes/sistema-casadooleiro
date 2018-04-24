<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista Clinica</title>
</head>
<body>

<h1>${clinica.nome}</h1>
<p>${clinica.id}</p>
<c:forEach items="${clinica.servicos}" var="servico">
<h3>${servico.tipo}</h3>

</c:forEach>

<form:form action="${s:mvcUrl('SC#adicionar').build()}" method="post" >
<label>Tipo de Serviço</label>
<input type="text" name="servicos[1].tipo">

<button type="submit">Cadastrar</button>
</form:form>

</body>
</html>