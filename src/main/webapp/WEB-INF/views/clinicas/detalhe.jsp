<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Clínicas - Lista</title>
</head>
<body>
<form action="controlemembros/clientes" method="get" >
<table>
		<tr>
			<td>Titulo</td>
			<td>ID</td>
				
			
		</tr>
		
		<c:forEach items="${clinicas}" var="clinica" varStatus="status">
			<tr>
				<td>
				<a href="${s:mvcUrl('CC#detalhe').arg(0,clinica.id).build() }">${clinica.nome }</a>
				</td>
				<td>${clinica.id }</td>
			</tr>
		</c:forEach>
				
	</table>

</form>
</body>
</html>