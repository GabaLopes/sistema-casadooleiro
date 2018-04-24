<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>${clientes.nome} - Detalhe</title>
</head>
<body>
<div class="container">
	<div class="panel-group">
	    <div class="panel panel-primary" width="50%">
	      <div class="panel-heading"> <h2>${clientes.nome}</h2>
  									  <p>${clientes.telefone}</p></div>
	      <div class="panel-body">
	        <div class="row">
			  <div class="col-md-2"></div>
			  <div class="col-md-8">      
			  <table class="table table-bordered">
			    <thead>
			      <tr>
			        <th>Nome</th>
			        <th>Data Nascimento</th>
			        <th>Telefone</th>
			        
			      </tr>
			    </thead>
			    <tbody>
			      
			      <c:forEach items="${clientes.dependente }" var="dependente" >
					<tr>
					<td>${dependente.nome}</td>
					<td><fmt:formatDate pattern="dd/MM/yyyy" value="${dependente.dataNascimento.time}"/></td>
					<td>${dependente.telefone }</td>
					</tr>
			      </c:forEach>        
			            
			    </tbody>
			  </table>
			  </div>
			  <div class="col-md-2"></div>
			 </div> 
	      </div>
	    </div>
    </div>

  
</div>

</body>

</html>