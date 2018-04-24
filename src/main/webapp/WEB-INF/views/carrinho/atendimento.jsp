<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <script type="text/javascript">
  $(document).ready(function(){
	  $("#myInput").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#myTable tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
	</script>
<title>Atendimento - Casa do Oleiro</title>

</head>
<body>
<div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span><input class="form-control" id="myInput" type="text" placeholder="Procurar Serviço..."></div>
	<br><br>						
	<table class="table table-bordered">
	    <thead>
	      <tr>
	      	<th>Id</th>
	        <th>Serviço</th>
	        <th>Médico</th>
	        <th>Clínica</th>
	        <th>Valor</th>
	      </tr>
	    </thead>
	    <tbody id="myTable">
			<c:forEach items="${servico}" var="servicos">
		      <tr>
		      	<td>${servicos.id}</td>
		        <td>${servicos.tipo}</td>
		        <td>${servicos.medico }</td>
		        <td>${servicos.clinica}</td>
		        <td>${servicos.valorOleiro}</td>
		        <td><form:form action="/controlemembros/carrinho/add" method="post">
					<input type="hidden" value="${servicos.id}"name="id">
					<input type="hidden" value="${servicos.tipo}"name="tipo">
					<input type="hidden" value="${servicos.medico}"name="medico">
					<input type="hidden" value="${servicos.clinica}"name="clinica">
					<input type="hidden" value="${servicos.valorParticular}"name="valorParticular">
					<input type="hidden" value="${servicos.valorClinica}"name="valorClinica">
					<input type="hidden" value="${servicos.valorOleiro}"name="valorOleiro">
					<button type="submit" class="btn btn-danger">Incluir Item</button>																	
					</form:form>
				</td>
			  </tr>  			  
			</c:forEach>
			 
	    </tbody>
	</table>

</body>
</html>